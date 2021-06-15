package com.market.mall.pc.mypage.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.pc.mypage.service.MyProductInquiryService;

/**
 * @PackageName: com.market.mall.pc.mypage.service.impl
 * @FileName : MyProductInquiryServiceImpl.java
 * @Date : 2016. 1. 27.
 * @프로그램 설명 : 프론트 > 마이페이지 > 상품Q&A를 처리하는 Service Implement Class
 * @author DEV_KIMSOYOUNG
 */
@Service("pcMyProductInquiryService")
public class MyProductInquiryServiceImpl implements MyProductInquiryService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	* <pre>
	* 1. MethodName : selectMyProductInquiryListCount
	* 2. ClassName  : MyProductInquiryServiceImpl.java
	* 3. Comment    : 프론트 > MY LAND > 상품Q&A 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMyProductInquiryListCount (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("PcMyProductInquiry.selectMyProductInquiryListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMyProductInquiryList
	* 2. ClassName  : MyProductInquiryServiceImpl.java
	* 3. Comment    : 프론트 > MY LAND > 상품Q&A 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMyProductInquiryList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("PcMyProductInquiry.selectMyProductInquiryList", commandMap);
	}
	
	
	/**
	* <pre>
	* 1. MethodName : selectMyProductInquiryRplCountMap
	* 2. ClassName  : MyProductInquiryServiceImpl.java
	* 3. Comment    : 마이페이지 메인 > 상품Q&A > 미답변/답변 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 1.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMyProductInquiryRplCountMap (Map<String,Object> commandMap) throws Exception
	{
		commandMap.put("BRD_INQ_TYPE", Code.INQUIRY_TYPE_PRODUCT);
		
		return defaultDAO.select("PcMyProductInquiry.selectMyProductInquiryRplCountMap", commandMap);
	}

	
	@Override
	public int updateMyProductInquiry(Map<String, Object> commandMap) {
	
		return 0;
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMyQnaInfo(Map<String, Object> commandMap) throws Exception {
		
		return defaultDAO.select("PcMyProductInquiry.selectMyQnaInfo", commandMap);
	}

	@Override
	public int deleteMyQna(Map<String, Object> commandMap) throws Exception {
		
		return defaultDAO.delete("PcMyProductInquiry.deleteMyQna", commandMap);
	}

	@Override
	public int updateMyQna(Map<String, Object> commandMap) throws Exception {
		
		return defaultDAO.insert("PcMyProductInquiry.updateMyQna", commandMap);
	}

	
 
}
