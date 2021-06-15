package com.market.util;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONObject;

import com.epasscni.util.StringUtil;

public class ObjectToJsonUtil {
    
    public static JSONObject objectToJson(List<Map<String,Object>> param, String key){
        JSONObject jsonObject = new JSONObject();
        
        for(int index=0; index < param.size(); index++){
            String value = (String)param.get(index).get(key);
            jsonObject.put(key, value);
        }
        
        return jsonObject;
    }
    
    public static JSONObject objectToJson(Map<String,Object> param){
        JSONObject jsonObject = new JSONObject();
        Set<String> keyset = param.keySet();
        Iterator iterator = keyset.iterator();
        while(iterator.hasNext()) {
        	String key = (String)iterator.next();
        	String value = StringUtil.getString(param.get(key),"");
        	jsonObject.put(key, value);
        }
        return jsonObject;
    }
}
