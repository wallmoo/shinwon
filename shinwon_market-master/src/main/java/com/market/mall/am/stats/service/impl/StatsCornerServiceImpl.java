package com.market.mall.am.stats.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.stats.service.StatsCornerService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

/**
 * 
 * @PackageName: com.market.mall.am.stats.service.impl
 * @FileName : StatsCornerServiceImpl.java
 * @Date : 2014. 10. 22.
 * @프로그램 설명 : 관리자 > 통계 > 매장별통계를 처리하는 Service Implement Class
 * @author LJH
 */
@Service("statsCornerService")
public class StatsCornerServiceImpl implements StatsCornerService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectCornerStatsDelivery
	 * 2. ClassName		: StatsCornerServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 배송완료/거부 통계
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 10. 22. 오전 11:51:21
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCornerStatsDelivery(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("OST_SEND_END", Code.OST_SEND_END);
    	commandMap.put("OST_SWAP_END", Code.OST_SWAP_END);
    	commandMap.put("OST_BACK_END", Code.OST_BACK_END);
    	
    	return defaultDAO.selectList("StatsCorner.selectCornerStatsDelivery",commandMap);
    }

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectCornerStatsDeliveryHistory
	 * 2. ClassName		: StatsCornerServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 배송완료/거부 HISTORY
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 10. 22. 오전 11:51:21
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCornerStatsDeliveryHistory(Map<String, Object> commandMap) throws Exception 
    {
    	return defaultDAO.selectList("StatsCorner.selectCornerStatsDeliveryHistory",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectCornerStatsSendEndList
     * 2. ClassName		: StatsCornerServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 배송완료 목록
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 12. 15. 오후 3:52:57
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCornerStatsSendEndList(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("OST_SEND_END", Code.OST_SEND_END);
    	
    	return defaultDAO.selectList("StatsCorner.selectCornerStatsSendEndList",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectCornerStatsSwapEndList
     * 2. ClassName		: StatsCornerServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 교환완료 목록
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 12. 15. 오후 3:52:57
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCornerStatsSwapEndList(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("OST_SWAP_END", Code.OST_SWAP_END);
    	
    	return defaultDAO.selectList("StatsCorner.selectCornerStatsSwapEndList",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectCornerStatsBackEndList
     * 2. ClassName		: StatsCornerServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 반품완료 목록
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 12. 15. 오후 3:52:57
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCornerStatsBackEndList(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("OST_BACK_END", Code.OST_BACK_END);
    	
    	return defaultDAO.selectList("StatsCorner.selectCornerStatsBackEndList",commandMap);
    }
}
