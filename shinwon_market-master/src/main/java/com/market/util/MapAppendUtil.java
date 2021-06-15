package com.market.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class MapAppendUtil {
	public static void appendTablePrefix(Map<String,Object> map,String prefix) {
		Map<String,Object> tmp = new HashMap<String, Object>();
		
		Set<String> keys = map.keySet();
		for (String key : keys) {
			tmp.put(prefix+key, map.get(key));
		}
		
		Set<String> tmpKeys = tmp.keySet();
		for (String key : tmpKeys) {
			map.put(key, tmp.get(key));
		}
	}
}
