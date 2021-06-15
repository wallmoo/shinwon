package com.market.mall.am.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.product.service.BasicProductService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.product.controller
 * @FileName : ProductImageController.java
 * @Date : 2014. 6. 20.
 * @프로그램 설명 : 관리자 > 상품관리 > 상품상세 > 상품이미지 등록 및 리사이징을 처리하는 Controller Class
 * @author 이상준
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class ProductImageController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="fileUpload") private FileUpload fileUpload;
    @Resource(name="basicProductService") private BasicProductService basicProductService;
    @Resource(name="commonService") private CommonService commonService;
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;

    /**
     * <pre>
     * 1. MethodName : productImageForm
     * 2. ClassName  : ProductImageController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품상세 > 상품이미지 등록 팝업
     * 4. 작성자       : 이상준
     * 5. 작성일       : 2014. 6. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/basicProductImageForm")
    public ModelAndView basicProductImageForm(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //RETURN OBJECT
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : productImageSubmitJson
     * 2. ClassName  : ProductImageController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품상세 > 상품이미지 등록 처리
     * 4. 작성자       : 이상준
     * 5. 작성일       : 2014. 6. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/upload/basicProductImageSubmitJson")
    public JSON basicProductImageSubmitJson(HttpServletRequest request, HttpServletResponse response, Map<String, Object> commandMap) throws Exception {

        JSON json = new JSON();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);

        String pathType = StringUtil.getString(commandMap.get("pathType"),"default");
        String Allow = StringUtil.getString(commandMap.get("Allow"),"image");
        String dateFolderFlag = StringUtil.getString(commandMap.get("dateFolderFlag"),"");
        commandMap.put("makeThumbnail", "Y");
        

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("upload");
        
        if (file!=null){
            commandMap = fileUpload.productImageExecute(commandMap, file, pathType, Allow, dateFolderFlag);
        }

        json.put("data", commandMap);

        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : productImageRemoveJson
     * 2. ClassName  : ProductImageController.java
     * 3. Comment    : 기등록된 이미지 삭제 
     * 4. 작성자       : 이상준
     * 5. 작성일       : 2014. 6. 23.
     * </pre>
     *
     * @param request
     * @param response
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/upload/basicProductImageRemoveJson")
    public JSON basicProductImageRemoveJson(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {

        JSON json = new JSON();

        String[] image_info = StringUtil.getString(commandMap.get("image_info")).split("\\|");
        String upload_path = propertiesService.getString("file.cdn.uploadPath");
        String directory_path = image_info[0];
        String file_name = image_info[2];
        
        File file = new File( upload_path + directory_path + file_name );
       	file.delete();
       	
        json.put("data", commandMap);

        return json;
    }
    
}
