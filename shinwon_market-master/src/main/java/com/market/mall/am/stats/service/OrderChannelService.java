package com.market.mall.am.stats.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @PackageName: com.market.mall.am.stats.service
 * @FileName : OrderChannelService.java
 * @Date : 2014. 8. 14.
 * @프로그램 설명 : 관리자 > 통계 > 회원통계를 처리하는 Controller Class
 * @author LJH
 */
public interface OrderChannelService {

	
	/**
	 * <pre>
	 * 1. MethodName	: selectOrderChannelList
	 * 2. ClassName		: OrderChannelService.java
     * 3. Comment    	: 관리자 > 통계 > 채널별대출상세
     * 4. 작성자			: khcho
     * 5. 작성일			: 2016. 5. 12.
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectOrderChannelList(Map<String, Object> commandMap) throws Exception;
    
	/**
	 * <pre>
	 * 1. MethodName	: selectOrderChannelSumList
	 * 2. ClassName		: OrderChannelService.java
     * 3. Comment    	: 관리자 > 통계 > 채널별대출 합계리스트 조회
     * 4. 작성자			: khcho
     * 5. 작성일			: 2016. 5. 12.
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectOrderChannelSumList(Map<String, Object> commandMap) throws Exception;
    
	 
    
    
}
