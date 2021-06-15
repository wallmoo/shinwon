package com.market.mall.mobile.customer.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.mobile.customer.service.NoticeBoardService;

/**
 * @PackageName: com.market.mall.mobile.customer.service.impl
 * @FileName : NoticeBoardServiceImpl.java
 * @Date : 2016. 2. 15.
 * @프로그램 설명 : 모바일 > 고객센터 > 공지사항을 처리하는 Service Implement Class
 * @author khcho
 */
@Service("mobileNoticeBoardService")
public class NoticeBoardServiceImpl implements NoticeBoardService{

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : selectNoticeBoardListCount
	* 2. ClassName  : NoticeBoardServiceImpl.java
	* 3. Comment    : 공지사항 개수
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectNoticeBoardListCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcNoticeBoard.selectNoticeBoardListCount", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : selectNoticeBoardList
	* 2. ClassName  : NoticeBoardServiceImpl.java
	* 3. Comment    : 공지사항 목록
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeBoardList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("PcNoticeBoard.selectNoticeBoardList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectTopNoticeBoardList
	* 2. ClassName  : NoticeBoardServiceImpl.java
	* 3. Comment    : 상단 공지 목록
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 22.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTopNoticeBoardList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("PcNoticeBoard.selectTopNoticeBoardList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectNoticeBoardInfo
	* 2. ClassName  : NoticeBoardServiceImpl.java
	* 3. Comment    : 공지사항 상세
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectNoticeBoardInfo (Map<String, Object> commandMap) throws Exception{
		//조회수 증가
		defaultDAO.update("PcNoticeBoard.updateNoticeBoardReadCount", commandMap);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		commandMap.put("CMM_FLE_TB_NM", "T_BRD_NTS");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_NTS_IDX"), ""));
	    returnMap.put("fileList", defaultDAO.selectList("PcCommon.selectCommonFileList", commandMap));
	    returnMap.put("row", defaultDAO.select("PcNoticeBoard.selectNoticeBoardInfo", commandMap));
		return returnMap;
	}

	/**
	* <pre>
	* 1. MethodName : selectMainNoticeBoardList
	* 2. ClassName  : NoticeBoardServiceImpl.java
	* 3. Comment    : 메인페이지 공지사항 목록
	* 4. 작성자       : 이미정
	* 5. 작성일       : 2014. 12. 5.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMainNoticeBoardList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("PcNoticeBoard.selectMainNoticeBoardList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectPreBoardListCount
	* 2. ClassName : NoticeBoardServiceImpl.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 일반게시판 미리보기 목록 갯수 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectPreBoardListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("PcNoticeBoard.selectPreBoardListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectPreBoardList
	* 2. ClassName : NoticeBoardServiceImpl.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 일반게시판 미리보기 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectPreBoardList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("PcNoticeBoard.selectPreBoardList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectPreBoardInfo
	* 2. ClassName : NoticeBoardServiceImpl.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 게시판 미리보기 상세
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectPreBoardInfo (Map<String,Object> commandMap) throws Exception
	{
		//조회수 증가
		defaultDAO.update("PcNoticeBoard.updatePreBoardReadCount", commandMap);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		commandMap.put("CMM_FLE_TB_NM", "T_BRD_DTL");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_DTL_IDX"), ""));
	    commandMap.put("CMM_FLE_TB_TYPE", "G");  
	    returnMap.put("fileList", defaultDAO.selectList("PcNoticeBoard.selectBoardCommonFileList", commandMap));
	    returnMap.put("row", defaultDAO.select("PcNoticeBoard.selectPreBoardInfo", commandMap));
		return returnMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectReplyListCount
	* 2. ClassName : NoticeBoardServiceImpl.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 게시판 미리보기 상세 > 댓글 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectReplyListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("PcNoticeBoard.selectReplyListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectReplyList
	* 2. ClassName : NoticeBoardServiceImpl.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 게시판 미리보기 상세 > 댓글 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectReplyList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("PcNoticeBoard.selectReplyList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertReply
	* 2. ClassName : NoticeBoardServiceImpl.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 게시판 미리보기 상세 > 댓글 등록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertReply (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.insert("PcNoticeBoard.insertReply", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectPreImageBoardListCount
	* 2. ClassName : NoticeBoardServiceImpl.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 이미지게시판 미리보기 목록 갯수 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectPreImageBoardListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("PcNoticeBoard.selectPreImageBoardListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectPreImageBoardList
	* 2. ClassName : NoticeBoardServiceImpl.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 이미지게시판 미리보기 목록 갯수 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectPreImageBoardList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("PcNoticeBoard.selectPreImageBoardList", commandMap);
	}
	
	
}
