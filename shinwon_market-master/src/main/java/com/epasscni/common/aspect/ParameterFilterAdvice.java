package com.epasscni.common.aspect;

import java.util.Enumeration;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.epasscni.common.annotations.ParamFilter;
import com.epasscni.common.exception.ParamFilterException;
import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
@Aspect
public class ParameterFilterAdvice {

    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;

	public void checkParam(JoinPoint joinPoint, ParamFilter paramFilter) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();

		Enumeration<?> enumeration = request.getParameterNames();
		
		Map<String, Object> commandMap = null;
		String paramValue = null;
		String compareValue = StringUtil.getString(defaultDAO.select("Common.selectBanWrdKeyWord", commandMap).get("BAN_TXT_LONG_TXT"),"");
		
		String[] deinedFileExt = null;
		
		if(!"".equals(compareValue)){
		    deinedFileExt = compareValue.split("\\|");
		}

		while(enumeration.hasMoreElements()) {
			String key = (String) enumeration.nextElement();
			String[] values = request.getParameterValues(key);
			if(values != null) {
				for(int i=0; i<values.length; i++){
					paramValue = values[i];
					paramValue = paramValue.trim();
					paramValue = paramValue.toLowerCase();
					
					if (deinedFileExt != null) {
						for(int j=0; j<deinedFileExt.length; j++){
							compareValue = deinedFileExt[j];
							if(paramValue.indexOf(compareValue) != -1){
								throw new ParamFilterException();
							}
						}
					}
				}
			}
		}
	}
}
