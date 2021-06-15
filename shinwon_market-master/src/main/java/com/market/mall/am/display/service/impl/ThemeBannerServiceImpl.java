package com.market.mall.am.display.service.impl;

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

import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.ThemeBannerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.tag.TAG_MODEL;

/**
 * @PackageName: com.market.mall.am.display.service.impl
 * @FileName : ThemeBannerServiceImpl.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시배너관리를 처리하는 Service Implement Class
 * @author jangsin
 */
@Service("themeBannerService")
public class ThemeBannerServiceImpl implements ThemeBannerService{

    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
    * <pre>
    * 1. MethodName : selectThemeBannerCodeList
    * 2. ClassName  : ThemeBannerServiceImpl.java
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
    public List<Map<String, Object>> selectThemeBannerCodeList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("ThemeBanner.selectSubCodeList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectThemeBannerListCount
    * 2. ClassName  : ThemeBannerServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 목록 갯수 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectThemeBannerListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("ThemeBanner.selectThemeBannerListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectThemeBannerList
    * 2. ClassName  : ThemeBannerServiceImpl.java
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
    public List<Map<String, Object>> selectThemeBannerList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("ThemeBanner.selectThemeBannerList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectThemeBannerInfo
    * 2. ClassName  : ThemeBannerServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 상세정보 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectThemeBannerInfo (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.select("ThemeBanner.selectThemeBannerInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertThemeBanner
    * 2. ClassName  : ThemeBannerServiceImpl.java
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
    public int insertThemeBanner (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        logger.info("========================= 배너관리 기본정보 등록 시작 ============================================");
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BNR_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("BNR_MST_REG_ID", admin.getADM_MST_ID());
        
        // 배너관리 등록
        result = defaultDAO.insert("ThemeBanner.insertThemeBanner", commandMap);
        
        int bannerIdx = StringUtil.getInt(commandMap.get("CMN_COM_IDX"));
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        //탑 셀러인 경우만 태그, 대표 상품 등록
        if( bannerIdx == Code.PC_MAIN_TOP_SELLER_BANNER_UP || bannerIdx == Code.PC_MAIN_TOP_SELLER_BANNER_DOWN){
        	
        	
            String tagList = StringUtil.getString(commandMap.get("tagList"),"");
            List<Map<String,Object>> arrTagList = mapper.readValue(tagList,typeRef);
            
            if(arrTagList != null){
                for(int index = 0; index < arrTagList.size(); index++){
                    Map<String, Object> paramMap = new HashMap<String, Object>();
                    paramMap.put("TAG_BND_STATUS", StringUtil.getString(commandMap.get("TAG_BND_STATUS"), "USE"));
                    paramMap.put(TAG_MODEL.TAG_MST_ID, StringUtil.getString(arrTagList.get(index).get("TAG_MST_ID"),""));
                    paramMap.put(TAG_MODEL.TAG_BND_ID, StringUtil.getString(commandMap.get("BNR_MST_IDX"),""));
                    paramMap.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_TOP_SELLER);
                    
                    //탑 셀러 태그 등록
                    defaultDAO.insert("PcTag.insertTagBind", paramMap);
                }
            }
            
            //대표상품 등록
            String jsonList = StringUtil.getString(commandMap.get("productList"),"");
            List<Map<String,Object>> bannerProuductList = mapper.readValue(jsonList,typeRef);

            for(int index=0; index < bannerProuductList.size(); index ++){
                String prdCD = StringUtil.getString(bannerProuductList.get(index).get("BNR_PRD_MST_CD"),"");
                commandMap.put("BNR_PRD_MST_CD", prdCD);
                
                String refUseYN = StringUtil.getString(bannerProuductList.get(index).get("BNR_PRD_REF_USE_YN"),"Y");
                commandMap.put("BNR_PRD_REF_USE_YN", refUseYN);
                
                // 대표 상품 등록
                defaultDAO.insert("ThemeBanner.insertProductBanner", commandMap);
            }
            
        }
        
        //상품전시인 경우만 카테고리 등록
        if(bannerIdx == Code.PC_MAIN_PRODUCT_BANNER){
        	String jsonList = StringUtil.getString(commandMap.get("categoryList"),"");
            List<Map<String,Object>> bannerCategoryList = mapper.readValue(jsonList,typeRef);
            String [] cateNum = StringUtil.getArray(commandMap, "categoryList");
            for(int index = 0; index < bannerCategoryList.size(); index++)
            {
                commandMap.put("BNR_MST_IDX", StringUtil.getString(commandMap.get("BNR_MST_IDX"), ""));
                commandMap.put("PRD_CTG_IDX", StringUtil.getString(bannerCategoryList.get(index).get("PRD_CTG_IDX"),""));
                commandMap.put("BNR_CTG_ORDER", StringUtil.getString(bannerCategoryList.get(index).get("BNR_CTG_ORDER"),""));
                
                defaultDAO.insert("ThemeBanner.insertCategoryBanner", commandMap);
            }
        }
        
        
        if(result > 0)
        {
        	logger.info("========================= 배너관리 상세정보 등록 시작 ================================");
        	// 배너정보 등록
            //result = defaultDAO.insert("ThemeBanner.insertThemeBannerDetail", commandMap);
            
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                logger.info("========================= 첨부파일 등록 시작 ================================");
                if(result > 0)
                {
                    CommonsMultipartFile file = fileList.get(0);
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_TB_NM", "T_BNR_MST");
                        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BNR_MST_IDX"), ""));
                        commandMap.put("CMM_FLE_SORT", 1);
                        commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                        
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "display", "image", "Y"));
                        if(result > 0)
                        {
                            return result;
                        }
                        else
                        {
                            logger.info("============================================================");
                            logger.info("Message : 관리자 > 배너관리 > 첨부파일 등록 오류");
                            logger.info("============================================================");
                            throw new TransactionException("배너 관리 등록 중 오류가 발생하였습니다.");
                        }
                    }
                    else
                    {
                        logger.info("============================================================");
                        logger.info("Message : 관리자 > 배너관리 > 첨부파일 누락");
                        logger.info("============================================================");
                        throw new TransactionException("배너 관리 등록 중 오류가 발생하였습니다.");
                    }
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
    * 1. MethodName : updateThemeBanner
    * 2. ClassName  : ThemeBannerServiceImpl.java
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
    public int updateThemeBanner (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String CMM_FLE_IDX = StringUtil.getString(commandMap.get("CMM_FLE_IDX"), "");
        int bannerIdx = StringUtil.getInt(commandMap.get("CMN_COM_IDX"));
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        //탑 셀러일때 태그, 대표 상품 수정
        if( bannerIdx == Code.PC_MAIN_TOP_SELLER_BANNER_UP || bannerIdx == Code.PC_MAIN_TOP_SELLER_BANNER_DOWN){
            commandMap.put("TAG_BND_ID", commandMap.get("BNR_MST_IDX"));
            commandMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_TOP_SELLER);
            
        	System.out.println("[TAG_BND_ID]===============================================>>>>>>>>>>>>>>>>>>>" + commandMap.get("BNR_MST_IDX"));
        	System.out.println("[TAG_BND_TYPE]===============================================>>>>>>>>>>>>>>>>>>>" + CONTENTS_TYPE_CODE.TYPE_TOP_SELLER);        	
            
            
            //태그 수정
            if(defaultDAO.delete("PcTag.deleteTagBind", commandMap) > -1){
                String tagList = StringUtil.getString(commandMap.get("tagList"),"");
                List<Map<String,Object>> arrTagList = mapper.readValue(tagList,typeRef);
	            if(arrTagList != null){
	                for(int index = 0; index < arrTagList.size(); index++){
	                    Map<String, Object> paramMap = new HashMap<String, Object>();
	                    paramMap.put("TAG_BND_STATUS", StringUtil.getString(commandMap.get("TAG_BND_STATUS"), "USE"));
	                    paramMap.put(TAG_MODEL.TAG_MST_ID, StringUtil.getString(arrTagList.get(index).get("TAG_MST_ID"),""));
	                    paramMap.put(TAG_MODEL.TAG_BND_ID, StringUtil.getString(commandMap.get("BNR_MST_IDX"),""));
	                    paramMap.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_TOP_SELLER);
	                    
	                    //탑 셀러 태그 등록
	                    defaultDAO.insert("PcTag.insertTagBind", paramMap);
	                }
	            }
            }
            //대표 상품 수정
            if(defaultDAO.delete("ThemeBanner.deleteProductBanner", commandMap) > -1){
            	 String jsonList = StringUtil.getString(commandMap.get("productList"),"");
                 List<Map<String,Object>> bannerProuductList = mapper.readValue(jsonList,typeRef);

                 for(int index=0; index < bannerProuductList.size(); index ++){
                     String prdCD = StringUtil.getString(bannerProuductList.get(index).get("BNR_PRD_MST_CD"),"");
                     commandMap.put("BNR_PRD_MST_CD", prdCD);
                     
                     String refUseYN = StringUtil.getString(bannerProuductList.get(index).get("BNR_PRD_REF_USE_YN"),"Y");
                     commandMap.put("BNR_PRD_REF_USE_YN", refUseYN);
                     
                     // 대표 상품 등록
                     defaultDAO.insert("ThemeBanner.insertProductBanner", commandMap);
                 }
            }
        }
        
        
            
        //상품전시배너일때 카테고리 수정
        if(bannerIdx == Code.PC_MAIN_PRODUCT_BANNER){
            if(defaultDAO.delete("ThemeBanner.deleteBannerCategory", commandMap) > -1){
                 String jsonList = StringUtil.getString(commandMap.get("categoryList"),"");
                 List<Map<String,Object>> bannerCategoryList = mapper.readValue(jsonList,typeRef);
                
                 for(int index = 0; index < bannerCategoryList.size();index++){
                    commandMap.put("BNR_MST_IDX", StringUtil.getString(commandMap.get("BNR_MST_IDX"), ""));
                    commandMap.put("PRD_CTG_IDX", StringUtil.getString(bannerCategoryList.get(index).get("PRD_CTG_IDX"),""));
                    commandMap.put("BNR_CTG_ORDER", StringUtil.getString(bannerCategoryList.get(index).get("BNR_CTG_ORDER"),""));
                    defaultDAO.insert("ThemeBanner.insertCategoryBanner", commandMap);
                 }
            }
        }

        if(!"".equals(CMM_FLE_IDX))
        {
            logger.info("=========================  첨부파일 삭제 시작 ================================");
            Map<String, Object> row = (Map<String, Object>) defaultDAO.select("Common.selectCommonFileInfo", commandMap);
            String CMM_FLE_SAVE_PATH = StringUtil.getString(row.get("CMM_FLE_SAVE_PATH"), "");
            if(row != null && !"".equals(CMM_FLE_SAVE_PATH))
            {
                // 파일 DB 수정
                if(defaultDAO.update("Common.deleteCommonFile", commandMap) > 0)
                {
                    // 물리적 파일 삭제
                    fileUpload.delete(CMM_FLE_SAVE_PATH);
                }
                else
                {
                    logger.info("===========================================================");
                    logger.info("Message : 관리자 > 배너관리 > 첨부파일 삭제 오류");
                    logger.info("===========================================================");
                    throw new TransactionException("배너 관리 수정 중 오류가 발생하였습니다.");
                }
            }
            
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                logger.info("========================= 첨부파일 등록 시작 ================================");
                CommonsMultipartFile file = fileList.get(0);
                if(!file.isEmpty())
                {
                    commandMap.put("CMM_FLE_TB_NM", "T_BNR_MST");
                    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BNR_MST_IDX"), ""));
                    commandMap.put("CMM_FLE_TB_TYPE", "I");
                    commandMap.put("CMM_FLE_SORT", 1);
                    commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                    
                    // 파일 DB 등록 및 파일 업로드
                    if(defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "display", "image", "Y")) < 0)
                    {
                        logger.info("===========================================================");
                        logger.info("Message : 관리자 > 배너관리 > 첨부파일 등록 오류");
                        logger.info("===========================================================");
                        throw new TransactionException("배너 관리 수정 중 오류가 발생하였습니다.");
                    }
                }
            }
        }
        else
        {
            String CMN_FLE_ALT_TXT_IDX = StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_IDX"), "");
            if(!"".equals(CMN_FLE_ALT_TXT_IDX))
            {
                logger.info("========================= 첨부파일 대체 텍스트 수정 시작 ================================");
                commandMap.put("CMN_FLE_ALT_TXT_OLD", commandMap.get("CMN_FLE_ALT_TXT"));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", commandMap.get("CMN_FLE_ALT_TXT_IDX"));
                if(defaultDAO.update("Common.updateCommonFileAltText", commandMap) < 0)
                {
                    logger.info("============================================================");
                    logger.info("Message : 관리자 > 배너관리 > 첨부파일 대체 텍스트 수정 오류");
                    logger.info("============================================================");
                    throw new TransactionException("배너 관리 수정 중 오류가 발생하였습니다.");
                }
            }
        }
        
