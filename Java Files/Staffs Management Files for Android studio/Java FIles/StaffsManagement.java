package com.example.androidtemplate.Activities;

import static com.appolica.flubber.Flubber.AnimationPreset.ALPHA;
import static com.example.androidtemplate.Modules.Admin.query_done;
import static com.example.androidtemplate.R.color.BlackTransparent;
import static com.teamup.app_sync.AppSyncChangeNavigationColor.change;
import static com.teamup.app_sync.AppSyncTextUtils.check_empty_and_null;

import android.content.Context;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.LinearLayoutCompat;
import androidx.lifecycle.Observer;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.appolica.flubber.Flubber;
import com.example.androidtemplate.Adapters.StaffsAdapter;
import com.example.androidtemplate.Models.ModelStaffs;
import com.example.androidtemplate.Modules.Admin;
import com.example.androidtemplate.Modules.ProgressPleasewait;
import com.example.androidtemplate.R;
import com.example.androidtemplate.Reqs.LoginResponseItem;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.teamup.app_sync.AppSyncAlertWithList;
import com.teamup.app_sync.AppSyncCustomDialog;
import com.teamup.app_sync.AppSyncKeyboardSettings;

import java.util.ArrayList;


public class StaffsManagement extends AppCompatActivity implements AppSyncAlertWithList.AlertDialogList {

    public static int position = 0;
    public static String id = "0";
    public static boolean manage = false;
    public static boolean refresh_needed = false;
    public static String selected_txt = "";

    int last_loaded = 0;
    boolean loading = false;
    String search = "";

    RecyclerView recycler;
    SwipeRefreshLayout swiper;
    Button load_more_btn;
    ProgressBar prog;
    EditText searchEdt;
    FloatingActionButton addBtn;
    ImageView searchImg, cross_img;

    Context context;
    StaffsAdapter adapter;
    ArrayList<LoginResponseItem> list;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        change(this);
        setContentView(R.layout.activity_staffs_management);
        Admin.HandleToolBar(this, "Staffs", findViewById(R.id.go_back_img), findViewById(R.id.title_head_txt));

        context = this;

        handle_init_views();

        handle_recycler_model();

        handle_swiper();

        Handle_search_bar();

        Handle_clickers();

        Handle_query_done();
    }

    private void Handle_query_done() {
        query_done.observe(this, new Observer<String>() {
            @Override
            public void onChanged(String s) {
                if (check_empty_and_null(s)) {
                    ProgressPleasewait.stop(context);
                    if (s.contains("adding")) {
                        AppSyncCustomDialog.stopPleaseWaitDialog(context);
                        swiper.setRefreshing(true);
                        ModelStaffs.load();
                    } else if (s.contains("deleting")) {
                        try {
                            list.remove(position);
                            adapter.notifyDataSetChanged();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    query_done.setValue("");
                }
            }
        });
    }


    private void Handle_clickers() {
        addBtn.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                Handle_add_dialog();
            }
        });
    }

    private void Handle_add_dialog() {
        AppSyncCustomDialog.showDialog(context, R.layout.dialog_add_staff, BlackTransparent, true);
        View vv = AppSyncCustomDialog.view2;
        LinearLayoutCompat liner = vv.findViewById(R.id.liner);
        Flubber.with()
                .animation(ALPHA)
                .repeatCount(0)
                .delay(0)
                .duration(500)
                .createFor(liner)
                .start();

        ProgressBar prog = vv.findViewById(R.id.prog);
        EditText email_edt = vv.findViewById(R.id.email_edt);
        Button add_btn = vv.findViewById(R.id.add_btn);
        ImageView close_img = vv.findViewById(R.id.close_img);
        close_img.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                AppSyncCustomDialog.stopPleaseWaitDialog(context);
            }
        });

        add_btn.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                String email = email_edt.getText().toString();
                if (check_empty_and_null(email)) {
                    add_btn.setVisibility(View.GONE);
                    prog.setVisibility(View.VISIBLE);
                    Admin.makeItQuery("INSERT INTO `admin_login` (`id`, `email`, `name`, `role`, `status`) VALUES " +
                            "(NULL, '" + email + "', 'Staff', 'staff', '1')", "adding");
                }
            }
        });
    }

    private void Handle_search_bar() {
        cross_img.setVisibility(View.GONE);
        searchImg.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                search = searchEdt.getText().toString().trim();
                if (check_empty_and_null(search)) {
                    swiper.setRefreshing(true);
                    ModelStaffs.load();
                } else {
                    searchEdt.setError("type something to search");
                }
            }
        });

        searchEdt.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                if (actionId == EditorInfo.IME_ACTION_DONE) {
                    // Your action on done
                    searchImg.callOnClick();
                    AppSyncKeyboardSettings.hideKeyBoard(context);
                    return true;
                }
                return false;
            }
        });


        searchEdt.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                String temp_search = searchEdt.getText().toString().trim();
                if (check_empty_and_null(temp_search)) {
                    cross_img.setVisibility(View.VISIBLE);
                } else {
                    cross_img.setVisibility(View.GONE);
                }

            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });


        cross_img.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                Handle_close_search();
            }
        });
    }

    private void Handle_close_search() {
        searchEdt.setText("");
        search = searchEdt.getText().toString().trim();
        swiper.setRefreshing(true);
        ModelStaffs.load();
    }


    private void handle_swiper() {
        swiper.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                ModelStaffs.load();
            }
        });
    }

    private void handle_recycler_model() {
        list = new ArrayList<>();
        recycler.setLayoutManager(new LinearLayoutManager(this));
        adapter = new StaffsAdapter(list);
        recycler.setAdapter(adapter);

        if (ModelStaffs.response_data.getValue() == null || refresh_needed) {
            swiper.setRefreshing(true);
            ModelStaffs.load();
        }

        ModelStaffs.response_data.observe(this, new Observer<ArrayList<LoginResponseItem>>() {
            @Override
            public void onChanged(ArrayList<LoginResponseItem> LoginResponseItems) {
                if (LoginResponseItems != null) {

                    list.clear();
                    last_loaded = LoginResponseItems.size();
                    prog.setVisibility(View.GONE);
                    loading = false;

                    list.addAll(LoginResponseItems);
                    adapter.notifyDataSetChanged();
                    swiper.setRefreshing(false);
                    refresh_needed = false;

                    if (LoginResponseItems.size() > 0) {
                        /* data available */
                    } else {
                        /* data not available */
                    }
                }
            }
        });
    }

    private void handle_init_views() {
        recycler = findViewById(R.id.recycler);
        swiper = findViewById(R.id.swiper);
        load_more_btn = findViewById(R.id.load_more_btn);
        prog = findViewById(R.id.prog);
        searchEdt = findViewById(R.id.searchEdt);
        searchImg = findViewById(R.id.searchImg);
        cross_img = findViewById(R.id.cross_img);
        addBtn = findViewById(R.id.addBtn);

    }

    @Override
    public void onBackPressed() {
        if (searchEdt.getText().length() > 0) {
            Handle_close_search();
        } else {
            super.onBackPressed();
            Admin.OverrideNow(this);
        }
    }

    @Override
    public void selectedFromAlertDialogList(String selected) {
        if (selected.equalsIgnoreCase("Delete staff")) {
            Handle_deletion();
        }
    }

    private void Handle_deletion() {
        ProgressPleasewait.show(context, "deleting", true);
        Admin.makeItQuery("DELETE FROM `admin_login` WHERE `admin_login`.`id` =  " + id, "deleting");
    }


    @Override
    public void AlertDialogWithListDismissed() {

    }
}