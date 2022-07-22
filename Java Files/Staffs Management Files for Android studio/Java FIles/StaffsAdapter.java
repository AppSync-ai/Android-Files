package com.example.androidtemplate.Adapters;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.annotation.RequiresApi;
import androidx.appcompat.widget.LinearLayoutCompat;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.example.androidtemplate.Activities.StaffsManagement;
import com.example.androidtemplate.R;
import com.example.androidtemplate.Reqs.LoginResponseItem;
import com.teamup.app_sync.AppSyncAlertWithList;

import java.util.ArrayList;
import java.util.List;


public class StaffsAdapter extends RecyclerView.Adapter<StaffsAdapter.ViewHolder> {

    public List<LoginResponseItem> blog_list;
    private static final int CAMERA_CODE2 = 22;

    int cur;
    public Context context;

    public StaffsAdapter(List<LoginResponseItem> blog_list) {
        this.blog_list = blog_list;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.single_staff, parent, false);

        context = parent.getContext();

        return new ViewHolder(view);

    }

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    @Override
    public void onBindViewHolder(final ViewHolder holder, @SuppressLint("RecyclerView") final int position) {


//        Flubber.with()
//                .animation(Flubber.AnimationPreset.ALPHA) // Slide up animation
//                .repeatCount(0)                              // Repeat once
//                .duration(500)                              // Last for 1000 milliseconds(1 second)
//                .createFor(holder.liner)                             // Apply it to the view
//                .start();


        holder.setIsRecyclable(false);

        holder.email_txt.setText("" + blog_list.get(position).getEmail());
        holder.id_txt.setText("" + blog_list.get(position).getId());

        holder.liner.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                StaffsManagement.position = position;
                StaffsManagement.id = blog_list.get(position).getId();
                StaffsManagement.selected_txt = blog_list.get(position).getEmail();


                ArrayList<String> ll = new ArrayList<>();
                ll.add("Delete staff");
                AppSyncAlertWithList.showListDialog(context, ll, R.drawable.staff_img, "Select Option");


            }
        });

    }


    @Override
    public int getItemCount() {
        return blog_list.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {

        private ImageView imageView1, imageView2, imageView3;
        TextView email_txt, id_txt, Txt3, Txt4, Txt5;
        private View mView;
        Button Btn1, Btn2, Btn3, Btn4;
        ProgressBar progressBar;
        LinearLayoutCompat liner;
        CardView cardView;
        CheckBox checkBox;

        public ViewHolder(View itemView) {
            super(itemView);
            mView = itemView;
            liner = itemView.findViewById(R.id.liner);
            email_txt = itemView.findViewById(R.id.email_txt);
            id_txt = itemView.findViewById(R.id.id_txt);

        }


    }


}
