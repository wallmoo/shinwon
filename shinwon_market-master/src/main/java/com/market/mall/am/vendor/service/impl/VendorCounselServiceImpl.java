package com.market.mall.am.vendor.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.vendor.service.VendorCounselService;
import com.market.mall.dao.CommonDefaultDAO;

/**
 * @PackageName: com.market.mall.am.vendor.service.impl
 * @FileName : VendorCounselServiceImpl.java
 * @Date : 2016. 8. 26.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점상담관리를 처리하는 Controller Class
 * @author DEV_LEESANGWOOK
 */
@Service("vendorCounselService")
public class VendorCounselServiceImpl implements VendorCounselService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorCounselListCount
	 * 2. ClassName  : VendorCounselServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담관리 목록 개수
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectVendorCounselListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("VendorCounsel.selectVendorCounselListCount", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorCounselList
	 * 2. ClassName  : VendorCounselServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담관리 목록
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectVendorCounselList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("VendorCounsel.selectVendorCounselList", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorCounselInfo
	 * 2. ClassName  : VendorCounselServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담관리 상세정보
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorCounselInfo (Map<String,Object> commandMap) throws Exception
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Map<String, Object> row = new HashMap<String, Object>();
		
		row = defaultDAO.select("VendorCounsel.selectVendorCounselInfo", commandMap);
		
		// 현재 유통방법 리스트 불러오기
//		String VDR_CST_DTB = StringUtil.getString(row.get("VDR_CST_DTB"),"");
//		
//		if(!"".equals(VDR_CST_DTB))
//		{
//			String[] VDR_CST_DTBs = VDR_CST_DTB.split("[|]");
//			commandMap.put("VDR_CST_DTBs", VDR_CST_DTBs);
//			returnMap.put("dtbList", defaultDAO.selectList("VendorCounsel.selectDtbList", commandMap));
//		}
			
        commandMap.put("CMM_FLE_TB_NM", "T_VDR_CST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("VDR_CST_IDX"), ""));
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        returnMap.put("row", row);
	       
		return returnMap;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : updateVendorCounsel
	 * 2. ClassName  : VendorCounselServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담관리 수정 
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateVendorCounsel (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.update("VendorCounsel.updateVendorCounsel", commandMap);
	}
}
