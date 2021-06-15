package com.market.mall.pc.mypage.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.mypage.service.MyKeepService;

/**
 * @PackageName: com.market.mall.pc.mypage.service.impl
 * @FileName : MyKeepServiceImpl.java
 * @Date : 2016. 1. 28.
 * @프로그램 설명 : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백을 처리하는 Service Implement Class
 * @author DEV_KIMSOYOUNG
 */
@Service("pcMyKeepService")
public class MyKeepServiceImpl implements MyKeepService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
    * <pre>
    * 1. MethodName : selectKeepProductListCount
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑상품 목록 갯수
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectKeepProductListCount (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.selectCount("PcMyKeep.selectKeepProductListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectKeepProductList
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑상품 목록
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectKeepProductList (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.selectList("PcMyKeep.selectKeepProductList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : deleteKeepProduct
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑상품 > 선택 상품 삭제
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int deleteKeepProduct (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.delete("PcMyKeep.deleteKeepProduct", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : deleteSoldOutKeepProduct
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑상품 > 품절 상품 삭제
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int deleteSoldOutKeepProduct (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.delete("PcMyKeep.deleteSoldOutKeepProduct", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectKeepContentsListCount
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑콘텐츠 목록 갯수
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectKeepContentsListCount (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.selectCount("PcMyKeep.selectKeepContentsListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectKeepContentsList
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑콘텐츠 목록
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectKeepContentsList (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.selectList("PcMyKeep.selectKeepContentsList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : deleteKeepContents
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑콘텐츠 > 선택 콘텐츠 삭제
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int deleteKeepContents (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.delete("PcMyKeep.deleteKeepContents", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectKeepPlanListCount
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑기획전 목록 갯수
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectKeepPlanListCount (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.selectCount("PcMyKeep.selectKeepPlanListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectKeepPlanList
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑기획전 목록  
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectKeepPlanList (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.selectList("PcMyKeep.selectKeepPlanList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : deleteEndKeepPlan
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑기획전 > 종료된 기획전 삭제 
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int deleteEndKeepPlan (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.delete("PcMyKeep.deleteEndKeepPlan", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectKeepEventListCount
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑이벤트 목록 갯수
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectKeepEventListCount (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.selectCount("PcMyKeep.selectKeepEventListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectKeepEventList
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑이벤트 목록 
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectKeepEventList (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.selectList("PcMyKeep.selectKeepEventList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : deleteEndKeepEvent
    * 2. ClassName  : MyKeepServiceImpl.java
    * 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑이벤트 > 종료된 이벤트 삭제
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int deleteEndKeepEvent (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.delete("PcMyKeep.deleteEndKeepEvent", commandMap);
    }
} 
