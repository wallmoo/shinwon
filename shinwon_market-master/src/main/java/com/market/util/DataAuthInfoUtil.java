package com.market.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.market.mall.common.SessionsAdmin;
import com.market.mall.model.Admin;

public class DataAuthInfoUtil {
	public static Map<String,Object> getAdminAuthInfoInstance(HttpServletRequest request,String prefix){
		Map<String,Object> result = new HashMap<String, Object>();
		Admin admin = SessionsAdmin.getSessionAdmin(request);
		result.put(prefix+"REG_ID", admin.getADM_MST_ID());
		result.put(prefix+"REG_IP", request.getRemoteAddr());
		result.put(prefix+"UDP_ID", admin.getADM_MST_ID());
		result.put(prefix+"UDP_IP", request.getRemoteAddr());
		return result;
	}
	
}
