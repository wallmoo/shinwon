package com.market.mall.am.board.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.board.service.OotdBoardService;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_WSH_TAG_CONST;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.model.tag.WSH_TAG_MODEL;
import com.market.mall.pc.tag.service.WishTagService;

@Service("ootdBoardService")
public class OotdBoardServiceImpl implements OotdBoardService {
	 
    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    @Resource(name="wishTagService") private WishTagService wishTagService;
    @Autowired FileUpload fileUpload;
    
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOOTDBoardList(Map<String, Object> commandMap) {
		return defaultDAO.selectList("OotdBoard.selectOOTDBoardList", commandMap);
	}
	
	public int selectOOTDBoardListCount (Map<String, Object> commandMap){
	    return defaultDAO.selectCount("OotdBoard.selectOOTDBoardListCount", commandMap);
	}
	
	public int selectOOTDCommentListCount (Map<String, Object> commandMap) throws Exception 
	{
	    return defaultDAO.selectCount("OotdBoard.selectOOTDCommentListCount", commandMap);
	}
	
    public String insertOOTDComment (Map<String, Object> commandMap) throws Exception {
        
        commandMap.put("CNT_OTD_ID", commandMap.get("CNT_MST_IDX"));
        commandMap.put("OTD_RPL_REF_ID", StringUtil.getString(commandMap.get("OTD_RPL_REF_ID"),""));
        
        int result = defaultDAO.insert("OotdBoard.insertOOTDComment", commandMap);
        
        String idx = null;
        
        if(result > 0)
        {
            idx = StringUtil.getString(commandMap.get("OTD_RPL_ID"), "");
        }
        return idx;
    }
	
    public int updateOOTDCommentStatus (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.update("OotdBoard.updateOOTDCommentStatus", commandMap);
    }
    
	public List<Map<String, Object>> selectOOTDCommentList (Map<String, Object> commandMap) throws Exception 
	{
	    return defaultDAO.selectList("OotdBoard.selectOOTDCommentList", commandMap);
	}

