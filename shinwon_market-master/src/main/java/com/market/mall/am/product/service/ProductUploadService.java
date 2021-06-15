package com.market.mall.am.product.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.exception.FileUploadException;


/**
 * @PackageName: com.market.mall.am.product.service
 * @FileName : ProductUploadService.java
 * @Date : 2015. 11. 12.
 * @프로그램 설명 : 관리자 > 상품관리 > 이미지일괄업로드관리를 처리하는 Service Class
 * @author khcho
 */
public interface ProductUploadService {

	 /**
     * <pre>
     * 1. MethodName : productImageUpload
     * 2. ClassName  : ProductUploadService.java
     * 3. Comment    : 관리자 > 상품관리 > 이미지일괄업로드
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 10. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    
     public int productImageCount (Map<String, Object> commandMap)throws Exception;    
     
     
	 /**
      * <pre>
      * 1. MethodName : productUploadRegist
      * 2. ClassName  : ProductUploadService.java
      * 3. Comment    : 관리자 > 상품관리 > 이미지일괄업로드 상품테이블 저장
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 07.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     
      public int productUploadRegist (HttpServletRequest request, List<Map<String, Object>> productList, String fileName)throws Exception;   
     
     
      /**
       * <pre>
       * 1. MethodName : productUploadRegistProc
       * 2. ClassName  : ProductUploadService.java
       * 3. Comment    : 관리자 > 상품관리 > 이미지일괄업로드 상품 업로드
       * 4. 작성자       : khcho
       * 5. 작성일       : 2015. 12. 07.
       * </pre>
       *
       * @param request
       * @param commandMap
       * @return
       * @throws Exception
       */
      
       public int productUploadRegistProc (int PRD_EXC_FILE_IDX) throws Exception;
     
       /**
        * <pre>
        * 1. MethodName : selectProductUploadList
        * 2. ClassName  : ProductUploadService.java
        * 3. Comment    : 관리자 > 상품관리 > 이미지일괄업로드 상품 업로드 결과조회
        * 4. 작성자       : khcho
        * 5. 작성일       : 2015. 12. 08.
        * </pre>
        *
        * @param commandMap
        * @return
        * @throws Exception
        */
        public List<Map<String, Object>> selectProductUploadList (Map<String, Object> commandMap) throws Exception;
        
      
        
        /**
         * <pre>
         * 1. MethodName : selectProductUploadList
         * 2. ClassName  : ProductUploadService.java
         * 3. Comment    : 관리자 > 상품관리 > 이미지일괄업로드 상품 업로드 결과조회
         * 4. 작성자       : khcho
         * 5. 작성일       : 2015. 12. 08.
         * </pre>
         
         * @param commandMap
         * @return
         * @throws Exception
         */
         public Map<String, Object> selectProductUploadCount (Map<String, Object> commandMap) throws Exception;
    
         
         /**
          * <pre>
          * 1. MethodName : productImageUpload
          * 2. ClassName  : ProductUploadService.java
          * 3. Comment    : 관리자 > 상품관리 > 이미지일괄업로드
          * 4. 작성자       : khcho
          * 5. 작성일       : 2015. 12. 08.
          * </pre>
          *
          * @param request
          * @param commandMap
          * @return
          * @throws Exception
          */
         public Map<String, Object> productImageUpload(Map<String, Object> commandMap, CommonsMultipartFile multipartFile, String pathType, String Allow, String dateFolderFlag, int PRD_EXC_FILE_IDX) throws FileUploadException, IOException, Exception; 
         
     /**
      * <pre>
      * 1. MethodName : productImageExecuteZip
      * 2. ClassName  : ProductUploadService.java
      * 3. Comment    : 관리자 > 상품관리 > 이미지일괄업로드
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 10. 15.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     public Map<String, Object> productImageExecuteZip(Map<String, Object> commandMap, CommonsMultipartFile multipartFile, String pathType, String Allow, String dateFolderFlag) throws FileUploadException, IOException, Exception;

   
}
