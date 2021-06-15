package com.market.mall.am.site.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.site.service.VendorManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.site.service.impl
 * @FileName : VendorManagerServiceImpl.java
 * @Date : 2016. 8. 24.
 * @프로그램 설명 : 관리자 > 시스템관리 > 입점업체 관리를 처리하는 Service Implement Class
 * @author DEV_KIMYEONGJUN
 */
@Service("vendorManagerService")
public class VendorManagerServiceImpl implements VendorManagerService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorManagerListCount
	 * 2. ClassName  : VendorManagerServiceImpl.java
	 * 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 목록 갯수
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 24.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectVendorManagerListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("VendorManager.selectVendorManagerListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectVendorManagerList
	* 2. ClassName  : VendorManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 목록
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectVendorManagerList (Map<String , Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("VendorManager.selectVendorManagerList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertVendorManager
	* 2. ClassName  : VendorManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 등록
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertVendorManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("VDR_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("VDR_MST_REG_ID", admin.getADM_MST_ID());
        
		return defaultDAO.insert("VendorManager.insertVendorManager", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectVendorManagerInfo
	* 2. ClassName  : VendorManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 입점업체 상세정보
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorManagerInfo (Map<String,Object> commandMap) throws Exception
	{
		return (Map<String, Object>) defaultDAO.select("VendorManager.selectVendorManagerInfo", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : updateVendorManager
	* 2. ClassName  : VendorManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 입점업체 수정
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateVendorManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("VDR_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("VDR_MST_UPD_ID", admin.getADM_MST_ID());
        
        int result = defaultDAO.update("VendorManager.updateVendorManager", commandMap);
        
        if(result > 0)
        {
        	// 입점업체정보관리에서 상태여부에 따른 관리자관리에 해당 입점업체에 대한 아이디 사용여부 수정
        	defaultDAO.update("VendorManager.updateBasicManagerState", commandMap);
        }
        
		return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectVendorManagerNmCheckCount
	* 2. ClassName  : VendorManagerServiceImpl.java
	* 3. Comment    : 입점업체 중복체크
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectVendorManagerNmCheckCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("VendorManager.selectVendorManagerNmCheckCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : updateChangeFee
	* 2. ClassName  : VendorManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 입점업체관리 > 수정 > 수수료 변경 > 등록
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
//	public int updateChangeFee (Map<String,Object> commandMap) throws Exception
//	{
//		int result = defaultDAO.update("VendorManager.updateChangeFee", commandMap);
//		
//		if(result > 0)
//		{
//			// 수수료 변경으로 인한 해당 입점업체 상품 매입원가 변경
//			defaultDAO.update("VendorManager.updateVendorProductBuyPrice", commandMap);
//		}
//		
//		return result;
//	}
	
	/**
	* <pre>
	* 1. MethodName : selectVendorReqListCount
	* 2. ClassName  : VendorManagerServiceImpl.java
	* 3. Comment    : 입점신청을 작성한 입점업체 목록 갯수
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectVendorReqListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("VendorManager.selectVendorReqListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectVendorReqList
	* 2. ClassName  : VendorManagerServiceImpl.java
	* 3. Comment    : 입점신청을 작성한 입점업체 목록
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectVendorReqList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("VendorManager.selectVendorReqList", commandMap);
	}
	
	public int selectSellerListCount (Map<String,Object> commandMap) throws Exception{
	    return defaultDAO.selectCount("VendorManager.selectSellerListCount", commandMap);
	}
	    
	public List<Map<String,Object>> selectSellerList (Map<String,Object> commandMap) throws Exception {
	    return defaultDAO.selectList("VendorManager.selectSellerList", commandMap);
	}
	
	public int selectRegistVendorListCount (Map<String,Object> commandMap) throws Exception {
        return defaultDAO.selectCount("VendorManager.selectRegistVendorListCount", commandMap);
    }

    public List<Map<String, Object>> selectRegistVendorList (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("VendorManager.selectRegistVendorList", commandMap);
    }
    
    public List<Map<String, Object>> selectSellerSearchList (Map<String, Object> commandMap) throws Exception {
    	/* 
    	 * 판매율(%) =  (판매수량  / 총재고 ( 판매수량 + 현재 재고 수량 )) * 100 
    	 */
    	double result = 0;
    	List<Map<String, Object>> sellerList = defaultDAO.selectList("VendorManager.selectSellerList", commandMap);
    	
    	//입점업체별 판매수량 = 한달전 ~ 금일 총 주문량
    	List<Map<String, Object>> orderSellCntByVendorList = defaultDAO.selectList("VendorManager.selectOrderSellCntByVendor", commandMap);
    	//입점업체별 총 재고
    	List<Map<String, Object>> productStockByVendorList = defaultDAO.selectList("VendorManager.selectProductStockCntByVendor", commandMap);

    	if(orderSellCntByVendorList != null && orderSellCntByVendorList.size() > 0 && productStockByVendorList != null && productStockByVendorList.size() > 0) {
			
    		for(Map<String, Object> orderCnt : orderSellCntByVendorList) {
				for(Map<String, Object> productCnt : productStockByVendorList) {
					if(orderCnt.get("PRD_MST_VDR_IDX").equals(productCnt.get("VDR_MST_IDX"))) {

						int sellCnt = StringUtil.getInt(orderCnt.get("VDR_ORD_CNT"));
						int productStock = StringUtil.getInt(productCnt.get("PRD_STOCK_TOTAL"));

						result = Double.parseDouble(String.format("%.2f",((double)sellCnt / (double)productStock) * 100.0));
					}
				}
				for(Map<String, Object> seller : sellerList) {
					if(seller.get("VDR_MST_IDX").equals(orderCnt.get("PRD_MST_VDR_IDX"))) {
						seller.put("VDR_SELL_RATE", result);
					}else {
						seller.put("VDR_SELL_RATE", (double)0);
					}
				}
				
			}

    	}
    	else {
    		for(Map<String, Object> seller : sellerList) {
    			seller.put("VDR_SELL_RATE", result);
    		}
    	}
    		
    	return sellerList;
    }
    
    
	public int deleteVendorManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
        
        return defaultDAO.update("VendorManager.deleteVendorManager", commandMap);
        
        
        /*
        int result = defaultDAO.update("VendorManager.updateVendorManager", commandMap);
        
        if(result > 0)
        {
        	// 입점업체정보관리에서 상태여부에 따른 관리자관리에 해당 입점업체에 대한 아이디 사용여부 수정
        	defaultDAO.update("VendorManager.updateBasicManagerState", commandMap);
        }
        
		return result;
		*/
	}    
	
}
