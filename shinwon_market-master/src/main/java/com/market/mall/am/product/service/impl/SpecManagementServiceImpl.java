package com.market.mall.am.product.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.product.service.SpecManagementService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

@Service("specManagementService")
public class SpecManagementServiceImpl implements SpecManagementService {
	
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : selectSpecManagementView
	* 2. ClassName : SpecManagementServiceImpl.java
	* 3. Comment : 상품관리 > 스펙관리 > 스펙 상세
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectSpecManagementView(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.select("SpecManagement.selectSpecManagementInfo",commandMap);
    }
	
	/**
	* <pre>
	* 1. MethodName : selectSubSpecManagementList
	* 2. ClassName : SpecManagementServiceImpl.java
	* 3. Comment : 상품관리 > 스펙관리 > 스펙 하위 카테고리 리스트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSubSpecManagementList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("SpecManagement.selectSubSpecManagementList",commandMap);
    }
	
	/**
	* <pre>
	* 1. MethodName : selectSpecManagementList
	* 2. ClassName : SpecManagementServiceImpl.java
	* 3. Comment : 상품관리 > 스펙관리 > 스펙 리스트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSpecManagementList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("SpecManagement.selectSpecManagementList",commandMap);
    }
	
	/**
     * <pre>
     * 1. MethodName : insertCategoryProduct
     * 2. ClassName  : SpecManagementServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 스펙카테고리 등록 
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 10. 14.
     * </pre>
     *
     * @param commandMap
     * @return 추가된 카테고리의 카테고리ID ( db seqno )
     * @throws Exception
     */
    public int insertSpecManagement(Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
       
        result = defaultDAO.insert("SpecManagement.insertSpecManagement",commandMap);

        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : deleteSpecManagement
     * 2. ClassName  : SpecManagementServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 스펙카테고리 삭제
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 10. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int deleteSpecManagement(Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;

        //카테고리 설정값 수정; result는 0 일 수도 있음
        result = defaultDAO.update("SpecManagement.deleteSpecManagement",commandMap);

        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : updateSpecManagement
     * 2. ClassName  : SpecManagementServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 스펙카테고리 수정
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 10. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateSpecManagement(Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;

        /**
         * 스펙 수정 항목 : 사용여부, 하위 스펙 정렬 순서
         * 1. 스펙 설정값(사용여부) 수정
         * 2. 하위 스펙 정렬 순서 수정
         * 3. 스펙 사용여부 [미사용] 설정 시 하위 카테고리 상품 판매상태 수정
         *     1) 하위 스펙에 등록된 상품 판매상태 [판매중지]로 변경
         *     2) 상품 판매상태 변경 이력 저장
         */
        
        //스펙 설정값 수정; result는 0 일 수도 있음
        result = defaultDAO.update("SpecManagement.updateSpecManagement",commandMap);

        //하위 카테고리 정렬 수정
        String [] PRD_SPC_IDXs = (String[]) commandMap.get("PRD_SPC_IDXs");

        if (PRD_SPC_IDXs != null){
            int cnt = PRD_SPC_IDXs.length;
            if (cnt > 0){
                for(int i=0;i<cnt;i++){
                	Map<String, Object> paramMap = new HashMap<String, Object>();
                	paramMap.put("PRD_SPC_IDX", PRD_SPC_IDXs[i]);
                	paramMap.put("PRD_SPC_SORT", (i+1));
                	paramMap.put("PRD_SPC_UPD_IP", commandMap.get("PRD_SPC_UPD_IP"));
                	paramMap.put("PRD_SPC_UPD_ID", commandMap.get("PRD_SPC_UPD_ID"));
                    result = defaultDAO.update("SpecManagement.updateSpecManagementSort", paramMap);
                }
            }
        }
        
        return result;
    }
    
    /**
	* <pre>
	* 1. MethodName : selectSpecCategoryList
	* 2. ClassName : SpecManagementServiceImpl.java
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
    public List<Map<String, Object>> selectSpecCategoryList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("SpecManagement.selectSpecCategoryList",commandMap);
    }
	
	
	/**
	* <pre>
	* 1. MethodName : selectSubCategoryProductList
	* 2. ClassName : SpecManagementServiceImpl.java
	* 3. Comment : 관리자 > 상품관리 > 상품카테고리 > 하위 스펙 리스트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 19.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> subSpecManagementProductAjax(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("SpecManagement.subSpecManagementProductAjax",commandMap);
    }
	
	/**
	* <pre>
	* 1. MethodName : selectSpecProductCount
	* 2. ClassName : SpecManagementServiceImpl.java
	* 3. Comment : 상품에서 스펙 사용유무 확인
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 20.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectSpecProductCount(Map<String, Object> commandMap) throws Exception 
    {
        int result = defaultDAO.selectCount("SpecManagement.selectSpecProductCount",commandMap);
        return result;
    }

}
