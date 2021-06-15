package com.epasscni.viewer.abstractView;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.springframework.web.servlet.view.document.AbstractJExcelView;

import com.epasscni.util.CharacterConversion;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;



public class EXCELView extends AbstractJExcelView {

    @SuppressWarnings({ "unchecked", "rawtypes" })
    @Override
    protected void buildExcelDocument(Map<String, Object> excelMap, WritableWorkbook wb, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String itemValue = "";

        String fileName = (String) excelMap.get("fileName");
        String[] headerTitle = (String[]) excelMap.get("headerTitle");
        String[] cellField = (String[]) excelMap.get("cellField");
        String[] colSize = (String[]) excelMap.get("colSize");
        Map<String, Object> map = (Map<String, Object>) excelMap.get("headerTpl");
        WritableCellFormat headerFormat = (WritableCellFormat) map.get("headerFormat");
        map = (Map<String, Object>) excelMap.get("dataTpl");
        WritableCellFormat dataFormat = (WritableCellFormat) map.get("dataFormat");


        HashMap<String, Object> item = null;
        List list = (List) excelMap.get("list");

        WorkbookSettings ws = new WorkbookSettings();
        ws.setLocale(new Locale("ko", "KR"));

        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename="+CharacterConversion.K2E(fileName)+".xls");

        WritableWorkbook workbook = Workbook.createWorkbook(response.getOutputStream(), ws);
        WritableSheet sheet = workbook.createSheet("data",0);

        for(int i=0;i<colSize.length;i++){
            sheet.setColumnView(i, Integer.parseInt(colSize[i].toString()));
        }



        for(int i=0;i<headerTitle.length;i++){
            sheet.addCell(new Label(i,0,headerTitle[i], headerFormat));
        }
        if (list != null){
            for(int i=0;i<list.size(); i++){
                item = (HashMap<String, Object>) list.get(i);
                int nCnt = i+1;
                for(int j=0;j<cellField.length;j++){

                    if (item.get(cellField[j]) == null){
                        if ("listNum".equals(cellField[j])){
                            itemValue = StringUtil.getString(i+1);
                        } else {
                            itemValue = "";
                        }
                    } else {

                        if (cellField[j].indexOf("REGDATE") > 0){
                            itemValue = FormatUtil.formatDate(item.get(cellField[j]).toString(), "-");
                        } else if (cellField[j].indexOf("MODDATE") > 0){
                            itemValue = FormatUtil.formatDate(item.get(cellField[j]).toString(), "-");
                        //} else if (cellField[j].indexOf("DATE") > 0){
                            //itemValue = formatUtil.dateFormat(item.get(cellField[j]).toString(), datePattern);
                        } else {
                            itemValue = item.get(cellField[j]).toString();
                        }
                    }
                    sheet.addCell(new Label(j, nCnt, itemValue, dataFormat));
                }
            }
        }

        workbook.write();
        workbook.close();
    }

}
