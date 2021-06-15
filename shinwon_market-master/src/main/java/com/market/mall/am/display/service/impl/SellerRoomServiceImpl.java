package com.market.mall.am.display.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.SellerRoomService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;


@Service("SellerRoomService")
public class SellerRoomServiceImpl implements SellerRoomService{

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Autowired 
    private FileUpload fileUpload;
	
	@Override
	public Map<String, Object> selectSellerRoomLayoutInfo(Map<String, Object> commandMap) throws Exception{
		
		return defaultDAO.select("SellerRoom.selectSellerRoomLayoutInfo", commandMap);
	}

	@Override
	public int updateSellerRoomLayoutInfo(Map<String, Object> commandMap) throws Exception {
		
		
		return defaultDAO.update("SellerRoom.updateSellerRoomLayoutInfo", commandMap);
	}

	public int selectSellerMediaCount(Map<String, Object> commandMap) throws Exception 
	{
	    return defaultDAO.selectCount("SellerRoom.selectSellerMediaCount", commandMap);
	}
	
	public List<Map<String, Object>> selectSellerMediaList(Map<String, Object> commandMap) throws Exception
	{
	    return defaultDAO.selectList("SellerRoom.selectSellerMediaList", commandMap);
	}
	
	public int insertSellerMedia (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
	    
	    int result = 0;
	    Admin admin = SessionsAdmin.getSessionAdmin(request);
	    
	    commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 관리 IDX 
	    
        commandMap.put("CNT_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_REG_ID", admin.getADM_MST_ID());
        
        commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_MEDIA); // 셀러룸 > 미디어 타입
	    result = defaultDAO.insert("SellerRoom.insertSellerMedia", commandMap);
	    
	    if ( result > 0){
            /**
             * PC 목록 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 1
             * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 1
             */
            
	        if(request != null){
	            
	            commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
	            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
	            commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
	            
	            //PC 목록 이미지
	            CommonsMultipartFile pcFile =  (CommonsMultipartFile) request.getFile("pcFile");
	            if(pcFile != null && !pcFile.isEmpty()){
	                commandMap.put("CMM_FLE_TB_TYPE", "P");
	                commandMap.put("CMM_FLE_SORT", "1");
	                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
	                
	                // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, pcFile, "vendor", "image", "Y"));
	            }
	            //Mobile 목록 이미지
	            CommonsMultipartFile mobileFile =  (CommonsMultipartFile) request.getFile("mobileFile");
	            if(mobileFile != null && !mobileFile.isEmpty()){
	                commandMap.put("CMM_FLE_TB_TYPE", "M");
                    commandMap.put("CMM_FLE_SORT", "1");
                    commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), ""));
                    
