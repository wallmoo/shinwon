package com.market.mall.am.stats.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @PackageName: com.market.mall.am.stats.service
 * @FileName : StatsOrderService.java
 * @Date : 2014. 8. 12.
 * @프로그램 설명 : 관리자 > 통계 > 매출분석을 처리하는 Controller Class
 * @author LJH
 */
public interface StatsOrderService {

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderStatsOrderDate
	 * 2. ClassName		: StatsOrderService.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 주문일기준 매출통계 일자별 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 8. 12. 오전 10:40:57
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectOrderStatsOrderDate(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStatsOrderTime
     * 2. ClassName		: StatsOrderService.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 주문일기준 매출통계 시간대별 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 12. 오전 10:41:47
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectOrderStatsOrderTime(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderStatsPayDate
	 * 2. ClassName		: StatsOrderService.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 결제금액기준 매출통계 일자별 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 8. 12. 오전 10:40:57
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectOrderStatsPayDate(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStatsPayBrand
     * 2. ClassName		: StatsOrderService.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 결제금액기준 매출통계 브랜드별 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 12. 오전 10:41:47
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectOrderStatsPayBrand(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderStatsPosDate
	 * 2. ClassName		: StatsOrderService.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 판매실적기준 매출통계 일자별 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 8. 12. 오전 10:40:57
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectOrderStatsPosDate(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsCornerCd
    * 2. ClassName  : StatsOrderService.java
    * 3. Comment    : 관리자 > 통계 > 매출분석 > 판매실적기준 매출통계 매장별
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2015. 1. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrderStatsCornerCd(Map<String, Object> commandMap) throws Exception; 

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStatsProductDate
     * 2. ClassName		: StatsOrderService.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 상품매출통계 시간대별 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 12. 오후 7:32:24
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectOrderStatsProductDate(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStatsProductRank
     * 2. ClassName		: StatsOrderService.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 상품매출통계 매출순위별 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 13. 오후 5:11:33
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectOrderStatsProductRank(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStatsMemberRank
     * 2. ClassName		: StatsOrderService.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 회원별매출통계 매출순위별 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 13. 오후 5:47:50
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectOrderStatsMemberRank(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStatsAreaRank
     * 2. ClassName		: StatsOrderService.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 지역별매출통계 매출순위별 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 13. 오후 7:35:57
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectOrderStatsAreaRank(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStatsAgeRank
     * 2. ClassName		: StatsOrderService.java
     * 3. Comment    	: 관리자 > 통계 > 매출분석 > 연령대별매출통계 매출순위별 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 13. 오후 7:35:57
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectOrderStatsAgeRank(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCommissionHistoryCnt
    * 2. ClassName  : StatsOrderService.java
    * 3. Comment    : 수수료 sap 전송 전 회계연월 이력 체크
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2015. 2. 23.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCommissionHistoryCnt(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateSapCommission
    * 2. ClassName  : StatsOrderService.java
    * 3. Comment    : 수수료 sap 전송
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2015. 2. 23.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateSapCommission (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsSales
    * 2. ClassName  : StatsOrderService.java
    * 3. Comment    : 판매실적
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrderStatsSales(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsSalesDetail
    * 2. ClassName  : StatsOrderService.java
    * 3. Comment    : 판매실적 상세
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrderStatsSalesDetail(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsProduct
    * 2. ClassName  : StatsOrderService.java
    * 3. Comment    : 판매상품
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrderStatsProduct(Map<String, Object> commandMap) throws Exception; 
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsCustomerUnit
    * 2. ClassName  : StatsOrderService.java
    * 3. Comment    : 객단가
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrderStatsCustomerUnit(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsShop
    * 2. ClassName  : StatsOrderService.java
    * 3. Comment    : 매장별통계 배송매장 
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrderStatsShop(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsRegularStoreList
    * 2. ClassName  : StatsOrderService.java
    * 3. Comment    : 매장별통계 배송매장 단골매장 리스트 팝업
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrderStatsRegularStoreList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsRegularStoreCount
    * 2. ClassName  : StatsOrderService.java
    * 3. Comment    : 매장별통계 배송매장 단골매장 리스트 개수
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectOrderStatsRegularStoreCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStatsAgeSex
    * 2. ClassName  : StatsOrderService.java
    * 3. Comment    : 매출통계 > 성별/연령별
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 19.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrderStatsAgeSex(Map<String, Object> commandMap) throws Exception; 
    
}
