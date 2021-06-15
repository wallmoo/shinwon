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
import com.market.mall.am.stats.service.OrderChannelService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

/**
 * 
 * @PackageName: com.market.mall.am.stats.service.impl
 * @FileName : OrderChannelServiceImpl.java
 * @Date : 2016. 5. 12.
 * @프로그램 설명 : 관리자 > 통계 > 채널별배출ㄹ을 처리하는 Service Implement Class
 * @author khcho
 */
@Service("orderChannelService")
public class OrderChannelServiceImpl implements OrderChannelService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderChannelList
	 * 2. ClassName		: OrderChannelServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 채널별 매출통계 상세
     * 4. 작성자			: khcho
     * 5. 작성일			: 2016. 5. 12.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderChannelList(Map<String, Object> commandMap) throws Exception 
    {
    	String searchOrdGb = StringUtil.getString(commandMap.get("searchOrdGb"),"A");
    	
    	List<Map<String, Object>> tempList = null;
    	
    	if("A".equals(searchOrdGb))
    	{
    		tempList = defaultDAO.selectList("OrderChannel.selectOrderChannelListA",commandMap);
    	}else
    	{
    		tempList = defaultDAO.selectList("OrderChannel.selectOrderChannelListB",commandMap);
    	}
        return tempList;
    }
    /**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderChannelSumList
	 * 2. ClassName		: OrderChannelServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 채널별 매출통계 합계목록조회
     * 4. 작성자			: khcho
     * 5. 작성일			: 2016. 5. 12.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderChannelSumList(Map<String, Object> commandMap) throws Exception 
    {
    	String searchOrdGb = StringUtil.getString(commandMap.get("searchOrdGb"),"A");
    	
    	List<Map<String, Object>> tempList = null;
    	
    	if("A".equals(searchOrdGb))
    	{
    		tempList = defaultDAO.selectList("OrderChannel.selectOrderChannelSumListA",commandMap);
    	}else
    	{
    		tempList = defaultDAO.selectList("OrderChannel.selectOrderChannelSumListB",commandMap);
    	}
        return tempList;
    }
	
 
}
