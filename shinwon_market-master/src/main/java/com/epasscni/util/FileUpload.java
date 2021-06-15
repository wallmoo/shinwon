package com.epasscni.util;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.swing.ImageIcon;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.exception.FileUploadException;
import com.market.mall.model.UploadFile;
import com.market.util.ServerOsValidator;
import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.ResampleOp;


import egovframework.rte.fdl.property.EgovPropertyService;


@Component
public class FileUpload {

	@Autowired
	ServletContext servletContext;
	
	
    private static final Object Object = null;

	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
     * <pre>
     * 1. MethodName : getUploadPath
     * 2. ClassName  : FileUpload.java
     * 3. Comment    : 파일 유형에 따라 저장소 위치를 resource properties에서 호출하기 위한 NAME값 반환
     * 4. 작성자       : 이상준
     * 5. 작성일       : 2014. 6. 20.
     * </pre>
     *
     * @param n
     * @return
     */
    public String getUploadPath(String n){
        String p = "file.path.default";
        if ("excel".equals(n)){
            p = "file.path.excel";
        }
        else if ("contents".equals(n))
        {
            p = "file.path.contents"; 
        }
        else if ("marketing".equals(n))
        {
            p = "file.path.marketing";
        }
        else if ("display".equals(n))
        {
            p = "file.path.display";
        }
        else if ("customer".equals(n))
        {
            p = "file.path.customer";
        }
        else if ("board".equals(n))
        {
            p = "file.path.board";
        }
        else if ("editor".equals(n))
        {
            p = "file.path.editor";
        }
        else if ("product".equals(n))
        {
        	p = "file.path.product";
        }
        else if ("lookbook".equals(n))
        {
        	p = "file.path.lookbook";
        }
        else if ("zip".equals(n))
        {
        	p = "file.path.temp";
        }
        else if ("logo".equals(n))
        {
            p = "file.path.logo";
        }
        return propertiesService.getString(p);
    }

    /**
    * <pre>
    * 1. MethodName : getCheckFileType
    * 2. ClassName  : FileUpload.java
    * 3. Comment    : 업로드 가능한 확장자를 반환한다. 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 5. 16.
    * </pre>
    *
    * @param a
    * @return
    */
    public String getCheckFileType(String a){
        String p = "";  
        if ("excel".equals(a)){
        	p = "file.AllowedExtensions.excel";
        } else if ("editor".equals(a)){
        	p = "file.AllowedExtensions.image";
        } else if ("image".equals(a)){
            p = "file.AllowedExtensions.image";
        } else if ("fileType".equals(a)){
        	p = "file.AllowedExtensions.fileType";
        }else if ("zip".equals(a)){
        	p = "file.AllowedExtensions.zip";
        }else if ("counsel1".equals(a)){
        	p = "file.AllowedExtensions.counsel1";
        }else if ("counsel2".equals(a)){
        	p = "file.AllowedExtensions.counsel2";
        }
        return p;
    }



    /**
    * <pre>
    * 1. MethodName : execute
    * 2. ClassName  : FileUpload.java
    * 3. Comment    : 첨부 파일 업로드 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 5. 16.
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
    public Map<String, Object> execute(Map<String, Object> commandMap, CommonsMultipartFile multipartFile, String pathType, String Allow, String dateFolderFlag) throws FileUploadException, IOException{
    	String basePath = new File( servletContext.getRealPath("/nas/cdn/")).getAbsolutePath();
        UploadFile uploadFile = new UploadFile();
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
        if( StringUtils.hasLength( multipartFile.getOriginalFilename()) ){
        	
        	 String ext = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();

            uploadFile.setEmpty(false);
            String path = "";
            //확장자에 따라 uploadPath 달라짐(일반문서=file.docs.uploadPath // 이미지= file.cdn.uploadPath)
            String uploadPath = propertiesService.getString("file.docs.uploadPath");
            
            System.out.println("uploadPath=================================" + uploadPath);
            
            String[] checkImgFileExts = propertiesService.getString(getCheckFileType("image")).split("\\|"); //이미지 확장자 배열
            for(int i = 0; i < checkImgFileExts.length;i++){
    			if(checkImgFileExts[i].equals(ext)) 
    			{
    				if("editor".equals(pathType)){
    					uploadPath = propertiesService.getString("file.cdn.uploadPath.editor");
    				}else{
    					uploadPath = propertiesService.getString("file.cdn.uploadPath");
    				}
    				break;
    			}
    		}

            String destFileDir = uploadPath;
            //TODO editor 업로드 이미지만 사용. 이미지 첨부후 바로 보여줄 필요성때문. 추후 운영 반영시 http -> https로 변경 가능성 있음..
            String webPathDomain = "http://"+propertiesService.getString("cdn.domain.editor"); 
            
            path += path + getUploadPath(pathType) + "/";

            if ("Y".equals(dateFolderFlag)){
                String month = String.valueOf(Calendar.getInstance().get(Calendar.MONTH)+1);
                if(month.length()==1) month = "0"+month;

                String day = String.valueOf(Calendar.getInstance().get(Calendar.DATE));
                if(day.length()==1) day = "0"+day;

                path += Calendar.getInstance().get(Calendar.YEAR);
                path += "/" + month + "/";
                path += day + "/";
            }
            
            destFileDir = basePath+path;
            destFileDir = ServerOsValidator.getFilePathByOs(destFileDir);
            
            
            File destFile = new File(destFileDir);
            if(!destFile.exists()){
                destFile.mkdirs();
            }
            
            String exceptionMessage = "";
            
            /** 첨부파일 확장자 체크 */
            String fileAllowValid = "N";
            
