package com.market.mall.am.stats.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @PackageName: com.market.mall.am.stats.service
 * @FileName : StatsCornerService.java
 * @Date : 2014. 10. 22.
 * @프로그램 설명 : 관리자 > 통계 > 매장별통계를 처리하는 Controller Class
 * @author LJH
 */
public interface StatsCornerService {

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectCornerStatsDelivery
	 * 2. ClassName		: StatsCornerService.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 배송완료/거부 통계 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 10. 22. 오전 11:49:02
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectCornerStatsDelivery(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectCornerStatsDeliveryHistory
	 * 2. ClassName		: StatsCornerService.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 배송완료/거부 HISTORY 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 10. 22. 오전 11:49:02
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectCornerStatsDeliveryHistory(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectCornerStatsSendEndList
     * 2. ClassName		: StatsCornerService.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 배송완료 목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 12. 15. 오후 3:48:40
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCornerStatsSendEndList(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectCornerStatsSwapEndList
     * 2. ClassName		: StatsCornerService.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 교환완료 목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 12. 15. 오후 3:48:40
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCornerStatsSwapEndList(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectCornerStatsBackEndList
     * 2. ClassName		: StatsCornerService.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 반품완료 목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 12. 15. 오후 3:48:40
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCornerStatsBackEndList(Map<String, Object> commandMap) throws Exception;
}
