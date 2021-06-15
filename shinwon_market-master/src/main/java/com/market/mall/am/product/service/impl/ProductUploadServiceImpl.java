package com.market.mall.am.product.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
//import org.springframework.transaction.interceptor.TransactionAspectUtils;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.exception.FileUploadException;
import com.epasscni.util.CsvRowHandler;
import com.epasscni.util.CsvUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.FileUpload;
import com.epasscni.util.FileUtil;
import com.epasscni.util.StringUtil;
import com.ibatis.sqlmap.engine.transaction.TransactionManager;
import com.market.mall.am.product.service.ProductUploadService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.UploadFile;



import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.product.service.impl
 * @FileName : ProductUploadServiceImpl.java
 * @Date : 2014. 4. 11.
 * @프로그램 설명 : 관리자 > 상품관리 > 이미지일괄등록를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("productUploadService")
public class ProductUploadServiceImpl implements ProductUploadService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired 
    private FileUpload fileUpload;
    
    @Autowired 
    private CsvUtil csvUtil;
    
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    
	/**
     * <pre>
     * 1. MethodName : productImageCount
     * 2. ClassName  : BasicProductServiceImpl.java
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
    public int productImageCount (Map<String, Object> commandMap) throws Exception
    {
    	return this.defaultDAO.selectCount("BasicProduct.selectProductCountByPrdMstCd", commandMap);
    }
    
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
    
     public int productUploadRegist (HttpServletRequest request, List<Map<String, Object>> productList, String fileName)throws Exception
     {
    	 int result=0;
    	 int listCnt = productList.size();
    	 
    	 Map<String, Object> commandMap = null;
    			 
    	 int PRD_EXC_FILE_IDX = this.defaultDAO.selectCount("ProductUpload.selectProductExcelFileIdx", commandMap);
    	 
    	 Admin admin = SessionsAdmin.getSessionAdmin(request);
         String PRD_EXC_REG_IP = request.getRemoteAddr();
         String PRD_EXC_REG_ID = admin.getADM_MST_ID();
         
         int errorCount = 0;
         
    	 for(int i=0;i<listCnt;i++)
    	 {
    		 Map<String, Object> productData = productList.get(i);
    		 
    		 productData.put("PRD_EXC_FILE", fileName);
    		 productData.put("PRD_EXC_FILE_IDX", PRD_EXC_FILE_IDX);
    		 productData.put("PRD_EXC_RESULT", "N");
    		 productData.put("PRD_EXC_REG_ID", PRD_EXC_REG_ID);
    		 productData.put("PRD_EXC_REG_IP", PRD_EXC_REG_IP);
    		  
    		 
    		 result = defaultDAO.insert("ProductUpload.insertProductExcel", productData);
    		 
    	 }
    	 
    	 if(result > 0)result = PRD_EXC_FILE_IDX;
    	 
    	 
    	 return result;
     }
     
     

     
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
     
      public int productUploadRegistProc (int PRD_EXC_FILE_IDX) throws Exception
      {
     	 int result=0;
     	 
     	 result = defaultDAO.update("ProductUpload.spProductBatchRegist", PRD_EXC_FILE_IDX);
     	 
     	 return result;
      }
     
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
       @SuppressWarnings("unchecked")
       public List<Map<String, Object>> selectProductUploadList (Map<String, Object> commandMap) throws Exception
       {
           return defaultDAO.selectList("ProductUpload.selectProductUploadList", commandMap);
       }
       
        
       /**
        * <pre>
        * 1. MethodName : selectProductUploadCount
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
        @SuppressWarnings("unchecked")
        public Map<String, Object> selectProductUploadCount (Map<String, Object> commandMap) throws Exception
        {
            return defaultDAO.select("ProductUpload.selectProductUploadCount", commandMap);
        }
        
        /**
 	    * <pre>
 	    * 1. MethodName : productImageUpload
 	    * 2. ClassName  : ProductUploadServiceImpl.java
 	    * 3. Comment    : 이미지일괄업로드 
 	    * 4. 작성자       : khcho
 	    * 5. 작성일       : 2015. 10. 15.
 	    * </pre>
 	    *
 	    */
 	@SuppressWarnings("null")
 	public Map<String, Object> productImageUpload(Map<String, Object> commandMap, CommonsMultipartFile multipartFile, String pathType, String Allow, String dateFolderFlag, int PRD_EXC_FILE_IDX) throws FileUploadException, IOException, Exception{

      UploadFile uploadFile = new UploadFile();
      
      FileUtil fileUtil = new FileUtil();
       
      Map<String, Object> resultMap = new HashMap<String, Object>();
      List<Map<String, Object>> uploadList = defaultDAO.selectList("ProductUpload.selectProductImageUploadList", PRD_EXC_FILE_IDX);
      
      System.out.println("multipartFile.getOriginalFilename() : "+multipartFile.getOriginalFilename());
      System.out.println("Allow : "+Allow);
      System.out.println("pathType : "+pathType);
      if( StringUtils.hasLength( multipartFile.getOriginalFilename()) ){
      	//String uploadPath = propertiesService.getString("file.docs.uploadPath");
      	
          uploadFile.setEmpty(false);

          String destFileDir = propertiesService.getString("file.cdn.uploadPath");
          String webPathDomain = propertiesService.getString("cdn.domain");
          String path = fileUpload.getUploadPath("product") + "/";

          //-- 상품 이미지는 무조건 날짜경로 폴더 생성
          String month = String.valueOf(Calendar.getInstance().get(Calendar.MONTH)+1);
          if(month.length()==1) month = "0"+month;

          String day = String.valueOf(Calendar.getInstance().get(Calendar.DATE));
          if(day.length()==1) day = "0"+day;

          path += Calendar.getInstance().get(Calendar.YEAR);
          path += "/" + month + "/";
          path += day + "/";
          
          String fileExtValid = "Y";
          String fileAllowValid = "N";
          String originalFilename = multipartFile.getOriginalFilename();
          String ext = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();
          String[] check = propertiesService.getStringArray("file.DeniedExtensionsFile");


          for(int i=0; i<check.length;i++){
              if(check[i].equals(ext)) fileExtValid="N";
          }
          if(fileExtValid.equals("N")){
              resultMap =  null;
              logger.debug("###################### 파일 확장자 제한(file extension limit) ###################### ");
              throw new FileUploadException("파일 확장자 제한(file extension limit)");
          }

          if (!"".equals(Allow)){
              String[] check2 = propertiesService.getString(fileUpload.getCheckFileType(Allow)).split("\\|");
              for(int i=0; i<check2.length;i++){
                  if(check2[i].equals(ext)) {
                  	fileAllowValid="Y";
                  }
              }

              if(fileAllowValid.equals("N")){
                  resultMap =  null;
                  logger.debug("###################### 가능한 확장자가 아님  ###################### ");
                  throw new FileUploadException("가능한 확장자가 아님");
              }
          }

          // 신규파일 이름 생성
          String fileExt = StringUtils.getFilenameExtension(originalFilename.toLowerCase());
           
          // 첨부파일 저장
          String serverFileName = destFileDir + originalFilename;
          
          String unzipPath = destFileDir+fileUpload.getUploadPath(pathType) + "/unzip";

          //try {
          	File targetFile = new File(serverFileName);
          	
              multipartFile.transferTo(targetFile);
          	
              fileUtil.unzip(targetFile, new File(unzipPath), false);
              
              System.out.println("unzipPath : "+unzipPath);
              
              List<Map<String, Object>> imgList = new  ArrayList<Map<String, Object>>();
              
              File dirFile = new File(unzipPath);
              File []fileList=dirFile.listFiles();
              int i = 0;
              for(File tempFile : fileList) {
              	if(tempFile.isFile()) {
              		
              		String tempFileName=tempFile.getName();
              		String imageExt = tempFileName.substring(tempFileName.lastIndexOf(".") + 1).toLowerCase();
              		String makeThumbnail = StringUtil.getString(commandMap.get("makeThumbnail"), "N");

              		//String tempPrdMstCd = tempFileName.substring(0,tempFileName.lastIndexOf(".")).toLowerCase();
              		
              		int listCnt = uploadList.size();
           	      
              		String PRD_EXC_IDX = "";
              		String PRD_EXC_IMG = "";
              		String PRD_MST_CD = "";
              		
	           	    for(int k=0;k<listCnt;k++)
	              	{
	           	    	Map<String, Object> uploadData = uploadList.get(k);
	           	    	
	           	    	PRD_EXC_IMG = StringUtil.getString(uploadData.get("PRD_EXC_IMG"),"");
	           	    	
	           	    	if(tempFileName.equals(PRD_EXC_IMG))
	           	    	{
	           	    		PRD_EXC_IDX = StringUtil.getString(uploadData.get("PRD_EXC_IDX"),"");
	           	    		PRD_MST_CD = StringUtil.getString(uploadData.get("PRD_MST_CD"),"");
	           	    	}
	              	}
              		
              		String tempImgPath = path + PRD_MST_CD + "/";
              		String tempDestImgDir = destFileDir+tempImgPath;
              		
              		
              		String errorCode = "정상등록";
              		if(!"".equals(PRD_MST_CD) &&"jpg".equals(imageExt))
              		{
              			File tempDestFile = new File(tempDestImgDir);
 	                		
 	                	if(!tempDestFile.exists()){
 	                		tempDestFile.mkdirs();
 	                	}
 	                	
 	                	fileUtil.copyPhysicalFile(tempFile, new File(tempDestImgDir+PRD_MST_CD+"_0.jpg"));
 	                	//tempFile.delete();
 	                	
 	                	commandMap.put("webpath", tempImgPath);
 	                	commandMap.put("domain", webPathDomain);
 	                	commandMap.put("destFileDir",tempDestImgDir);
 	                	commandMap.put("fileObj", PRD_MST_CD+"_0");
 	                	commandMap.put("fileName", PRD_MST_CD+"_0.jpg");
 		                commandMap.put("fileExt", imageExt);
 		                commandMap.put("fileOrgName", tempFileName);
 		                
 		                   
 		                
 		                if ("Y".equals(makeThumbnail)){
 		                	 Map<String, Object>  thumbnailMap = fileUpload.setThumbnail(commandMap);
 		                	 
 		                	 List<Map<String, Object>> tempList = (List<Map<String, Object>>)thumbnailMap.get("imgList");
 		                	 
 		                	 int tempCnt = tempList.size();
 		                	 
 		                	 for(int k = 0;k< tempCnt;k++)
 		                	 {
 		                		Map<String, Object> temp = tempList.get(k);
 		                	 
 		                		String PRD_IMG_ATT_PATH = StringUtil.getString(temp.get("webpath"),"");
 		                		String PRD_IMG_SYS_NM = StringUtil.getString(temp.get("filename"),"");
 		                		int PRD_IMG_ATT_SIZE =  Integer.parseInt(StringUtil.getString(temp.get("size"),""));
 		                		String PRD_IMG_URL_PATH = StringUtil.getString(propertiesService.getString("cdn.protocol"))+StringUtil.getString(temp.get("domain"),"")+PRD_IMG_ATT_PATH+PRD_IMG_SYS_NM;
 		                		String PRD_IMG_ORG_NM = StringUtil.getString(temp.get("fileOrgName"),"");
 		                		String PRD_IMG_ALT_TEXT = "";
 		                		
 		                		Map<String, Object> paramMap = new HashMap<String, Object>();
 		                		paramMap.put("PRD_MST_CD",PRD_MST_CD);
 		                		paramMap.put("PRD_IMG_IDX","0");
 		                		paramMap.put("PRD_IMG_SORT",k);
 		                		paramMap.put("PRD_IMG_ATT_PATH",PRD_IMG_ATT_PATH);
 		                		paramMap.put("PRD_IMG_SYS_NM",PRD_IMG_SYS_NM);
 		                		paramMap.put("PRD_IMG_ATT_SIZE",PRD_IMG_ATT_SIZE);
 		                		paramMap.put("PRD_IMG_URL_PATH",PRD_IMG_URL_PATH);
 		                		paramMap.put("PRD_IMG_ORG_NM",PRD_IMG_ORG_NM);
 		                		paramMap.put("PRD_IMG_ALT_TEXT",PRD_IMG_ALT_TEXT);
 		                		
 		                		defaultDAO.insert("BasicProduct.insertProductImage", paramMap);
 		                		 		                	 
 		                	 }
 		                	 
 		                }
 		                
 		                defaultDAO.update("ProductUpload.updateProductImageUploadResult", Integer.parseInt(PRD_EXC_IDX));
 		                
              		}else
              		{
              			if(!"jpg".equals(imageExt))errorCode="확장자오류";
              			else errorCode="해당상품없음";
              			
              			tempDestImgDir = "";
              		}
 	                Map<String, Object> fileMap = new HashMap<String, Object>();
 	                fileMap.put("seq", i + 1);
 	                fileMap.put("filename", tempFileName);
 	                fileMap.put("prdmstcd", PRD_MST_CD);
 	                fileMap.put("webpath", tempDestImgDir);
 	                fileMap.put("errorcode", errorCode);
 	                 
 	                imgList.add(i, fileMap); 
 	                tempFile.delete();
 	                
 	                i++;
              	 }
              }
              resultMap.put("fileUploadCount", i);
              resultMap.put("imgList", imgList);
              
              fileUtil.deleteFile(serverFileName);
              
              
              List<Map<String, Object>> tempList = (List<Map<String, Object>>)resultMap.get("imgList");
              
              System.out.println("************************************tempList.size() : "+ tempList.size());
              
              
      }
      
      return resultMap;
  }
    
    /**
	    * <pre>
	    * 1. MethodName : productImageExecuteZip
	    * 2. ClassName  : ProductUploadServiceImpl.java
	    * 3. Comment    : 이미지일괄업로드 
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2015. 10. 15.
	    * </pre>
	    *
	    * @param commandMap
	    * @param multipartFile : 첨부파일
	    * @param pathType : 업로드 구분
	    * @param Allow : 허용 확장자
	    * @param dateFolderFlag : 업로드시 날짜 폴더 생성유무
	    * @return
	    * @throws FileUploadException
	    * @throws IOException
	    */
	@SuppressWarnings("null")
	public Map<String, Object> productImageExecuteZip(Map<String, Object> commandMap, CommonsMultipartFile multipartFile, String pathType, String Allow, String dateFolderFlag) throws FileUploadException, IOException, Exception{

     UploadFile uploadFile = new UploadFile();
     
     FileUtil fileUtil = new FileUtil();
      
     Map<String, Object> resultMap = new HashMap<String, Object>();
     
     System.out.println("multipartFile.getOriginalFilename() : "+multipartFile.getOriginalFilename());
     System.out.println("Allow : "+Allow);
     System.out.println("pathType : "+pathType);
     if( StringUtils.hasLength( multipartFile.getOriginalFilename()) ){
     	//String uploadPath = propertiesService.getString("file.docs.uploadPath");
     	
         uploadFile.setEmpty(false);

         String destFileDir = propertiesService.getString("file.cdn.uploadPath");
         String webPathDomain = propertiesService.getString("cdn.domain");
         String path = fileUpload.getUploadPath("product") + "/";

         //-- 상품 이미지는 무조건 날짜경로 폴더 생성
         String month = String.valueOf(Calendar.getInstance().get(Calendar.MONTH)+1);
         if(month.length()==1) month = "0"+month;

         String day = String.valueOf(Calendar.getInstance().get(Calendar.DATE));
         if(day.length()==1) day = "0"+day;

         path += Calendar.getInstance().get(Calendar.YEAR);
         path += "/" + month + "/";
         path += day + "/";
         
         String fileExtValid = "Y";
         String fileAllowValid = "N";
         String originalFilename = multipartFile.getOriginalFilename();
         String ext = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();
         String[] check = propertiesService.getStringArray("file.DeniedExtensionsFile");


         for(int i=0; i<check.length;i++){
             if(check[i].equals(ext)) fileExtValid="N";
         }
         if(fileExtValid.equals("N")){
             resultMap =  null;
             logger.debug("###################### 파일 확장자 제한(file extension limit) ###################### ");
             throw new FileUploadException("파일 확장자 제한(file extension limit)");
         }

         if (!"".equals(Allow)){
             String[] check2 = propertiesService.getString(fileUpload.getCheckFileType(Allow)).split("\\|");
             System.out.println("--> check2:" + check2[0]);
             for(int i=0; i<check2.length;i++){
                 if(check2[i].equals(ext)) {  
                 	fileAllowValid="Y";
                 }
             }

             if(fileAllowValid.equals("N")){
                 resultMap =  null;
                 logger.debug("###################### 가능한 확장자가 아님  ###################### ");
                 throw new FileUploadException("가능한 확장자가 아님");
             }
         }

         // 신규파일 이름 생성
         String fileExt = StringUtils.getFilenameExtension(originalFilename.toLowerCase());
          
         // 첨부파일 저장
         String serverFileName = destFileDir + originalFilename;
         
         String unzipPath = destFileDir+fileUpload.getUploadPath(pathType) + "/unzip";

         //try {
         	File targetFile = new File(serverFileName);
         	
             multipartFile.transferTo(targetFile);
         	
             fileUtil.unzip(targetFile, new File(unzipPath), false);
             
             System.out.println("unzipPath : "+unzipPath);
             
             List<Map<String, Object>> imgList = new  ArrayList<Map<String, Object>>();
             
             File dirFile = new File(unzipPath);
             File []fileList=dirFile.listFiles();
             int i = 0;
             for(File tempFile : fileList) {
             	if(tempFile.isFile()) {
             		
             		String tempFileName=tempFile.getName();
             		String imageExt = tempFileName.substring(tempFileName.lastIndexOf(".") + 1).toLowerCase();
             		String makeThumbnail = StringUtil.getString(commandMap.get("makeThumbnail"), "N");

             		String tempPrdMstCd = tempFileName.substring(0,tempFileName.lastIndexOf(".")).toLowerCase();
             		Map<String, Object> prdCommandMap =  new HashMap<String, Object>();
             		String tempImgPath = path + tempPrdMstCd + "/";
             		String tempDestImgDir = destFileDir+tempImgPath;
             		prdCommandMap.put("PRD_MST_CD",tempPrdMstCd);
             		
             		int prdCount = this.productImageCount(prdCommandMap);
             		int PRD_IMG_IDX = this.defaultDAO.selectCount("ProductUpload.selectProductImageIndex", prdCommandMap);
             		
             		
             		String errorCode = "정상등록";
             		if(prdCount > 0&&"jpg".equals(imageExt))
             		{
             			File tempDestFile = new File(tempDestImgDir);
	                		
	                	if(!tempDestFile.exists()){
	                		tempDestFile.mkdirs();
	                	}
	                	
	                	fileUtil.copyPhysicalFile(tempFile, new File(tempDestImgDir+tempPrdMstCd+"_"+PRD_IMG_IDX+".jpg"));
	                	
	                	
	                	commandMap.put("webpath", tempImgPath);
	                	commandMap.put("domain", webPathDomain);
	                	commandMap.put("destFileDir",tempDestImgDir);
	                	commandMap.put("fileObj", tempPrdMstCd+"_"+PRD_IMG_IDX);
	 	                commandMap.put("fileName", tempPrdMstCd+"_"+PRD_IMG_IDX+".jpg");
	                	commandMap.put("fileExt", imageExt);
		                commandMap.put("fileOrgName", tempFileName);
		                  
		                if ("Y".equals(makeThumbnail)){
		                	Map<String, Object>  thumbnailMap = fileUpload.setThumbnail(commandMap);
	 		                	 
	 		              	List<Map<String, Object>> tempList = (List<Map<String, Object>>)thumbnailMap.get("imgList");
	 		                	 
	 		                int tempCnt = tempList.size();
	 		                	 
	 		                for(int k = 0;k< tempCnt;k++)
	 		                {
	 		                	Map<String, Object> temp = tempList.get(k);
	 		                	 
	 		                	String PRD_IMG_ATT_PATH = StringUtil.getString(temp.get("webpath"),"");
	 		                	String PRD_IMG_SYS_NM = StringUtil.getString(temp.get("filename"),"");
	 		                	int PRD_IMG_ATT_SIZE =  Integer.parseInt(StringUtil.getString(temp.get("size"),""));
	 		                	String PRD_IMG_URL_PATH = StringUtil.getString(propertiesService.getString("cdn.protocol"))+StringUtil.getString(temp.get("domain"),"")+PRD_IMG_ATT_PATH+PRD_IMG_SYS_NM;
	 		                	String PRD_IMG_ORG_NM = StringUtil.getString(temp.get("fileOrgName"),"");
	 		                	String PRD_IMG_ALT_TEXT = "";
	 		                	
	 		                	Map<String, Object> paramMap = new HashMap<String, Object>();
	 		                	paramMap.put("PRD_MST_CD",tempPrdMstCd);
	 		                	paramMap.put("PRD_IMG_IDX",PRD_IMG_IDX);
	 		                	paramMap.put("PRD_IMG_SORT",k);
	 		                	paramMap.put("PRD_IMG_ATT_PATH",PRD_IMG_ATT_PATH);
	 		                	paramMap.put("PRD_IMG_SYS_NM",PRD_IMG_SYS_NM);
	 		                	paramMap.put("PRD_IMG_ATT_SIZE",PRD_IMG_ATT_SIZE);
	 		                	paramMap.put("PRD_IMG_URL_PATH",PRD_IMG_URL_PATH);
	 		                	paramMap.put("PRD_IMG_ORG_NM",PRD_IMG_ORG_NM);
	 		                	paramMap.put("PRD_IMG_ALT_TEXT",PRD_IMG_ALT_TEXT);
	 		                	
	 		                	defaultDAO.insert("BasicProduct.insertProductImage", paramMap);
	 		                		 		                	 
	 		                 }
		                 }
             		}else
             		{
             			if(!"jpg".equals(imageExt))errorCode="확장자오류";
             			else errorCode="해당상품없음";
             			
             			tempDestImgDir = "";
             		}
	                    Map<String, Object> fileMap = new HashMap<String, Object>();
	                    fileMap.put("seq", i + 1);
	                    fileMap.put("filename", tempFileName);
	                    fileMap.put("prdmstcd", tempPrdMstCd);
	                    fileMap.put("webpath", tempDestImgDir);
	                    fileMap.put("errorcode", errorCode);
	                    imgList.add(i, fileMap); 
	                    
	                    tempFile.delete();
	                    
	                    i++;
             	}
             	
             }
             resultMap.put("fileUploadCount", i);
             resultMap.put("imgList", imgList);
             fileUtil.deleteFile(serverFileName);

     }
     
     return resultMap;
 }
   
}
