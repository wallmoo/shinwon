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
import com.market.mall.am.stats.service.StatsMemberService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

/**
 * 
 * @PackageName: com.market.mall.am.stats.service.impl
 * @FileName : StatsMemberServiceImpl.java
 * @Date : 2014. 8. 14.
 * @프로그램 설명 : 관리자 > 통계 > 회원통계를 처리하는 Service Implement Class
 * @author LJH
 */
@Service("statsMemberService")
public class StatsMemberServiceImpl implements StatsMemberService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectMemberJoinDate
	 * 2. ClassName		: StatsMemberServiceImpl.java
     * 3. Comment    	: 관리자 > 통계 > 회원통계 > 성별/연령별 가입 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMemberJoinDate(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("StatsMember.selectMemberJoinDate",commandMap);
    }
    
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectErpJoinPath
	 * 2. ClassName		: StatsMemberServiceImpl.java
     * 3. Comment    	: ERP 가입경로
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectErpJoinPath(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("StatsMember.selectErpJoinPath",commandMap);
    }

    
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectMemberOrderArea
	 * 2. ClassName		: StatsMemberServiceImpl.java
     * 3. Comment    	:  관리자 > 통계 > 회원통계 > 지역별 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMemberOrderArea(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("StatsMember.selectMemberOrderArea",commandMap);
    }
  
    
    
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectMemberOrderPrice
	 * 2. ClassName		: StatsMemberServiceImpl.java
     * 3. Comment    	:  관리자 > 통계 > 회원통계 > 주문금액별 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMemberOrderPrice(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("StatsMember.selectMemberOrderPrice",commandMap);
    }
    
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectMemberOrderRate
	 * 2. ClassName		: StatsMemberServiceImpl.java
     * 3. Comment    	:  관리자 > 통계 > 회원통계 > 구매율별 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMemberOrderRate(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("StatsMember.selectMemberOrderRate",commandMap);
    }
}
