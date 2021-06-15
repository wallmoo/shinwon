package com.market.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ListSelectUtil {
	public static Map<String,Object> selectOne(List<Map<String,Object>> list, String attributeName, String attributeValue){
		if(list==null || list.isEmpty()) {return null;}
		if(attributeName==null || attributeName.isEmpty()) {return null;}
		if(attributeValue==null) {return null;}
		Iterator i = list.iterator();
		while(i.hasNext()) {
			Map<String,Object> item = (Map<String,Object>)i.next();
			if(attributeValue.equals(item.get(attributeName))) {
				return item;
			}
		}
		return null;
	}
	public static List<Map<String,Object>> selectList(List<Map<String,Object>> list, String attributeName, String attributeValue){
		if(list==null || list.isEmpty()) {return null;}
		if(attributeName==null || attributeName.isEmpty()) {return null;}
		if(attributeValue==null) {return null;}
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Iterator i = list.iterator();
		while(i.hasNext()) {
			Map<String,Object> item = (Map<String,Object>)i.next();
			if(attributeValue.equals(item.get(attributeName))) {
				result.add(item);
			}
		}
		return result;
	}
}
