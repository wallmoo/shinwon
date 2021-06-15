package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.marketing.service
 * @FileName : PlanService.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 마케팅관리 > 기획전관리 처리하는 Service Interface
 * @author kanghk
 */
public interface PlanService {

    /**
    * <pre>
    * 1. MethodName : selectPlanListCount
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 목록 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 16.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectPlanListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectPlanList
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 16.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectPlanList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectPlanInfo
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 상세정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 16.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectPlanInfo (Map<String, Object> commandMap) throws Exception;
    
    public Map<String,Object> setSessionAdmin(MultipartHttpServletRequest request, Map<String, Object> commandMap);
    
    public int insertPlanData(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    
    /**
    * <pre>
    * 1. MethodName : insertPlan
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 16.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertPlan (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updatePlan
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 수정 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 16.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updatePlan (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectPlanListCount
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 목록 갯수 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 13.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectProductPlanCount (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPlanList
     * 2. ClassName  : PlanService.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String, Object>> selectProductPlanList (Map<String, Object> commandMap) throws Exception;
     
     public int deletePlanData(Map<String,Object> commandMap) throws Exception;
     
     public int deletePlanDetailGroup(Map<String,Object> commandMap) throws Exception;
     
     public int deletePlanDetail(Map<String,Object> commandMap) throws Exception;
     
     public int updatePlanList(Map<String, Object> commandMap) throws Exception;
}
