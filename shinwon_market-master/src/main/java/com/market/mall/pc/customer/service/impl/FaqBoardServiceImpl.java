package com.market.mall.pc.customer.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.customer.service.FaqBoardService;

/**
 * @PackageName: com.market.mall.pc.customer.service.impl
 * @FileName : FaqBoardServiceImpl.java
 * @Date : 2014. 7. 22.
 * @프로그램 설명 : 프론트 > 고객센터 > FAQ를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("pcFaqBoardService")
public class FaqBoardServiceImpl implements FaqBoardService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	/**
	* <pre>
	* 1. MethodName : selectFaqBoardListCount
	* 2. ClassName  : FaqBoardServiceImpl.java
	* 3. Comment    : FAQ 개수
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectFaqBoardListCount(Map<String, Object> commandMap) 	throws Exception {
		return defaultDAO.selectCount("PcFaqBoard.selectFaqBoardListCount", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : selectFaqBoardList
	* 2. ClassName  : FaqBoardServiceImpl.java
	* 3. Comment    : FAQ 리스트
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFaqBoardList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("PcFaqBoard.selectFaqBoardList", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : updateFaqBoardReadCount
	* 2. ClassName  : FaqBoardServiceImpl.java
	* 3. Comment    : FAQ 조회수 증가
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateFaqBoardReadCount(Map<String, Object> commandMap)	throws Exception {
		return defaultDAO.update("PcFaqBoard.updateFaqBoardReadCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectFaqCodeList
	* 2. ClassName : FaqBoardServiceImpl.java
	* 3. Comment : FAQ 하위 카테고리 
	* 4. 작성자 : Lee
	* 5. 작성일 : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFaqCodeList (String faqCode) throws Exception
	{
		return defaultDAO.selectList("PcFaqBoard.selectFaqCodeList", faqCode);
	}

	
	public String selectFaqCateNameInfo(String strCmnComIdx) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectStr("PcFaqBoard.selectFaqCateNameInfo", strCmnComIdx);
	}

}
