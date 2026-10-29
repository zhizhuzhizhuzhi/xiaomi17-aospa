package com.xiaomi.settings.puddingdisplay;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.IBinder;
import android.os.Parcel;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

final class DimmingControl {
    private static final String DESCRIPTOR =
            "vendor.xiaomi.hardware.displayfeature_aidl.IDisplayFeature";
    private static final String SERVICE = DESCRIPTOR + "/default";
    // V2 OEM AIDL: setFeature(displayId, caseId, modeId, cookie), transaction 7.
    // OEM DC_BACKLIGHT case 20 maps to kernel DC_MODE feature 8. Verified 0/1 on pudding.
    private static final Pattern DC_MODE = Pattern.compile("dc_mode\\[08\\]:\\s*([01])");

    static SharedPreferences prefs(Context context) {
        return context.createDeviceProtectedStorageContext()
                .getSharedPreferences("dimming", Context.MODE_PRIVATE);
    }

    static int readMode() throws Exception {
        String value = new String(Files.readAllBytes(Paths.get(
                "/sys/class/mi_display/disp-DSI-0/disp_param")), java.nio.charset.StandardCharsets.UTF_8);
        Matcher match = DC_MODE.matcher(value);
        if (!match.find()) throw new IllegalStateException("DC mode unavailable");
        return Integer.parseInt(match.group(1));
    }

    static void apply(int mode) throws Exception {
        if (mode != 0 && mode != 1) throw new IllegalArgumentException("Invalid mode");
        IBinder binder = (IBinder) Class.forName("android.os.ServiceManager")
                .getDeclaredMethod("checkService", String.class).invoke(null, SERVICE);
        if (binder == null || !binder.isBinderAlive()) {
            throw new IllegalStateException("Display service unavailable");
        }
        Parcel request = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            request.writeInterfaceToken(DESCRIPTOR);
            request.writeInt(0);
            request.writeInt(20);
            request.writeInt(mode);
            request.writeInt(255);
            if (!binder.transact(7, request, reply, 0)) {
                throw new IllegalStateException("Unsupported display transaction");
            }
            reply.readException();
        } finally {
            request.recycle();
            reply.recycle();
        }
        // One immediate readback on the actual operation path; no timed retries.
        if (readMode() != mode) throw new IllegalStateException("Display mode readback mismatch");
    }
}