        	if (!"".equals(Allow)){
        	    
        	    /** 업로드 가능한 확장자*/
        	    String[] checkFileExts = propertiesService.getString(getCheckFileType(Allow)).split("\\|");
        		for(int i = 0; i < checkFileExts.length;i++){
        		    
        		    exceptionMessage += checkFileExts.length == i+1?"."+checkFileExts[i]:"."+checkFileExts[i] + ", ";
        		    
        			if(checkFileExts[i].equals(ext)) 
        			{
        			    fileAllowValid="Y";
        			}
        		}
        		
        		if(fileAllowValid.equals("N")){
        			resultMap =  null;
        			logger.debug("###################### 업로드 불가능한 확장자 (업로드 가능한 확장자[ " + exceptionMessage + " ]) ###################### ");
        			throw new FileUploadException("업로드 불가능한 확장자 입니다.\\n첨부파일 확장자를 확인 후 다시 시도 해 주십시오.\\n업로드 가능한 확장자[ " + exceptionMessage + " ]");
        		}
        	}
            
            /** 첨부파일 크기 제한 (10MB) */
        	long fileSize = multipartFile.getSize();
        	        	
        	if(StringUtil.getString(commandMap.get("fileSizeYn"),"") == "Y")
        	{
	        	if(fileSize > 10485760){
	        		 resultMap =  null;
	                 logger.debug("###################### 업로드 용량 초과 (MAX : 10M)  ###################### ");
	                 throw new FileUploadException("업로드 용량이 초과되었습니다.\\n첨부파일의 용량을 확인 후 다시 시도 해 주십시오.\\n최대 업로드 용량[ 10MB ]");
	        	}
        	}
            

            /** 신규파일 이름 생성 */
            String randomFileName = UUID.randomUUID().toString();
            String fileExt = StringUtils.getFilenameExtension(multipartFile.getOriginalFilename().toLowerCase());
            String fileName = randomFileName + "." + fileExt;

            /** 첨부파일 저장 */
            
            String serverFileName = destFileDir + fileName;
            
            

            try {
                multipartFile.transferTo(new File(serverFileName));
                
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
            uploadFile.setExt(ext); //확장자명
            uploadFile.setSystemPath(uploadPath); // 시스템 경로
            uploadFile.setAttachPath(path); // 파일 경로
            uploadFile.setServerFileName(serverFileName); // 서버파일명
            uploadFile.setFileName(fileName); // 저장된 파일 이름
            uploadFile.setOriginalFileName(multipartFile.getOriginalFilename()); // 원본파일명
            uploadFile.setContentType(multipartFile.getContentType()); // contentType
            uploadFile.setFileSize(multipartFile.getSize()); // filesize
            uploadFile.setWebpath(webPathDomain + path + fileName); // webpath 에디터만 사용

            /** editor로 이미지 업로드시 처리 */
            if(Allow.equals("editor")){
                /** 업로드 성공 여부 */
                if(!multipartFile.isEmpty()){
                    resultMap.put("success", "false");
                    logger.debug("######################################################################################");
                    logger.debug("FILE UPLOAD SUCCESSFUL");
                    logger.debug("######################################################################################");
                    
                }else{
                    logger.debug("######################################################################################");
                    logger.debug("FILE UPLOAD FAIL");
                    logger.debug("######################################################################################");
                    resultMap.put("success", "true");
                }
                resultMap.put("message", "");
                resultMap.put("file_url", uploadFile.getWebpath());
                logger.debug("######################################################################################");
                logger.debug("######### FILE URL : "+resultMap.get("file_url"));
                logger.debug("######################################################################################");
            }

            /** 결과 값 반환*/
            Iterator<String> iterator = commandMap.keySet().iterator();
            while(iterator.hasNext())
            {
                String key = (String)iterator.next();
                resultMap.put(key, commandMap.get(key));
            }
            
            resultMap.put("CMM_FLE_SYS_PATH", uploadFile.getSystemPath());
            resultMap.put("CMM_FLE_ATT_PATH", uploadFile.getAttachPath());
            resultMap.put("CMM_FLE_ORG_NM", uploadFile.getOriginalFileName());
            resultMap.put("CMM_FLE_SYS_NM", uploadFile.getFileName());
            resultMap.put("CMM_FLE_ATT_SIZE", Long.toString(uploadFile.getFileSize()));
            resultMap.put("CMM_FLE_ATT_EXT", uploadFile.getExt());
            resultMap.put("CMM_FLE_USE_YN", "Y");
            resultMap.put("CMM_FLE_WEB_PATH",uploadFile.getWebpath());//EDITOR 이미지용.
            String webServerPath = uploadFile.getSystemPath()+uploadFile.getAttachPath();
            commandMap.put("ip", propertiesService.getString("web.server.ip"));
            commandMap.put("port", propertiesService.getString("web.server.port"));
            commandMap.put("id", propertiesService.getString("web.server.id"));
            commandMap.put("password", propertiesService.getString("web.server.password"));
            commandMap.put("folder", webServerPath);
            commandMap.put("localPath", path);
            commandMap.put("filesName", fileName);
            commandMap.put("base", basePath);
            //사용자가 올린 이미지 리사이즈
            String makeResize = StringUtil.getString(commandMap.get("makeResize"), "N");
            if ("Y".equals(makeResize)){
                commandMap.put("destFileDir", destFileDir);
                commandMap.put("fileName", fileName);
                commandMap.put("fileExt", fileExt);
                commandMap.put("fileOrgName", uploadFile.getOriginalFileName());
                
                makeThumbnail2(commandMap);
                //resultMap = commandMap;
            }
        }
        
