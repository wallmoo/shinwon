package com.epasscni.viewer.abstractView;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.web.servlet.view.AbstractView;

public class JSONView extends AbstractView {
    public JSONView() {
        setContentType( "text/json; charset=utf-8");
    }


    @Override
    protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {

        JSONObject jsonObject = JSONObject.fromObject(map);

        //JSONObject obj = (JSONObject) new XMLSerializer().read( jsonObject.toString() );

        //System.out.println(obj);

        response.setContentType( "text/json; charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.write(jsonObject.toString());
        out.flush();

    }
}
