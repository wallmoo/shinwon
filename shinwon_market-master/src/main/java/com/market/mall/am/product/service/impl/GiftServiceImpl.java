package com.market.mall.am.product.service.impl;

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
import com.market.mall.am.product.service.GiftService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.product.service.impl
 * @FileName : GiftServiceImpl.java
 * @Date : 2015. 5. 3.
 * @프로그램 설명 : 관리자 > 상품관리 > 사은품관리를 처리하는 Service Implement Class
 * @author jesong
 */
@Service("giftService")
public class GiftServiceImpl implements GiftService{
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

      
    /**
    * <pre>
    * 1. MethodName : selectGiftListCount
    * 2. ClassName  : GiftServiceImpl.java
    * 3. Comment    : 관리자 > 상품관리 > 사은품관리 목록 갯수 
    * 4. 작성자       : jesong
    * 5. 작성일       : 2015. 5. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectGiftListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Gift.selectGiftListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectGiftList
    * 2. ClassName  : GiftServiceImpl.java
    * 3. Comment    :  관리자 > 상품관리 > 사은품관리 목록 
    * 4. 작성자       : jesong
    * 5. 작성일       : 2015. 5. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectGiftList (Map<String, Object> commandMap) throws Exception
    {
    	
        return defaultDAO.selectList("Gift.selectGiftList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectGiftInfo
    * 2. ClassName  : GiftServiceImpl.java
    * 3. Comment    : 관리자 > 상품관리 > 사은품관리 상세 정보 
    * 4. 작성자       : jesong
    * 5. 작성일       : 2015. 5. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectGiftInfo (Map<String, Object> commandMap) throws Exception
    {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
    	// 사은품관리 상세 정보 
    	Map<String, Object> giftInfo = defaultDAO.select("Gift.selectGiftInfo",commandMap);
    
    	// 연관 상품 리스트 
    	List<Map<String, Object>> productList = defaultDAO.selectList("Gift.selectProductList",commandMap);
    	
    	// return 
    	resultMap.put("giftInfo", giftInfo);
    	resultMap.put("productList", productList);
    	resultMap.put("commandMap", commandMap);
    	
        return resultMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : insertGift
    * 2. ClassName  : GiftServiceImpl.java
    * 3. Comment    : 관리자 > 상품관리 > 사은품관리 등록 
    * 4. 작성자       : jesong
    * 5. 작성일       : 2015. 5. 3.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public int insertGift (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
    	int result = 0;
    	
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
        //기본값 설정 - 등록자 ID, IP
        commandMap.put("GFT_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("GFT_MST_REG_ID", admin.getADM_MST_ID());
        
        // 사은품 정보 등록 
        result = defaultDAO.insert("Gift.insertGift", commandMap);
        
        if(result > 0){
        	
        	
        
	        // 사은품에 관련된 적용상품 삭제 
			defaultDAO.delete("Gift.deleteProduct",commandMap);
	        // 적용상품 등록 
	        String [] arrPRD_MST_CD = (String[]) commandMap.get("arrPRD_MST_CD");
	        if(arrPRD_MST_CD != null)
	        {
	        	for ( String PRD_MST_CD : arrPRD_MST_CD )
	        	{
	        		commandMap.put("PRD_PRD_MST_CD", PRD_MST_CD);
	        		result = defaultDAO.insert("Gift.insertProduct",commandMap);
	        	}
	        }
	        
	        //파일첨부
        	if(commandMap.get("GFT_MST_PRD_TYPE").equals("F")){
        		@SuppressWarnings("unchecked")
    			List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
                if(fileList.size() > 0)
                {
                	CommonsMultipartFile file = fileList.get(0);
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_TB_NM", "T_GFT_MST");
                        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("GFT_MST_IDX"), ""));
                        commandMap.put("CMM_FLE_SORT", 1);
                        commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                        
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "gift", "image", "Y"));
                    }
                }
        		
        	}
        }
        
        return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateGift
    * 2. ClassName  : GiftServiceImpl.java
    * 3. Comment    : 관리자 > 상품관리 > 사은품관리 수정 
    * 4. 작성자       : jesong
    * 5. 작성일       : 2015. 5. 3.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "unchecked", "rawtypes" })
	public int updateGift (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {

    	int result = 0 ;
    	String CMM_FLE_IDX = StringUtil.getString(commandMap.get("CMM_FLE_IDX"), "");
    	String GFT_MST_PRD_TYPE = StringUtil.getString(commandMap.get("GFT_MST_PRD_TYPE"), "");
    	String CMN_FLE_ALT_TXT_IDX = StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_IDX"), "");
    	
        Admin admin = SessionsAdmin.getSessionAdmin(request); 
    	//기본값 설정 - 수정자 ID, IP	
        commandMap.put("GFT_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("GFT_MST_UPD_ID", admin.getADM_MST_ID());
        
        // 사은품 정보 수정 
        result = defaultDAO.update("Gift.updateGift", commandMap);
        
        // 사은품에 관련된 적용상품 삭제 
		defaultDAO.delete("Gift.deleteProduct",commandMap);
		
        // 적용상품 등록 
        String [] arrPRD_MST_CD = (String[]) commandMap.get("arrPRD_MST_CD");
        if(arrPRD_MST_CD != null)
        {
        	for ( String PRD_MST_CD : arrPRD_MST_CD )
        	{
        		commandMap.put("PRD_PRD_MST_CD", PRD_MST_CD);
        		result = defaultDAO.insert("Gift.insertProduct",commandMap);
        	}
        }
        
        if(result > 0){
        	//첨부파일 삭제 혹은 상품선택 등록 일 때 파일 삭제
        	if(!"".equals(CMM_FLE_IDX) || ("P".equals(GFT_MST_PRD_TYPE) && !"".equals(CMN_FLE_ALT_TXT_IDX))){
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
                        throw new TransactionException("사은품관리 수정 중 오류가 발생하였습니다.");
                    }
                }
        	}
        	if(("F".equals(GFT_MST_PRD_TYPE) && !"".equals(CMM_FLE_IDX)) || "F".equals(GFT_MST_PRD_TYPE))
            {
                
                
                List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
                if(fileList.size() > 0)
                {
                    logger.info("========================= 첨부파일 등록 시작 ================================");
                    CommonsMultipartFile file = fileList.get(0);
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_TB_NM", "T_GFT_MST");
                        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("GFT_MST_IDX"), ""));
                        commandMap.put("CMM_FLE_TB_TYPE", "I");
                        commandMap.put("CMM_FLE_SORT", 1);
                        commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                        commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_OLD"), ""));
                        
                        // 파일 DB 등록 및 파일 업로드
                        if(defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "gift", "image", "Y")) < 0)
                        {
                            throw new TransactionException("사은품관리 수정 중 오류가 발생하였습니다.");
                        }
                    }
                }
            }
            else if("F".equals(GFT_MST_PRD_TYPE) && "".equals(CMM_FLE_IDX))
            {
                
                if(!"".equals(CMN_FLE_ALT_TXT_IDX))
                {
                    logger.info("========================= 첨부파일 대체 텍스트 수정 시작 ================================");
                    if(defaultDAO.update("Common.updateCommonFileAltText", commandMap) < 0)
                    {
                        throw new TransactionException("카드이벤트 안내 관리 수정 중 오류가 발생하였습니다.");
                    }
                }
            }
        }
         
        return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectPlanList
    * 2. ClassName : GiftServiceImpl.java
    * 3. Comment : 기획전 목록 가져오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 10. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectPlanList (Map<String, Object> commandMap) throws Exception
    {
    	
        return defaultDAO.selectList("Gift.selectPlanList", commandMap);
    }
}