                    //파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, mobileFile, "vendor", "image", "Y"));
	            }
	        }
	    }
	    
	    return result;
	}

    public Map<String, Object> selectSellerMediaInfo (Map<String, Object> commandMap) throws Exception
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_MEDIA); // 셀러룸 > 미디어 타입
        // 기본 정보
        returnMap.put("row", defaultDAO.select("SellerRoom.selectSellerMediaInfo", commandMap));
        
        commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));

        // 첨부파일 정보
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        
        
        return returnMap;
    }
    
    public int updateSellerMedia (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("CNT_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_UPD_ID", admin.getADM_MST_ID());
        commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_MEDIA); // 셀러룸 > 미디어 타입
        
        int result = 0;
        
        //미디어 기본정보 수정
        result = defaultDAO.update("SellerRoom.updateSellerMedia", commandMap);
        String CMM_FLE_SAVE_PATH = "";
        
        //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
        
        if( result > 0){
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
             * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 1
             */
            commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
            
            //PC 목록 이미지
            CommonsMultipartFile pcFile =  (CommonsMultipartFile) request.getFile("pcFile");
            
            if(pcFile != null && !pcFile.isEmpty()){
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                commandMap.put("CMM_FLE_SORT", "1");
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
                
                // 파일 등록 및 파일 업로드
                result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, pcFile, "vendor", "image", "Y"));
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1_IDX"), "")))
            {
                //대체 텍스트만 변경된 경우...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
            //모바일 목록 이미지
            CommonsMultipartFile mobileFile =  (CommonsMultipartFile) request.getFile("mobileFile");
            
            if(mobileFile != null){
                commandMap.put("CMM_FLE_TB_TYPE", "M");
                commandMap.put("CMM_FLE_SORT", "1");
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), ""));
                
                // 파일 등록 및 파일 업로드
                result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, mobileFile, "vendor", "image", "Y"));
                
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1_IDX"), "")))
            {
                //대체 텍스트만 변경된 경우...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
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
    
    public int selectSellerLookBookCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("SellerRoom.selectSellerLookBookCount", commandMap);
    }
    
    public List<Map<String, Object>> selectSellerLookBookList(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("SellerRoom.selectSellerLookBookList", commandMap);
    }
    
    public int insertSellerLookBook (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 관리 IDX 
        
        commandMap.put("CNT_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_REG_ID", admin.getADM_MST_ID());
        
        commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_LOOKBOOK); // 셀러룸 > 룩북 타입
        
        result = defaultDAO.insert("SellerRoom.insertSellerLookBook", commandMap);
        
        if ( result > 0)
        {
            /**
             * PC 이미지는 CMM_FLE_TB_TYPE이 P
             * 모바일 이미지는 CMM_FLE_TB_TYPE이 M
             */
            if( request != null){
                List<MultipartFile> pcFileList = request.getFiles("pcFile");    // PC용 이미지
                
                if(pcFileList != null && pcFileList.size() > 0)
                {
                    int fileSort = 0;
                    
                    commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                    commandMap.put("CMM_FLE_TB_TYPE", "P");
                    commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_REG_ID").toString());
                    for(int i = 0;i < pcFileList.size();i++)
                    {
                        CommonsMultipartFile file = (CommonsMultipartFile)pcFileList.get(i);
                        
                        if(file!=null && !file.isEmpty())
                        {
                            commandMap.put("CMM_FLE_SORT", ++fileSort);
                            // 파일 등록 및 파일 업로드
                            result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "vendor", "image", "Y"));
                        }
                    }
                }
            }
            if(request != null){
                List<MultipartFile> mobileFileList = request.getFiles("mobileFile");    //모바일용 이미지
                if(mobileFileList!=null && mobileFileList.size() > 0)
                {
                    int fileSort = 0;
                    
                    commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
                    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
                    commandMap.put("CMM_FLE_TB_TYPE", "M");
                    commandMap.put("CMM_FLE_REG_ID", commandMap.get("CNT_MST_REG_ID").toString());
                    for(int i = 0;i < mobileFileList.size();i++)
                    {
                        CommonsMultipartFile file = (CommonsMultipartFile)mobileFileList.get(i);
                        
                        if(file!=null && !file.isEmpty())
                        {
                            commandMap.put("CMM_FLE_SORT", ++fileSort);
                            // 파일 등록 및 파일 업로드
                            result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "vendor", "image", "Y"));
                        }
                    }
                }   
            }

        }
        
        return result;
    }
    
    public Map<String, Object> selectSellerLookBookInfo (Map<String, Object> commandMap) throws Exception
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_LOOKBOOK); // 셀러룸 > 룩북 타입
        // 기본 정보
        returnMap.put("row", defaultDAO.select("SellerRoom.selectSellerLookBookInfo", commandMap));
        
        commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));

        // 첨부파일 정보
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        return returnMap;
    }
    
    public int updateSellerLookBook (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("CNT_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_UPD_ID", admin.getADM_MST_ID());
        commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_LOOKBOOK); // 셀러룸 > 룩북 타입
        
        int result = 0;
        
        //룩북 기본정보 수정
        result = defaultDAO.update("SellerRoom.updateSellerLookBook", commandMap);
        String CMM_FLE_SAVE_PATH = "";
        
        //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
        
        if( result > 0){
            //기존 파일 삭제
            Map<String, Object> fileParamMap = new HashMap<String, Object>();
            String filePK = StringUtil.getString(commandMap.get("CNT_MST_IDX"),"");
            fileParamMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
            fileParamMap.put("CMM_FLE_TB_PK", filePK);
            
            if(!filePK.equals("")){
                List<Map<String, Object>> row = defaultDAO.selectList("Common.selectCommonFileInfo", fileParamMap);
                
                for(int index = 0; index < row.size(); index++){
                    Map<String, Object> paramMap = new HashMap<String, Object>();                   
                    CMM_FLE_SAVE_PATH = StringUtil.getString(row.get(index).get("CMM_FLE_SAVE_PATH"), "");
                    if(row != null && !"".equals(CMM_FLE_SAVE_PATH))
                    {
                        paramMap.put("CMM_FLE_IDX", row.get(index).get("CMM_FLE_IDX"));
 
                        //파일 DB 수정
                        defaultDAO.update("Common.deleteCommonFile", paramMap);
                        // 물리적 삭제할 파일 경로에 추가
                        tempRemoveList.add(CMM_FLE_SAVE_PATH);
                    }
                    
                }
                
            }
            //기존 파일 IDX
            int oldFileSize = 0;
            if(commandMap.get("CMM_FLE_IDX") != null) {
            	
            	try {
                    String [] arrCMM_FLE_IDX = (String[]) commandMap.get("CMM_FLE_IDX");
                    oldFileSize = arrCMM_FLE_IDX.length;
                    for(int index = 0; index < arrCMM_FLE_IDX.length; index++){
                        Map<String, Object> param = new HashMap<String, Object>();
                        param.put("CMM_FLE_IDX", arrCMM_FLE_IDX[index]);
                        
                        defaultDAO.update("Common.updateUseCommonFile", param);
                    }
            	}catch(Exception e) {
            		
            	}
 
            }

            
            /**
             * PC 목록 이미지는 CMM_FLE_TB_TYPE이 P
             * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M
             */
            commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
            
            //PC 목록 이미지
            List<CommonsMultipartFile> fileList = (List) request.getFiles("pcFile");
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
                        commandMap.put("CMM_FLE_SORT", ++fileSort + oldFileSize);
                        
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "vendor", "image", "Y"));
                    }
                }
            }
            //모바일용 이미지
            List<CommonsMultipartFile> fileList2 = (List) request.getFiles("mobileFile");
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
                        
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "vendor", "image", "Y"));
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
    
    public int deleteSellerLookBook(Map<String, Object> commandMap) throws Exception
    {
        List<String> arrSellerRoomIdx = (List<String>) commandMap.get("arrsellerRoomIdxs");
        
        int result = 0;
        
        if(arrSellerRoomIdx!=null && arrSellerRoomIdx.size() > 0){
            for (int index = 0; index < arrSellerRoomIdx.size(); index++){
                String sellerRoomIdx = arrSellerRoomIdx.get(index);
                commandMap.put("CNT_MST_IDX", sellerRoomIdx);
                commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_LOOKBOOK);
                
                result = defaultDAO.update("SellerRoom.deleteSellerLookBook", commandMap);
            }
        }

        return result;
    }
    
    @Override
	public List<Map<String, Object>> selectTagDisplayCategoryList(Map<String, Object> commandMap) throws Exception 
    {
		return defaultDAO.selectList("SellerRoom.selectTagDisplayCategoryList", commandMap);
	}
    
	@Override
	public List<Map<String, Object>> selectTagDisplayCategoryCodeList(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.selectList("SellerRoom.selectTagDisplayCategoryCodeList", commandMap);
	}
    
	@Override
	public List<Map<String, Object>> selectTagDisplayList(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.selectList("SellerRoom.selectTagDisplayList", commandMap);
	}
	
	@Override
	public int insertTagDisplay(Map<String, Object> commandMap) throws Exception 
	{
		String idx = StringUtil.getString(commandMap.get("VDR_MST_IDX"), "");
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("TAG_BND_ID", idx);
		
		param.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_BRAND);
		
		defaultDAO.delete("SellerRoom.deleteTagDisplay", param);
		
		String[] TAG_MST_IDs = (String[])commandMap.get("TAG_MST_IDs");
		List<Map<String, Object>> tags = new ArrayList<Map<String, Object>>();
		for(int index = 0; index < TAG_MST_IDs.length; index++) {
			Map<String, Object> tag = new HashMap<String, Object>();
			tag.put("TAG_BND_ID", idx);
			tag.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_BRAND);
			tag.put("TAG_MST_ID", TAG_MST_IDs[index]);
			tags.add(tag);
		}
		Map<String, Object> insertParam = new HashMap<String, Object>();
		insertParam.put("arrTAG", tags);
		return defaultDAO.insertObject("SellerRoom.insertTagDisplay", insertParam);
	}
	
	public int selectSellerStoreListCount(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("SellerRoom.selectSellerStoreListCount", commandMap);
	}
	
	public List<Map<String, Object>> selectSellerStoreList(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("SellerRoom.selectSellerStoreList", commandMap);
	}
	
	public Map<String, Object> selectSellerStoreInfo(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.select("SellerRoom.selectSellerStoreInfo", commandMap);
	}
	
	public int insertSellerStore(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.insert("SellerRoom.insertSellerStore", commandMap);
	}
	
	public int updateSellerStore(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.update("SellerRoom.updateSellerStore", commandMap);
	}

	public int deleteSellerStore(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.delete("SellerRoom.deleteSellerStore", commandMap);
	}	
	
    public int searchSallerPickListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("SellerRoom.searchSallerPickListCount", commandMap);
    }
    
    
	public List<Map<String, Object>> searchSallerPickList(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("SellerRoom.searchSallerPickList", commandMap);
	}
	
	
	public int insertSellerPick(HttpServletRequest request,Map<String, Object> commandMap) throws Exception
	{
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);		
		int result = 0 ;
		// 입점상점 코드 획인  
		// STEP 1 . T_BNR_MST 의 IDX 취번
        // 시퀀스채번 
        int bnrPrdIdx =  defaultDAO.selectCount("SellerRoom.selectBannerDisplayIdx", commandMap);

        
        commandMap.put("BNR_MST_IDX"    , bnrPrdIdx);
        commandMap.put("BNR_MST_REG_IP" , request.getRemoteAddr());
        commandMap.put("BNR_MST_REG_ID" , admin.getADM_MST_ID());
        
		// STEP 2.  T_BNR_MST INSERT         
        result = defaultDAO.insert("SellerRoom.insertBannerDisplay", commandMap);		
		
		

		// STEP 3.  T_BNR_CNT INSERT -> 1개만 등록 처리 
        
        //System.out.println( "===================>CNT_MST_IDXs  :" + commandMap.get("CNT_MST_IDXs") );
        //System.out.println( "===================>CNT_MST_LIST  :" + commandMap.get("CNT_MST_LIST") );
        
        
        
    	if ( commandMap.get("CNT_MST_LIST")  instanceof String) {
    		
			commandMap.put("CNT_MST_IDX"     , commandMap.get("CNT_MST_LIST")  );
			commandMap.put("BNR_CNT_ORDER" , "1");
        	result = result + defaultDAO.insert("SellerRoom.insertBannerContent", commandMap);	
    		
    	}else if ( commandMap.get("CNT_MST_LIST")  instanceof String[]) {
    		
        	String[] prdMstCd = (String[])commandMap.get("CNT_MST_LIST");
        	if(prdMstCd != null && prdMstCd.length > 0){
        		for(int i=0;i<prdMstCd.length;i++) {
        			commandMap.put("CNT_MST_IDX"   , prdMstCd[i]);
        			commandMap.put("BNR_CNT_ORDER" , i + 1);
        			
                	result = result + defaultDAO.insert("SellerRoom.insertBannerContent", commandMap);    			
        		}              		
        	}
    	}
		
		
		return result;
	}
	    

	public List<Map<String, Object>> selectBannerCNTList(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("SellerRoom.selectBannerCntList", commandMap);
	}
	
	

	public int updateSellerPick(HttpServletRequest request,Map<String, Object> commandMap) throws Exception
	{
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);		
		int result = 0 ;

        commandMap.put("BNR_MST_UPD_IP" , request.getRemoteAddr());
        commandMap.put("BNR_MST_UPD_ID" , admin.getADM_MST_ID());
  
        
        result = defaultDAO.update("SellerRoom.updateBannerDisplay", commandMap);		
        result = result + defaultDAO.delete("SellerRoom.deleteBannerContent", commandMap);        

		// STEP 3.  T_BNR_CNT INSERT
    	if ( commandMap.get("CNT_MST_LIST")  instanceof String) {
    		
			commandMap.put("CNT_MST_IDX"     , commandMap.get("CNT_MST_LIST")  );
			commandMap.put("BNR_CNT_ORDER" , "1");
        	result = result + defaultDAO.insert("SellerRoom.insertBannerContent", commandMap);	
    		
    	}else if ( commandMap.get("CNT_MST_LIST")  instanceof String[]) {
    		
        	String[] prdMstCd = (String[])commandMap.get("CNT_MST_LIST");
        	if(prdMstCd != null && prdMstCd.length > 0){
        		for(int i=0;i<prdMstCd.length;i++) {
        			commandMap.put("CNT_MST_IDX"   , prdMstCd[i]);
        			commandMap.put("BNR_CNT_ORDER" , i + 1);
        			
                	result = result + defaultDAO.insert("SellerRoom.insertBannerContent", commandMap);    			
        		}              		
        	}
    	}
		
		
		return result;
	}

	
	public int selectSellerRommProductDisplayListCount(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("SellerRoom.selectSellerRommProductDisplayListCount", commandMap);
	}
	
	
	public List<Map<String, Object>> selectSellerRommProductDisplayList(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("SellerRoom.selectSellerRommProductDisplayList", commandMap);
	}
	
	public List<Map<String, Object>> selectProductCatCodeList(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("SellerRoom.selectProductCatCodeList", commandMap);
	}
	
	// 
    public int insertSellerProductDisplay(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        
        //상품코드/전시순서 등록
        String [] DSP_MST_IDX = (String[]) commandMap.get("arrDSP_MST_IDX");
        String [] DSP_MST_TXT = (String[]) commandMap.get("arrDSP_MST_TXTs");
        if ( DSP_MST_IDX != null ){
        	for(int i=0;i<DSP_MST_IDX.length;i++){
        		commandMap.put("PRD_MST_CD", DSP_MST_IDX[i]);
        		commandMap.put("DSP_MST_TXT", DSP_MST_TXT[i]);
        		
                //System.out.println(  "================> PRD_MST_CD"  + commandMap.get("PRD_MST_CD")  );
                //System.out.println(  "================> DSP_MST_TXT"  + commandMap.get("DSP_MST_TXT")  );        		
        		
        		//commandMap.put("DSP_MST_SRT" , i+1 ) ;
        		result+=defaultDAO.insert("SellerRoom.insertProductDisplaySellerRoom", commandMap);
        		if(result > 0){
        			//defaultDAO.insert("SellerRoom.updateProductDisplaySellerRoomSort", commandMap);
        		}
        	}
        }
        
        return result;
    }
    
    public int deleteSellerProductDisplay (HttpServletRequest request,Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.insert("SellerRoom.deleteProductDisplaySellerRoom", commandMap);
    } 
    
    
    public Map<String, Object> selectSellerProductInfo (Map<String, Object> commandMap) throws Exception
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        returnMap.put("row", defaultDAO.select("SellerRoom.selectSellerProductInfo", commandMap));
        return returnMap;
    }
	
    
	
    public int updateProductDisplaySellerOrder(HttpServletRequest request,Map<String,Object> commandMap) throws Exception
    {
  	  int result = 0;
      
	  	  String[] DSP_MST_IDX = (String[])commandMap.get("DSP_MST_IDX[]");
	  	  String[] DSP_MST_USE_YN = (String[])commandMap.get("DSP_MST_USE_YN[]");
	  	
	  	  
      if(DSP_MST_IDX!=null && DSP_MST_USE_YN!=null){
	          for(int i = 0 ; i < DSP_MST_IDX.length ; i++)
	          {
	        	  commandMap.put("DSP_MST_IDX", DSP_MST_IDX[i]);
	        	  
	              commandMap.put("DSP_MST_SRT", i+1);
	              
	              commandMap.put("DSP_MST_USE_YN", DSP_MST_USE_YN[i]);
	              
	              result = defaultDAO.update("SellerRoom.updateProductDisplaySellerOrder", commandMap);
	          }
      }
	                   
	        return result; 
    }
	
}
