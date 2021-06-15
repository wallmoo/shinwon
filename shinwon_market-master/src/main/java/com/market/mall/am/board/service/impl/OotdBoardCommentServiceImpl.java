package com.market.mall.am.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.board.service.OotdBoardCommentService;
import com.market.mall.dao.CommonDefaultDAO;

@Service("ootdBoardCommentService")
public class OotdBoardCommentServiceImpl implements OotdBoardCommentService {
	 
    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	
	public int selectOOTDCommentListCount (Map<String, Object> commandMap) throws Exception 
	{
	    return defaultDAO.selectCount("OotdBoardComment.selectOOTDCommentListCount", commandMap);
	}
	
    public String insertOOTDComment (Map<String, Object> commandMap) throws Exception {
        
        commandMap.put("CNT_OTD_ID", commandMap.get("CNT_MST_IDX"));
        commandMap.put("OTD_RPL_REF_ID", StringUtil.getString(commandMap.get("OTD_RPL_REF_ID"),""));
        
        int result = defaultDAO.insert("OotdBoardComment.insertOOTDComment", commandMap);
        
        String idx = null;
        
        if(result > 0)
        {
            idx = StringUtil.getString(commandMap.get("OTD_RPL_ID"), "");
        }
        return idx;
    }
	
    public int updateOOTDCommentStatus (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.update("OotdBoardComment.updateOOTDCommentStatus", commandMap);
    }
    
	public List<Map<String, Object>> selectOOTDCommentList (Map<String, Object> commandMap) throws Exception 
	{
	    return defaultDAO.selectList("OotdBoardComment.selectOOTDCommentList", commandMap);
	}
}
