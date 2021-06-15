package com.market.util;

import java.util.HashMap;
import java.util.Map;

public class StringToMapUtil {
    public static Map<String, Object> stringToMap(String source){
        
        if(source == null || source.isEmpty()){return null;}
        
        String[] sKeyValueList = source.replace("{", "").replace("}", "").split(",");
        
        Map<String, Object> result = new HashMap<String, Object>();
        for(int index = 0; index < sKeyValueList.length; index++){
            String[] sKeyValueItem = sKeyValueList[index].split("=");
            result.put(sKeyValueItem[0], StringUtils.nvl(sKeyValueItem[1]));
        }
        return result;
    }
}
