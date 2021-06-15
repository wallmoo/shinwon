package com.market.mall.am.logo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.logo.service.LogoService;
import com.market.mall.dao.CommonDefaultDAO;

import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * @PackageName: com.market.mall.am.logo.service.impl
 * @FileName : LogoServiceImpl.java
 * @Date : 2016. 8. 8.
 * @프로그램 설명 : Logo관리를 처리하는 ServiceImplements
 * @author DEV_KIMHYOJOONG
 */
@Service("logoService")
public class LogoServiceImpl implements LogoService{

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired 
    private FileUpload fileUpload;

    @Resource(name="propertiesService")
    private EgovPropertyService propertiesService;

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectLogoList
     * 2. ClassName  : LogoServiceImpl.java
     * 3. Comment    : 로고 목록
     * 4. 작성자       : DEV_KIMHYOJOONG
     * 5. 작성일       : 2016. 8. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectLogoList (Map<String, Object> commandMap) throws Exception{
        return this.defaultDAO.selectList("Logo.selectLogoList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : insertLogo
     * 2. ClassName  : LogoServiceImpl.java
     * 3. Comment    : 로고 등록
     * 4. 작성자       : DEV_KIMHYOJOONG
     * 5. 작성일       : 2016. 8. 9.
     * </pre>
     *
     * @param multipartRequest
     * @param commandMap
     * @return
     * @throws Exception
     */
    public String insertLogo (MultipartHttpServletRequest multipartRequest, Map<String, Object> commandMap) throws Exception{
        String result = "등록되었습니다.";

        // 업로드 로고파일 목록
        @SuppressWarnings({ "unchecked", "rawtypes" })
        List<CommonsMultipartFile> fileList = (List) multipartRequest.getFiles("file");

        Map<String, Object> logoParamMap = new HashMap<String, Object>(); // 로고 등록 정보
        Map<String, Object> uploadFileMap = new HashMap<String, Object>(); // 업로드 파일 정보
        List<String> deleteLogoArray = new ArrayList<String>(); // 삭제 로고파일 목록
        List<String> uploadLogoArray = new ArrayList<String>(); // 등록 로고파일 목록

        String[] LGO_MST_IDX = StringUtil.getArray(commandMap, "LGO_MST_IDX"); // 로고 IDX
        String[] LGO_MST_TYPE = StringUtil.getArray(commandMap, "LGO_MST_TYPE"); // 로고 TYPE
        String[] LGO_MST_SYS_NM = StringUtil.getArray(commandMap, "LGO_MST_SYS_NM"); // 로고 시스템 파일명

        // 물리적 파일 경로
        String logoFilePath = this.propertiesService.getString("file.cdn.uploadPath") + this.propertiesService.getString("file.path.logo") + "/"; 

        try{
            // 로고파일 등록
            commandMap.put("fileSizeYn", "Y");
            long fileSize = 0;
            for(int i=0; i<fileList.size(); i++){
                CommonsMultipartFile file = fileList.get(i);
                
                if(!file.isEmpty()){
                    // 파일 사이즈 체크(1M 제한)
                    fileSize = file.getSize();
                    
                    if(fileSize > 1048576){
                        throw new Exception("size");
                    }

                    // 파일업로드
                    uploadFileMap = this.fileUpload.execute(commandMap, file, "logo", "image", "N");
                    uploadLogoArray.add(logoFilePath + StringUtil.getString(uploadFileMap.get("CMM_FLE_SYS_NM")));

                    // 로고 정보 등록
                    logoParamMap.put("LGO_MST_IDX", LGO_MST_IDX[i]);
                    logoParamMap.put("ADM_MST_ID", commandMap.get("REG_ID"));
                    logoParamMap.put("LGO_MST_TYPE", LGO_MST_TYPE[i]);
                    logoParamMap.put("LGO_MST_SYS_PATH", uploadFileMap.get("CMM_FLE_SYS_PATH"));
                    logoParamMap.put("LGO_MST_ATT_PATH", uploadFileMap.get("CMM_FLE_ATT_PATH"));
                    logoParamMap.put("LGO_MST_ORG_NM", uploadFileMap.get("CMM_FLE_ORG_NM"));
                    logoParamMap.put("LGO_MST_SYS_NM", uploadFileMap.get("CMM_FLE_SYS_NM"));
                    logoParamMap.put("LGO_MST_ATT_SIZE", uploadFileMap.get("CMM_FLE_ATT_SIZE"));
                    logoParamMap.put("REG_IP", commandMap.get("REG_IP"));
                    logoParamMap.put("REG_ID", commandMap.get("REG_ID"));

                    this.defaultDAO.update("Logo.updateLogo", logoParamMap);
                    
                    if(!("").equals(LGO_MST_SYS_NM[i])){
                        deleteLogoArray.add(logoFilePath + LGO_MST_SYS_NM[i]);
                    }

                    logoParamMap.clear();
                    uploadFileMap.clear();
                }
            }
        }catch(Exception e){
            this.logger.error("::::::::::: 로고 등록 처리 Error : " + e.toString());
            e.printStackTrace();

            if(("size").equals(e.getMessage())){
                result = "파일 사이즈는 1M 이하만 가능합니다.";
            }else{
                result = "처리중 오류가 발생하였습니다.";
            }

            // 롤백 처리
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

            // 업로드 로고파일 삭제
            this.deleteLogoFile(uploadLogoArray);
            deleteLogoArray.clear();
        }

        // 이전 로고 파일 삭제
        this.deleteLogoFile(deleteLogoArray);

        uploadLogoArray.clear();
        deleteLogoArray.clear();

        return result;
    }

    /**
     * <pre>
     * 1. MethodName : deleteLogoFile
     * 2. ClassName  : LogoServiceImpl.java
     * 3. Comment    : 로고 파일 삭제 
     * 4. 작성자       : DEV_KIMHYOJOONG
     * 5. 작성일       : 2016. 8. 9.
     * </pre>
     *
     * @param deleteLogoList
     * @throws Exception
     */
    public void deleteLogoFile(List<String> deleteLogoList) throws Exception{
        try{
            // 물리적 파일 삭제
            for(String data : deleteLogoList){
                this.fileUpload.delete(data);
            }
        }catch(Exception e){
            this.logger.error("::::::::::: 로고 삭제 Error : " + e.toString());
            e.printStackTrace();
        }
    }

    /**
     * <pre>
     * 1. MethodName : selectLogoUrl
     * 2. ClassName  : LogoService.java
     * 3. Comment    : 로고 주소
     * 4. 작성자       : LogoServiceImpl
     * 5. 작성일       : 2016. 8. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public String selectLogoUrl (Map<String, Object> commandMap) throws Exception{
        return this.defaultDAO.selectStr("Logo.selectLogoUrl", commandMap);
    }
}
