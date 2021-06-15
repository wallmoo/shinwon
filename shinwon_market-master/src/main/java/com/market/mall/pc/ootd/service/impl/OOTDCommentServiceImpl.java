package com.market.mall.pc.ootd.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.User;
import com.market.mall.pc.ootd.service.OOTDCommentService;

@Service("pcOOTDCommentService")
public class OOTDCommentServiceImpl implements OOTDCommentService {

    @Autowired
    CommonDefaultDAO defaultDAO;

    public String insertOOTDComment (Map<String, Object> commandMap) throws Exception {

        commandMap.put("CNT_OTD_ID", commandMap.get("CNT_MST_IDX"));
        commandMap.put("OTD_RPL_REF_ID", StringUtil.getString(commandMap.get("OTD_RPL_REF_ID"),""));
        
        int result = defaultDAO.insert("PcOotdComment.insertOOTDComment", commandMap);
        
        String idx = null;
        
        if(result > 0)
        {
            idx = StringUtil.getString(commandMap.get("OTD_RPL_ID"), "");
        }

        return idx;
    }
    
    public List<Map<String, Object>> selectOOTDCommentList (Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("PcOotdComment.selectOOTDCommentList", commandMap);
    }
    
    public int selectOOTDCommentListCount (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PcOotdComment.selectOOTDCommentListCount", commandMap);
    }

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOOTDCommentHierachy (Map<String, Object> commandMap){
	    return defaultDAO.selectList("PcOotdComment.selectOOTDCommentHierachy", commandMap);
	}
	
    public int selectOOTDCount (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PcOotdComment.selectOOTDCount", commandMap);
    }
    
    public int updateOOTDComment (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.update("PcOotdComment.updateOOTDComment", commandMap);
    }
    
    public int deleteOOTDComment (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.delete("PcOotdComment.deleteOOTDComment", commandMap);
    }
}
