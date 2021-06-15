package com.epasscni.viewer.abstractView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.write.WritableCellFormat;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.epasscni.util.StringUtil;
import com.lowagie.text.Document;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;



public class PDFView extends AbstractPdfView {

    @Override
    protected void buildPdfDocument(Map<String, Object> pdfMap, Document document, PdfWriter writer, HttpServletRequest request, HttpServletResponse response) throws Exception {


        String fileName = (String) pdfMap.get("fileName");
        String datePattern = "YYYY-MM-DD";
        String[] headerTitle = (String[]) pdfMap.get("headerTitle");
        String[] cellField = (String[]) pdfMap.get("cellField");
        String[] colSize = (String[]) pdfMap.get("colSize");
        Map<String, Object> map = (Map<String, Object>) pdfMap.get("headerTpl");
        WritableCellFormat headerFormat = (WritableCellFormat) map.get("headerFormat");
        map = (Map<String, Object>) pdfMap.get("dataTpl");
        WritableCellFormat dataFormat = (WritableCellFormat) map.get("dataFormat");

        HashMap<String, Object> item = null;
        String itemValue = "";



        List list = (List) pdfMap.get("list");

        Table table = new Table(headerTitle.length);
        for(int i=0;i<headerTitle.length;i++){
            table.addCell(headerTitle[i]);
        }
        document.add(table);
        for(int i=0;i<list.size(); i++){
            item = (HashMap<String, Object>) list.get(i);
            table = new Table(cellField.length);
            int nCnt = i+1;
            for(int j=0;j<cellField.length;j++){

                if (item.get(cellField[j]) == null){
                    if ("listNum".equals(cellField[j])){
                        itemValue = StringUtil.getString(i+1);
                    } else {
                        itemValue = "";
                    }
                } else {
                        itemValue = item.get(cellField[j]).toString();
                }
                table.addCell(itemValue);
            }
            document.add(table);
        }


    }


}
