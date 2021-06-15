package com.market.mall.pc.mypage.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.User;
import com.market.mall.pc.mypage.service.MyRegularStoreService;

/**
 * @PackageName: com.market.mall.pc.mypage.service.impl
 * @FileName : MyRegularStoreServiceImpl.java
 * @Date : 2015. 6. 16.
 * @프로그램 설명 : 사용자 > 퀵메뉴 > 단골매장 관련하여 처리하는 Service Implement Class
 * @author DEV_KIMSOYOUNG
 */
@Service("pcMyRegularStoreService")
public class MyRegularStoreServiceImpl implements MyRegularStoreService 
{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : regularStoreInfo
	* 2. ClassName : MyRegularStoreServiceImpl.java
	* 3. Comment : 사용자 > 퀵메뉴 > 단골매장 상세정보
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 16.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> regularStoreInfo (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.select("pcRegularStore.regularStoreInfo", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectRegularStoreCount
	* 2. ClassName : MyRegularStoreServiceImpl.java
	* 3. Comment : 사용자 > 퀵메뉴 > 단골매장 팝업 > 매장 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 16.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectRegularStoreCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("pcRegularStore.selectRegularStoreCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectRegularStoreList
	* 2. ClassName : MyRegularStoreServiceImpl.java
	* 3. Comment : 사용자 > 퀵메뉴 > 단골매장 팝업 > 매장 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 16.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectRegularStoreList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("pcRegularStore.selectRegularStoreList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : updateRegularStore
	* 2. ClassName : MyRegularStoreServiceImpl.java
	* 3. Comment : 사용자 > 퀵메뉴 > 단골매장 팝업 > 단골 매장 변경
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 16.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateRegularStore (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.update("pcRegularStore.updateRegularStore", commandMap);
	}
}
