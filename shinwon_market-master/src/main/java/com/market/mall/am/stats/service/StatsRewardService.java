package com.market.mall.am.stats.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @PackageName: com.market.mall.am.stats.service
 * @FileName : StatsRewardService.java
 * @Date : 2014. 8. 14.
 * @프로그램 설명 : 관리자 > 통계 > 리워드통계를 처리하는 Controller Class
 * @author LJH
 */
public interface StatsRewardService {

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectRewardStatsCouponDate
	 * 2. ClassName		: StatsRewardService.java
     * 3. Comment    	: 관리자 > 통계 > 리워드통계 > 쿠폰 통계 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 8. 14. 오후 2:49:17
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectRewardStatsCouponDate(Map<String, Object> commandMap) throws Exception;

}
