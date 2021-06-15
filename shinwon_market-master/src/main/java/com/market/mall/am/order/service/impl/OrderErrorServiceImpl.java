package com.market.mall.am.order.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.mall.am.order.service.OrderErrorService;
import com.market.mall.dao.CommonDefaultDAO;

/**
 * @PackageName: com.market.mall.am.order.service.impl
 * @FileName : OrderErrorServiceImpl.java
 * @Date : 2015. 10. 27.
 * @프로그램 설명 : 결제오류조회 처리하는 ServiceImpl Class
 * @author DEV_KANGHYUNKYU
 */
@Service("orderErrorService")
public class OrderErrorServiceImpl implements OrderErrorService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	 @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	 
	/**
	* <pre>
	* 1. MethodName : selectOrdErrCount
	* 2. ClassName  : OrderErrorServiceImpl.java
	* 3. Comment    : 결제오류조회 개수
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectOrdErrCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("OrderError.selectOrdErrCount", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : selectOrdErrList
	* 2. ClassName  : OrderErrorServiceImpl.java
	* 3. Comment    : 결제오류조회 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrdErrList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("OrderError.selectOrdErrList", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : insertOrdErr
	* 2. ClassName  : OrderErrorServiceImpl.java
	* 3. Comment    : 결제오류 등록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertOrdErr(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.insert("OrderError.insertOrdErr", commandMap);
	}
}