	public Map<String, Object> selectOOTDBoardInfo (Map<String, Object> commandMap) throws Exception {
	    
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    //기본 정보 
	    returnMap.put("row", defaultDAO.select("OotdBoard.selectOOTDBoardInfo", commandMap));
	    
	    commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
	    //OOTD 등록 상품 리스트 
        returnMap.put("ootdProductList", defaultDAO.selectList("OotdBoard.selectOOTDProductList", commandMap));
        
	    commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        
        //OOTD 첨부 파일 이미지
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        
        //OOTD 등록 태그 리스트
        Map<String, Object> param = new HashMap<String, Object>();
        param.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_OOTD);
        param.put(TAG_MODEL.TAG_BND_ID, StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        returnMap.put("tagList", defaultDAO.selectList("PcTag.selectTagListById", param));
        
        //OOTD 희망 태그 리스트
        param.put(WSH_TAG_MODEL.WSH_TAG_TYPE, CONTENTS_TYPE_CODE.TYPE_OOTD);
        param.put(WSH_TAG_MODEL.WSH_TAG_BND_ID, StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        returnMap.put("wishTagList", defaultDAO.selectList("WishTag.selectWishTagListById", param));
        
	    return returnMap;
	}
	
	public int updateOOTD (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
	{
	    int result = 0;
	    
	    commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_OOTD);
	    
	    result = defaultDAO.update("OotdBoard.updateOOTDData", commandMap);
	    
	    String CMM_FLE_SAVE_PATH = "";
	    
	    //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
        
	    if(result > 0)
	    {
	        //기존 파일 삭제
	        String [] removeFileIdx = request.getParameterValues("file_del_idx");
	        
            if(removeFileIdx != null){
                for(int i=0;i<removeFileIdx.length;i++){
                    //파일 상세 정보
                	if(removeFileIdx[i] == null || removeFileIdx[i].isEmpty()) {
                		continue;
                	}
                    commandMap.put("CMM_FLE_IDX", removeFileIdx[i]);
                    Map<String, Object> row = (Map<String, Object>) defaultDAO.select("Common.selectCommonFileInfo", commandMap);
                    CMM_FLE_SAVE_PATH = StringUtil.getString(row.get("CMM_FLE_SAVE_PATH"), "");
                    
                     if(row != null && !"".equals(CMM_FLE_SAVE_PATH))
                     {
                         commandMap.put("CMM_FLE_USE_YN", "N");
                         
                         // 파일 DB 수정
                         defaultDAO.update("Common.deleteCommonFile", commandMap);
                         
                         // 물리적 삭제할 파일 경로에 추가
                         tempRemoveList.add(CMM_FLE_SAVE_PATH);
                     }
                }
            }
            
            //파일 insert
            List<CommonsMultipartFile> fileList = (List)request.getFiles("file");
            if(fileList.size() > 0)
            {
                commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_UPD_ID"));
                
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "board", "image", "Y"));
                    }
                }
            }
            
            //파일 삭제한 경우에만..
            if(tempRemoveList != null){
                for(int i=0;i<tempRemoveList.size();i++){
                    fileUpload.delete(tempRemoveList.get(i));
                }
            }
            
            commandMap.put("TAG_BND_ID", commandMap.get("CNT_MST_IDX"));
            commandMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_OOTD);
            //태그 수정
            defaultDAO.delete("PcTag.deleteTagBind", commandMap);
            String[] tagDataList = (String[])commandMap.get("TAG_MST_ID");
        
            if(tagDataList != null && tagDataList.length > 0){
                for(int index=0; index < tagDataList.length; index++){
                    Map<String, Object> tagParam = new HashMap<String, Object>();
                    tagParam.put("TAG_BND_STATUS", "USE");
                    tagParam.put(TAG_MODEL.TAG_MST_ID, tagDataList[index]);
                    tagParam.put(TAG_MODEL.TAG_BND_ID, commandMap.get("CNT_MST_IDX"));
                    tagParam.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_OOTD);
                    tagParam.put(TAG_MODEL.TAG_BND_REP, "N");
                    
                    //OOTD 태그 등록
                    defaultDAO.insert("PcTag.insertTagBind", tagParam);
                }
            }
        
            //희망태그 수정
            commandMap.put(WSH_TAG_MODEL.WSH_TAG_BND_ID, commandMap.get("CNT_MST_IDX"));
            commandMap.put(WSH_TAG_MODEL.WSH_TAG_TYPE, CONTENTS_TYPE_CODE.TYPE_OOTD);
            commandMap.put(WSH_TAG_MODEL.REG_ID, commandMap.get("CNT_MST_UPD_ID"));
            defaultDAO.delete("WishTag.deleteWishTagBind", commandMap);
            
            String wishTagListString = StringUtil.getString(commandMap.get(PARAM_WSH_TAG_CONST.WSH_TAG_TITLE_LIST),"");
            if(!"".equals(wishTagListString))
            {
                List<String> wishTagList = StringUtil.tagListStringToList(wishTagListString);
                if(!wishTagList.isEmpty()){
                    commandMap.put(PARAM_WSH_TAG_CONST.WSH_TAG_TITLE_LIST, wishTagList);
                    this.wishTagService.insertWithTagList(commandMap);
                }
            }
            
            //OOTD 상품 수정
            String [] CNT_PRD_MST_CD = StringUtil.getArray(commandMap, "PRD_MST_CD");
            defaultDAO.delete("OotdBoard.deleteOOTDProduct", commandMap);
            for(int index = 0; index < CNT_PRD_MST_CD.length; index++)
            {
                Map<String, Object> productMap = new HashMap<String, Object>();
                productMap.put("CNT_MST_IDX", commandMap.get("CNT_MST_IDX"));
                productMap.put("CNT_PRD_MST_CD", CNT_PRD_MST_CD[index]);
                
                defaultDAO.insert("OotdBoard.insertOOTDWithProduct", productMap);
            }
	    }
	    return result;
	}

}
