package com.market.mall.am.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface OotdBoardService {
	
	public List<Map<String, Object>> selectOOTDBoardList (Map<String, Object> commandMap);
	
	public int selectOOTDBoardListCount (Map<String, Object> commandMap);
	
	public Map<String, Object> selectOOTDBoardInfo (Map<String, Object> commandMap) throws Exception;
	
	public int updateOOTD (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
}
