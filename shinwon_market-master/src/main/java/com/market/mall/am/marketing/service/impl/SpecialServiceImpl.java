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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.marketing.service.OneDayService;
import com.market.mall.am.marketing.service.SpecialService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;

/**
 * @PackageName: com.market.mall.am.marketing.service.impl
 * @FileName : OneDayServiceImpl.java
 * @Date : 2015. 11. 26.
 * @프로그램 설명 : 관리자 > 프로모션관리 > 원데이특가를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("specialService")
public class SpecialServiceImpl implements SpecialService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Autowired TagService tagService;
	@Autowired private FileUpload fileUpload;
    
    public int selectSpecialCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Special.selectSpecialCount",commandMap);
    }

    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSpecialList(Map<String, Object> commandMap) throws Exception 
    {
    	return defaultDAO.selectList("Special.selectSpecialList",commandMap);
    }

    @SuppressWarnings("unchecked")
    public Map<String, Object> selectSpecialInfo(Map<String, Object> commandMap) throws Exception 
    {
    	Map<String, Object> returnMap = new HashMap<String, Object>();
    	
    	// 기본 정보
        returnMap.put("row", defaultDAO.select("Special.selectSpecialInfo", commandMap));
        
        commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        
        //첨부파일 정보
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        
        //상품구성 목록
        commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        returnMap.put("detailList", defaultDAO.selectList("Special.selectSpecialDetailList", commandMap));
        
        //태그 리스트
        commandMap.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_SPECIAL);
        commandMap.put(TAG_MODEL.TAG_BND_ID, StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        returnMap.put("tagList", defaultDAO.selectList("Tag.selectContentWithTagList", commandMap));
        
    	return returnMap;
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int insertSpecial(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
		result = defaultDAO.insert("Special.insertSpecial", commandMap);
		
		if(result > 0)
		{
            /**
             * PC 상단 스페셜 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 1
             * PC 상단 영상 썸네일 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 2
             * PC 목록 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 3
             * PC 상세 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 4
             * 
             * 모바일 상단 스페셜 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 1
             * 모바일 상단 영상 썸네일 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 2
             * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 3
             * 모바일 상세 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 4
             */ 
            commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
            
			//PC 상단 스페셜 이미지
			CommonsMultipartFile pcSpecialFile = (CommonsMultipartFile) request.getFile("pcSpecialFile");
            if(pcSpecialFile != null && !pcSpecialFile.isEmpty())
            {
            	int fileSort = 1;
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_REG_ID"));
                commandMap.put("CMM_FLE_SORT", fileSort);
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, pcSpecialFile, "marketing", "image", "Y"));
            }
			//PC 상단 영상 썸네일 이미지
			CommonsMultipartFile pcThumbnailFile = (CommonsMultipartFile) request.getFile("pcThumbnailFile");
            if(pcThumbnailFile != null && !pcThumbnailFile.isEmpty())
            {
            	int fileSort = 2;
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_REG_ID"));
                commandMap.put("CMM_FLE_SORT", fileSort);
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, pcThumbnailFile, "marketing", "image", "Y"));
            }
			
            //PC용 이미지(목록,상세)
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                
                
                commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_REG_ID"));
                int fileSort = 3;
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = fileList.get(i);
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", fileSort);
                        commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                    }
                    fileSort++;
                }
            }
            
			//Mobile 상단 스페셜 이미지
			CommonsMultipartFile mobileSpecialFile = (CommonsMultipartFile) request.getFile("mobileSpecialFile");
            if(mobileSpecialFile != null && !mobileSpecialFile.isEmpty())
            {
            	int fileSort = 1;
                commandMap.put("CMM_FLE_TB_TYPE", "M");
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_REG_ID"));
                commandMap.put("CMM_FLE_SORT", fileSort);
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M"+fileSort), ""));
                
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, mobileSpecialFile, "marketing", "image", "Y"));
            }
			//Mobile 상단 영상 썸네일 이미지
			CommonsMultipartFile mobileThumbnailFile = (CommonsMultipartFile) request.getFile("mobileThumbnailFile");
            if(mobileThumbnailFile != null && !mobileThumbnailFile.isEmpty())
            {
            	int fileSort = 2;
                commandMap.put("CMM_FLE_TB_TYPE", "M");
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_REG_ID"));
                commandMap.put("CMM_FLE_SORT", fileSort);
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M"+fileSort), ""));
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, mobileThumbnailFile, "marketing", "image", "Y"));
            }
            
            //모바일 용 이미지(목록,상세)
            List<CommonsMultipartFile> mobileFileList = (List) request.getFiles("mobileFile");
            if(mobileFileList.size() > 0)
            {
                commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "M");
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_REG_ID"));
                int fileSort = 3;
                for(int i = 0;i < mobileFileList.size();i++)
                {
                    CommonsMultipartFile file = mobileFileList.get(i);
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", fileSort);
                        commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M"+fileSort), ""));
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                    }
                    fileSort++;
                }
            }
            //상품 등록
            String [] CNT_PRD_MST_CD = StringUtil.getArray(commandMap, "PRD_MST_CD");
            for(int index = 0; index < CNT_PRD_MST_CD.length; index++)
            {
            	commandMap.put("CNT_PRD_MST_CD", CNT_PRD_MST_CD[index]);
            	commandMap.put("CNT_DTL_ORDER", index+1);
            	// 상품 구성 등록
                defaultDAO.insert("Contents.insertContentDetail", commandMap);
            }
            //태그 등록
            Map<String, Object> param = new HashMap<String, Object>();
            param.put(TAG_MODEL.TAG_BND_ID, commandMap.get("CNT_MST_IDX"));
            param.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_SPECIAL);
            param.put("TAG_MST_IDs", commandMap.get("TAG_MST_ID"));
            param.put("TAG_BND_REP_ID", commandMap.get("TAG_BND_REP_ID"));

            this.tagService.insertTagBindBatch(param);
		}
		
		return result;
	}

    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int updateSpecial(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
        
		result = defaultDAO.update("Special.updateSpecial", commandMap);
		String CMM_FLE_SAVE_PATH = "";
		
        //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
		
        if(result > 0)
        {
            //기존 파일 삭제
            String[] arrCMM_FLE_IDX = request.getParameterValues("CMM_FLE_IDX[]");
            
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
             * PC 상단 스페셜 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 1
             * PC 상단 영상 썸네일 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 2
             * PC 목록 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 3
             * PC 상세 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 4
             * 
             * 모바일 상단 스페셜 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 1
             * 모바일 상단 영상 썸네일 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 2
             * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 3
             * 모바일 상세 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 4
             */
            commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_UPD_ID"));
            
			//PC 상단 스페셜 이미지
			CommonsMultipartFile pcSpecialFile = (CommonsMultipartFile) request.getFile("pcSpecialFile");
            if(pcSpecialFile != null && !pcSpecialFile.isEmpty())
            {
            	int fileSort = 1;
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                commandMap.put("CMM_FLE_SORT", fileSort);
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, pcSpecialFile, "marketing", "image", "Y"));
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1_IDX"), "")))
            {
                //대체 텍스트만 변경된 경우...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
			//PC 상단 영상 썸네일 이미지
			CommonsMultipartFile pcThumbnailFile = (CommonsMultipartFile) request.getFile("pcThumbnailFile");
            if(pcThumbnailFile != null && !pcThumbnailFile.isEmpty())
            {
            	int fileSort = 2;
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                commandMap.put("CMM_FLE_SORT", fileSort);
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, pcThumbnailFile, "marketing", "image", "Y"));
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2_IDX"), "")))
            {
                //대체 텍스트만 변경된 경우...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
            //PC용 이미지(목록,상세)
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0 && fileList != null)
            {
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                int fileSort = 3;
                for(int i = 0; i < fileList.size();i++)
                {
                    CommonsMultipartFile file = fileList.get(i);
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", fileSort);
                        commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                    }
                    fileSort++;
                }
            }
            
			//Mobile 상단 스페셜 이미지
			CommonsMultipartFile mobileSpecialFile = (CommonsMultipartFile) request.getFile("mobileSpecialFile");
            if(mobileSpecialFile != null && !mobileSpecialFile.isEmpty())
            {
            	int fileSort = 1;
                commandMap.put("CMM_FLE_TB_TYPE", "M");
                commandMap.put("CMM_FLE_SORT", fileSort);
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M"+fileSort), ""));
                
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, mobileSpecialFile, "marketing", "image", "Y"));
            }
            
			//Mobile 상단 영상 썸네일 이미지
			CommonsMultipartFile mobileThumbnailFile = (CommonsMultipartFile) request.getFile("mobileThumbnailFile");
            if(mobileThumbnailFile != null && !mobileThumbnailFile.isEmpty())
            {
            	int fileSort = 2;
                commandMap.put("CMM_FLE_TB_TYPE", "M");
                commandMap.put("CMM_FLE_SORT", fileSort);
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M"+fileSort), ""));
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, mobileThumbnailFile, "marketing", "image", "Y"));
            }
            
            //모바일 용 이미지(목록,상세)
            List<CommonsMultipartFile> mobileFileList = (List) request.getFiles("mobileFile");
            if(mobileFileList.size() > 0)
            {
                commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "M");
                int fileSort = 3;
                for(int i = 0;i < mobileFileList.size();i++)
                {
                    CommonsMultipartFile file = mobileFileList.get(i);
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", fileSort);
                        commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M"+fileSort), ""));
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                    }
                    fileSort++;
                }
            }
            
        }
        
        //태그 수정
        Map<String, Object> tagParam = new HashMap<String, Object>();
        tagParam.put(TAG_MODEL.TAG_BND_ID, commandMap.get("CNT_MST_IDX"));
        tagParam.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_SPECIAL);
        //태그 삭제
        defaultDAO.delete("PcTag.deleteTagBind", tagParam);
        
        tagParam.put("TAG_MST_IDs", commandMap.get("TAG_MST_ID"));
        tagParam.put("TAG_BND_REP_ID", commandMap.get("TAG_BND_REP_ID"));
    	//태그 등록
        this.tagService.insertTagBindBatch(tagParam);
        
        //상품 수정
        if(defaultDAO.delete("Special.deleteProductDetail", commandMap) > -1)
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
        
		return result;
	}
  
    //스페셜 목록 > 전시여부 수정
    public int updateSpecialList(Map<String, Object> commandMap) throws Exception
    {
  	  int result = defaultDAO.update("Special.updateSpecialList", commandMap);
  	  return result;
    }
    
}
