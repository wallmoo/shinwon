package com.market.mall.pc.member.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.member.service.LikeContentsService;

@Service("pcLikeContentsService")
public class LikeContentsServiceImpl implements LikeContentsService{
	 
	@Resource(name="defaultDAO") 
	 private CommonDefaultDAO defaultDAO;

    @Override
    public String insertLikeContents(Map<String, Object> commandMap) {
        int dbResult = defaultDAO.insertNoException("PcLikeContents.insertLikeContents", commandMap);
        if(dbResult == SERVICE_RESULT_CODE.DB_FAIL){
            return SERVICE_RESULT_CODE.SERVICE_FAIL;
        }
        
        return null;
    }

    @Override
    public String deleteLikeContents(Map<String, Object> commandMap) {
        int dbResult = defaultDAO.deleteNoException("PcLikeContents.deleteLikeContents", commandMap);
        if(dbResult == SERVICE_RESULT_CODE.DB_FAIL){
            return SERVICE_RESULT_CODE.SERVICE_FAIL;
        }
        return null;
    }
    
    public int selectLikeContentsCount(Map<String, Object> commandMap) {
        return defaultDAO.selectCount("PcLikeContents.selectLikeContentsCount", commandMap);
    }

}
