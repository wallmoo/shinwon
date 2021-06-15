package com.market.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ParsePartInfoUtil {
	public static List<Map<String, Object>> ParsePartInfo(List<Map<String, Object>> partInfos){
		if(partInfos == null) {return null;}
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		for(int index = 0; index < partInfos.size(); index++) {
			Map<String, Object> item = new HashMap<String,Object>();
			item.put("ERP_PART_DIV", partInfos.get(index).get("PART_DIV"));
			item.put("SHP_MST_ERP_CD", partInfos.get(index).get("PART_NO"));
			item.put("SHP_MST_NM", partInfos.get(index).get("PART_NAME"));
			item.put("ERP_STATE", partInfos.get(index).get("STATE"));
			item.put("ERP_ZIP_NO", partInfos.get(index).get("ZIP_NO"));
			item.put("SHP_MST_DRO_ADR1", partInfos.get(index).get("ADDR"));
			item.put("SHP_MST_TEL", partInfos.get(index).get("PART_PHONE_NO"));
			item.put("ERP_BRAND", partInfos.get(index).get("BRAND"));
			result.add(item);
		}
		return result;
	}
}
