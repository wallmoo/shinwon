package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.site.service
 * @FileName : DelivCompanyService.java
 * @Date : 2014. 4. 1.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 배송업체 관리를 처리하는 Service Interface
 * @author jangsin
 */
public interface DelivCompanyService {

    
    /**
    * <pre>
    * 1. MethodName : selectDelivCompanyListCount
    * 2. ClassName  : DelivCompanyService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 관리 목록 갯수 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectDelivCompanyListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectDelivCompanyList
    * 2. ClassName  : DelivCompanyService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 관리 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectDelivCompanyList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectDelivCompanyInfo
    * 2. ClassName  : DelivCompanyService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 관리 상세정보 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 2.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectDelivCompanyInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertDelivCompany
    * 2. ClassName  : DelivCompanyService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 관리 등록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 2.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertDelivCompany (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateDelivCompany
    * 2. ClassName  : DelivCompanyService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 관리 수정 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 2.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateDelivCompany (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectSimpleDelivCompanyList
    * 2. ClassName  : DelivCompanyService.java
    * 3. Comment    : 택배사 리스트(주문 팝업에서 사용)
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 5. 12.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectSimpleDelivCompanyList (Map<String, Object> commandMap) throws Exception;
}
