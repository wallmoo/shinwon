package com.market.util;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JsonUtil {
    public static JSONObject getJsonStringFromMap( Map<String, Object> map )
    {
        JSONObject jsonObject = new JSONObject();
        if(map==null || map.isEmpty()) {return jsonObject;}
        for( Map.Entry<String, Object> entry : map.entrySet() ) {
            String key = entry.getKey();
            Object value = entry.getValue();
            if (value instanceof List) {
            	value = getJsonArrayFromList((List<Map<String, Object>>)value);
			}
            jsonObject.put(key, value);
        }
        
        return jsonObject;
    }
    
    public static JSONArray getJsonArrayFromList( List<Map<String, Object>> list )
    {
        JSONArray jsonArray = new JSONArray();
        if(list==null || list.isEmpty()) {return jsonArray;}
        for( Map<String, Object> map : list ) {
            jsonArray.add( getJsonStringFromMap( map ) );
        }
        
        return jsonArray;
    }
}
