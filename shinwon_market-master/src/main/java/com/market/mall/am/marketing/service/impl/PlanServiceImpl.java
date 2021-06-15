package com.market.mall.am.marketing.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.marketing.service.PlanService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;

/**
 * @PackageName: com.market.mall.am.marketing.service.impl
 * @FileName : PlanServiceImpl.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 마케팅관리 > 기획전관리를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("planService")
public class PlanServiceImpl implements PlanService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    @SuppressWarnings("unused")
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    TagService tagService;
    
    /**
    * <pre>
    * 1. MethodName : selectPlanListCount
    * 2. ClassName  : PlanServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 목록 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectPlanListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Plan.selectPlanListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectPlanList
    * 2. ClassName  : PlanServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectPlanList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("Plan.selectPlanList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectPlanInfo
    * 2. ClassName  : PlanServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 상세정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectPlanInfo (Map<String, Object> commandMap) throws Exception
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        // 기본 정보
        returnMap.put("row", defaultDAO.select("Plan.selectPlanInfo", commandMap));
        
        commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PLN_MST_IDX"), ""));
        
        // 첨부파일 정보
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        
        // 상품구성 그룹 목록
        returnMap.put("detailGroupList", defaultDAO.selectList("Plan.selectPlanDetailGroupList", commandMap));
        
        // 상품구성 목록
        commandMap.put("IMG_THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);

        
        returnMap.put("detailList", defaultDAO.selectList("Plan.selectPlanDetailList", commandMap));
        
        //tabList
        Map<String, Object> param = new HashMap<String, Object>();
        param.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_PLAN);
        param.put(TAG_MODEL.TAG_BND_ID, StringUtil.getString(commandMap.get("PLN_MST_IDX"), ""));
        returnMap.put("tagList", defaultDAO.selectList("PcTag.selectTagListById", param));
        
        return returnMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : insertPlan
    * 2. ClassName  : PlanServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    
    public Map<String,Object> setSessionAdmin(MultipartHttpServletRequest request, Map<String, Object> commandMap){
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("PLN_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("PLN_MST_REG_ID", admin.getADM_MST_ID());
        
        return commandMap;
    }
    
    public int insertPlanData(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception{
        int result = 0;

        // 기획전 관리 등록        
        Map<String, Object> idxResult = defaultDAO.select("Plan.createPlanIdx",null);
        int planIdx = Integer.parseInt(idxResult.get("PLN_MST_IDX").toString());
        commandMap.put("PLN_MST_IDX", planIdx);
        
        result = defaultDAO.insert("Plan.insertPlan", commandMap);
        
        if(result > 0)
        {
            /**
             * PC 목록 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 1
             * PC 상세 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 2
             * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 1
             * 모바일 상세 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 2
             */
            String planType = StringUtil.getString(commandMap.get("PLN_MST_TYPE"),"");
            
            if(request != null){
                List<MultipartFile> fileList = request.getFiles("file");// PC용 이미지
                
                if(fileList != null && fileList.size() > 0)
                {
                    int fileSort = 0;
                    
                    commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");
                    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PLN_MST_IDX"), ""));
                    commandMap.put("CMM_FLE_TB_TYPE", "P");
                    commandMap.put("CMM_FLE_REG_ID", commandMap.get("PLN_MST_REG_ID").toString());
                    for(int i = 0;i < fileList.size();i++)
                    {
                        CommonsMultipartFile file = (CommonsMultipartFile)fileList.get(i);
                        
                        if(!file.isEmpty())
                        {
                            commandMap.put("CMM_FLE_SORT", ++fileSort);
                            commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                            // 파일 등록 및 파일 업로드
                            result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                        }
                    }
                }
            }
                
            //모바일용 이미지
            if(request != null){
                List<MultipartFile> fileList2 = request.getFiles("file2");
                if(fileList2!=null && fileList2.size() > 0)
                {
                    int fileSort = 0;
                    
                    commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");
                    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PLN_MST_IDX"), ""));
                    commandMap.put("CMM_FLE_TB_TYPE", "M");
                    commandMap.put("CMM_FLE_REG_ID", commandMap.get("PLN_MST_REG_ID").toString());
                    for(int i = 0;i < fileList2.size();i++)
                    {
                        CommonsMultipartFile file = (CommonsMultipartFile)fileList2.get(i);
                        
                        if(!file.isEmpty())
                        {
                            commandMap.put("CMM_FLE_SORT", ++fileSort);
                            commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M"+fileSort), ""));
                            // 파일 등록 및 파일 업로드
                            result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                        }
                    }
                }   
            }
            
            //상품 등록
            String [] groupNum = StringUtil.getArray(commandMap, "groupNum");
            for(int i = 0;i< groupNum.length;i++)
            {
                commandMap.put("PLN_GRP_TITLE", StringUtil.getString(commandMap.get("PLN_GRP_TITLE" + StringUtil.getString(groupNum[i], "0")), ""));
                
                commandMap.put("PLN_GRP_COL", StringUtil.getString(commandMap.get("PLN_GRP_COL" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("PLN_GRP_SORT", StringUtil.getString(commandMap.get("PLN_GRP_SORT" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("PLN_GRP_TYPE", StringUtil.getString(commandMap.get("PLN_GRP_TYPE" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("PLN_GRP_REF_TYPE", StringUtil.getString(commandMap.get("PLN_GRP_REF_TYPE" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("PLN_GRP_URL", StringUtil.getString(commandMap.get("PLN_GRP_URL" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("PLN_GRP_DESC", StringUtil.getString(commandMap.get("PLN_GRP_DESC" + StringUtil.getString(groupNum[i], "0")), ""));   
                
                if ("M".contentEquals(   StringUtil.getString(commandMap.get("PLN_MST_TYPE"), "" ))) {
                    if (  !"".contentEquals( StringUtil.getString(commandMap.get("PLN_GRP_URL" + StringUtil.getString(groupNum[i], "0")), "") ) ) {
                    	commandMap.put("PLN_GRP_REF_TYPE", "U");	
                    }else {
                    	commandMap.put("PLN_GRP_REF_TYPE", "P");                	
                    }                	
                }

                // 상품 구성 그룹 등록
                defaultDAO.insert("Plan.insertPlanDetailGroup", commandMap);
                
                if(request != null)
                {
                    List<MultipartFile> fileList3 = request.getFiles("fileGroup"+ StringUtil.getString(groupNum[i], "0"));
                    
                    if(fileList3!=null && fileList3.size() > 0)
                    {
                        int fileSort = 0;
                        
                        commandMap.put("CMM_FLE_TB_NM", "T_PLN_GRP");
                        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PLN_GRP_IDX"), ""));
                        commandMap.put("CMM_FLE_TB_TYPE", "P");
                        commandMap.put("CMM_FLE_REG_ID", commandMap.get("PLN_MST_REG_ID").toString());
                        for(int j = 0;j < fileList3.size();j++)
                        {
                            CommonsMultipartFile file = (CommonsMultipartFile)fileList3.get(j);
                            
                            if(!file.isEmpty())
                            {
                                commandMap.put("CMM_FLE_SORT", ++fileSort);
                                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                                // 파일 등록 및 파일 업로드
                                result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                            }
                        }
                    }    
                }
                
                String [] PLN_PRD_MST_CD = StringUtil.getArray(commandMap, "PLN_PRD_MST_CD" + StringUtil.getString(groupNum[i], "0"));
                for(int y = 0;y < PLN_PRD_MST_CD.length;y++)
                {
                    commandMap.put("PLN_PRD_MST_CD", PLN_PRD_MST_CD[y]);
                    commandMap.put("PLN_DTL_ORDER", y+1);
                    // 상품 구성 등록
                    defaultDAO.insert("Plan.insertPlanDetail", commandMap);
                }
            }
            
            Map<String, Object> param = new HashMap<String, Object>();
            param.put(TAG_MODEL.TAG_BND_ID, planIdx);
            param.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_PLAN);
            param.put("TAG_MST_IDs", commandMap.get("TAG_MST_ID"));
            param.put("TAG_BND_REP_ID", commandMap.get("TAG_BND_REP_ID"));
            
            //태그 등록
            this.tagService.insertTagBindBatch(param);
        }
        return planIdx;
    }
    
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int insertPlan (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Map<String,Object> param = setSessionAdmin(request, commandMap);
        commandMap.put("PLN_MST_REG_IP",StringUtil.getString(param.get("PLN_MST_REG_IP")));
        commandMap.put("PLN_MST_REG_ID",StringUtil.getString(param.get("PLN_MST_REG_ID")));
        return insertPlanData(request, commandMap); 
    }
    
    /**
    * <pre>
    * 1. MethodName : updatePlan
    * 2. ClassName  : PlanServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 수정 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public int updatePlan (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("PLN_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PLN_MST_UPD_ID", admin.getADM_MST_ID());
        
        int result = 0;
        
        //기획전 기본정보 수정
        result = defaultDAO.update("Plan.updatePlan", commandMap);
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
             * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 1
             * 모바일 상세 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 2
             */ 
            
            commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PLN_MST_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
             
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
            if(file4 != null){
                if(!file4.isEmpty())
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

        Map<String, Object> tagParam = new HashMap<String, Object>();
        tagParam.put(TAG_MODEL.TAG_BND_ID, commandMap.get("PLN_MST_IDX"));
        tagParam.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_PLAN);
        //태그 삭제
        defaultDAO.delete("PcTag.deleteTagBind", tagParam);
        
        tagParam.put("TAG_MST_IDs", commandMap.get("TAG_MST_ID"));
        tagParam.put("TAG_BND_REP_ID", commandMap.get("TAG_BND_REP_ID"));
    	//태그 등록
        this.tagService.insertTagBindBatch(tagParam);
        
        
        // 상품구성 삭제
        if(defaultDAO.delete("Plan.deletePlanDetail", commandMap) > -1)
        {
                // 상품 구성 그룹 등록
        	String [] groupNum = StringUtil.getArray(commandMap, "groupNum");
            for(int i = 0;i < groupNum.length;i++)
            {
                String delYn = StringUtil.getString(commandMap.get("DEL_YN" + StringUtil.getString(groupNum[i], "0")), "");
                System.out.println("+++++++++++++++++delYn : "+delYn);
                
                commandMap.put("PLN_GRP_IDX", StringUtil.getString(commandMap.get("PLN_GRP_IDX" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("PLN_GRP_TITLE", StringUtil.getString(commandMap.get("PLN_GRP_TITLE" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("PLN_GRP_COL", StringUtil.getString(commandMap.get("PLN_GRP_COL" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("PLN_GRP_SORT", StringUtil.getString(commandMap.get("PLN_GRP_SORT" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("PLN_GRP_TYPE", StringUtil.getString(commandMap.get("PLN_GRP_TYPE" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("PLN_GRP_DESC", StringUtil.getString(commandMap.get("PLN_GRP_DESC" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("PLN_GRP_REF_TYPE", StringUtil.getString(commandMap.get("PLN_GRP_REF_TYPE" + StringUtil.getString(groupNum[i], "0")), ""));
                commandMap.put("PLN_GRP_URL", StringUtil.getString(commandMap.get("PLN_GRP_URL" + StringUtil.getString(groupNum[i], "0")), ""));
                
                int groupCnt = defaultDAO.selectCount("Plan.selectPlanGroupCount", commandMap);
                
                if("Y".equals(delYn)) defaultDAO.delete("Plan.deletePlanDetailGroupIdx", commandMap);
                else
                {
                    if(groupCnt == 0 ) defaultDAO.insert("Plan.insertPlanDetailGroup", commandMap);
                    else defaultDAO.update("Plan.updatePlanDetailGroup", commandMap);
                    
                    String [] PLN_PRD_MST_CD = StringUtil.getArray(commandMap, "PLN_PRD_MST_CD" + StringUtil.getString(groupNum[i], "0"));

                    for(int y = 0;y < PLN_PRD_MST_CD.length;y++)
                    {
                        commandMap.put("PLN_PRD_MST_CD", PLN_PRD_MST_CD[y]);
                        commandMap.put("PLN_DTL_ORDER", y+1);
                        // 상품 구성 등록
                        defaultDAO.insert("Plan.insertPlanDetail", commandMap);
                    }
                    
                    List<CommonsMultipartFile> fileList3 = (List) request.getFiles("fileGroup"+ StringUtil.getString(groupNum[i], "0"));
                    
                     
                    if(fileList3.size() > 0)
                    {
                        int fileSort = 0;
                        
                        commandMap.put("CMM_FLE_TB_NM", "T_PLN_GRP");
                        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PLN_GRP_IDX"), ""));
                        commandMap.put("CMM_FLE_TB_TYPE", "P");
                        commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                        for(int j = 0;j < fileList3.size();j++)
                        {
                            CommonsMultipartFile file = fileList3.get(j);
                            
                            if(!file.isEmpty())
                            {
                                commandMap.put("CMM_FLE_SORT", ++fileSort);
                                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                                // 파일 등록 및 파일 업로드
                                result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                            }
                        }
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
        
        return result;
    }
    /**
     * <pre>
     * 1. MethodName : selectProductPlanCount
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅관리 > 상품기획전팝업 목록 갯수 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectProductPlanCount (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectCount("Plan.selectProductPlanCount", commandMap);
     }
     
     /**
      * <pre>
      * 1. MethodName : selectProductPlanList
      * 2. ClassName  : PlanServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅관리 > 상품기획전팝업 목록 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 11. 13.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      @SuppressWarnings("unchecked")
      public List<Map<String, Object>> selectProductPlanList (Map<String, Object> commandMap) throws Exception
      {
          return defaultDAO.selectList("Plan.selectProductPlanList", commandMap);
      }
      
      public int deletePlanData(Map<String,Object> commandMap) throws Exception {
          return defaultDAO.delete("Plan.deletePlanData", commandMap);
      }
      
      public int deletePlanDetailGroup(Map<String,Object> commandMap) throws Exception {
          return defaultDAO.delete("Plan.deletePlanDetailGroup", commandMap);
      }
      
      public int deletePlanDetail(Map<String,Object> commandMap) throws Exception {
          return defaultDAO.delete("Plan.deletePlanDetail", commandMap);
      }
      //기획전 목록 > 전시여부 수정
      public int updatePlanList(Map<String, Object> commandMap) throws Exception
      {
    	  int result = defaultDAO.update("Plan.updatePlanList", commandMap);
    	  return result;
      }
}
