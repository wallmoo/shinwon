package com.market.mall.am.vendor.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.epasscni.util.StringUtil;
import com.market.mall.am.vendor.service.VendorReqService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.vendor.service.impl
 * @FileName : VendorReqServiceImpl.java
 * @Date : 2016. 8. 23.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점신청서 관리를 처리하는 Service Implement Class
 * @author DEV_KIMYEONGJUN
 */
@Service("vendorReqService")
public class VendorReqServiceImpl implements VendorReqService {

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Resource protected Mail mail;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorReqListCount
	 * 2. ClassName  : VendorReqServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점신청서관리 목록 갯수
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 23.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectVendorReqListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("VendorReq.selectVendorReqListCount", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorReqList
	 * 2. ClassName  : VendorReqServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점신청서관리 목록
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 23.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectVendorReqList (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("VendorReq.selectVendorReqList", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorReqInfo
	 * 2. ClassName  : VendorReqServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점신청서관리 상세정보
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 23.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorReqInfo (Map<String,Object> commandMap) throws Exception
	{
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    //입점신청서 상세정보
	    Map<String, Object> row = defaultDAO.select("VendorReq.selectVendorReqInfo", commandMap);
	    returnMap.put("row", row);
	    
	    //외부채널 리스트
	    List<Map<String, Object>> vendorRouteChannel = defaultDAO.selectList("VendorReq.selectVendorRouteChannel", commandMap);
		returnMap.put("vendorRouteChannel", vendorRouteChannel);
		
		//사업자 등록증 첨부파일
		commandMap.put("CMM_FLE_TB_NM", "T_VDR_REQ");
		commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("VDR_REQ_IDX"), ""));
		Map<String, Object> file = defaultDAO.select("Common.selectCommonFileInfo", commandMap);
		returnMap.put("file", file);
	    
		return returnMap;
	    
	}
	
	/**
	 * <pre>
	 * 1. MethodName : updateVendorReq
	 * 2. ClassName  : VendorReqServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점신청서관리 수정
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 23.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateVendorReq (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
        Admin admin = SessionsAdmin.getSessionAdmin(request);
	        
	    commandMap.put("VDR_REQ_UPD_IP", request.getRemoteAddr());
	    commandMap.put("VDR_REQ_UPD_ID", admin.getADM_MST_ID());
	         
		return defaultDAO.update("VendorReq.updateVendorReq", commandMap);
	}
	 
}
