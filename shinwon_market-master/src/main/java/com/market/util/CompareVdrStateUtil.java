package com.market.util;

import java.util.Map;
import java.util.Objects;

import com.epasscni.util.StringUtil;

import jxl.biff.drawing.Origin;

public class CompareVdrStateUtil {
	
	public static boolean decisionApvState(Map<String, Object> origin, Map<String, Object> target) {
		
		boolean updateFlag = true;
		
		String ORGIN_PRD_MST_PRC = StringUtil.getString(origin.get("PRD_MST_PRC"));
		String TARGET_ORGIN_PRD_MST_PRC = StringUtil.getString(target.get("PRD_MST_PRC"));
		
		String ORGIN_PRD_MST_UNT = StringUtil.getString(origin.get("PRD_MST_UNT"));
		String TARGET_PRD_MST_UNT = StringUtil.getString(target.get("PRD_MST_UNT"));
		
		String ORGIN_PRD_MST_SALE_RATE = StringUtil.getString(origin.get("PRD_MST_SALE_RATE"));
		String TARGET_PRD_MST_SALE_RATE = StringUtil.getString(target.get("PRD_MST_SALE_RATE"));
		
		String ORGIN_PRD_MST_SEL_CNT = StringUtil.getString(origin.get("PRD_MST_SEL_CNT"));
		String TARGET_PRD_MST_SEL_CNT = StringUtil.getString(target.get("PRD_MST_SEL_CNT"));
		
		String ORGIN_PRD_MST_SEL_STATE = StringUtil.getString(origin.get("PRD_MST_SEL_STATE"));
		String TARGET_PRD_MST_SEL_STATE = StringUtil.getString(target.get("PRD_MST_SEL_STATE"));
		
		if(!ORGIN_PRD_MST_PRC.equals(TARGET_ORGIN_PRD_MST_PRC)) 
		{
			updateFlag = false;
		}
		
		if(!ORGIN_PRD_MST_UNT.equals(TARGET_PRD_MST_UNT)) 
		{
			updateFlag = false;
		}
		if(!ORGIN_PRD_MST_SALE_RATE.equals(TARGET_PRD_MST_SALE_RATE)) 
		{
			updateFlag = false;
		}
		if(!ORGIN_PRD_MST_SEL_CNT.equals(TARGET_PRD_MST_SEL_CNT)) 
		{
			updateFlag = false;
		}
		if(!ORGIN_PRD_MST_SEL_STATE.equals(TARGET_PRD_MST_SEL_STATE))
		{
			updateFlag = false;
		}
		
		return updateFlag;
	}
}
