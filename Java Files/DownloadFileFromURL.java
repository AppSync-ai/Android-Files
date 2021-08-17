package com.teamup.sarkarichakri.AllModules;

import android.content.Context;
import android.content.ContextWrapper;
import android.os.AsyncTask;
import android.os.Environment;
import android.util.Log;

import com.teamup.app_sync.AppSyncPaths;
import com.teamup.app_sync.AppSyncProgressDialog;
import com.teamup.sarkarichakri.R;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

public class DownloadFileFromURL extends AsyncTask<String, String, String> {

    /**
     * Before starting background thread
     * Show Progress Bar Dialog
     */


    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        AppSyncProgressDialog.showDialog(Admin.context, "Downloading..", R.color.BlackTransparent);
    }

    /**
     * Downloading file in background thread
     */
    @Override
    protected String doInBackground(String... f_url) {
        int count;
        try {
            URL url = new URL(f_url[0]);
            URLConnection conection = url.openConnection();
            conection.connect();
            // getting file length
            int lenghtOfFile = conection.getContentLength();

            // input stream to read file - with 8k buffer
            InputStream input = new BufferedInputStream(url.openStream(), 8192);

            // Output stream to write file
            ContextWrapper cw = new ContextWrapper(Admin.context);
            File directory = cw.getDir("imageDir", Context.MODE_PRIVATE);
//            File path = Environment.getExternalStoragePublicDirectory(
//                    Environment.DIRECTORY_DOWNLOADS);
            File file = new File(directory, Admin.filenameWithExtention);

            Admin.tinyDB.putString(Admin.filenameWithExtention, file.getAbsolutePath() + "");

            try {
                // Make sure the Pictures directory exists.
                directory.createNewFile();
            } catch (Exception c) {
                Log.wtf("Hulk-err-61", c.getMessage());
            }
            OutputStream output = new FileOutputStream(file.getAbsolutePath());

            byte data[] = new byte[1024];

            long total = 0;

            while ((count = input.read(data)) != -1) {
                total += count;
                // publishing the progress....
                // After this onProgressUpdate will be called
                publishProgress("" + (int) ((total * 100) / lenghtOfFile));

                // writing data to file
                output.write(data, 0, count);
            }

            // flushing output
            output.flush();

            // closing streams
            output.close();
            input.close();

        } catch (Exception e) {
            Log.e("Hulk-Error-72", e.getMessage());
        }

        return null;
    }

    /**
     * Updating progress bar
     */
    protected void onProgressUpdate(String... progress) {
        // setting progress percentage
        AppSyncProgressDialog.setProgress(Integer.parseInt(progress[0]));

    }

    /**
     * After completing background task
     * Dismiss the progress dialog
     **/
    @Override
    protected void onPostExecute(String file_url) {


        AppSyncProgressDialog.StopDialog(Admin.context);
        // dismiss the dialog after the file was downloaded
        AppSyncProgressDialog.setProgress(100);
        // Displaying downloaded image into image view
        // Reading image path from sdcard

    }

}