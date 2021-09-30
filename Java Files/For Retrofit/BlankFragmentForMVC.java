package com.mt.spingamer.AllFragments;

import static android.util.Log.*;
import static android.util.Log.wtf;

import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.mt.spingamer.AllAdapters.OfferwallAdapter;
import com.mt.spingamer.AllModules.Admin;
import com.mt.spingamer.AllReqs.AllOffersReq;
import com.mt.spingamer.Models.OfferwallModel;
import com.mt.spingamer.databinding.BlankFragmentBinding;
import com.mt.spingamer.databinding.OfferwallFragmentBinding;
import com.teamup.app_sync.AppSyncDirectResponseListen;
import com.teamup.app_sync.AppSyncNewPleaseWait;
import com.teamup.app_sync.AppSyncSimpleTextDialog;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;

public class OfferwallFragment extends Fragment {
    OfferwallFragmentBinding view;
    RecyclerView recycler;
    OfferwallAdapter adapter;

    public OfferwallFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        view = OfferwallFragmentBinding.inflate(inflater, container, false);

        view.recycler.setLayoutManager(new LinearLayoutManager(getContext()));
        adapter = new OfferwallAdapter(OfferwallModel.list);
        view.recycler.setAdapter(adapter);


        return view.getRoot();
    }



    @Override
    public void setMenuVisibility(final boolean visible) {
        if (visible) {

        }
        super.setMenuVisibility(visible);
    }
}
