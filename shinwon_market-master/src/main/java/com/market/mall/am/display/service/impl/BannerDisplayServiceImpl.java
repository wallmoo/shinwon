package com.market.mall.am.display.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.BannerDisplayService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
/**
 * @PackageName: com.market.mall.am.display.service.impl
 * @FileName : BannerDisplayServiceImpl.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시배너관리를 처리하는 Service Implement Class
 * @author jangsin
 */
@Service("bannerDisplayService")
public class BannerDisplayServiceImpl implements BannerDisplayService{

    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
    * <pre>
    * 1. MethodName : selectBannerDisplayCodeList
    * 2. ClassName  : BannerDisplayServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 배너 코드 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBannerDisplayCodeList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("BannerDisplay.selectSubCodeList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectBannerDisplayListCount
    * 2. ClassName  : BannerDisplayServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 목록 갯수 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectBannerDisplayListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("BannerDisplay.selectBannerDisplayListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectBannerDisplayList
    * 2. ClassName  : BannerDisplayServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBannerDisplayList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("BannerDisplay.selectBannerDisplayList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectBannerDisplayInfo
    * 2. ClassName  : BannerDisplayServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 상세정보 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectBannerDisplayInfo (Map<String, Object> commandMap) throws Exception
    {
    	Map<String, Object> returnMap = new HashMap<String, Object>();
	    commandMap.put("CMM_FLE_TB_NM", "T_BNR_MST");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BNR_MST_IDX"), ""));
	    returnMap.put("row", defaultDAO.select("BannerDisplay.selectBannerDisplayInfo", commandMap));
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        return returnMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : insertBannerDisplay
    * 2. ClassName  : BannerDisplayServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 등록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int insertBannerDisplay (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        logger.info("========================= 배너관리 기본정보 등록 시작 ============================================");
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BNR_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("BNR_MST_REG_ID", admin.getADM_MST_ID());
        
        if(!StringUtil.getString(commandMap.get("BNR_MST_HEX_CD")).equals("")){
        	commandMap.put("BNR_MST_HEX_CD", "#"+commandMap.get("BNR_MST_HEX_CD"));
        }
        
        // 시퀀스채번 
        int bnrPrdIdx =  defaultDAO.selectCount("BannerDisplay.selectBannerDisplayIndex", commandMap);
        
        
        commandMap.put("BNR_MST_IDX"    , bnrPrdIdx);
        // 배너관리 등록 : 시퀸스 번호를 채번하여, bnr_mst bnr_prd 파일 공통 테이블에도 사용한다. 
        result = defaultDAO.insert("BannerDisplay.insertBannerDisplaySeq", commandMap);
        //result = defaultDAO.insert("BannerDisplay.insertBannerDisplay", commandMap);
        
        //해당 전시배너에 속한 배너의 순번 수정
        
        /*
        System.out.println("=================result=================" + result );
        System.out.println("=================bnrPrdIdx=================" + bnrPrdIdx );  
        System.out.println("=================PRD_MST_CDs=================" + commandMap.get("PRD_MST_CD_LIST") );
        */
        
        
        if(result > 0){
        	result = defaultDAO.insert("BannerDisplay.updateBannerDisplaySort", commandMap);
        	
        	//배너 상품 테이블 INSERT  insertBannerProduct
        	//   #{BNR_PRD_MST_CD}     ,
		    //   #{BNR_PRD_REF_USE_YN} 
        	
        	
        	if ( commandMap.get("PRD_MST_CD_LIST")  instanceof String) {
        		
    			commandMap.put("BNR_PRD_MST_CD"     , commandMap.get("PRD_MST_CD_LIST")  );
    			commandMap.put("BNR_PRD_REF_USE_YN" , "N");
            	result = result + defaultDAO.insert("BannerDisplay.insertBannerProduct", commandMap);	
        		
        	}else if ( commandMap.get("PRD_MST_CD_LIST")  instanceof String[]) {
        		
            	String[] prdMstCd = (String[])commandMap.get("PRD_MST_CD_LIST");
            	if(prdMstCd != null && prdMstCd.length > 0){
            		for(int i=0;i<prdMstCd.length;i++) {
            			commandMap.put("BNR_PRD_MST_CD"     , prdMstCd[i]);
            			commandMap.put("BNR_PRD_REF_USE_YN" , "N");
                    	result = result + defaultDAO.insert("BannerDisplay.insertBannerProduct", commandMap);    			
            		}              		
            	}
        	}
        }
        
        if(result > 0)
        {
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                logger.info("========================= 첨부파일 등록 시작 ================================");
                if(result > 0)
                {
                	int fileSort = 0;
                	for(int i = 0;i < fileList.size();i++)
		            {
                		CommonsMultipartFile file = fileList.get(i);
                		if(!file.isEmpty())
                        {
                            commandMap.put("CMM_FLE_TB_NM", "T_BNR_MST");
                            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BNR_MST_IDX"), ""));
                            commandMap.put("CMM_FLE_SORT", ++fileSort);
                            commandMap.put("CMN_FLE_ALT_TXT", commandMap.get("CMN_FLE_ALT_TXT"));
                            commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                            
                            // 파일 등록 및 파일 업로드
                            result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "display", "image", "Y"));
                        }
		            }
                	return result;
                }
                else
                {
                    logger.info("============================================================");
                    logger.info("Message : 관리자 > 배너관리 > 상세정보 등록 오류");
                    logger.info("============================================================");
                    throw new TransactionException("배너 관리 등록 중 오류가 발생하였습니다.");
                }
            }
            else
            {
            	/*이미지 첨부 안해도 등록되도록 수정...2015.01.19*/
            	return result;
                /*logger.info("============================================================");
                logger.info("Message : 관리자 > 배너관리 > 첨부파일 누락");
                logger.info("============================================================");
                throw new TransactionException("배너 관리 등록 중 오류가 발생하였습니다.");*/
            }
        }
        else
        {
            logger.info("============================================================");
            logger.info("Message : 관리자 > 배너관리 > 기본정보 등록 오류");
            logger.info("============================================================");
            throw new TransactionException("배너 관리 등록 중 오류가 발생하였습니다.");
        }
    }
    
    /**
    * <pre>
    * 1. MethodName : updateBannerDisplay
    * 2. ClassName  : BannerDisplayServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 수정 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int updateBannerDisplay (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0;
        String[] arrCMM_FLE_IDX = request.getParameterValues("CMM_FLE_IDX");	//기존파일
        String removeFileIdx = "";
        String CMM_FLE_SAVE_PATH = "";
        
        //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
        
        commandMap.put("CMM_FLE_TB_NM", "T_BNR_MST");
        commandMap.put("CMM_FLE_TB_PK", commandMap.get("BNR_MST_IDX"));
        commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
        
        if(arrCMM_FLE_IDX != null){	//파일삭제 새로운 파일추가
        	for(int i=0; i< arrCMM_FLE_IDX.length; i++)
        	{        		
        		removeFileIdx = arrCMM_FLE_IDX[i];
        		commandMap.put("CMM_FLE_IDX", removeFileIdx);
        		
	        	if(!("").equals(arrCMM_FLE_IDX)){	        		
	        		//파일 상세 정보
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
        	List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
	        if(fileList.size() > 0)
	        {
	            int fileSort = 0;

	            for(int i = 0;i < fileList.size();i++)
	            {
	                CommonsMultipartFile file = fileList.get(i);
	                
	                if(!file.isEmpty())
	                {
	                    commandMap.put("CMM_FLE_SORT", ++fileSort);
	                    commandMap.put("CMN_FLE_ALT_TXT", commandMap.get("CMN_FLE_ALT_TXT"));
	                    // 파일 등록 및 파일 업로드
	                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "display", "image", "Y"));
	                }
	            }
	        }
        }else{
        	//파일 변경 없이 대체 텍스트 수정
        	if(commandMap.get("CMN_FLE_ALT_TXT_IDX") != null && StringUtil.getInt(commandMap.get("CMN_FLE_ALT_TXT_IDX"),0) > 0){
        		commandMap.put("CMN_FLE_ALT_TXT_OLD", commandMap.get("CMN_FLE_ALT_TXT"));
        		defaultDAO.update("Common.updateCommonFileAltText", commandMap);
        	}
        }
        
        logger.info("========================= 기본정보 수정 시작 ============================================");
        commandMap.put("BNR_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("BNR_MST_UPD_ID", admin.getADM_MST_ID());
        if(!StringUtil.getString(commandMap.get("BNR_MST_HEX_CD")).equals("")){
        	commandMap.put("BNR_MST_HEX_CD", "#"+commandMap.get("BNR_MST_HEX_CD"));
        }
        // 기본정보 수정
        result = defaultDAO.update("BannerDisplay.updateBannerDisplay", commandMap);

        
        
        int result2 = defaultDAO.update("BannerDisplay.deleteBannerProduct", commandMap);
        
        
    	if ( commandMap.get("PRD_MST_CD_LIST")  instanceof String) {
    		
			commandMap.put("BNR_PRD_MST_CD"     , commandMap.get("PRD_MST_CD_LIST")  );
			commandMap.put("BNR_PRD_REF_USE_YN" , "N");
			result2 = result2 + defaultDAO.insert("BannerDisplay.insertBannerProduct", commandMap);	
    		
    	}else if ( commandMap.get("PRD_MST_CD_LIST")  instanceof String[]) {
    		
        	String[] prdMstCd = (String[])commandMap.get("PRD_MST_CD_LIST");
        	if(prdMstCd != null && prdMstCd.length > 0){
        		for(int i=0;i<prdMstCd.length;i++) {
        			commandMap.put("BNR_PRD_MST_CD"     , prdMstCd[i]);
        			commandMap.put("BNR_PRD_REF_USE_YN" , "N");
        			result2 = result2 + defaultDAO.insert("BannerDisplay.insertBannerProduct", commandMap);    			
        		}              		
        	}
    	}        
        

        

        
        if(result > 0)
        {
            //파일 삭제한 경우에만..
            if(tempRemoveList != null){
            	for(int i=0;i<tempRemoveList.size();i++){
            		fileUpload.delete(tempRemoveList.get(i));
            	}
            }
            return result;
        }
        else
        {
            logger.info("============================================================");
            logger.info("Message : 관리자 > 배너관리 > 기본정보 수정 오류");
            logger.info("============================================================");
            throw new TransactionException("배너 관리 수정 중 오류가 발생하였습니다.");
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : selectBnrCatCodeList
     * 2. ClassName  : BannerDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 상단 제목 표시
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectBnrCatCodeList (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectList("BannerDisplay.selectBnrCatCodeList",commandMap);
     }
     
     
     
     @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectBannerProductList (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectList("BannerDisplay.selectBannerProductList",commandMap);
     }

     
     

    /**
     * <pre>
     * 1. MethodName : updateBannerDisplaySortArray
     * 2. ClassName  : BannerDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 공통코드 순서 정렬 
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 3.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      public int updateBannerDisplaySortArray (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
      {
          int result = 0;
          
    	  String[] BNR_MST_IDX = (String[])commandMap.get("BNR_MST_IDX[]");
          if(BNR_MST_IDX!=null){
	          for(int i = 0 ; i < BNR_MST_IDX.length ; i++)
	          {
	        	  commandMap.put("BNR_MST_IDX", BNR_MST_IDX[i]);
	              commandMap.put("BNR_MST_SRT", i+1);
	              result = defaultDAO.update("BannerDisplay.updateBannerDisplaySortArray", commandMap);
	          }
          }
                     
          return result; 
      }
      
      /**
    * <pre>
    * 1. MethodName : deleteBannerDisplay
    * 2. ClassName : BannerDisplayServiceImpl.java
    * 3. Comment : 배너삭제
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 3.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int deleteBannerDisplay (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
	  {
	      int result = 0;
	      
		  result = defaultDAO.update("BannerDisplay.deleteBannerDisplay", commandMap);
		  
	      return result; 
	  }

	@Override
	public int deleteBannerDisplayBatch(HttpServletRequest request, Map<String, Object> commandMap) 
	{
		return defaultDAO.deleteNoException("BannerDisplay.deleteBannerDisplayBatch", commandMap);
	}

	@Override
	public int updateBannerDisplayUseYNBatch(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
	{	
		List<Map<String, Object>> bannerList = (List<Map<String, Object>>)commandMap.get("bannerList");
		if(bannerList == null || bannerList.size() < 1) {
			return 0;
		}
		
		int result = 0;
		for(int index = 0; index < bannerList.size(); index++) {
			result = defaultDAO.update("BannerDisplay.updateBannerDisplaySortArray", bannerList.get(index));    
        }
		return result;
		
	}
	
    public int deleteBannerCNT (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
	  {
	      int result = 0;
	      
		  result = defaultDAO.delete("BannerDisplay.deleteBannerContent", commandMap);
		  
	      return result; 
	  }
    
    public int deleteBannerCNTBatch (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
	  {
	      int result = 0;
	      
		  result = defaultDAO.delete("BannerDisplay.deleteBannerContentDisplayBatch", commandMap);
		  
	      return result; 
	  }    
    
}
