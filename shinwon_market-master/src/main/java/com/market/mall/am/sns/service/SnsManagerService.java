package com.market.mall.am.sns.service;

import java.util.List;
import java.util.Map;  

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @PackageName: com.market.mall.am.sns.service
 * @FileName : SnsManagerServcie.java
 * @Date : 2016. 8. 17.
 * @프로그램 설명 : 관리자 > SNS관리 처리하는 Controller Class
 * @author DEV_KIMYEONGJUN
 */
public interface SnsManagerService {

    /**
     * <pre>
     * 1. MethodName : selectSnsManagerListCount
     * 2. ClassName  : SnsManagerServcie.java
     * 3. Comment    : 관리자 > SNS관리 > SNS목록 갯수
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectSnsManagerListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectSnsManagerList
     * 2. ClassName  : SnsManagerServcie.java
     * 3. Comment    : 관리자 > SNS관리 > SNS목록
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectSnsManagerList (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertSnsManager
     * 2. ClassName  : SnsManagerService.java
     * 3. Comment    : 관리자 > SNS관리 > SNS등록
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertSnsManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectSnsManagerInfo
     * 2. ClassName  : SnsManagerService.java
     * 3. Comment    : 관리자 > SNS관리 > SNS 상세정보
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectSnsManagerInfo (Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateSnsManager
     * 2. ClassName  : SnsManagerService.java
     * 3. Comment    : 관리자 > SNS관리 > SNS 수정
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception  
     */
    public int updateSnsManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectSnsUseList
     * 2. ClassName  : SnsManagerServcie.java
     * 3. Comment    : 관리자 > SNS관리 > SNS 사용목록
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectSnsUseList (Map<String, Object> commandMap) throws Exception;
     
     
}
