package com.market.mall.pc.tag.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.common.constants.STATUS_CODE;
import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.mall.common.constants.params.PARAM_WSH_TAG_CONST;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.tag.WSH_TAG_MODEL;

@Service("wishTagService")
public class WishTagService {

    @Autowired
    CommonDefaultDAO dao;
   
    public String insertWishTagData(Map<String, Object> commandMap){
    	int dbResult = SERVICE_RESULT_CODE.DB_FAIL;
    	String id = UUID.randomUUID().toString(); 
    	commandMap.put(WSH_TAG_MODEL.WSH_TAG_ID, id);
    	dbResult = dao.insertNoException("WishTag.insertWishTag", commandMap);
    	if(dbResult == SERVICE_RESULT_CODE.DB_FAIL) {
    		return SERVICE_RESULT_CODE.SERVICE_FAIL;
    	}
    	return id;
    }
    
    public List<String> insertWithTagList(Map<String, Object> commandMap){
    	
    	List<String> titleList = (List<String>)commandMap.get(PARAM_WSH_TAG_CONST.WSH_TAG_TITLE_LIST);
    	List<String> idList = new ArrayList<String>();
    	commandMap.put(WSH_TAG_MODEL.WSH_TAG_STATUS, STATUS_CODE.USE);
    	
    	for(int index = 0; index < titleList.size(); index++) {
    		commandMap.put(WSH_TAG_MODEL.WSH_TAG_TITLE, titleList.get(index));
    		String serviceResult = insertWishTagData(commandMap);
    		if(serviceResult == SERVICE_RESULT_CODE.SERVICE_FAIL) {
    			continue;
    		}
    		idList.add(serviceResult);
    	}
    	
    	return idList;
    
    }    
    
    public List<Map<String, Object>> selectWishTagList(Map<String, Object> commandMap){
        return dao.selectListJsonWrapper("WishTag.selectWishTagList", commandMap);        
    }
    
    public int selectWishTagCount(Map<String, Object> commandMap){
        return dao.selectCount("WishTag.selectWishTagCount", commandMap);        
    }
    
    public Map<String, Object> selectWishTagDataById(Map<String, Object> param){
        return dao.selectWithException("WishTag.selectWishTagById", param);        
    }
    
    public List<Map<String, Object>> selectWishTagListByUserId(Map<String, Object> param){
        return dao.selectListJsonWrapper("WishTag.selectWishTagListByUserId", param);
    }
    
    public List<Map<String, Object>> selectWishTagListById(Map<String, Object> commandMap){
        return dao.selectListJsonWrapper("WishTag.selectWishTagListById", commandMap);
    }
    
    //희망태그 아이디별 리스트
    public List<Map<String, Object>> selectWishTagListByAdmin(Map<String, Object> commandMap){
    	return dao.selectListJsonWrapper("WishTag.selectWishTagListByAdmin", commandMap);
    }

}