        logger.info("========================= 기본정보 수정 시작 ============================================");
        commandMap.put("BNR_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("BNR_MST_UPD_ID", admin.getADM_MST_ID());
        
        
        
        // 기본정보 수정
        int result = defaultDAO.update("ThemeBanner.updateThemeBanner", commandMap);
        
        if(result > 0)
        {
            logger.info("========================= 배너 상세정보 수정 시작 ================================");
            // 기존 배너정보 수정
            //result = defaultDAO.update("ThemeBanner.updateThemeBannerDetail", commandMap);
            if(result > 0)
            {
                return result;
            }
            else
            {
                logger.info("============================================================");
                logger.info("Message : 관리자 > 배너관리 > 상세정보 수정 오류");
                logger.info("============================================================");
                throw new TransactionException("배너 관리 수정 중 오류가 발생하였습니다.");
            }
        }
        else
        {
            logger.info("============================================================");
            logger.info("Message : 관리자 > 배너관리 > 기본정보 수정 오류");
            logger.info("============================================================");
            throw new TransactionException("배너 관리 수정 중 오류가 발생하였습니다.");
        }
        

    }
    
    public int updateBannerStatus (Map<String, Object> commandMap) throws Exception {
        return -1;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectBnrCatCodeList
     * 2. ClassName  : ThemeBannerServiceImpl.java
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
         return defaultDAO.selectList("ThemeBanner.selectBnrCatCodeList",commandMap);
     }

