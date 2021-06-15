package com.market.mall.pc.tag.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.common.constants.STATUS_CODE;
import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.tag.TAG_MODEL;

@Service("TagService")
public class TagService {

    @Autowired
    CommonDefaultDAO dao;
    
    public String insertTag(Map<String, Object> commandMap){
        String id = UUID.randomUUID().toString();
        commandMap.put(TAG_MODEL.TAG_MST_ID, id);
        commandMap.put(TAG_MODEL.TAG_MST_STATUS, STATUS_CODE.USE);
        
        int result = dao.insertNoException("PcTag.insertTag", commandMap);
        
        if(result == SERVICE_RESULT_CODE.DB_FAIL) {
        	return SERVICE_RESULT_CODE.SERVICE_FAIL;
        }
        
        return id;
    }
    
    //해쉬태그 그룹 등록
    public String insertTagGroup(Map<String, Object> commandMap){
        String id = UUID.randomUUID().toString();
        
        commandMap.put(PARAM_CONST.TAG_GRP_ID, id);

        int result = dao.insertNoException("PcTag.insertTagGroup", commandMap);
        
        if(result == SERVICE_RESULT_CODE.DB_FAIL) {
            return SERVICE_RESULT_CODE.SERVICE_FAIL;
        }
        
        return id;
    }
    //공통 팝업 해쉬태그 그룹 리스트
    public List<Map<String, Object>> selectTagGroup(Map<String, Object> commandMap){
        return dao.selectListJsonWrapper("Tag.selectTagGroup", commandMap);
    }
    
    //해쉬태그 그룹 리스트 조회
    public List<Map<String, Object>> selectTagGroupList(Map<String, Object> commandMap){
        return dao.selectListJsonWrapper("PcTag.selectTagGroupList", commandMap);        
    }
    //해쉬태그 그룹 리스트 count
    public int selectTagGroupListCount(Map<String, Object> commandMap){
        int result = SERVICE_RESULT_CODE.DB_FAIL;
        try {
            result = dao.selectCount("PcTag.selectTagGroupListCount", commandMap);
        } catch(Exception e){
            result = SERVICE_RESULT_CODE.DB_FAIL;
        }
        return result;
    }
    
    //해쉬태그 그룹 조회
    public Map<String, Object> selectTagGroupById(Map<String, Object> commandMap){
        return dao.selectWithException("PcTag.selectTagGroupById", commandMap);
    }
    //헤쉬태그 그룹 태그 리스트 조회
    public List<Map<String, Object>> selectTagGroupWithTagListById(Map<String, Object> commandMap){
        return dao.selectListJsonWrapper("PcTag.selectTagGroupWithTagListById", commandMap);
    }
    
    //해쉬태그 그룹 바인등 등록
    public String insertTagGroupBind(Map<String, Object> commandMap){
        String id = StringUtil.getString(commandMap.get(TAG_MODEL.TAG_MST_ID));
        
        int result = dao.insertNoException("PcTag.insertTagGroupBind", commandMap);
        
        if(result == SERVICE_RESULT_CODE.DB_FAIL) {
            return SERVICE_RESULT_CODE.SERVICE_FAIL;
        }
        
        return id;
    }
    
    public Map<String, Object> selectTagById(Map<String, Object> commandMap){
    	return dao.selectWithException("PcTag.selectTagById", commandMap);
    }
    public List<Map<String, Object>> selectTagList(){
        return dao.selectListJsonWrapper("PcTag.selectTagList", null);
    }
    public List<Map<String, Object>> selectTagList(Map<String, Object> commandMap){
        return dao.selectListJsonWrapper("PcTag.selectTagList", commandMap);
    }
    public List<Map<String, Object>> selectTagListById(Map<String, Object> commandMap){
        return dao.selectListJsonWrapper("PcTag.selectTagListByBindType", commandMap);
    }
    
