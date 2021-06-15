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
import com.market.mall.am.stats.service.StatsRewardService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

/**
 * 
 * @PackageName: com.market.mall.am.stats.service.impl
 * @FileName : StatsRewardServiceImpl.java
 * @Date : 2014. 8. 14.
 * @프로그램 설명 : 관리자 > 통계 > 리워드통계를 처리하는 Service Implement Class
 * @author LJH
 */
@Service("statsRewardService")
public class StatsRewardServiceImpl implements StatsRewardService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectRewardStatsCouponDate
	 * 2. ClassName		: StatsRewardServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 리워드통계 > 쿠폰 통계
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 8. 14. 오후 3:50:19
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectRewardStatsCouponDate(Map<String, Object> commandMap) throws Exception 
    {
    	//commandMap.put("OST_FIX", Code.OST_FIX);

    	return defaultDAO.selectList("StatsReward.selectRewardStatsCouponDate",commandMap);
    }

}
