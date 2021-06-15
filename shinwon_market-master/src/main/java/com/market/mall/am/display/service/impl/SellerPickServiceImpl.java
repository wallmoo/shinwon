package com.market.mall.am.display.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.SellerPickService;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;


@Service("SellerPickService")
public class SellerPickServiceImpl implements SellerPickService{

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Autowired 
    private FileUpload fileUpload;
	
    @Autowired
    TagService tagService;
	
	public int selectSellerPickListCount (Map<String, Object> commandMap) throws Exception 
	{
	    return defaultDAO.selectCount("VendorSellerPick.selectSellerPickListCount", commandMap);
	}
	
	public List<Map<String, Object>> selectSellerPickList (Map<String, Object> commandMap)throws Exception 
	{
	    return defaultDAO.selectList("VendorSellerPick.selectSellerPickList", commandMap);
	}
	
	public int insertSellerPick (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
	{
	    int result = 0;
	    commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_PICK);
	    
	    result = defaultDAO.insert("VendorSellerPick.insertSellerPick", commandMap);
	    
	    if(result > 0)
        {
            /**
             * PC 목록 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 1
             * PC 상세 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 2
             * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 1
             * 모바일 상세 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 2
             */
            
            if(request != null){
                List<MultipartFile> fileList = request.getFiles("pcFile");// PC용 이미지
                
                if(fileList != null && fileList.size() > 0)
                {
                    int fileSort = 0;
                    
                    commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                    commandMap.put("CMM_FLE_TB_TYPE", "P");
                    commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_REG_ID").toString());
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
                
            if(request != null){
                List<MultipartFile> fileList2 = request.getFiles("mobileFile"); //  모바일용 이미지
                if(fileList2!=null && fileList2.size() > 0)
                {
                    int fileSort = 0;
                    
                    commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                    commandMap.put("CMM_FLE_TB_TYPE", "M");
                    commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_REG_ID").toString());
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
            
            //셀러픽 관련상품 등록
            String [] CNT_PRD_MST_CD = StringUtil.getArray(commandMap, "PRD_MST_CD");
            for(int y = 0; y < CNT_PRD_MST_CD.length;y++)
            {
                commandMap.put("CNT_PRD_MST_CD", CNT_PRD_MST_CD[y]);
                commandMap.put("CNT_DTL_ORDER", y+1);
                // 상품 구성 등록
                defaultDAO.insert("Contents.insertContentDetail", commandMap);
            }
            
            Map<String, Object> param = new HashMap<String, Object>();
            param.put(TAG_MODEL.TAG_BND_ID, commandMap.get("CNT_MST_IDX"));
            param.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_SELLER_PICK);
            param.put("TAG_MST_IDs", commandMap.get("TAG_MST_ID"));
            param.put("TAG_BND_REP_ID", commandMap.get("TAG_BND_REP_ID"));
            
            //태그 등록
            this.tagService.insertTagBindBatch(param);
        }
	    
	    return result;
	}
	
	public int updateSellerPick (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
	{
	    int result = 0;
	    
	    result = defaultDAO.update("VendorSellerPick.updateSellerPick", commandMap);
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
            
            /**
             * PC 목록 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 1
             * PC 상세 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 2
             * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 1
             * 모바일 상세 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 2
             */ 
            if(request != null){
                List<MultipartFile> fileList = request.getFiles("pcFile");// PC용 이미지
                
                if(fileList != null && fileList.size() > 0)
                {
                    int fileSort = 0;
                    
                    commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                    commandMap.put("CMM_FLE_TB_TYPE", "P");
                    commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_UPD_ID").toString());
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
                
            if(request != null){
                List<MultipartFile> fileList2 = request.getFiles("mobileFile"); //  모바일용 이미지
                if(fileList2!=null && fileList2.size() > 0)
                {
                    int fileSort = 0;
                    
                    commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                    commandMap.put("CMM_FLE_TB_TYPE", "M");
                    commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_UPD_ID").toString());
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
            
            //태그 수정
            Map<String, Object> tagParam = new HashMap<String, Object>();
            tagParam.put(TAG_MODEL.TAG_BND_ID, commandMap.get("CNT_MST_IDX"));
            tagParam.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_SELLER_PICK);
            //태그 삭제
            defaultDAO.delete("PcTag.deleteTagBind", tagParam);
            
            tagParam.put("TAG_MST_IDs", commandMap.get("TAG_MST_ID"));
            tagParam.put("TAG_BND_REP_ID", commandMap.get("TAG_BND_REP_ID"));
        	//태그 등록
            this.tagService.insertTagBindBatch(tagParam);
            
            //상품 수정
            if(defaultDAO.delete("VendorSellerPick.deleteSellerPickDetail", commandMap) > -1)
            {
                String [] CNT_PRD_MST_CD = StringUtil.getArray(commandMap, "PRD_MST_CD");
                for(int index = 0; index < CNT_PRD_MST_CD.length; index++)
                {
                	commandMap.put("CNT_PRD_MST_CD", CNT_PRD_MST_CD[index]);
                	commandMap.put("CNT_DTL_ORDER", index+1);
                	// 상품 구성 등록
                    defaultDAO.insert("Contents.insertContentDetail", commandMap);
                }
            }
            
            //파일 삭제한 경우에만..
            if(tempRemoveList != null){
                for(int i=0;i<tempRemoveList.size();i++){
                    fileUpload.delete(tempRemoveList.get(i));
                }
            }
        }
        
	    return result;
	}
	
    public Map<String, Object> selectSellerPickInfo (Map<String, Object> commandMap) throws Exception
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        // 기본 정보
        returnMap.put("row", defaultDAO.select("VendorSellerPick.selectSellerPickInfo", commandMap));
        
        commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        
        // 첨부파일 정보
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        
        // 상품구성 목록
        commandMap.put("IMG_THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        
        returnMap.put("detailList", defaultDAO.selectList("VendorSellerPick.selectSellerPickDetailList", commandMap));
        
        //tagList
        Map<String, Object> param = new HashMap<String, Object>();
        param.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_SELLER_PICK);
        param.put(TAG_MODEL.TAG_BND_ID, StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        returnMap.put("tagList", defaultDAO.selectList("PcTag.selectTagListById", param));
        
        return returnMap;
    }
    
    //EB 셀러픽 목록 > 전시여부 수정
    public int updateSellerPickList(Map<String, Object> commandMap) throws Exception
    {
  	  int result = defaultDAO.update("VendorSellerPick.updateSellerPickList", commandMap);
  	  return result;
    }
	   
}