        return resultMap;
    }

  
    /**
    * <pre>
    * 1. MethodName : delete
    * 2. ClassName  : FileUpload.java
    * 3. Comment    : 첨부파일을 삭제한다. 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 5. 16.
    * </pre>
    *
    * @param targetFile
    */
    public void delete(String targetFile) {
        
        File file = new File(targetFile);
         if(file.exists()){
             if (file.delete()) {
                 logger.debug("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
                 logger.debug("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ File delete successful ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
                 logger.debug("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
             } else {
                 logger.debug("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
                 logger.debug("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ File delete fail ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
                 logger.debug("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
             }
         }
    }
    
    /**
     * <pre>
     * 1. MethodName : productImageExecute
     * 2. ClassName  : FileUpload.java
     * 3. Comment    : 상품 이미지 등록 처리와 썸네일 생성 
     * 4. 작성자       : 이상준
     * 5. 작성일       : 2014. 6. 20.
     * </pre>
     *
     * @param commandMap
     * @param multipartFile
     * @param pathType : 업로드 구분
     * @param Allow : 허용 확장자
     * @param dateFolderFlag : 업로드시 날짜 폴더 생성유무
     * @return
     * @throws FileUploadException
     * @throws IOException
     */
	public Map<String, Object> productImageExecute(Map<String, Object> commandMap, CommonsMultipartFile multipartFile, String pathType, String Allow, String dateFolderFlag) throws FileUploadException, IOException{
		String basePath = new File( servletContext.getRealPath("/nas/cdn/")).getAbsolutePath();
        UploadFile uploadFile = new UploadFile();
        Map<String, Object> resultMap = new HashMap<String, Object>();

        if( StringUtils.hasLength( multipartFile.getOriginalFilename()) ){

            uploadFile.setEmpty(false);

            String destFileDir = basePath;
            String webPathDomain = propertiesService.getString("cdn.domain");
            String prd_mst_cd = (String)commandMap.get("PRD_MST_CD");
            //String product_image_env = (String)commandMap.get("product_image_env");
            String path = getUploadPath(pathType) + "/";
            

            //-- 상품 이미지는 무조건 날짜경로 폴더 생성
            String month = String.valueOf(Calendar.getInstance().get(Calendar.MONTH)+1);
            if(month.length()==1) month = "0"+month;

            String day = String.valueOf(Calendar.getInstance().get(Calendar.DATE));
            if(day.length()==1) day = "0"+day;
            
            if(prd_mst_cd.equals("")){
	            path += Calendar.getInstance().get(Calendar.YEAR);
	            path += "/" + month + "/";
	            path += day + "/";
	            path += "temp/";
            }else{
            	path += Calendar.getInstance().get(Calendar.YEAR);
	            path += "/" + month + "/";
	            path += day + "/";
	            path += prd_mst_cd +"/";
            }
            
            logger.debug("path : " + path);

            destFileDir = destFileDir+path;

            logger.debug("destFileDir : " + destFileDir);

            File destFile = new File(destFileDir);

            logger.debug("destFile.exists() : " + destFile.exists());

            if(!destFile.exists()){
                destFile.mkdirs();
            }

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
                String[] check2 = propertiesService.getString(getCheckFileType(Allow)).split("\\|");
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
            String fileName = commandMap.get("fileObj") +"."+ fileExt;

            // 첨부파일 저장
            String serverFileName = destFileDir + fileName;

            try {
                multipartFile.transferTo(new File(serverFileName));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

            //확장자명
            uploadFile.setExt(ext);

            // 서버파일명
            uploadFile.setServerFileName(serverFileName);

            // 저장된 파일 이름
            uploadFile.setFileName(fileName);

            // 원본파일명
            uploadFile.setOriginalFileName(originalFilename);

            // contentType
            uploadFile.setContentType(multipartFile.getContentType());

            // filesize
            uploadFile.setFileSize(multipartFile.getSize());

            // webpath
            uploadFile.setWebpath(path );
            String webServerPath = uploadFile.getSystemPath()+uploadFile.getAttachPath();
            commandMap.put("ip", propertiesService.getString("web.server.ip"));
            commandMap.put("port", propertiesService.getString("web.server.port"));
            commandMap.put("id", propertiesService.getString("web.server.id"));
            commandMap.put("password", propertiesService.getString("web.server.password"));
            commandMap.put("folder", webServerPath);
            commandMap.put("localPath", path);
            commandMap.put("filesName", fileName);
            commandMap.put("base", basePath);
            
            commandMap.put("filename", uploadFile.getFileName());
            commandMap.put("webpath", uploadFile.getWebpath());
            commandMap.put("domain", webPathDomain);

            String makeThumbnail = StringUtil.getString(commandMap.get("makeThumbnail"), "N");
            if ("Y".equals(makeThumbnail)){
                commandMap.put("destFileDir", destFileDir);
                commandMap.put("fileName", fileName);
                commandMap.put("fileExt", fileExt);
                commandMap.put("fileOrgName", originalFilename);
                resultMap = setThumbnail(commandMap);
                //resultMap = commandMap;
            } else {

                //result
                resultMap.put("filename",uploadFile.getFileName());
                resultMap.put("savefolder","/" + path);
                resultMap.put("originalfilename",uploadFile.getOriginalFileName());
                resultMap.put("filesize",Long.toString(uploadFile.getFileSize()));
                resultMap.put("contenttype",uploadFile.getContentType() );
                resultMap.put("serverpath",uploadFile.getServerFileName());
                resultMap.put("webpath",uploadFile.getWebpath());
                resultMap.put("domain",webPathDomain);

                List<Map<String, Object>> imgList = null;
                Map<String, Object> fileMap = new HashMap<String, Object>();
                fileMap.put("fileObj", commandMap.get("fileObj"));
                fileMap.put("webpath", uploadFile.getWebpath());
                fileMap.put("domain", webPathDomain);
                fileMap.put("filename", uploadFile.getFileName());
                imgList.add(0, fileMap);
                resultMap.put("imgList", imgList);
            }

        }

        return resultMap;
    }
	
	public void productImageFromUrlExcute(Map<String, Object> commandMap, String url, String pathType, String Allow, String dateFolderFlag){
		int slashIndex = url.lastIndexOf('/');
		String fileName = url.substring(slashIndex + 1);
		try (BufferedInputStream in = new BufferedInputStream(new URL(url).openStream());
		  FileOutputStream fileOutputStream = new FileOutputStream(fileName)) {
		    byte dataBuffer[] = new byte[1024];
		    int bytesRead;
		    while ((bytesRead = in.read(dataBuffer, 0, 1024)) != -1) {
		        fileOutputStream.write(dataBuffer, 0, bytesRead);
		    }
		} catch (IOException e) {
		    // handle exception
		}		
	}
	
	/**
	* <pre>
	* 1. MethodName : productImageExecuteByExcel
	* 2. ClassName  : FileUpload.java
	* 3. Comment    : 엑셀 업로드시 상품 이미지 등록 처리와 썸네일 생성 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 8. 21.
	* </pre>
	*
	* @param commandMap
	* @param file
	* @param pathType
	* @param Allow
	* @param dateFolderFlag
	* @return
	* @throws FileUploadException
	* @throws IOException
	*/
	@SuppressWarnings("null")
	public Map<String, Object> productImageExecuteByExcel(Map<String, Object> commandMap, File file, String pathType, String Allow, String dateFolderFlag) throws FileUploadException, IOException{

        UploadFile uploadFile = new UploadFile();
        Map<String, Object> resultMap = new HashMap<String, Object>();
       
        if( StringUtils.hasLength( file.getName()) ){

            uploadFile.setEmpty(false);

            String destFileDir = propertiesService.getString("file.cdn.uploadPath");
            String webPathDomain = propertiesService.getString("cdn.domain");
            String prd_mst_cd = (String)commandMap.get("PRD_MST_CD");
            //String product_image_env = (String)commandMap.get("product_image_env");
            String path = getUploadPath(pathType) + "/";

            //-- 상품 이미지는 무조건 날짜경로 폴더 생성
            String month = String.valueOf(Calendar.getInstance().get(Calendar.MONTH)+1);
            if(month.length()==1) month = "0"+month;

            String day = String.valueOf(Calendar.getInstance().get(Calendar.DATE));
            if(day.length()==1) day = "0"+day;

            path += Calendar.getInstance().get(Calendar.YEAR);
            path += "/" + month + "/";
            path += day + "/";
            path += prd_mst_cd + "/";

            logger.debug("path : " + path);

            destFileDir = destFileDir+path;

            logger.debug("destFileDir : " + destFileDir);

            File destFile = new File(destFileDir);

            logger.debug("destFile.exists() : " + destFile.exists());

            if(!destFile.exists()){
                destFile.mkdirs();
            }

            String fileExtValid = "Y";
            String fileAllowValid = "N";
            String originalFilename = file.getName();
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
                String[] check2 = propertiesService.getString(getCheckFileType(Allow)).split("\\|");
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
            String fileName = commandMap.get("fileObj") +"."+ fileExt;

            // 첨부파일 저장
            String serverFileName = destFileDir + fileName;
            
            //InputStream inStream = null;
            //OutputStream outStream = null;
            
            //스트림, 버퍼 선언
            FileInputStream inputStream = null;
            FileOutputStream outputStream = null;
            BufferedInputStream bin = null;
            BufferedOutputStream bout = null;
            int b = 0;
            
            try {
            	//스트림 생성
        	   inputStream = new FileInputStream(file);
        	   outputStream = new FileOutputStream(serverFileName);
            	   
            	//버퍼 생성
        	   bin = new BufferedInputStream(inputStream);
        	   bout = new BufferedOutputStream(outputStream);
    	   
    		   while((b = bin.read()) != -1){
    			   bout.write(b);
    		   }

    		   //자원 해제
  	           	bout.close();
  	           	
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
                logger.debug("###################### 지정된 파일을 찾을 수 없습니다. ###################### ");
                throw new FileUploadException("지정된 파일을 찾을 수 없습니다.");
            } finally {
            	outputStream.close();
  	           	inputStream.close();
  	           	bin.close();
            }

            //확장자명
            uploadFile.setExt(ext);

            // 서버파일명
            uploadFile.setServerFileName(serverFileName);

            // 저장된 파일 이름
            uploadFile.setFileName(fileName);

            // 원본파일명
            uploadFile.setOriginalFileName(originalFilename);

            // contentType
            uploadFile.setContentType("image/jpeg");

            // filesize
            uploadFile.setFileSize(file.length());

            // webpath
            uploadFile.setWebpath(path );

            commandMap.put("filename", uploadFile.getFileName());
            commandMap.put("webpath", uploadFile.getWebpath());
            commandMap.put("domain", webPathDomain);

            String makeThumbnail = StringUtil.getString(commandMap.get("makeThumbnail"), "N");
            if ("Y".equals(makeThumbnail)){
                commandMap.put("destFileDir", destFileDir);
                commandMap.put("fileName", fileName);
                commandMap.put("fileExt", fileExt);
                commandMap.put("fileOrgName", originalFilename);
                resultMap = setThumbnail(commandMap);
                //resultMap = commandMap;
            } else {

                //result
                resultMap.put("filename",uploadFile.getFileName());
                resultMap.put("savefolder","/" + path);
                resultMap.put("originalfilename",uploadFile.getOriginalFileName());
                resultMap.put("filesize",Long.toString(uploadFile.getFileSize()));
                resultMap.put("contenttype",uploadFile.getContentType() );
                resultMap.put("serverpath",uploadFile.getServerFileName());
                resultMap.put("webpath",uploadFile.getWebpath());
                resultMap.put("domain",webPathDomain);

                List<Map<String, Object>> imgList = null;
                Map<String, Object> fileMap = new HashMap<String, Object>();
                fileMap.put("fileObj", commandMap.get("fileObj"));
                fileMap.put("webpath", uploadFile.getWebpath());
                fileMap.put("domain", webPathDomain);
                fileMap.put("filename", uploadFile.getFileName());
                imgList.add(0, fileMap);
                resultMap.put("imgList", imgList);
            }

        }

        return resultMap;
    }
	
	
	
	public Map<String, Object> setThumbnail(Map<String, Object> commandMap) throws IOException{
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Map<String, Object> fileMap = new HashMap<String, Object>();
        ArrayList<Map<String, Object>> imgList = new ArrayList<Map<String, Object>>();
        String webpath = commandMap.get("webpath").toString();
        String domain = commandMap.get("domain").toString();
        String fileExt = StringUtil.getString(commandMap.get("fileExt"));
        int nCnt = 0;

        String fileObjOrg = StringUtil.getString(commandMap.get("fileObj"), "noFileObj");

        fileMap.put("fileObj", fileObjOrg);
        fileMap.put("webpath", webpath);
        fileMap.put("domain", domain);
        fileMap.put("filename", fileObjOrg+"."+fileExt);
        fileMap.put("fileOrgName", commandMap.get("fileOrgName"));
        fileMap.put("altText", commandMap.get("alt_text"));
        fileMap.put("size", '0');
        imgList.add(nCnt++,fileMap);

        String [][] resizeImage = { {"_500", "500"},
        							{"_450", "450"},
        							{"_320", "320"},
        							{"_250", "250"},
        							{"_180", "180"},
        							{"_125", "125"},
        							{"_84", "84"} }; 
        
        for( int i=0; i<resizeImage.length ; i++ ){
        	
        	String tail = resizeImage[i][0];
        	String size = resizeImage[i][1];
        	
	        commandMap.put("fileObj", fileObjOrg+tail);
	        commandMap.put("width", size);
	        commandMap.put("height", size);
	        makeThumbnail(commandMap);
	
	        fileMap = new HashMap<String, Object>();
	        fileMap.put("fileObj", fileObjOrg+tail);
	        fileMap.put("webpath", webpath);
	        fileMap.put("domain", domain);
	        fileMap.put("filename", fileObjOrg+tail+"."+fileExt);
	        fileMap.put("size", size);
	        fileMap.put("fileOrgName", commandMap.get("fileOrgName"));
	        fileMap.put("altText", commandMap.get("alt_text"));        
	        imgList.add(nCnt++,fileMap);
        }

        for (int i=0;i<imgList.size();i++){
            Map<String, Object> map = imgList.get(i);
            logger.debug(map.toString());
        }

        resultMap.put("imgList", imgList);
        return resultMap;
    }
	
	   public void makeThumbnail_old(Map<String, Object> commandMap) throws IOException{
	        String fileExt = StringUtil.getString(commandMap.get("fileExt"));
	        String serverFileName = StringUtil.getString(commandMap.get("destFileDir")) + StringUtil.getString(commandMap.get("fileName"));
	        String targetFileName = StringUtil.getString(commandMap.get("destFileDir")) +
	                                StringUtil.getString(commandMap.get("fileObj")) + "." +
	                                fileExt;

	        File src = new File(serverFileName);
	        File target = new File(targetFileName);

	        int width = StringUtil.getInt(commandMap.get("width"), 0);
	        int height = StringUtil.getInt(commandMap.get("height"), 0);

	        Image srcImg = null;
	        String suffix = src.getName()
	                .substring(src.getName().lastIndexOf('.') + 1).toLowerCase();

	        if (suffix.equals("bmp") || suffix.equals("png")
	                || suffix.equals("gif")) {
	            srcImg = ImageIO.read(src);
	        } else {
	            srcImg = new ImageIcon(src.toString()).getImage();
	        }

	        int srcWidth = srcImg.getWidth(null);
	        int srcHeight = srcImg.getHeight(null);
	        int destWidth = -1, destHeight = -1;

	        if (width < 0) {
	            destWidth = srcWidth;
	        } else if (width > 0) {
	            destWidth = width;
	        }

	        if (height < 0) {
	            destHeight = srcHeight;
	        } else if (height > 0) {
	            destHeight = height;
	        }

	        Image imgTarget = srcImg.getScaledInstance(destWidth, destHeight,
	                Image.SCALE_SMOOTH);
	        int pixels[] = new int[destWidth * destHeight];
	        PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, destWidth,
	                destHeight, pixels, 0, destWidth);

	        try {
	            pg.grabPixels();
	        } catch (InterruptedException e) {
	            throw new IOException(e.getMessage());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        BufferedImage destImg = new BufferedImage(destWidth, destHeight,
	                BufferedImage.TYPE_INT_RGB);
	        destImg.setRGB(0, 0, destWidth, destHeight, pixels, 0, destWidth);
	        ImageIO.write(destImg, "jpg", target);

	    }
	   
	   public void makeThumbnail(Map<String, Object> commandMap) throws IOException{
		   
		   String fileExt = StringUtil.getString(commandMap.get("fileExt"));
		   String serverFileName = StringUtil.getString(commandMap.get("destFileDir")) + StringUtil.getString(commandMap.get("fileName"));
		   String targetFileName = StringUtil.getString(commandMap.get("destFileDir")) +
                   StringUtil.getString(commandMap.get("fileObj")) + "." +
                   fileExt;
		   
		   File f = new File(serverFileName);
		   BufferedImage src = ImageIO.read(f);
		   
		   int destWidth = StringUtil.getInt(commandMap.get("width"), 0);
		   int destHeight = StringUtil.getInt(commandMap.get("height"), 0);
   
		   
		   
           //ResampleOp resampleOp = new ResampleOp (destWidth, destHeight);
           //resampleOp.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft);
           BufferedImage resizedImage = this.resize(src,destWidth,destHeight);
           ImageIO.write(resizedImage, fileExt.toUpperCase() ,new File(targetFileName));
           
	    }
	   
	   public static BufferedImage resize(BufferedImage img, int newW, int newH) { 
	       Image tmp = img.getScaledInstance(newW, newH, Image.SCALE_SMOOTH);
	       BufferedImage dimg = new BufferedImage(newW, newH, BufferedImage.TYPE_INT_RGB);

	       Graphics2D g2d = dimg.createGraphics();
	       g2d.drawImage(tmp, 0, 0, null);
	       g2d.dispose();

	       return dimg;
	   }  
	   /**
	* <pre>
	* 1. MethodName : makeThumbnail2
	* 2. ClassName  : FileUpload.java
	* 3. Comment    : 프론트 사용자 등록 이미지 리사이즈
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 31.
	* </pre>
	*
	* @param commandMap
	* @throws IOException
	*/
	public void makeThumbnail2(Map<String, Object> commandMap) throws IOException{
		   String fileExt = StringUtil.getString(commandMap.get("fileExt"));
		   String serverFileName = StringUtil.getString(commandMap.get("destFileDir")) + StringUtil.getString(commandMap.get("fileName"));
		   
		   File f = new File(serverFileName);
		   BufferedImage src = ImageIO.read(f);
	
	       Image srcImg = null;
	       srcImg = ImageIO.read(f);
	        
	       int wantWidth = 600; //원하는 width값
	       int imageWidth = srcImg.getWidth(null);//이미지 가로사이즈
	       int imageHeight = srcImg.getHeight(null);//이미지 세로사이즈
	       
	       //비율 설정
	       double ratio = 1.0;
	       
	       //이미지가 원하는 크기보다 큰 경우(width값만 체크)만 리사이즈
	       if(imageWidth > wantWidth){
	    	   ratio = (double)wantWidth/ (double)imageWidth;        	   
	       }
	       
	       int destWidth = (int)(imageWidth * ratio);
	       int destHeight = (int)(imageHeight * ratio);
	       
	       ResampleOp resampleOp = new ResampleOp (destWidth, destHeight);
	       resampleOp.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.VerySharp);
	       BufferedImage rescaled = resampleOp.filter(src, null);
	       
	       ImageIO.write(rescaled, fileExt.toLowerCase() ,new File(serverFileName)); //기존 파일에 덮어쓴다.
	    }
	
	/**
	* <pre>
	* 1. MethodName : productImageFolderMove
	* 2. ClassName : FileUpload.java
	* 3. Comment : 상품이미지 이미지명 변경 후 이동
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 12. 9.
	* </pre>
	*
	* @param commandMap
	* @param pathType
	* @return
	* @throws FileUploadException
	* @throws IOException
	*/
	public int productImageFolderMove(Map<String, Object> commandMap, String pathType) throws FileUploadException, IOException{

        int result = 0;
        
        String destFileDir = new File( servletContext.getRealPath("/nas/cdn/")).getAbsolutePath();
        String oldDestFileDir = "";
        String newDestFileDir = "";
        String copyDestFileDir = "";
        
        String oldPath = getUploadPath(pathType) + "/";
        String newPath = getUploadPath(pathType) + "/";
        String copyPath = getUploadPath(pathType) + "/";
        
        String prd_mst_cd = (String)commandMap.get("PRD_MST_CD");	//신규등록 상품코드
        String old_prd_mst_cd = (String)commandMap.get("OLD_PRD_MST_CD");	//상품복사시 기존 상품코드
        String prd_file_name = (String)commandMap.get("PRD_FILE_NAME");
        
        String [] arrPRD_IMG = (String[]) commandMap.get("_product_image");
        
        String month = String.valueOf(Calendar.getInstance().get(Calendar.MONTH)+1);
        if(month.length()==1) month = "0"+month;

        String day = String.valueOf(Calendar.getInstance().get(Calendar.DATE));
        if(day.length()==1) day = "0"+day;
        
        oldPath += Calendar.getInstance().get(Calendar.YEAR);
        oldPath += "/" + month + "/";
        oldPath += day + "/";
        oldPath += "temp/";
        
        newPath += Calendar.getInstance().get(Calendar.YEAR);
        newPath += "/" + month + "/";
        newPath += day + "/";
        newPath += prd_mst_cd + "/";
        
        if(ServerOsValidator.isWindows()) {
        	oldPath = oldPath.replaceAll("/", Matcher.quoteReplacement(File.separator));
        	newPath = newPath.replaceAll("/", Matcher.quoteReplacement(File.separator));
        }
        
        logger.debug("oldPath : " + oldPath);
        oldDestFileDir = destFileDir+oldPath;
        newDestFileDir = destFileDir+newPath;
                
        File destFile = new File(newDestFileDir);

        logger.debug("destFile.exists() : " + destFile.exists());

        if(!destFile.exists()){
            destFile.mkdirs();
        }
        //
        if(old_prd_mst_cd!=null && !old_prd_mst_cd.equals("")){
	        //상품 복사의 경우 기존 상품코드 폴더의 파일을 신규 상품코드 폴더로 복사한다.
        	String [] arrImgCopyInfo = arrPRD_IMG[0].split("\\|");
        	copyDestFileDir = destFileDir+arrImgCopyInfo[2];
        	
	        List<File> copyDirList = getDirFileList(copyDestFileDir);
	        try{
		        //폴더의 사이즈만큼 돌면서 파일을 이동시킨다.
		        for (int i=0; i<copyDirList.size(); i++)
		        {
		        	//i번째 저장되어 있는 파일을 불러온다.
		        	String fileName = copyDirList.get(i).getName();
		        	//상품신규등록시 temp에서 상품코드 폴더로
		        	//상품복사시 기존 상품코드 폴더 혹은 temp에서 이미지 이동
		        	for( int ii = 0; ii < arrPRD_IMG.length; ii++ )
		        	{
		        		String [] arrImgInfo = arrPRD_IMG[ii].split("\\|");
		        		
		        		if(fileName.indexOf(arrImgInfo[4]) != -1){
		        			fileCopy(copyDestFileDir+fileName, newDestFileDir+fileName.replace(old_prd_mst_cd, prd_mst_cd));	//파일이동
			        	}
		        	}
		        }
		        result = 0;
	        }catch(NullPointerException e){
	        	result = -1;
	        }
	        //이동전의 Temp 폴더에 있는 파일들을 읽는다.
            List<File> dirList = getDirFileList(oldDestFileDir);
            try{
    	        //폴더의 사이즈만큼 돌면서 파일을 이동시킨다.
    	        for (int i=0; i<dirList.size(); i++)
    	        {
    	        	//i번째 저장되어 있는 파일을 불러온다.
    	        	String fileName = dirList.get(i).getName();
    	        	
    	        	if(fileName.indexOf(prd_file_name) != -1){
    	        		fileMove(oldDestFileDir+fileName, newDestFileDir+fileName.replace(prd_file_name, prd_mst_cd));	//파일이동
    	        	}
    	        }
    	        result = 0;
            }catch(NullPointerException e){
            	result = -1;
            }
        }else{
        	//이동전의 Temp 폴더에 있는 파일들을 읽는다.
            List<File> dirList = getDirFileList(oldDestFileDir);
            try{
            	if(dirList!=null) {
            		//폴더의 사이즈만큼 돌면서 파일을 이동시킨다.
        	        for (int i=0; i<dirList.size(); i++)
        	        {
        	        	//i번째 저장되어 있는 파일을 불러온다.
        	        	String fileName = dirList.get(i).getName();
        	        	
        	        	if(fileName.indexOf(prd_file_name) != -1){
        	        		fileMove(oldDestFileDir+fileName, newDestFileDir+fileName.replace(prd_file_name, prd_mst_cd));	//파일이동
        	        	}
        	        }
            	}
            	result = 0;
            }catch(NullPointerException e){
            	result = -1;
            }
        }
        

        return result;
    }
	
	 /**
	* <pre>
	* 1. MethodName : fileCopy
	* 2. ClassName : FileUpload.java
	* 3. Comment : 설명추가부분 
	* 4. 작성자 : 파일을 복사하는 메소드
	* 5. 작성일 : 2015. 12. 9.
	* </pre>
	*
	* @param inFileName
	* @param outFileName
	*/
	public static void fileCopy(String inFileName, String outFileName) {
	  try {
	   FileInputStream fis = new FileInputStream(inFileName);
	   FileOutputStream fos = new FileOutputStream(outFileName);
	   
	   int data = 0;
	   while((data=fis.read())!=-1) {
	    fos.write(data);
	   }
	   fis.close();
	   fos.close();
	   
	  } catch (IOException e) {
	   // TODO Auto-generated catch block
	   e.printStackTrace();
	  }
	 }
	
	 /**
	* <pre>
	* 1. MethodName : fileMove
	* 2. ClassName : FileUpload.java
	* 3. Comment : 파일을 이동하는 메소드 
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 12. 9.
	* </pre>
	*
	* @param inFileName
	* @param outFileName
	*/
	public void fileMove(String inFileName, String outFileName) {
	  try {
	   FileInputStream fis = new FileInputStream(inFileName);
	   FileOutputStream fos = new FileOutputStream(outFileName);
	   
	   int data = 0;
	   while((data=fis.read())!=-1) {
	    fos.write(data);
	   }
	   fis.close();
	   fos.close();
	   
	   //복사한뒤 원본파일을 삭제함
	   delete(inFileName);
	   
	  } catch (IOException e) {
	   // TODO Auto-generated catch block
	   e.printStackTrace();
	  }
	 }
	 
	 /**
	* <pre>
	* 1. MethodName : getDirFileList
	* 2. ClassName : FileUpload.java
	* 3. Comment : 디렉토리의 파일 리스트를 읽는 메소드
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 12. 9.
	* </pre>
	*
	* @param dirPath
	* @return
	*/
	public static List<File> getDirFileList(String dirPath)
	 {
	  // 디렉토리 파일 리스트
	  List<File> dirFileList = null;
	  
	  // 파일 목록을 요청한 디렉토리를 가지고 파일 객체를 생성함
	  File dir = new File(dirPath);
	  
	  // 디렉토리가 존재한다면
	  if (dir.exists())
	  {
	   // 파일 목록을 구함
	   File[] files = dir.listFiles();
	   
	   // 파일 배열을 파일 리스트로 변화함 
	   dirFileList = Arrays.asList(files);
	  }
	  
	  return dirFileList;
	 }
	 
}