package com.market.mall.am.stats.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.DateUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.stats.service.StatsOrderService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * 
 * @PackageName: com.market.mall.am.stats.service.impl
 * @FileName : StatsOrderServiceImpl.java
 * @Date : 2014. 8. 12.
 * @프로그램 설명 : 관리자 > 통계 > 매출분석을 처리하는 Service Implement Class
 * @author LJH
 */
@Service("statsOrderService")
public class StatsOrderServiceImpl implements StatsOrderService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderStatsOrderDate
	 * 2. ClassName		: StatsOrderServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 주문일기준 매출통계 일자별
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 8. 12. 오전 10:44:38
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsOrderDate(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("PAY_CARD", Code.PAY_CARD);
    	commandMap.put("PAY_ACCOUNT", Code.PAY_ACCOUNT);
    	commandMap.put("PAY_DEPOSIT", Code.PAY_DEPOSIT);
    	commandMap.put("PAY_HP", Code.PAY_HP);
    	commandMap.put("OST_CANCEL_END", Code.OST_CANCEL_END);
        
        return defaultDAO.selectList("StatsOrder.selectOrderStatsOrderDate",commandMap);
    }

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderStatsOrderTime
	 * 2. ClassName		: StatsOrderServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 주문일기준 매출통계 시간대별
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 8. 12. 오전 10:44:38
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsOrderTime(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("PAY_CARD", Code.PAY_CARD);
    	commandMap.put("PAY_ACCOUNT", Code.PAY_ACCOUNT);
    	commandMap.put("PAY_DEPOSIT", Code.PAY_DEPOSIT);
    	commandMap.put("PAY_HP", Code.PAY_HP);
    	commandMap.put("OST_CANCEL_END", Code.OST_CANCEL_END);
        
        return defaultDAO.selectList("StatsOrder.selectOrderStatsOrderTime",commandMap);
    }

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderStatsPayDate
	 * 2. ClassName		: StatsOrderServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 결제금액기준 매출통계 일자별
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 8. 12. 오전 10:44:38
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsPayDate(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("PAY_CARD", Code.PAY_CARD);
    	commandMap.put("PAY_ACCOUNT", Code.PAY_ACCOUNT);
    	commandMap.put("PAY_DEPOSIT", Code.PAY_DEPOSIT);
    	commandMap.put("PAY_HP", Code.PAY_HP);
    	commandMap.put("OST_PAY", Code.OST_PAY);
    	commandMap.put("OST_CANCEL_END", Code.OST_CANCEL_END);
        
        return defaultDAO.selectList("StatsOrder.selectOrderStatsPayDate",commandMap);
    }

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderStatsPayBrand
	 * 2. ClassName		: StatsOrderServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 결제금액기준 매출통계 브랜드별
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 8. 12. 오전 10:44:38
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsPayBrand(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("PAY_CARD", Code.PAY_CARD);
    	commandMap.put("PAY_ACCOUNT", Code.PAY_ACCOUNT);
    	commandMap.put("PAY_DEPOSIT", Code.PAY_DEPOSIT);
    	commandMap.put("PAY_HP", Code.PAY_HP);
    	commandMap.put("OST_PAY", Code.OST_PAY);
    	commandMap.put("OST_CANCEL_END", Code.OST_CANCEL_END);
        
        return defaultDAO.selectList("StatsOrder.selectOrderStatsPayBrand",commandMap);
    }

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderStatsPosDate
	 * 2. ClassName		: StatsOrderServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 판매실적기준 매출통계 일자별
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 8. 12. 오전 10:44:38
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsPosDate(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("OST_SEND", Code.OST_SEND);
    	commandMap.put("OST_BACK_END", Code.OST_BACK_END);
    	commandMap.put("OST_SWAP_END", Code.OST_SWAP_END);
    	commandMap.put("OST_SWAP_CANCEL", Code.OST_SWAP_CANCEL);
    	
        return defaultDAO.selectList("StatsOrder.selectOrderStatsPosDate",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsCornerCd
    * 2. ClassName  : StatsOrderServiceImpl.java
    * 3. Comment    : 관리자 > 통계 > 매출분석 > 판매실적기준 매출통계 매장별
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2015. 1. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsCornerCd(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("OST_SEND", Code.OST_SEND);
    	commandMap.put("OST_BACK_END", Code.OST_BACK_END);
    	commandMap.put("OST_SWAP_END", Code.OST_SWAP_END);
    	commandMap.put("OST_SWAP_CANCEL", Code.OST_SWAP_CANCEL);
    	
        return defaultDAO.selectList("StatsOrder.selectOrderStatsCornerCd",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStatsProductDate
     * 2. ClassName		: StatsOrderServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 상품매출통계 일자별
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 12. 오후 7:34:08
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsProductDate(Map<String, Object> commandMap) throws Exception 
    {
    	//commandMap.put("OST_FIX", Code.OST_FIX);	// 구매확정
    	
    	List<Map<String, Object>> productList = defaultDAO.selectList("StatsOrder.selectOrderStatsProductDate",commandMap);
    	
		for (int i = 0; i < productList.size(); i++)
		{
			commandMap.put("ORDER_DATE", StringUtil.getString(productList.get(i).get("ORDER_DATE"),""));
			commandMap.put("PROD_CD", StringUtil.getString(productList.get(i).get("PROD_CD"),""));
	    	List<Map<String, Object>> sizeList = defaultDAO.selectList("StatsOrder.selectOrderStatsProductSize",commandMap);
	    	
			for (int j = 0; j < sizeList.size(); j++)
			{
		    	productList.get(i).put("PROD_SIZE_"+j,StringUtil.getString(sizeList.get(j).get("PROD_SIZE")));
		    	productList.get(i).put("ORDER_CNT_"+j,StringUtil.getString(sizeList.get(j).get("ORDER_CNT")));
			}
		}
        
        return productList;
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStatsProductRank
     * 2. ClassName		: StatsOrderServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 상품매출통계 매출순위별
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 13. 오후 5:13:12
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsProductRank(Map<String, Object> commandMap) throws Exception 
    {
    	//commandMap.put("OST_FIX", Code.OST_FIX);
    	
        return defaultDAO.selectList("StatsOrder.selectOrderStatsProductRank",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStatsMemberRank
     * 2. ClassName		: StatsOrderServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 회원별매출통계 매출순위별
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 13. 오후 5:48:45
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsMemberRank(Map<String, Object> commandMap) throws Exception 
    {
    	//commandMap.put("OST_FIX", Code.OST_FIX);
    	commandMap.put("OST_CANCEL_END", Code.OST_CANCEL_END);
    	
        return defaultDAO.selectList("StatsOrder.selectOrderStatsMemberRank",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStatsAreaRank
     * 2. ClassName		: StatsOrderServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 지역별매출통계 매출순위별
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 13. 오후 7:36:38
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsAreaRank(Map<String, Object> commandMap) throws Exception 
    {
    	//commandMap.put("OST_FIX", Code.OST_FIX);
    	
        return defaultDAO.selectList("StatsOrder.selectOrderStatsAreaRank",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStatsAgeRank
     * 2. ClassName		: StatsOrderServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 연령대별매출통계 매출순위별
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 13. 오후 7:36:38
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsAgeRank(Map<String, Object> commandMap) throws Exception 
    {
    	//commandMap.put("OST_FIX", Code.OST_FIX);
    	
        return defaultDAO.selectList("StatsOrder.selectOrderStatsAgeRank",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCommissionHistoryCnt
    * 2. ClassName  : StatsOrderServiceImpl.java
    * 3. Comment    : 수수료 sap 전송 전 회계연월 이력 체크
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2015. 2. 23.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCommissionHistoryCnt(Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.selectCount("StatsOrder.selectCommissionHistoryCnt",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateSapCommission
    * 2. ClassName  : StatsOrderServiceImpl.java
    * 3. Comment    : 수수료 SAP 전송
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2015. 2. 23.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateSapCommission (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
    	int result = 0;
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
    	String STR_COM_REG_ID = admin.getADM_MST_ID();
        
    	String searchSendYear = StringUtil.getString(commandMap.get("searchSendYear"),"");
    	String searchSendMonth = StringUtil.getString(commandMap.get("searchSendMonth"),"");
    	
    	commandMap.put("searchStartDate", searchSendYear + searchSendMonth + "01");
        commandMap.put("searchEndDate", searchSendYear + searchSendMonth + "31");
        
        //SAP 전송 여부
        commandMap.put("updateSapCommissionYn", "Y");
    	
    	List<Map<String, Object>> cornerList = this.selectOrderStatsCornerCd(commandMap); /*매장별 매출통계 가져오기*/
    	
    	if(cornerList.size() == 0){
    		result = -1;
    	}else{
    		for(Map<String,Object> cornerMap : cornerList){
        		/*cornerMap.put("SEND_YEAR", searchSendYear);
        		cornerMap.put("SEND_MONTH", searchSendMonth);
        		cornerMap.put("STR_COM_DATE", searchSendYear + searchSendMonth );
        		cornerMap.put("STR_COM_REG_ID", STR_COM_REG_ID);
        		//RFC 통신 
        		Map<String,Object> resultMap = erpStock.updateSapCommision(cornerMap);
        		String eCode = StringUtil.getString(resultMap.get("STR_COM_RETURN_CD"),"");
        		
        		//실패한 건만 카운트 ++
        		if(!eCode.equals("S")){
        			result++;
        		}
        		
        		//LOG 입력
        		defaultDAO.update("StatsOrder.updateCommissionHistory",resultMap);*/
        	}
    	}
    	
    	return result;
    }
    
    
    
    
    
    
    
    
    
    
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsSales
    * 2. ClassName  : StatsOrderServiceImpl.java
    * 3. Comment    : 판매실적
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsSales(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("StatsOrder.selectOrderStatsSales",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsSalesDetail
    * 2. ClassName  : StatsOrderServiceImpl.java
    * 3. Comment    : 판매실적 엑셀 다운로드
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsSalesDetail(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("StatsOrder.selectOrderStatsSalesDetail",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsProduct
    * 2. ClassName  : StatsOrderServiceImpl.java
    * 3. Comment    : 판매상품 
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsProduct(Map<String, Object> commandMap) throws Exception 
    {
    	//카테고리 하나라도 선택되어있으면 searchCategoryYn이 Y
    	String searchPrdCtgEnv = StringUtil.getString(commandMap.get("searchPrdCtgEnv"),"");
    	String searchPrdCtgBrand = StringUtil.getString(commandMap.get("searchPrdCtgBrand"),"");
    	String searchPrdCtgIdx = StringUtil.getString(commandMap.get("searchPrdCtgIdx"),"");
    	
    	if(!("").equals(searchPrdCtgEnv) || !("").equals(searchPrdCtgBrand) || !("").equals(searchPrdCtgIdx)){
    		commandMap.put("searchCategoryYn", "Y");
    	}
    	
        return defaultDAO.selectList("StatsOrder.selectOrderStatsProduct",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsCustomerUnit
    * 2. ClassName  : StatsOrderServiceImpl.java
    * 3. Comment    : 객단가
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsCustomerUnit(Map<String, Object> commandMap) throws Exception 
    {
    	//카테고리 하나라도 선택되어있으면 searchCategoryYn이 Y
    	String searchPrdCtgEnv = StringUtil.getString(commandMap.get("searchPrdCtgEnv"),"");
    	String searchPrdCtgBrand = StringUtil.getString(commandMap.get("searchPrdCtgBrand"),"");
    	String searchPrdCtgIdx = StringUtil.getString(commandMap.get("searchPrdCtgIdx"),"");
    	
    	if(!("").equals(searchPrdCtgEnv) || !("").equals(searchPrdCtgBrand) || !("").equals(searchPrdCtgIdx)){
    		commandMap.put("searchCategoryYn", "Y");
    	}
    	
        return defaultDAO.selectList("StatsOrder.selectOrderStatsCustomerUnit",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsShop
    * 2. ClassName  : StatsOrderServiceImpl.java
    * 3. Comment    : 매장별통계 > 배송매장 
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsShop(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("StatsOrder.selectOrderStatsShop",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsRegularStoreList
    * 2. ClassName  : StatsOrderServiceImpl.java
    * 3. Comment    : 매장별통계 > 배송매장 > 단골매장 리스트 팝업
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderStatsRegularStoreList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("StatsOrder.selectOrderStatsRegularStoreList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsRegularStoreCount
    * 2. ClassName  : StatsOrderServiceImpl.java
    * 3. Comment    : 매장별통계 > 배송매장 > 단골매장 리스트 개수
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectOrderStatsRegularStoreCount(Map<String, Object> commandMap) throws Exception{
    	 return defaultDAO.selectCount("StatsOrder.selectOrderStatsRegularStoreCount",commandMap);
    }

    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsAgeSex
    * 2. ClassName  : StatsOrderServiceImpl.java
    * 3. Comment    : 매출통계 > 성별/연령별
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 19.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderStatsAgeSex(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("StatsOrder.selectOrderStatsAgeSex",commandMap);
    }
}
