package com.market.mall.pc.mypage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.epasscni.common.exception.AccreditationException;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.DbCryptoUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.pc.mypage.service.MyEventService;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("pcMyEventService")
public class MyEventServiceImpl implements MyEventService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name ="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
    * <pre>
    * 1. MethodName : selectMyEventListCount
    * 2. ClassName : MyEventServiceImpl.java
    * 3. Comment : 내가 참여한 이벤트 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMyEventListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("PcMyEvent.selectMyEventListCount",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectMyEventList
    * 2. ClassName : MyEventServiceImpl.java
    * 3. Comment : 내가 참여한 이벤트 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMyEventList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcMyEvent.selectMyEventList",commandMap);
    }
}
