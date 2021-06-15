package com.market.mall.am.accounting.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.accounting.service
 * @FileName : ShopInqService.java
 * @Date : 2015. 11. 12.
 * @프로그램 설명 : 관리자 > 게시판관리 > 입점업체문의사항를 처리하는 Service Interface
 * @author khcho
 */
public interface CompanyAccountingService {

    
    /**
    * <pre>
    * 1. MethodName : selectCompanyAccountingList
    * 2. ClassName  : AccountingService.java
    * 3. Comment    : 관리자 > 정산관리 > 업체정산 조회 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2016. 04. 07.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCompanyAccountingList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectVdrMstList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectAdmMstList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectJungsanYearList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectJungsanMonthList (Map<String, Object> commandMap) throws Exception;
    
    public int insertAccountingRequest(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
    public List<Map<String, Object>> selectCompanyAccountingDetail (Map<String, Object> commandMap) throws Exception;
    
    public int updateAccountingRequestCnfm(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
}
