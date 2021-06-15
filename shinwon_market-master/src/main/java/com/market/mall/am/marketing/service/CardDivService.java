package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.marketing.service
 * @FileName : CardDivService.java
 * @Date : 2015. 12. 02.
 * @프로그램 설명 : 관리자 > 마케팅관리 > 카드할부관리 처리하는 Service Interface
 * @author khcho
 */
public interface CardDivService {

    /**
    * <pre>
    * 1. MethodName : selectCardDivListCount
    * 2. ClassName  : CardDivService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드할부관리 목록 갯수 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 02.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCardDivListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCardDivList
    * 2. ClassName  : CardDivService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드할부관리 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 02.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCardDivList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCardDivInfo
    * 2. ClassName  : CardDivService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드할부관리 상세정보 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 02.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectCardDivInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertCardDiv
    * 2. ClassName  : CardDivService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드할부관리 등록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 02.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertCardDiv (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateCardDiv
    * 2. ClassName  : CardDivService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드할부관리 수정 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 02.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateCardDiv (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    
}
