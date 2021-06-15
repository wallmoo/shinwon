package com.market.util;

import com.epasscni.viewer.JSON;

public class ResponseCodeUtil {
    public static JSON setSuccessStatus(String message){
        JSON json = new JSON();
        return setSuccessStatus(json, message);
    }
    
    public static JSON setSuccessStatus(JSON json, String message){
        json.put("resultMsg", message);
        json.put("result", "200");
        return json;
    }
    
    public static JSON setFailStatus(String message){
        JSON json = new JSON();
        return setFailStatus(json, message);
    }
    public static JSON setFailStatus(JSON json, String message){
        json.put("resultMsg", message);
        json.put("result", "400");
        return json;
    }
    
}
