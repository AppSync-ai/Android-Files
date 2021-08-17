package com.mt.newschannel.AllFragments;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.fragment.app.Fragment;

import com.mt.newschannel.AllModules.TinyDB;
import com.mt.newschannel.R;


public class BlankFragment extends Fragment {
    TinyDB tinyDB;
    View view;

    public BlankFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.blank_fragment, container, false);

        tinyDB = new TinyDB(getActivity());


        return view;
    }


    @Override
    public void setMenuVisibility(final boolean visible) {
        if (visible) {

        }
        super.setMenuVisibility(visible);
    }

}
