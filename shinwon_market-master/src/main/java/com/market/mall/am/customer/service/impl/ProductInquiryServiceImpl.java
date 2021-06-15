package com.market.mall.am.customer.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.customer.service.ProductInquiryService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.customer.service.impl
 * @FileName : ProductInquiryServiceImpl.java
 * @Date : 2015. 4. 10.
 * @프로그램 설명 : 관리자 > 고객센터 > 상품 문의를 처리하는 Service Implement Class
 * @author DEV_KIMSOYOUNG
 */
@Service("productInquiryService")
public class ProductInquiryServiceImpl implements ProductInquiryService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Resource
	protected Sms sms;
    
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH;
	
	/**
	* <pre>
	* 1. MethodName : selectProductInquiryListCount
	* 2. ClassName : ProductInquiryServiceImpl.java
	* 3. Comment : 관리자 > 고객센터 > 상품 문의 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 10.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectProductInquiryListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("ProductInquiry.selectProductInquiryListCount", commandMap);
    }
	
	/**
	* <pre>
	* 1. MethodName : selectProductInquiryList
	* 2. ClassName : ProductInquiryServiceImpl.java
	* 3. Comment : 관리자 > 고객센터 > 상품 문의 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 10.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductInquiryList(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("ProductInquiry.selectProductInquiryList",commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectProductInquiryInfo
	* 2. ClassName : ProductInquiryServiceImpl.java
	* 3. Comment : 관리자 > 고객센터 > 상품문의 상세 정보 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 10.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectProductInquiryInfo (Map<String, Object> commandMap) throws Exception
	{
	    Map<String, Object> returnMap = new HashMap<String, Object>();
    	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
	    
	    // 상품 문의 상세정보 
	    Map<String, Object> row = defaultDAO.select("ProductInquiry.selectProductInquiryInfo", commandMap);
	    
	    // 첨부파일 정보
	    commandMap.put("CMM_FLE_TB_NM", "T_BRD_INQ"); 
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_INQ_IDX"), ""));
        List<Map<String, Object>> fileList = defaultDAO.selectList("Common.selectCommonFileList", commandMap);
        
	    returnMap.put("fileList", fileList);
	    returnMap.put("row", row);
	    
	    return returnMap;
	}
	
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectSellerInquiryInfo (Map<String, Object> commandMap) throws Exception
	{
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    // 셀러 문의 상세정보 
	    Map<String, Object> row = defaultDAO.select("ProductInquiry.selectProductInquiryInfo", commandMap);
	    
	    returnMap.put("row", row);
	    
	    return returnMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : updateProductInquiry
	* 2. ClassName : ProductInquiryServiceImpl.java
	* 3. Comment : 관리자 > 고객센터 > 상품문의 답변 등록 / 수정
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 10.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/	
	public int updateProductInquiry (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
	{
	    Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BRD_INQ_REPLY_IP", request.getRemoteAddr());
        commandMap.put("BRD_INQ_REPLY_ID", admin.getADM_MST_ID());
        commandMap.put("BRD_INQ_REPLY_NM", admin.getADM_MST_NM());

        // 답변 등록
        return defaultDAO.update("ProductInquiry.updateProductInquiry", commandMap); 
	    	     
	}
	
	public int selectSellerInquiryListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("ProductInquiry.selectSellerInquiryListCount", commandMap);
    }
	
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSellerInquiryList(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("ProductInquiry.selectSellerInquiryList",commandMap);
	}

}
