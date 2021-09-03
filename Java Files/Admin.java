package com.mt.spingamer.AllModules;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import androidx.lifecycle.MutableLiveData;

import com.mt.spingamer.R;

public class Admin {
    public static String BASE_URL = "";
    public static TinyDB tinyDB;
    public static String appname = "";
    public static MutableLiveData<Boolean> menu_img_show = new MutableLiveData<>();

    public static void intializeLocalRoom(Context context) {
        tinyDB = new TinyDB(context);
    }

    public static void OverrideNow(Context context) {
        ((Activity) context).overridePendingTransition(R.anim.fade_in, R.anim.fade_out);
    }

    public static void HandleToolBar(Context context, String title, ImageView backImg, TextView titleTxt) {

        titleTxt.setText("" + title);
        backImg.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ((Activity) context).finish();
                OverrideNow(context);
            }
        });

    }


    public static void loadFrag(Fragment f1, String name, FragmentManager fm) {
        for (int i = 0; i < fm.getBackStackEntryCount(); ++i) {
            fm.popBackStack();
        }
        FragmentTransaction ft = fm.beginTransaction();
        //  ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        ft.setCustomAnimations(R.anim.fade_in, R.anim.fade_out);
        ft.replace(R.id.container, f1, name);
        ft.commit();

    }

    public static void loadFrag_add_back(Fragment f1, String name, FragmentManager fm) {
      
        FragmentTransaction ft = fm.beginTransaction();
        //  ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        ft.setCustomAnimations(R.anim.fade_in, R.anim.fade_out);
        ft.replace(R.id.container, f1, name);
        ft.addToBackStack(name);
        ft.commit();

    }

}
