package com.market.mall.am.marketing.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.marketing.service.ChannelOnService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service("channelOnService")
public class ChannelOnServiceImpl implements ChannelOnService{

    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired TagService tagService;
    
    public List<Map<String, Object>> selectChannelOnList (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("ChannelOn.selectChannelOnList", commandMap);
    }
    
    public int selectChannelOnListCount (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("ChannelOn.selectChannelOnListCount", commandMap);
    }
    
    public int insertChannelOn (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("CNT_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_REG_ID", admin.getADM_MST_ID());
        
        Map<String, Object> idxResult = defaultDAO.select("Contents.createContentIdx",null);
        int channelOnIdx = Integer.parseInt(idxResult.get("CNT_MST_IDX").toString());
        
        commandMap.put("CNT_MST_IDX", channelOnIdx);
       
        //카테고리 1depth 등록
        String ctgIdx = StringUtil.getString(commandMap.get("CATEGORYPC1"),"");
        commandMap.put("PRD_CTG_IDX", ctgIdx);
        
        result = defaultDAO.insert("ChannelOn.insertChannelOn", commandMap);
        
        if(result > 0)
        {

            /**
             * PC 목록 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 1
             * PC 상세 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 2
             * PC 상단 썸네일 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 3
             * 
             * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 1
             * 모바일 상세 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 2
             * 모바일 상단 썸네일 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 3
             */ 
            
            //PC용 이미지
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                    }
                }
            }
            
            //PC용 상단 썸네일 이미지
            CommonsMultipartFile pcThumbnailFile = (CommonsMultipartFile) request.getFile("pcThumbnailFile");
            if(pcThumbnailFile != null)
            {
                commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                
                if(!pcThumbnailFile.isEmpty())
                {
                    commandMap.put("CMM_FLE_SORT", "3");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P3"), ""));
                    // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, pcThumbnailFile, "marketing", "image", "Y"));
                }
            }
            
            //모바일용 이미지
            List<CommonsMultipartFile> fileList2 = (List) request.getFiles("file2");
            if(fileList2.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "M");
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                for(int i = 0;i < fileList2.size();i++)
                {
                    CommonsMultipartFile file = fileList2.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M"+fileSort), ""));
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                    }
                }
            }
            
            //Mobile용 상단 썸네일 이미지
            CommonsMultipartFile mobileThumbnailFile = (CommonsMultipartFile) request.getFile("mobileThumbnailFile");
            if(mobileThumbnailFile != null)
            {
                commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "M");
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                
                if(!mobileThumbnailFile.isEmpty())
                {
                    commandMap.put("CMM_FLE_SORT", "3");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M3"), ""));
                    // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, mobileThumbnailFile, "marketing", "image", "Y"));
                }
            }
            
            //상품 등록
            String [] groupNum = StringUtil.getArray(commandMap, "groupNum");
            for(int i = 0;i< groupNum.length;i++)
            {
                commandMap.put("CNT_GRP_TITLE", StringUtil.getString(commandMap.get("CNT_GRP_TITLE" + StringUtil.getString(groupNum[i], "0")), ""));
                
                commandMap.put("CNT_GRP_COL", StringUtil.getInt(commandMap.get("CNT_GRP_COL" + StringUtil.getString(groupNum[i], "0")), 0));
                commandMap.put("CNT_GRP_SORT", StringUtil.getInt(commandMap.get("CNT_GRP_SORT" + StringUtil.getString(groupNum[i], "0")), 0));
                commandMap.put("CNT_GRP_TYPE", StringUtil.getString(commandMap.get("CNT_GRP_TYPE" + StringUtil.getString(groupNum[i], "0")), ""));
                
                  
                // 상품 구성 그룹 등록
                defaultDAO.insert("Contents.insertContentDetailGroup", commandMap);

                String [] CNT_PRD_MST_CD = StringUtil.getArray(commandMap, "CNT_PRD_MST_CD" + StringUtil.getString(groupNum[i], "0"));
                for(int y = 0;y < CNT_PRD_MST_CD.length;y++)
                {
                    commandMap.put("CNT_PRD_MST_CD", CNT_PRD_MST_CD[y]);
                    commandMap.put("CNT_DTL_ORDER", StringUtil.getString(commandMap.get("CNT_DTL_ORDER" + "_" + groupNum[i] + "_" + CNT_PRD_MST_CD[y]), ""));
                    // 상품 구성 등록
                    defaultDAO.insert("Contents.insertContentDetail", commandMap);
                }
            }
            Map<String, Object> param = new HashMap<String, Object>();
            param.put(TAG_MODEL.TAG_BND_ID, Integer.toString(channelOnIdx));
            param.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_CHANNEL_ON);
            param.put("TAG_MST_IDs", commandMap.get("TAG_MST_ID"));
            param.put("TAG_BND_REP_ID", commandMap.get("TAG_BND_REP_ID"));
            //태그 등록
            this.tagService.insertTagBindBatch(param);
        }
        return channelOnIdx;
    }
    
    public Map<String, Object> selectChannelOnInfo (Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        // 기본 정보
        returnMap.put("row", defaultDAO.select("ChannelOn.selectChannelOnInfo", commandMap));
        
        commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        
        // 첨부파일(목록/상세 이미지) 정보
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        
        // 상단 영상 썸네일 파일 정보
        returnMap.put("thumbnailFileList", defaultDAO.selectList("ChannelOn.selectThumbnailFileList", commandMap));
        
        // 상품구성 그룹 목록
        returnMap.put("detailGroupList", defaultDAO.selectList("ChannelOn.selectChannelOnDetailGroupList", commandMap));
        
        // 상품구성 목록
        commandMap.put("IMG_THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        returnMap.put("detailList", defaultDAO.selectList("ChannelOn.selectChannelOnDetailList", commandMap));
        
        //태그 리스트
        commandMap.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_CHANNEL_ON);
        commandMap.put(TAG_MODEL.TAG_BND_ID, StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        returnMap.put("tagList", defaultDAO.selectList("Tag.selectContentWithTagList", commandMap));
        
        return returnMap;
    }
    
    
    @SuppressWarnings("unchecked")
    public int updateChannelOn (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("CNT_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_UPD_ID", admin.getADM_MST_ID());
        
        int result = 0;
        
        //기획전 기본정보 수정
        result = defaultDAO.update("ChannelOn.updateChannelOn", commandMap);
        String CMM_FLE_SAVE_PATH = "";
        
        //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
        
        if(result > 0)
        {
            //기존 파일 삭제
            String[] arrCMM_FLE_IDX = request.getParameterValues("CMM_FLE_IDX");
            
            if(arrCMM_FLE_IDX != null){
                for(int i=0;i<arrCMM_FLE_IDX.length;i++){
                    //파일 상세 정보
                    commandMap.put("CMM_FLE_IDX", arrCMM_FLE_IDX[i]);
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
            
            /*String removeFiles = StringUtil.getString(commandMap.get("removeFiles"), "");
            if(!("").equals(removeFiles)){
                String fileSeq[] = removeFiles.split(",");
                if(fileSeq.length > 0){
                    for(int i=0;i<fileSeq.length;i++){
                        //파일 상세 정보
                        commandMap.put("CMM_FLE_IDX", fileSeq[i]);
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
            }*/
            
            /**
             * PC 목록 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 1
             * PC 상세 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 2
             * PC 상단 썸네일 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 3
             * 
             * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 1
             * 모바일 상세 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 2
             * 모바일 상단 썸네일 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 3
             * 
             */ 
            
            commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
            
            //PC 상단 영상 썸네일 이미지
            CommonsMultipartFile pcThumbnailFile = (CommonsMultipartFile) request.getFile("pcThumbnailFile");
            if(pcThumbnailFile != null){
                if(!pcThumbnailFile.isEmpty()){
                    commandMap.put("CMM_FLE_TB_TYPE", "P");
                    commandMap.put("CMM_FLE_SORT", "3");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P3"), ""));
                    
                    // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, pcThumbnailFile, "marketing", "image", "Y"));
                } 
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P3"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P3_IDX"), "")))
            {
                //대체 텍스트만 변경된 경우...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P3"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P3_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
            //PC 목록 이미지
            CommonsMultipartFile file1 =  (CommonsMultipartFile) request.getFile("file1");
            
            if(file1 != null){
                if(!file1.isEmpty())
                {
                    commandMap.put("CMM_FLE_TB_TYPE", "P");
                    commandMap.put("CMM_FLE_SORT", "1");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
                    // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file1, "marketing", "image", "Y"));
                }
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1_IDX"), "")))
            {
                //대체 텍스트만 변경된 경우...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
            //PC 상세 이미지
            CommonsMultipartFile file2 =  (CommonsMultipartFile) request.getFile("file2");
            if(file2 != null){
                if(!file2.isEmpty())
                {
                    commandMap.put("CMM_FLE_TB_TYPE", "P");
                    commandMap.put("CMM_FLE_SORT", "2");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2"), ""));
                    // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file2, "marketing", "image", "Y"));
                }
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2_IDX"), "")))
            {            
                //대체 텍스트만 변경된 경우...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
            //PC 상세 이미지
//            CommonsMultipartFile file3 =  (CommonsMultipartFile) request.getFile("file3");
//            if(file3 != null){
//              if(!file3.isEmpty())
//              {
//                  commandMap.put("CMM_FLE_TB_TYPE", "P");
//                  commandMap.put("CMM_FLE_SORT", "3");
//                  commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P3"), ""));
//                  // 파일 등록 및 파일 업로드
//                  result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file3, "marketing", "image", "Y"));
//              }
//            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P3"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P3_IDX"), "")))
//          {            
//              //대체 텍스트만 변경된 경우...
//              commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P3"), ""));
//              commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P3_IDX"), ""));
//              defaultDAO.update("Common.updateCommonFileAltText", commandMap);
//          }

            //모바일 상단 영상 썸네일 이미지
            CommonsMultipartFile mobileThumbnailFile = (CommonsMultipartFile) request.getFile("mobileThumbnailFile");
            if(mobileThumbnailFile != null){
                if(!mobileThumbnailFile.isEmpty()){
                    commandMap.put("CMM_FLE_TB_TYPE", "M");
                    commandMap.put("CMM_FLE_SORT", "3");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M3"), ""));
                    
                    // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, pcThumbnailFile, "marketing", "image", "Y"));
                } 
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M3"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M3_IDX"), "")))
            {
                //대체 텍스트만 변경된 경우...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M3"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M3_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
            //모바일 목록 이미지
            CommonsMultipartFile file4 =  (CommonsMultipartFile) request.getFile("file4");
            
            if(file4 != null){
                if(!file4.isEmpty())
                {
                    commandMap.put("CMM_FLE_TB_TYPE", "M");
                    commandMap.put("CMM_FLE_SORT", "1");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), ""));
                    // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file4, "marketing", "image", "Y"));
                }
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1_IDX"), "")))
            {
                //대체 텍스트만 변경된 경우...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
            //모바일 상세 이미지
            CommonsMultipartFile file5 =  (CommonsMultipartFile) request.getFile("file5");
            if(file5 != null){
                if(!file5.isEmpty())
                {
                    commandMap.put("CMM_FLE_TB_TYPE", "M");
                    commandMap.put("CMM_FLE_SORT", "2");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2"), ""));
                    // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file5, "marketing", "image", "Y"));
                }
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2_IDX"), "")))
            {
                //대체 텍스트만 변경된 경우...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
        }
        
        // 상품구성 삭제
        if(defaultDAO.delete("ChannelOn.deleteChannelOnDetail", commandMap) > -1)
        {
                // 상품 구성 그룹 등록
            String [] groupNum = StringUtil.getArray(commandMap, "groupNum");
            for(int i = 0;i < groupNum.length;i++)
            {
                String delYn = StringUtil.getString(commandMap.get("DEL_YN" + StringUtil.getString(groupNum[i], "0")), "");
                System.out.println("+++++++++++++++++delYn : "+delYn);
                
                commandMap.put("CNT_GRP_IDX", StringUtil.getString(commandMap.get("CNT_GRP_IDX" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("CNT_GRP_TITLE", StringUtil.getString(commandMap.get("CNT_GRP_TITLE" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("CNT_GRP_COL", StringUtil.getString(commandMap.get("CNT_GRP_COL" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("CNT_GRP_SORT", StringUtil.getString(commandMap.get("CNT_GRP_SORT" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("CNT_GRP_TYPE", StringUtil.getString(commandMap.get("CNT_GRP_TYPE" + StringUtil.getString(groupNum[i], "0")), ""));
                
                int groupCnt = defaultDAO.selectCount("ChannelOn.selectChannelOnGroupCount", commandMap);
                
                if("Y".equals(delYn)) { 
                	defaultDAO.delete("ChannelOn.deleteChannelOnDetailGroupIdx", commandMap);
                } else{
                    if(groupCnt == 0 ) {
                    	defaultDAO.insert("ChannelOn.insertChannelOnDetailGroup", commandMap);
                    } else {
                    	defaultDAO.update("ChannelOn.updateChannelOnDetailGroup", commandMap);
                    }
                    
                    String [] CNT_PRD_MST_CD = StringUtil.getArray(commandMap, "CNT_PRD_MST_CD" + StringUtil.getString(groupNum[i], "0"));
                    for(int y = 0;y < CNT_PRD_MST_CD.length;y++)
                    {
                        commandMap.put("CNT_PRD_MST_CD", CNT_PRD_MST_CD[y]);
                        commandMap.put("CNT_DTL_ORDER", StringUtil.getString(commandMap.get("CNT_DTL_ORDER" + "_" + CNT_PRD_MST_CD[y]), ""));
                        // 상품 구성 등록
                        defaultDAO.insert("ChannelOn.insertChannelOnDetail", commandMap);
                    }
                }
            }
            
        }        
        //파일 삭제한 경우에만..
        if(tempRemoveList != null){
            for(int i=0;i<tempRemoveList.size();i++){
                fileUpload.delete(tempRemoveList.get(i));
            }
        }
        
        //태그 수정
        Map<String, Object> tagParam = new HashMap<String, Object>();
        tagParam.put(TAG_MODEL.TAG_BND_ID, commandMap.get("CNT_MST_IDX"));
        tagParam.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_CHANNEL_ON);
        //태그 삭제
        defaultDAO.delete("PcTag.deleteTagBind", tagParam);
        
        tagParam.put("TAG_MST_IDs", commandMap.get("TAG_MST_ID"));
        tagParam.put("TAG_BND_REP_ID", commandMap.get("TAG_BND_REP_ID"));
    	//태그 등록
        this.tagService.insertTagBindBatch(tagParam);
        
        return result;
    }
    
    public int updateChannelOnStatus (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("CNT_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_UPD_ID", admin.getADM_MST_ID());
        
        int result = 0;

        String jsonList = StringUtil.getString(commandMap.get("jsonData"),"");
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        List<Map<String,Object>> chnnelOnList = mapper.readValue(jsonList,typeRef);
        
        for(int index = 0; index < chnnelOnList.size(); index++){
            
            String cntIdx = StringUtil.getString(chnnelOnList.get(index).get("CNT_MST_IDX"),"");
            String cntUseYN = StringUtil.getString(chnnelOnList.get(index).get("CNT_MST_USE_YN"),"Y");
            
            commandMap.put("CNT_MST_IDX", cntIdx);
            commandMap.put("CNT_MST_USE_YN", cntUseYN);
            
            result = defaultDAO.update("ChannelOn.updateChannelOnStatus", commandMap);
            
        }
        
        return result; 
    }
   
}
