package com.epasscni.viewer.abstractView;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import com.epasscni.util.StringUtil;

public class XMLView extends AbstractView {
    public XMLView() {
        setContentType( "text/xml; charset=utf-8");
    }


    @SuppressWarnings({ "unchecked", "rawtypes" })
    @Override
    protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {

        StringBuffer sb = new StringBuffer();
        sb.append("<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n");
        sb.append("<root>\n");

            Set<String> keySet = map.keySet();
            Iterator<String> iterator = keySet.iterator();
            while (iterator.hasNext()) {
                String key = iterator.next();
                Object value = map.get(key);


                // java.util.ArrayList
                // [Ljava.lang.String

                System.out.println ("object type : " + value.getClass() + "___" + StringUtil.getInt(value.getClass().toString().indexOf("[Ljava.lang.String"), 0));
                System.out.println ("object type : " + value.getClass() + "___" + StringUtil.getInt(value.getClass().toString().indexOf("java.util.ArrayList"), 0));

                if (StringUtil.getInt(value.getClass().toString().indexOf("[Ljava.lang.String"), 0) > 0){
                    String [] arrData = (String[]) value;
                    sb.append("<"+key+">\n");
                    for (int i=0; i<arrData.length;i++){
                        sb.append("<item>" + arrData[i]+ "</item>\n");
                    }
                    sb.append("</"+key+">\n");
                } else if (StringUtil.getInt(value.getClass().toString().indexOf("java.util.ArrayList"), 0) > 0){
                    List list = (List) value;
                    sb.append("<"+key+">\n");
                    for (int i=0; i<list.size();i++){
                        Map<String, Object> data = (Map<String, Object>) list.get(i);
                        sb.append("<item>\n");
                        Set<String> datakeySet = data.keySet();
                        Iterator<String> dataIterator = datakeySet.iterator();
                        while (dataIterator.hasNext()) {
                            String dataKey = dataIterator.next();
                            Object dataValue = data.get(dataKey);
                            sb.append("<"+dataKey +">" + dataValue+ "</"+dataKey +">\n");
                        }

                        sb.append("</item>\n");
                    }
                    sb.append("</"+key+">\n");
                } else {
                    sb.append("<"+key +">" + value+ "</"+key +">\n");
                }
            }
        sb.append("</root>");

        response.setContentType( "text/xml; charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.write(sb.toString());
        out.flush();

    }
}
