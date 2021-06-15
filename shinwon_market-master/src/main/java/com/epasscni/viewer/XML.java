package com.epasscni.viewer;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.viewer.abstractView.XMLView;

public class XML extends ModelAndView {

    protected HttpServletRequest request;
    private ModelMap model;
    public void setRequest(HttpServletRequest req){
            this.request = req;
    }
    public XML() {
        this.model = new ModelMap();
        this.setView(new XMLView());
    }

    public void init() {

    }

    public XML put(String s, List<Map<String, Object>> l){
        getModelMap().addAttribute(s, l);
        return this;
    }

    public XML put(String s, Map<String, Object> o){
        getModelMap().addAttribute(s, o);
        return this;
    }
    public XML put(String s, String s1){
        getModelMap().addAttribute(s, s1);
        return this;
    }
    public XML put(String s, String[] arr) {
        getModelMap().addAttribute(s, arr);
        return this;
    }
}
