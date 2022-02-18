package com.example.androidtemplate.ExcelFolder;

import android.content.Context;
import android.os.Build;

import androidx.annotation.RequiresApi;

import com.example.androidtemplate.Modules.Admin;
import com.example.androidtemplate.Reqs.ProductsResponseItem;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.File;
import java.util.ArrayList;

public class Excel_products {
    private static File file;
    private static HSSFWorkbook wb;

    @RequiresApi(api = Build.VERSION_CODES.O)
    public static void generate(Context context, ArrayList<ProductsResponseItem> list, String filename) {
        wb = new HSSFWorkbook();
        final HSSFSheet sheet = wb.createSheet(filename);

        ProductsResponseItem pr = new ProductsResponseItem();
        pr.setId("Id");


        list.add(0, pr);

        for (int i = 0; i < list.size(); i++) {
            HSSFRow row = sheet.createRow(i);

            for (int c = 0; c < 10; c++) {
                HSSFCell cell = row.createCell(c);

                if (c == 1)
                    cell.setCellValue("" + list.get(i).getTitle());
                else if (c == 2)
                    cell.setCellValue("" + list.get(i).getUnit());

            }
        }

        Admin.saveFile(filename + ".xls", context, file, wb);
    }
}
