package com.market.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MapToArrayListUtil {
    public static ArrayList<String> mapToArrayList(Map<String, Object> param, String key){
        
        ArrayList<String> result = new ArrayList<String>();
        
        if(key == null) {
            return result;
        }
        
        String [] keys = new String[param.size()];
        Object [] values = new Object[param.size()];
        
        int index = 0;
        
        for(Map.Entry<String, Object> mapEntry : param.entrySet()){
            if(mapEntry.getKey().contains(key) && mapEntry.getKey() != null) {
                values[index] = mapEntry.getValue();
                result.add((String)values[index]);
            }
            index++;
        }
        return result;
    }
}
