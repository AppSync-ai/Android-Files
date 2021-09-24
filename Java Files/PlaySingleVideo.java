gradle implementqation :
implementation 'com.google.android.exoplayer:exoplayer:2.8.3'



package com.teamup.snackindia.AllActivities;

import androidx.appcompat.app.AppCompatActivity;

import android.net.Uri;
import android.os.Bundle;

import com.google.android.exoplayer2.ExoPlayerFactory;
import com.google.android.exoplayer2.Player;
import com.google.android.exoplayer2.SimpleExoPlayer;
import com.google.android.exoplayer2.source.ExtractorMediaSource;
import com.google.android.exoplayer2.source.MediaSource;
import com.google.android.exoplayer2.trackselection.DefaultTrackSelector;
import com.google.android.exoplayer2.ui.AspectRatioFrameLayout;
import com.google.android.exoplayer2.ui.PlayerView;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.DefaultDataSourceFactory;
import com.google.android.exoplayer2.util.Util;
import com.teamup.rohitasawa_library.RohitChangeNavigationColor;
import com.teamup.rohitasawa_library.RohitHideTop;
import com.teamup.snackindia.Admin;
import com.teamup.snackindia.AllModules.FetchVideos;
import com.teamup.snackindia.R;
import com.teamup.snackindia.TinyDB;

public class PlaySingleVideo extends AppCompatActivity {

    TinyDB tinyDB;
    SimpleExoPlayer player;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        RohitHideTop.hide(this);
        RohitChangeNavigationColor.change(this);
        setContentView(R.layout.activity_play_single_video);

        tinyDB = new TinyDB(this);

        DefaultTrackSelector trackSelector = new DefaultTrackSelector();
        player = ExoPlayerFactory.newSimpleInstance(this, trackSelector);

        DataSource.Factory dataSourceFactory = new DefaultDataSourceFactory(this,
                Util.getUserAgent(this, "TikTok"));

        MediaSource videoSource = new ExtractorMediaSource.Factory(dataSourceFactory)
                .createMediaSource(Uri.parse(Admin.plauPath));

        //player.setVideoScalingMode(C.VIDEO_SCALING_MODE_SCALE_TO_FIT);

        player.prepare(videoSource);

        player.setRepeatMode(Player.REPEAT_MODE_ALL);

        final PlayerView playerView = findViewById(R.id.videoView);
        playerView.setPlayer(player);
        playerView.setResizeMode(AspectRatioFrameLayout.RESIZE_MODE_FIXED_WIDTH);
        player.setPlayWhenReady(true);


    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        overridePendingTransition(R.anim.fade_in, R.anim.fade_out);
        player.setPlayWhenReady(false);
        player.release();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        player.setPlayWhenReady(false);
        player.release();
    }

    @Override
    protected void onPause() {
        super.onPause();
        player.setPlayWhenReady(false);
        player.release();
    }

    
}