package com.market.mall.am.vendor.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.vendor.service.VendorSellerPickService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;


@Service("vendorSellerPickService")
public class VendorSellerPickServiceImpl implements VendorSellerPickService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
    @Autowired 
    private FileUpload fileUpload;
	
    @Autowired TagService tagService;
    
    public Map<String,Object> getSellerPickDetail(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	if(!SessionsAdmin.isLoginAdmin(request)) { return null; }
    	return defaultDAO.select("SellerPick.selectSellerPickInfo",commandMap);
    }
    public List<Map<String,Object>> getSellerPickProduct (HttpServletRequest request, Map<String, Object> commandMap)throws Exception{
    	if(!SessionsAdmin.isLoginAdmin(request)) { return null; }
    	if(!commandMap.containsKey("CNT_MST_IDX")) { return null; }
    	return defaultDAO.selectList("Contents.selectDetailItemByMasterIndex", commandMap);
    }
    public List<Map<String,Object>> getSellerAdminPickList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	if(!SessionsAdmin.isLoginAdmin(request)) { return null; }
    	if(commandMap.containsKey("ADM_MST_ID")) {
    		commandMap.remove("ADM_MST_ID");
    	}
    	return this.getSellerAdminPickList(request, commandMap);
    }
    
    @Override
    public List<Map<String,Object>> getSellerPickList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	return defaultDAO.selectList("SellerPick.selectSellerPickList", commandMap);
    }
    @Override
    public Integer selectSellerPickListCount(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	return defaultDAO.selectCount("SellerPick.selectSellerPickListCount", commandMap);
    }
    
	public int insertSellerPick (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        //commandMap.put("VDR_MST_IDX",  commandMap.get("CNT_MST_REG_ID"));
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("CNT_MST_REG_IP", request.getRemoteAddr());
        //????????? ????????????
        commandMap.put("CNT_MST_REG_ID", admin.getADM_MST_ID());

        // ????????? ?????? ??????
        
        Map<String, Object> idxResult = defaultDAO.select("Contents.createContentIdx",null);
        int sellerPickIdx = Integer.parseInt(idxResult.get("CNT_MST_IDX").toString());
        
        commandMap.put("CNT_MST_IDX", sellerPickIdx);

        
        
        result = defaultDAO.insert("Contents.insertContent", commandMap);
        
        if(result > 0)
        {

            /**
             * PC ?????? ???????????? CMM_FLE_TB_TYPE??? P,  CMM_FLE_SORT??? 1
             * PC ?????? ???????????? CMM_FLE_TB_TYPE??? P,  CMM_FLE_SORT??? 2
             * 
             * ????????? ?????? ???????????? CMM_FLE_TB_TYPE??? M,  CMM_FLE_SORT??? 1
             * ????????? ?????? ???????????? CMM_FLE_TB_TYPE??? M,  CMM_FLE_SORT??? 2
             */ 
            
            //PC??? ?????????
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
                        // ?????? ?????? ??? ?????? ?????????
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "vendor", "image", "Y"));
                    }
                }
            }
            
            //???????????? ?????????
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
                        // ?????? ?????? ??? ?????? ?????????
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "vendor", "image", "Y"));
                    }
                }
            }
            
            //?????? ??????
            String [] groupNum = StringUtil.getArray(commandMap, "groupNum");
            for(int i = 0;i< groupNum.length;i++)
            {
                commandMap.put("CNT_GRP_TITLE", StringUtil.getString(commandMap.get("CNT_GRP_TITLE" + StringUtil.getString(groupNum[i], "0")), ""));
                
                commandMap.put("CNT_GRP_COL", StringUtil.getInt(commandMap.get("CNT_GRP_COL" + StringUtil.getString(groupNum[i], "0")), 0));
                commandMap.put("CNT_GRP_SORT", StringUtil.getInt(commandMap.get("CNT_GRP_SORT" + StringUtil.getString(groupNum[i], "0")), 0));
                commandMap.put("CNT_GRP_TYPE", StringUtil.getString(commandMap.get("CNT_GRP_TYPE" + StringUtil.getString(groupNum[i], "0")), ""));
                
                  
                // ?????? ?????? ?????? ??????
                defaultDAO.insert("Contents.insertContentDetailGroup", commandMap);
                
                  
                List<CommonsMultipartFile> fileList3 = (List) request.getFiles("fileGroup"+ StringUtil.getString(groupNum[i], "0"));
                
                 
                if(fileList3.size() > 0)
                {
                    int fileSort = 0;
                    
                    commandMap.put("CMM_FLE_TB_NM", "T_CNT_GRP");
                    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_GRP_IDX"), ""));
                    commandMap.put("CMM_FLE_TB_TYPE", "P");
                    commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                    for(int j = 0;j < fileList3.size();j++)
                    {
                        CommonsMultipartFile file = fileList3.get(j);
                        
                        if(!file.isEmpty())
                        {
                            commandMap.put("CMM_FLE_SORT", ++fileSort);
                            commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                            // ?????? ?????? ??? ?????? ?????????
                            result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "vendor", "image", "Y"));
                        }
                    }
                }
                

                String [] CNT_PRD_MST_CD = StringUtil.getArray(commandMap, "CNT_PRD_MST_CD" + StringUtil.getString(groupNum[i], "0"));
                for(int y = 0;y < CNT_PRD_MST_CD.length;y++)
                {
                    commandMap.put("CNT_PRD_MST_CD", CNT_PRD_MST_CD[y]);
                    commandMap.put("CNT_DTL_ORDER", StringUtil.getString(commandMap.get("CNT_DTL_ORDER" + "_" + groupNum[i] + "_" + CNT_PRD_MST_CD[y]), ""));
                    // ?????? ?????? ??????
                    defaultDAO.insert("Contents.insertContentDetail", commandMap);
                }
            }
            //?????? ?????? ??????
            String [] arrTAG_MST_ID = ((String)commandMap.get("tagList")).split(",");
            
            if(arrTAG_MST_ID != null){
                for(int index=0; index < arrTAG_MST_ID.length; index++){
                    Map<String, Object> paramMap = new HashMap<String, Object>();
                    paramMap.put("TAG_BND_STATUS", StringUtil.getString(commandMap.get("TAG_BND_STATUS"), "USE"));
                    paramMap.put(TAG_MODEL.TAG_MST_ID, arrTAG_MST_ID[index]);
                    paramMap.put(TAG_MODEL.TAG_BND_ID, Integer.toString(sellerPickIdx));
                    paramMap.put(TAG_MODEL.TAG_BND_TYPE, commandMap.get(TAG_MODEL.TAG_BND_TYPE));
                    
                    //????????? ?????? ??????
                    defaultDAO.insert("PcTag.insertTagBind", paramMap);
                }
            }

        }
        return sellerPickIdx;
    }
	
    public Map<String, Object> selectSellerPickInfo (Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        // ?????? ??????
        returnMap.put("row", defaultDAO.select("SellerPick.selectSellerPickInfo", commandMap));
        
        commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        
        // ????????????(??????/?????? ?????????) ??????
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        
        // ???????????? ??????
        commandMap.put("IMG_THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        returnMap.put("detailList", defaultDAO.selectList("SellerPick.selectSellerPickDetailList", commandMap));
        
        //?????? ?????????
        Map<String, Object> param = new HashMap<String, Object>();
        param.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_SELLER_PICK);
        param.put(TAG_MODEL.TAG_BND_ID, StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        returnMap.put("tagList", defaultDAO.selectList("PcTag.selectTagListById", param));
        
        return returnMap;
    }
    
    @SuppressWarnings("unchecked")
    public int updateSellerPick (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("CNT_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_UPD_ID", admin.getADM_MST_ID());
        
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_SELLER_PICK);
        
        int result = 0;
        
        //????????? ???????????? ??????
        result = defaultDAO.update("SellerPick.updateSellerPick", commandMap);
        String CMM_FLE_SAVE_PATH = "";
        
        //????????? ?????? ????????? ?????? tempList
        List<String> tempRemoveList = new ArrayList<String>();
        
        if(result > 0)
        {
            //?????? ?????? ??????
            String[] arrCMM_FLE_IDX = request.getParameterValues("CMM_FLE_IDX");
            
            if(arrCMM_FLE_IDX != null){
                for(int i=0;i<arrCMM_FLE_IDX.length;i++){
                    //?????? ?????? ??????
                    commandMap.put("CMM_FLE_IDX", arrCMM_FLE_IDX[i]);
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
            
            /*String removeFiles = StringUtil.getString(commandMap.get("removeFiles"), "");
            if(!("").equals(removeFiles)){
                String fileSeq[] = removeFiles.split(",");
                if(fileSeq.length > 0){
                    for(int i=0;i<fileSeq.length;i++){
                        //?????? ?????? ??????
                        commandMap.put("CMM_FLE_IDX", fileSeq[i]);
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
            }*/
            
            /**
             * PC ?????? ???????????? CMM_FLE_TB_TYPE??? P,  CMM_FLE_SORT??? 1
             * PC ?????? ???????????? CMM_FLE_TB_TYPE??? P,  CMM_FLE_SORT??? 2
             * 
             * ????????? ?????? ???????????? CMM_FLE_TB_TYPE??? M,  CMM_FLE_SORT??? 1
             * ????????? ?????? ???????????? CMM_FLE_TB_TYPE??? M,  CMM_FLE_SORT??? 2
             * 
             */ 
            
            commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
            
            //PC ?????? ?????????
            CommonsMultipartFile file1 =  (CommonsMultipartFile) request.getFile("file1");
            
            if(file1 != null){
                if(!file1.isEmpty())
                {
                    commandMap.put("CMM_FLE_TB_TYPE", "P");
                    commandMap.put("CMM_FLE_SORT", "1");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
                    // ?????? ?????? ??? ?????? ?????????
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file1, "marketing", "image", "Y"));
                }
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1_IDX"), "")))
            {
                //?????? ???????????? ????????? ??????...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
            //PC ?????? ?????????
            CommonsMultipartFile file2 =  (CommonsMultipartFile) request.getFile("file2");
            if(file2 != null){
                if(!file2.isEmpty())
                {
                    commandMap.put("CMM_FLE_TB_TYPE", "P");
                    commandMap.put("CMM_FLE_SORT", "2");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2"), ""));
                    // ?????? ?????? ??? ?????? ?????????
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file2, "marketing", "image", "Y"));
                }
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2_IDX"), "")))
            {            
                //?????? ???????????? ????????? ??????...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
            //????????? ?????? ?????????
            CommonsMultipartFile file4 =  (CommonsMultipartFile) request.getFile("file4");
            
            if(file4 != null){
                if(!file4.isEmpty())
                {
                    commandMap.put("CMM_FLE_TB_TYPE", "M");
                    commandMap.put("CMM_FLE_SORT", "1");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), ""));
                    // ?????? ?????? ??? ?????? ?????????
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file4, "marketing", "image", "Y"));
                }
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1_IDX"), "")))
            {
                //?????? ???????????? ????????? ??????...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
            //????????? ?????? ?????????
            CommonsMultipartFile file5 =  (CommonsMultipartFile) request.getFile("file5");
            if(file5 != null){
                if(!file5.isEmpty())
                {
                    commandMap.put("CMM_FLE_TB_TYPE", "M");
                    commandMap.put("CMM_FLE_SORT", "2");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2"), ""));
                    // ?????? ?????? ??? ?????? ?????????
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file5, "marketing", "image", "Y"));
                }
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2_IDX"), "")))
            {
                //?????? ???????????? ????????? ??????...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
        }
        
        //?????? ??????
        Map<String, Object> tagParam = new HashMap<String, Object>();
        tagParam.put(TAG_MODEL.TAG_BND_ID, commandMap.get("CNT_MST_IDX"));
        tagParam.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_SPECIAL);
        //?????? ??????
        defaultDAO.delete("PcTag.deleteTagBind", tagParam);
        
        tagParam.put("TAG_MST_IDs", commandMap.get("TAG_MST_ID"));
        tagParam.put("TAG_BND_REP_ID", commandMap.get("TAG_BND_REP_ID"));
    	//?????? ??????
        this.tagService.insertTagBindBatch(tagParam);
        
        //?????? ??????
        if(defaultDAO.delete("SellerPick.deleteProductDetail", commandMap) > -1)
        {
            String [] CNT_PRD_MST_CD = StringUtil.getArray(commandMap, "PRD_MST_CD");
            for(int index = 0; index < CNT_PRD_MST_CD.length; index++)
            {
            	commandMap.put("CNT_PRD_MST_CD", CNT_PRD_MST_CD[index]);
            	commandMap.put("CNT_DTL_ORDER", index+1);
            	// ?????? ?????? ??????
                defaultDAO.insert("Contents.insertContentDetail", commandMap);
            }
        }
        
        //?????? ????????? ????????????..
        if(tempRemoveList != null){
            for(int i=0;i<tempRemoveList.size();i++){
                fileUpload.delete(tempRemoveList.get(i));
            }
        }
        
        return result;
        
        
    }
}
