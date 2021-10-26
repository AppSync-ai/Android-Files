package com.mt.classystockmanagementapp.AllModules;

import android.content.Context;
import android.view.View;
import android.widget.TextView;

import com.mt.classystockmanagementapp.R;
import com.teamup.app_sync.AppSyncCustomDialog;

public class ProgressPleasewait {

    public static void show(Context context, String text, boolean cancelable) {
        AppSyncCustomDialog.showDialog(context, R.layout.dialog_please_wait, R.color.Transparent, cancelable);
        View vv = AppSyncCustomDialog.view2;
        TextView txt = vv.findViewById(R.id.txt);
        txt.setText("" + text);
    }

    public static void stop(Context context) {
        AppSyncCustomDialog.stopPleaseWaitDialog(context);
    }
}
