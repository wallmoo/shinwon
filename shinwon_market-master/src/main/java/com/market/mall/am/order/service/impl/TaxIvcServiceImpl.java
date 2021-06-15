package com.market.mall.am.order.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.mall.am.order.service.TaxIvcService;
import com.market.mall.dao.CommonDefaultDAO;

/**
 * @PackageName: com.market.mall.am.order.service.impl
 * @FileName : TaxIvcServiceImpl.java
 * @Date : 2015. 10. 26.
 * @프로그램 설명 : 세금계산서 신청관리 처리하는 Service Class
 * @author DEV_KANGHYUNKYU
 */
@Service("taxIvcService")
public class TaxIvcServiceImpl implements TaxIvcService {
	 private Logger logger = LoggerFactory.getLogger(this.getClass());
	 @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : selectTaxIvcCount
	* 2. ClassName  : TaxIvcServiceImpl.java
	* 3. Comment    : 세금계산서 신청관리 개수
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 26.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectTaxIvcCount(Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.selectCount("TaxIvc.selectTaxIvcCount",commandMap);
    }

	/**
	* <pre>
	* 1. MethodName : selectTaxIvcList
	* 2. ClassName  : TaxIvcServiceImpl.java
	* 3. Comment    : 세금계산서 신청관리 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 26.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTaxIvcList(Map<String, Object> commandMap) throws Exception 
    {
		return defaultDAO.selectList("TaxIvc.selectTaxIvcList",commandMap);
    }
	
	/**
	* <pre>
	* 1. MethodName : selectTaxIvcInfo
	* 2. ClassName  : TaxIvcServiceImpl.java
	* 3. Comment    : 세금계산서 신청관리 상세
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTaxIvcInfo(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.select("TaxIvc.selectTaxIvcInfo",commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : updateTaxIvc
	* 2. ClassName  : TaxIvcServiceImpl.java
	* 3. Comment    : 세금계산서 신청관리 수정
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateTaxIvc(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.update("TaxIvc.updateTaxIvc",commandMap);
	}
}
