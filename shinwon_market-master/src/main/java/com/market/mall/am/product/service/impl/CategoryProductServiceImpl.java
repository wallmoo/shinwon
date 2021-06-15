package com.market.mall.am.product.service.impl;

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

import com.epasscni.common.exception.FileUploadException;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.product.service.CategoryProductService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.product.service.impl
 * @FileName : CategoryProductServiceImpl.java
 * @Date : 2014. 4. 14.
 * @프로그램 설명 :  관리자 > 상품관리 > 상품카테고리관리를 처리하는 Service Implement Class
 * @author ejpark
 */
@Service("categoryProductService")
public class CategoryProductServiceImpl implements CategoryProductService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
	@Resource(name="defaultDAO") 
	private CommonDefaultDAO defaultDAO;

    @Autowired 
    private FileUpload fileUpload;
    /**
     * <pre>
     * 1. MethodName : selectCategoryProductList
     * 2. ClassName  : CategoryProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 > 리스트 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 3. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCategoryProductList(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("CategoryProduct.selectCategoryProductList",commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectSubCategoryProductList
     * 2. ClassName  : CategoryProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 > 하위 상품 카테고리 리스트
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 3. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSubCategoryProductList(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("CategoryProduct.selectSubCategoryProductList",commandMap);
    }
	
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectUpperCategoryProductList (Map<String, Object> commandMap) throws Exception
    {
		return defaultDAO.selectList("CategoryProduct.selectUpperCategoryProductList", commandMap);
    }
	
    /**
     * <pre>
     * 1. MethodName : selectCategoryProductView
     * 2. ClassName  : CategoryProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 상세보기
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 3. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectCategoryProductView(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.select("CategoryProduct.selectCategoryProductInfo",commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : insertCategoryProduct
     * 2. ClassName  : CategoryProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 등록 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 3. 24.
     * 6. 수정자	: 이미정,	최종수정일 : 2014. 5. 30.
     * </pre>
     *
     * @param commandMap
     * @return 추가된 카테고리의 카테고리ID ( db seqno )
     * @throws Exception
     */
    public int insertCategoryProduct(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception{
        int result = 0;
        
        result = defaultDAO.insert("CategoryProduct.insertCategoryProduct",commandMap);

        return result;
    }

    /**
     * <pre>
     * 1. MethodName : updateCategoryProduct
     * 2. ClassName  : CategoryProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 수정
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 3. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public int updateCategoryProduct(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception{

        int result = 0;

        /**
         * 상품 카테고리 수정 항목 : 사용여부, 하위 카테고리 정렬 순서
         * 1. 상품 카테고리 설정값(사용여부) 수정
         * 2. 하위 카테고리 정렬 순서 수정
         * 3. 상품 카테고리 사용여부 [미사용] 설정 시 하위 카테고리 상품 판매상태 수정
         *     1) 하위 카테고리에 등록된 상품 판매상태 [판매중지]로 변경
         *     2) 상품 판매상태 변경 이력 저장
         */
        
        //카테고리 설정값 수정; result는 0 일 수도 있음
        result = defaultDAO.update("CategoryProduct.updateCategoryProduct",commandMap);
        
        //수정 하는 카테고리의 하위 뎁스 모두 프론트 노출여부도 변경
        if(result > 0 && commandMap.get("PRD_CTG_DSP_YN").equals("N")){
        	defaultDAO.update("CategoryProduct.updateCategoryChildProduct",commandMap);
        }

        //하위 카테고리 정렬 수정
        String [] PRD_CTG_IDXs = (String[]) commandMap.get("PRD_CTG_IDXs");
        if (PRD_CTG_IDXs != null){
            int cnt = PRD_CTG_IDXs.length;
            if (cnt > 0){
                for(int i=0;i<cnt;i++){
                	Map<String, Object> paramMap = new HashMap<String, Object>();
                	paramMap.put("PRD_CTG_IDX", PRD_CTG_IDXs[i]);
                	paramMap.put("PRD_CTG_SORT", (i+1));
                	paramMap.put("PRD_CTG_UPD_IP", commandMap.get("PRD_CTG_UPD_IP"));
                	paramMap.put("PRD_CTG_UPD_ID", commandMap.get("PRD_CTG_UPD_ID"));
                	paramMap.put("PRD_CTG_DSP_YN", commandMap.get("PRD_CTG_DSP_YN"));
                    defaultDAO.update("CategoryProduct.updateCategoryProductSort", paramMap);
                }
            }
        }

        // 파일첨부
        if(result > 0)
        {
            Admin admin = SessionsAdmin.getSessionAdmin(request);
            commandMap.put("BRD_NTS_REG_IP", request.getRemoteAddr());
            commandMap.put("BRD_NTS_REG_ID", admin.getADM_MST_ID());
            
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_PRD_CTG");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PRD_CTG_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        
                        // 파일 등록 및 파일 업로드
                        defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "category", "image", "Y"));
                    }
                }
            }
        }
        
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : deleteCategoryProduct
     * 2. ClassName  : CategoryProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 삭제
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int deleteCategoryProduct(Map<String, Object> commandMap) throws Exception{
        int result = 0;

        //카테고리 설정값 수정; result는 0 일 수도 있음
        result = defaultDAO.update("CategoryProduct.deleteCategoryProduct",commandMap);
        
        if(result > 0){
        	defaultDAO.update("CategoryProduct.deleteCategorySpecAll",commandMap); // 카테고리에 속한 스펙 삭제
        }

        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : insertCategoryProduct
     * 2. ClassName  : CategoryProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 카테고리 스펙 등록  
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 16.
     * </pre>
     */
    public int insertcategorySpec(Map<String, Object> commandMap) throws Exception{
        int result = 0;
        result = defaultDAO.insert("CategoryProduct.insertcategorySpec",commandMap);
        return result;
    }
    
    
	/**
	* <pre>
	* 1. MethodName : selectSpecCategoryList
	* 2. ClassName : CategoryProductServiceImpl.java
	* 3. Comment : 관리자 > 상품관리 > 카테고리 스펙 리스트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 16.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSpecCategoryList(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("CategoryProduct.selectSpecCategoryList",commandMap);
    }
	
	/**
     * <pre>
     * 1. MethodName : deleteCategorySpec
     * 2. ClassName  : CategoryProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 카테고리 스펙삭제
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int deleteCategorySpec(Map<String, Object> commandMap) throws Exception{
        int result = 0;

        //카테고리 설정값 수정; result는 0 일 수도 있음
        result = defaultDAO.update("CategoryProduct.deleteCategorySpec",commandMap);

        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : deleteCategorySpec
     * 2. ClassName  : CategoryProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 카테고리 스펙 등록여부 
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCategorySpecCount(Map<String, Object> commandMap) throws Exception{
        int result = 0;

        //카테고리 설정값 수정; result는 0 일 수도 있음
        result = defaultDAO.selectCount("CategoryProduct.selectCategorySpecCount",commandMap);

        return result;
    }
    
}
