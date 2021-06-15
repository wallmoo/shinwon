package com.market.mall.am.sms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.sms.service.SmsService;
import com.market.mall.dao.CommonDefaultDAO;

@Service("smsService")
public class SmsServiceImpl implements SmsService{
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;

	/**
	* <pre>
	* 1. MethodName : selectSmsLogListCount
	* 2. ClassName  : SmsServiceImpl.java
	* 3. Comment    : sms 발송 내역 개수
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2015. 2. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectSmsLogListCount(Map<String, Object> commandMap) throws Exception {
		int result = 0;
		
		try{
			if("lms".equals(StringUtil.getString(commandMap.get("searchSendType"),""))){
				result = defaultDAO.selectCount("Sms.selectMmsLogListCount", commandMap);
			}else{
				result = defaultDAO.selectCount("Sms.selectSmsLogListCount", commandMap);
			}
		}catch(Exception e){
			result = 0;
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectSmsLogList
	* 2. ClassName  : SmsServiceImpl.java
	* 3. Comment    : sms 발송 내역 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2015. 2. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSmsLogList(Map<String, Object> commandMap) throws Exception {
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		
		try{
			if("lms".equals(StringUtil.getString(commandMap.get("searchSendType"),""))){
				resultList = defaultDAO.selectList("Sms.selectMmsLogList", commandMap);
			}else{
				resultList = defaultDAO.selectList("Sms.selectSmsLogList", commandMap);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return resultList;
	}

}