    /**
     * <pre>
     * 1. MethodName : updateThemeBannerSortArray
     * 2. ClassName  : ThemeBannerServiceImpl.java
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
      public int updateThemeBannerSortArray (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
      {
          int result = 0;
          
    	  String ROLLING_TERM_SEC = (String)commandMap.get("ROLLING_TERM_SEC");
    	  if(!StringUtil.isEmpty(ROLLING_TERM_SEC)){
    		  result = defaultDAO.update("ThemeBanner.updateThemeBannerRollingSec", commandMap);
    	  }
    	  
    	  String[] BNR_DTL_IDX = (String[])commandMap.get("BNR_DTL_IDX[]");
          if(BNR_DTL_IDX!=null){
	          for(int i = 0 ; i < BNR_DTL_IDX.length ; i++)
	          {
	        	  commandMap.put("BNR_DTL_IDX", BNR_DTL_IDX[i]);
	              commandMap.put("BNR_DTL_ORDER", i+1);
	              result = defaultDAO.update("ThemeBanner.updateThemeBannerSortArray", commandMap);
	          }
          }
                     
          return result; 
      }
      
      public List<Map<String, Object>> selectThemeBannerCategory (Map<String, Object> commandMap) throws Exception{
          int result = 0;
          
          // 상품 카테고리 정보 리스트
          Map<String, Object> paramMap = new HashMap<String, Object>();
          paramMap.put("BNR_MST_IDX", commandMap.get("BNR_MST_IDX"));
          paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));
          
          return defaultDAO.selectList("ThemeBanner.selectThemeBannerCategory", paramMap);
      }
      
      public int deleteThemeBanner (Map<String, Object> commandMap) throws Exception{
    	  int bannerIdx = StringUtil.getInt(commandMap.get("CMN_COM_IDX"));
          ObjectMapper mapper = new ObjectMapper();
          TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
    	  String jsonList = StringUtil.getString(commandMap.get("themeBannerList"),"");
          List<Map<String,Object>> bannerList = mapper.readValue(jsonList,typeRef);
          for(int index = 0; index < bannerList.size(); index++)
          {
              commandMap.put("BNR_MST_IDX", StringUtil.getString(bannerList.get(index).get("BNR_MST_IDX"),""));

        	  defaultDAO.delete("ThemeBanner.deleteThemeBanner", commandMap);
        	  if(bannerIdx == Code.PC_MAIN_PRODUCT_BANNER)
        		  defaultDAO.delete("ThemeBanner.deleteBannerCategory", commandMap);
          }
    	  return 1;
      }
      public int updateThemeBannerStatus (Map<String, Object> commandMap) throws Exception{
          ObjectMapper mapper = new ObjectMapper();
          TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
          
    	  String jsonList = StringUtil.getString(commandMap.get("themeBannerList"),"");
          List<Map<String,Object>> bannerList = mapper.readValue(jsonList,typeRef);
          for(int index = 0; index < bannerList.size(); index++)
          {
              commandMap.put("BNR_MST_IDX", StringUtil.getString(bannerList.get(index).get("BNR_MST_IDX"),""));
              commandMap.put("BNR_MST_USE_YN", StringUtil.getString(bannerList.get(index).get("BNR_MST_USE_YN"),""));
        	  defaultDAO.update("ThemeBanner.updateThemeBannerStatus", commandMap);
          }
    	  return 1;
      }
      public List<Map<String, Object>> selectProductBanner (Map<String, Object> commandMap) throws Exception{
    	  return defaultDAO.selectList("ThemeBanner.selectProductBanner",commandMap);
      }
}
