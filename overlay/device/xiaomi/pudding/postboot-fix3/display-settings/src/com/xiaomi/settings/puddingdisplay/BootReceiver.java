package com.xiaomi.settings.puddingdisplay;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.provider.Settings;
import android.util.Log;

public final class BootReceiver extends BroadcastReceiver {
    @Override public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (!Intent.ACTION_BOOT_COMPLETED.equals(action)
                && !Intent.ACTION_LOCKED_BOOT_COMPLETED.equals(action)) return;
        PendingResult pending = goAsync();
        new Thread(() -> {
            try {
                SharedPreferences prefs = DimmingControl.prefs(context);
                int boot = Settings.Global.getInt(context.getContentResolver(), "boot_count", -1);
                if (boot >= 0 && prefs.getInt("restored_boot", -2) == boot) return;
                DimmingControl.apply(prefs.getInt("mode", 1));
                if (boot >= 0) prefs.edit().putInt("restored_boot", boot).commit();
            } catch (Exception error) {
                // Retry only on a later real boot event or explicit user action.
                Log.w("PuddingDimming", "Boot restore unavailable", error);
            } finally {
                pending.finish();
            }
        }, "PuddingDimmingBoot").start();
    }
}
