package com.market.mall.pc.ootd.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.STATUS_CODE;
import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.common.constants.params.PARAM_WSH_TAG_CONST;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.model.ootd.OOTD_MODEL;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.model.tag.WSH_TAG_MODEL;
import com.market.mall.pc.ootd.service.OOTDService;
import com.market.mall.pc.tag.service.WishTagService;

@Service("pcOOTDService")
public class OOTDServiceImpl implements OOTDService {

    @Autowired CommonDefaultDAO defaultDAO;
    @Autowired FileUpload fileUpload;
    @Resource(name="wishTagService") private WishTagService wishTagService;
    
    public int selectMyShoppingListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("PcOOTD.selectMyShoppingListCount", commandMap);
    }
    
    public List<Map<String, Object>> selectMyShoppingList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("PcOOTD.selectMyShoppingList", commandMap);
    }
    
    public int selectMyOOTDCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("PcOOTD.selectMyOOTDCount", commandMap);
    }
    
    public Map<String, Object> selectOotdInfo (Map<String, Object> commandMap) throws Exception
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        //OOTD ?????? ??????
        returnMap.put("row", defaultDAO.select("PcOOTD.selectOotdInfo", commandMap));
        
        commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        
        // ???????????? ??????
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        
        //OOTD ?????? ?????? ?????????
        Map<String, Object> param = new HashMap<String, Object>();
        param.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_OOTD);
        param.put(TAG_MODEL.TAG_BND_ID, StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        returnMap.put("tagList", defaultDAO.selectList("PcTag.selectTagListById", param));
        
        //OOTD ?????? ?????? ?????????
        param.put(WSH_TAG_MODEL.WSH_TAG_TYPE, CONTENTS_TYPE_CODE.TYPE_OOTD);
        param.put(WSH_TAG_MODEL.WSH_TAG_BND_ID, StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        returnMap.put("wishTagList", defaultDAO.selectList("WishTag.selectWishTagListById", param));
        
        if(!commandMap.containsKey("THUMBNAIL_SIZE")) {
        	param.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);	
        }
        if(!commandMap.containsKey("USER_ENV_TYPE")) {
        	param.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);	
        }
        
        //OOTD ?????? ????????? 
        returnMap.put("ootdProductList", defaultDAO.selectList("PcOOTD.selectOOTDProductList", commandMap));
        
        return returnMap;
    }
    //ootd ?????? ??????
    public int insertOOTDData (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("CNT_MST_REG_ID", user.getMEM_MST_MEM_ID());
        commandMap.put("CNT_MST_REG_IP" , request.getRemoteAddr());
        commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_OOTD);
        
        int result = SERVICE_RESULT_CODE.DB_FAIL;
        
        //ootd ??????
        result = defaultDAO.insertNoException("PcOOTD.insertOOTDData", commandMap);

        if(result > 0)
        {   
        	ObjectMapper mapper = new ObjectMapper();
        	TypeReference<List<String>> stringListTypeRef = new TypeReference<List<String>>(){};
        	
            //??????????????????
            List<String> wishTagListString = mapper.readValue(StringUtil.getString(commandMap.get(PARAM_WSH_TAG_CONST.WSH_TAG_TITLE_LIST), ""), stringListTypeRef);
            
            
            if(wishTagListString != null && !wishTagListString.isEmpty()) {
            	Map<String, Object> wishTagParam = new HashMap<String, Object>();
            	
            	wishTagParam.put(WSH_TAG_MODEL.REG_ID, user.getMEM_MST_MEM_ID());
            	wishTagParam.put(WSH_TAG_MODEL.WSH_TAG_TYPE, CONTENTS_TYPE_CODE.TYPE_OOTD);
            	wishTagParam.put(WSH_TAG_MODEL.WSH_TAG_BND_ID, commandMap.get("CNT_MST_IDX"));
            	wishTagParam.put(PARAM_WSH_TAG_CONST.WSH_TAG_TITLE_LIST, wishTagListString);
                this.wishTagService.insertWithTagList(wishTagParam);
            }
            
            
            //?????? ??????
            String tagData = StringUtil.getString(commandMap.get("tagData"),"");
            if(tagData != null && !tagData.equals("")){
                List<String> tagDataList = mapper.readValue(tagData, stringListTypeRef);

                if(tagDataList != null && tagDataList.size() > 0){
                    for(int index=0; index < tagDataList.size(); index++){
                        Map<String, Object> tagParam = new HashMap<String, Object>();
                        
                        tagParam.put("TAG_BND_STATUS", "USE");
                        tagParam.put(TAG_MODEL.TAG_MST_ID, tagDataList.get(index));
                        tagParam.put(TAG_MODEL.TAG_BND_ID, commandMap.get("CNT_MST_IDX"));
                        tagParam.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_OOTD);
                        tagParam.put(TAG_MODEL.TAG_BND_REP, "N");
                        
                        //OOTD ?????? ??????
                        defaultDAO.insert("PcTag.insertTagBind", tagParam);
                    }
                }
            }
            
            //????????? ??????
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_REG_ID"));
                
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = (CommonsMultipartFile)fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        
                        // ?????? ?????? ??? ?????? ?????????
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "board", "image", "Y"));
                    }
                }
            }
            
            //OOTD ?????? ??????
            List<String> CNT_PRD_MST_CD = mapper.readValue(StringUtil.getString(commandMap.get("PRD_MST_CD"), ""), stringListTypeRef);
            
            for(int index = 0; index < CNT_PRD_MST_CD.size(); index++){
                Map<String, Object> productMap = new HashMap<String, Object>();
                productMap.put("CNT_MST_IDX", commandMap.get("CNT_MST_IDX"));
                productMap.put("CNT_PRD_MST_CD", CNT_PRD_MST_CD.get(index));
                
                defaultDAO.insert("PcOOTD.insertOOTDWithProduct", productMap);
            }
        }
        return result;
    }
    
    public List<Map<String, Object>> selectSpecialOOTDProductList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("PcOOTD.selectSpecialOOTDProductList", commandMap);
    }
    
    public int deleteMyOOTDData (Map<String, Object> commandMap) throws Exception
    {
    	 int result = 0;
    	 commandMap.put("CNT_MST_USE_YN", "N");
    	 result = defaultDAO.update("PcOOTD.updateOOTDData", commandMap);
    	 
    	 return result;
    }
    public int updateMyOOTDData (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
        
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("CNT_MST_UPD_ID", user.getMEM_MST_MEM_ID());
        commandMap.put("CNT_MST_UPD_IP", request.getRemoteAddr());
        
        result = defaultDAO.update("PcOOTD.updateOOTDData", commandMap);
        
        String CMM_FLE_SAVE_PATH = "";
        
        //????????? ?????? ????????? ?????? tempList
        List<String> tempRemoveList = new ArrayList<String>();
        
        if(result > 0)
        {
            //?????? ?????? ??????
            String [] removeFileIdx = request.getParameterValues("file_del_idx");
            
            if(removeFileIdx != null){
                for(int i=0;i<removeFileIdx.length;i++){
                    //?????? ?????? ??????
                    commandMap.put("CMM_FLE_IDX", removeFileIdx[i]);
                    Map<String, Object> row = (Map<String, Object>) defaultDAO.select("Common.selectCommonFileInfo", commandMap);
                    CMM_FLE_SAVE_PATH = StringUtil.getString(row.get("CMM_FLE_SAVE_PATH"), "");
                    
                     if(row != null && !"".equals(CMM_FLE_SAVE_PATH))
                     {
                         commandMap.put("CMM_FLE_USE_YN", "N");
                         
                         // ?????? DB ??????
                         defaultDAO.update("Common.deleteCommonFile", commandMap);
                         
                         // ????????? ????????? ?????? ????????? ??????
                         tempRemoveList.add(CMM_FLE_SAVE_PATH);
                     }
                }
            }
            
            //?????? insert
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_REG_ID"));
                
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = (CommonsMultipartFile)fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        
                        // ?????? ?????? ??? ?????? ?????????
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "board", "image", "Y"));
                    }
                }
            }
            
            //?????? ????????? ????????????..
            if(tempRemoveList != null){
                for(int i=0;i<tempRemoveList.size();i++){
                    fileUpload.delete(tempRemoveList.get(i));
                }
            }
            
            ObjectMapper mapper = new ObjectMapper();
            TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
            
            commandMap.put("TAG_BND_ID", commandMap.get("CNT_MST_IDX"));
            commandMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_OOTD);
            //?????? ??????
            defaultDAO.delete("PcTag.deleteTagBind", commandMap);
            String tagData = StringUtil.getString(commandMap.get("tagData"),"");
            if(!tagData.equals("")){
                List<Map<String, Object>> tagDataList = mapper.readValue(tagData, typeRef);

                if(tagDataList != null && tagDataList.size() > 0){
                    for(int index=0; index < tagDataList.size(); index++){
                        Map<String, Object> tagParam = new HashMap<String, Object>();
                        
                        tagParam.put("TAG_BND_STATUS", StringUtil.getString(tagDataList.get(index).get("TAG_BND_STATUS"), "USE"));
                        tagParam.put(TAG_MODEL.TAG_MST_ID, StringUtil.getString(tagDataList.get(index).get("TAG_MST_ID"), ""));
                        tagParam.put(TAG_MODEL.TAG_BND_ID, commandMap.get("CNT_MST_IDX"));
                        tagParam.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_OOTD);
                        tagParam.put(TAG_MODEL.TAG_BND_REP, StringUtil.getString(tagDataList.get(index).get("TAG_BND_REP"), "N"));
                        
                        //OOTD ?????? ??????
                        defaultDAO.insert("PcTag.insertTagBind", tagParam);
                    }
                }
            }
            //OOTD ?????? ??????
            String [] CNT_PRD_MST_CD = StringUtil.getArray(commandMap, "PRD_MST_CD");
            defaultDAO.delete("PcOOTD.deleteOOTDProduct", commandMap);
            for(int index = 0; index < CNT_PRD_MST_CD.length; index++)
            {
                Map<String, Object> productMap = new HashMap<String, Object>();
                productMap.put("CNT_MST_IDX", commandMap.get("CNT_MST_IDX"));
                productMap.put("CNT_PRD_MST_CD", CNT_PRD_MST_CD[index]);
                
                defaultDAO.insert("PcOOTD.insertOOTDWithProduct", productMap);
            }
            

        }
        
        
        return result;

    }
    
    public int updateMyOOTDProduct (Map<String, Object> commandMap){
        return SERVICE_RESULT_CODE.DB_FAIL;
    }
    
    public List<Map<String, Object>> selectMyOOTDProductList (Map<String, Object> commandMap){
        return defaultDAO.selectList("PcOOTD.selectMyOOTDProductList", commandMap);
    }
    
    public List<Map<String, Object>> selectMyOOTDImageList (Map<String, Object> commandMap){
        return null;
    }
 
    public int selectOOTDLikeCount (Map<String, Object> commandMap){
        return SERVICE_RESULT_CODE.DB_FAIL;
    }
    
    public int deletOOTDData(Map<String, Object> commandMap){
        return SERVICE_RESULT_CODE.DB_FAIL;
    }
    
    public Map<String, Object> selectMemberPrivilege (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.select("PcOOTD.selectMemberPrivilege", commandMap);
    }
}