    public String updateTagInfo(Map<String, Object> commandMap){
    	String result = SERVICE_RESULT_CODE.SERVICE_SUCCESS;
        try {
        	int dbResult = dao.update("PcTag.updateTagInfo", commandMap);
        	if(dbResult == SERVICE_RESULT_CODE.DB_FAIL) {
        		result = SERVICE_RESULT_CODE.SERVICE_FAIL;
        	}
        } catch(Exception e) {
            e.printStackTrace();
        }
        finally {
			return result;
		}
    }
    
    public String updateTagGroupInfo(Map<String, Object> commandMap){
    	String result = SERVICE_RESULT_CODE.SERVICE_SUCCESS;
        try {
        	int dbResult = dao.update("PcTag.updateTagGroupInfo", commandMap);
        	if(dbResult == SERVICE_RESULT_CODE.DB_FAIL) {
        		result = SERVICE_RESULT_CODE.SERVICE_FAIL;
        	}
        } catch(Exception e) {
            e.printStackTrace();
        }
        finally {
			return result;
		}
    }
    
    public String updateTagGroupBindTag(Map<String, Object> commandMap) {
    	String result = SERVICE_RESULT_CODE.SERVICE_SUCCESS;
        try {
        	int dbResult = dao.delete("PcTag.deleteTagGroupBindTag", commandMap);
        	dbResult = dao.insert("PcTag.insertTagGroupBindTagBatch", commandMap);
        	if(dbResult == SERVICE_RESULT_CODE.DB_FAIL) {
        		result = SERVICE_RESULT_CODE.SERVICE_FAIL;
        	}
        } catch(Exception e) {
            e.printStackTrace();
        }
        finally {
			return result;
		}
    }
    
    
    public int insertTagBindBatch(Map<String, Object> param) throws Exception{
    	int result = -1;
    	
    	result = dao.insertNoException("PcTag.insertTagBindBatch", param);
    	
    	return result;
    }
    
    public String insertTagBind(Map<String, Object> commandMap) throws Exception{
       int result = 0;
        String id = StringUtil.getString(commandMap.get("TAG_BND_ID"));
        String jsonData =  StringUtil.getString(commandMap.get("TAG_ID_LIST"),"");
        
        if(jsonData.equals("")){
            return SERVICE_RESULT_CODE.SERVICE_FAIL;
        }
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        List<Map<String, Object>> tagDataList = mapper.readValue(jsonData, typeRef);
        
        for(int index = 0; index < tagDataList.size(); index++){
            Map<String, Object> paramMap = new HashMap<String, Object>();
            
            paramMap.put(TAG_MODEL.TAG_BND_ID, id);
            paramMap.put(TAG_MODEL.TAG_MST_ID, StringUtil.getString(tagDataList.get(index).get(TAG_MODEL.TAG_MST_ID),""));
            paramMap.put(TAG_MODEL.TAG_BND_STATUS, StringUtil.getString(tagDataList.get(index).get(TAG_MODEL.TAG_BND_STATUS),"USE"));
            paramMap.put(TAG_MODEL.TAG_BND_REP, StringUtil.getString(tagDataList.get(index).get(TAG_MODEL.TAG_BND_REP),"N"));
            paramMap.put(TAG_MODEL.TAG_BND_TYPE, StringUtil.getString(tagDataList.get(index).get(TAG_MODEL.TAG_BND_TYPE),""));
            
            result = dao.insertNoException("PcTag.insertTagBind", paramMap);
            
            if(result == SERVICE_RESULT_CODE.DB_FAIL){
                return SERVICE_RESULT_CODE.SERVICE_FAIL;
            }
        }
    	
    	return id; 	
    }
    
    public String updateTagBind(Map<String, Object> commandMap){
    	return SERVICE_RESULT_CODE.SERVICE_FAIL;
    }
    public String deleteTagById(Map<String, Object> commandMap) {
    	int result = dao.deleteNoException("PcTag.deleteTagById", commandMap);
    	if(result < 0) {
    		return SERVICE_RESULT_CODE.SERVICE_FAIL;
    	}
    	return SERVICE_RESULT_CODE.SERVICE_SUCCESS;
    }
    
    public List<Map<String, Object>> selectTagDisplayList(Map<String, Object> commandMap) {
        return dao.selectList("PcTag.selectTagDisplayList", commandMap);
    }
}
