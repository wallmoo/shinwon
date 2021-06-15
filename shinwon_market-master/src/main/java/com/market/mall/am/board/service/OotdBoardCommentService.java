package com.market.mall.am.board.service;

import java.util.List;
import java.util.Map;

public interface OotdBoardCommentService {

	public int selectOOTDCommentListCount (Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectOOTDCommentList (Map<String, Object> commandMap) throws Exception;
	
	public String insertOOTDComment (Map<String, Object> commandMap) throws Exception;
	
	public int updateOOTDCommentStatus (Map<String, Object> commandMap) throws Exception;
	
}
