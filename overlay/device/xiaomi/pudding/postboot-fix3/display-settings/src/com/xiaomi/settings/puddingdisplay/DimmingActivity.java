package com.xiaomi.settings.puddingdisplay;

import android.app.Activity;
import android.os.Bundle;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public final class DimmingActivity extends Activity {
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private RadioGroup modes;
    private TextView status;
    private boolean updating;
    private static final int DC = 1001;
    private static final int PWM = 1002;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        setTitle("调光模式");
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        int padding = (int) (24 * getResources().getDisplayMetrics().density);
        layout.setPadding(padding, padding, padding, padding);
        TextView description = new TextView(this);
        description.setText("选择适合自己的屏幕调光模式，重启后保留。\n");
        description.setTextSize(16);
        layout.addView(description);
        modes = new RadioGroup(this);
        RadioButton dc = new RadioButton(this);
        dc.setId(DC);
        dc.setText("DC 调光");
        modes.addView(dc);
        RadioButton pwm = new RadioButton(this);
        pwm.setId(PWM);
        pwm.setText("高频 PWM 调光");
        modes.addView(pwm);
        layout.addView(modes);
        status = new TextView(this);
        status.setTextSize(14);
        layout.addView(status);
        setContentView(layout);
        modes.setOnCheckedChangeListener((group, id) -> {
            if (updating || (id != DC && id != PWM)) return;
            changeMode(id == DC ? 1 : 0);
        });
    }

    @Override public void onResume() {
        super.onResume();
        worker.execute(() -> {
            try {
                int current = DimmingControl.readMode();
                runOnUiThread(() -> showMode(current, ""));
            } catch (Exception error) {
                runOnUiThread(() -> status.setText("暂时无法读取调光状态"));
            }
        });
    }

    private void changeMode(int requested) {
        enableButtons(false);
        status.setText("正在切换…");
        worker.execute(() -> {
            try {
                DimmingControl.apply(requested);
                if (!DimmingControl.prefs(this).edit().putInt("mode", requested).commit()) {
                    throw new IllegalStateException("Could not save selected mode");
                }
                runOnUiThread(() -> showMode(requested, "已应用，重启后保留"));
            } catch (Exception error) {
                android.util.Log.e("PuddingDimming", "Mode change failed", error);
                int actual;
                try { actual = DimmingControl.readMode(); }
                catch (Exception ignored) { actual = -1; }
                final int mode = actual;
                runOnUiThread(() -> showMode(mode, "切换未完成，请稍后重试"));
            }
        });
    }

    private void showMode(int mode, String message) {
        if (isFinishing() || isDestroyed()) return;
        updating = true;
        if (mode == 1) modes.check(DC);
        else if (mode == 0) modes.check(PWM);
        else modes.clearCheck();
        updating = false;
        status.setText(message);
        enableButtons(true);
    }

    private void enableButtons(boolean enabled) {
        for (int i = 0; i < modes.getChildCount(); i++) modes.getChildAt(i).setEnabled(enabled);
    }

    @Override public void onDestroy() {
        worker.shutdown();
        super.onDestroy();
    }
}
