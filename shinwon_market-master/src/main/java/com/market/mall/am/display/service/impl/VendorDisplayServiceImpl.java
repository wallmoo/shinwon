package com.market.mall.am.display.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.VendorDisplayService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.display.service.impl
 * @FileName : VendorDisplayServiceImpl.java
 * @Date : 2016. 2. 17.
 * @프로그램 설명 : 입점업체 상품상세 공지를 처리하는 ServiceImpl
 * @author DEV_KIMMINHO    
 */
@Service("vendorDisplayService")
public class VendorDisplayServiceImpl implements VendorDisplayService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
	/**
	* <pre>
	* 1. MethodName : selectVendorDisplayCount
	* 2. ClassName : VendorDisplayServiceImpl.java
	* 3. Comment : 입점업체 공통전시 등록 갯수
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 2. 17.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectVendorDisplayCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("VendorDisplay.selectVendorDisplayCount", commandMap);
    }
	
	/**
	* <pre>
	* 1. MethodName : insertVendorDisplay
	* 2. ClassName : VendorDisplayServiceImpl.java
	* 3. Comment : 입점업체 공통전시 등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertVendorDisplay(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.insert("VendorDisplay.insertVendorDisplay", commandMap);
    }
	
	/**
	* <pre>
	* 1. MethodName : updateVendorDisplay
	* 2. ClassName : VendorDisplayServiceImpl.java
	* 3. Comment : 입점업체 공통전시 수정
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateVendorDisplay(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.insert("VendorDisplay.updateVendorDisplay", commandMap);
    }
	
	/**
	* <pre>
	* 1. MethodName : selectVendorDisplayInfo
	* 2. ClassName : VendorDisplayServiceImpl.java
	* 3. Comment : 입점업체 공통전시 상세
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 2. 17.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorDisplayInfo (Map<String,Object> commandMap) throws Exception
	{
		return (Map<String, Object>) defaultDAO.select("VendorDisplay.selectVendorDisplayInfo", commandMap);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectVendorDisplayFileList (Map<String,Object> commandMap) throws Exception
	{
		return (List<Map<String,Object>>) defaultDAO.selectList("Contents.selectContentFileList", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorDisPcListImage (Map<String,Object> commandMap) throws Exception
	{
		return (Map<String, Object>) defaultDAO.select("Contents.selectContentPcListImage", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorDisMobileListImage (Map<String,Object> commandMap) throws Exception
	{
		return (Map<String, Object>) defaultDAO.select("Contents.selectContentMobileListImage", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorDisPcDetailImage (Map<String,Object> commandMap) throws Exception
	{
		return (Map<String, Object>) defaultDAO.select("Contents.selectContentPcDetailImage", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorDisMobileDetailImage (Map<String,Object> commandMap) throws Exception
	{
		return (Map<String, Object>) defaultDAO.select("Contents.selectContentMobileDetailImage", commandMap);
	}
	@Override
	@SuppressWarnings("unchecked")
	public Integer modifyVendorDisplay(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		//Map<String,Object> param = setSessionAdmin(request, commandMap);
        commandMap.put("CNT_MST_REG_IP",StringUtil.getString(commandMap.get("CNT_MST_REG_IP")));
        commandMap.put("CNT_MST_REG_ID",StringUtil.getString(commandMap.get("CNT_MST_REG_ID")));
		return (Integer) defaultDAO.update("Contents.selectContentMobileDetailImage", commandMap);
	}
	
}
