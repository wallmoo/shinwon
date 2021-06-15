package com.market.mall.pc.mypage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.mypage.service.MyGroupInquiryService;

@Service("pcMyGroupInquiryService")
public class MyGroupInquiryServiceImpl implements MyGroupInquiryService 
{
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Autowired 
    private FileUpload fileUpload;
	
	/**
	* <pre>
	* 1. MethodName : selectMyGroupInquiryListCount
	* 2. ClassName : MyGroupInquiryServiceImpl.java
	* 3. Comment : 사용자 > 마이페이지 > 쇼핑컨텐츠 > 단체주문문의 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 7. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMyGroupInquiryListCount(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.selectCount("PcMyGroupInquiry.selectMyGroupInquiryListCount",commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : selectMyGroupInquiryList
	* 2. ClassName : MyGroupInquiryServiceImpl.java
	* 3. Comment : 사용자 > 마이페이지 > 쇼핑컨텐츠 > 단체주문문의 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 7. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMyGroupInquiryList(Map<String, Object> commandMap) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    List<Map<String, Object>> list = defaultDAO.selectList("PcMyGroupInquiry.selectMyGroupInquiryList",commandMap);	    
	    
        returnMap.put("list", list);
		
		return returnMap;
	}
	
	
	/**
	* <pre>
	* 1. MethodName : selectMyGroupInquiryInfo
	* 2. ClassName : MyGroupInquiryServiceImpl.java
	* 3. Comment : 사용자 > 마이페이지 > 쇼핑컨텐츠 > 단체주문문의 상세보기
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 7. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectMyGroupInquiryInfo (HttpServletRequest request,Map<String,Object> commandMap) throws Exception
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		commandMap.put("CMM_FLE_TB_NM", "T_GRP_INQ");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("GRP_INQ_IDX"), ""));
	    commandMap.put("COMP_CD", request.getAttribute("serverCompCd"));      // 회사코드
	    
	    returnMap.put("fileList", defaultDAO.selectList("PcCommon.selectCommonFileList", commandMap));
	    
	    Map<String, Object> row = defaultDAO.select("PcMyGroupInquiry.selectMyGroupInquiryInfo", commandMap);
	    
		returnMap.put("row", row);
		
	    return returnMap;
	}
	

}
