package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.marketing.service
 * @FileName : KingerService.java
 * @Date : 2014. 4. 14.
 * @프로그램 설명 : 관리자 > 마케팅 관리 > 이벤트 관리를 처리하는 Service Interface
 * @author kanghk
 */
public interface KingerService {
    

    /**
    * <pre>
    * 1. MethodName : selectKingerTopDspCount
    * 2. ClassName  : KingerService.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 상단노출 갯수
    * 4. 작성자       : hjkim
    * 5. 작성일       : 2020. 06. 08
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectKingerTopDspCount (Map<String, Object> commandMap) throws Exception;

    /**
    * <pre>
    * 1. MethodName : selectKingerListCount
    * 2. ClassName  : KingerService.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 목록 갯수
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * 6. 수정일       : 2020. 06. 08
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectKingerListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectKingerList
    * 2. ClassName  : KingerService.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 목록
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * 6. 수정일       : 2020. 06. 08
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectKingerList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectKingerInfo
    * 2. ClassName  : KingerService.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 상세정보 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 22.
    * 6. 수정일       : 2020. 06. 08
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectKingerInfo (Map<String, Object> commandMap) throws Exception;
    
    
   
    /**
    * <pre>
    * 1. MethodName : insertKinger
    * 2. ClassName  : KingerService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertKinger (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertKingerWin
     * 2. ClassName  : KingerService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 당첨자발표 등록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int insertKingerWin (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateKingerWin
    * 2. ClassName  : KingerService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 당첨여부 수정 
    * 4. 작성자       : khcho	
    * 5. 작성일       : 2015. 12. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateKingerWin (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateKingerWinMst
     * 2. ClassName  : KingerService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 당첨자 발표 수정 
     * 4. 작성자       : khcho	
     * 5. 작성일       : 2015. 12. 23.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int updateKingerWinMst (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    
    
    /**
     * <pre>
     * 1. MethodName : updateKinger
     * 2. ClassName  : KingerService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 수정 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 22.
     * 6. 수정일       : 2020. 06. 08
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int updateKinger (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    

    /**
     * <pre>
     * 1. MethodName : updateKinger
     * 2. ClassName  : KingerService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 수정 
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 06. 08
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateKingerList (Map<String, Object> commandMap) throws Exception;
     
    /**
    * <pre>
    * 1. MethodName : selectKingerEntryListCount
    * 2. ClassName  : KingerService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 상세정보 > 응모자 / 당첨자 목록 갯수 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectKingerEntryListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectKingerEntryList
    * 2. ClassName  : KingerService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 상세정보 > 응모자 / 당첨자 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectKingerEntryList (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectKingerReviewListCount
     * 2. ClassName  : KingerService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 > 리뷰 목록 갯수 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectKingerReviewListCount (Map<String, Object> commandMap) throws Exception;
     
     /**
     * <pre>
     * 1. MethodName : selectKingerReviewList
     * 2. ClassName  : KingerService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 > 리뷰 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public Map<String, Object> selectKingerReviewList (Map<String, Object> commandMap) throws Exception;
    
    
    /**
     * <pre>
     * 1. MethodName : selectKingerEntryListCount
     * 2. ClassName  : KingerService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 응모자 / 당첨자 목록 갯수 
     * 4. 작성자       : kanghk
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectKingerWinListCount (Map<String, Object> commandMap) throws Exception;
     
     /**
     * <pre>
     * 1. MethodName : selectKingerWinList
     * 2. ClassName  : KingerService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 상세정보 > 응모자 / 당첨자 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 22.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public Map<String, Object> selectKingerWinList (Map<String, Object> commandMap) throws Exception;
     
     /**
      * <pre>
      * 1. MethodName : selectKingerWinInfo
      * 2. ClassName  : KingerService.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 상세정보 > 당첨자발표 상세 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 22.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      public Map<String, Object> selectKingerWinInfo (Map<String, Object> commandMap) throws Exception;
    
       
    /**
    * <pre>
    * 1. MethodName : updateKingerEntryWinner
    * 2. ClassName  : KingerService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자 수정 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 22.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateKingerEntryWinner (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
 
 	
	/**
	* <pre>
	* 1. MethodName : updateKingerWin
	* 2. ClassName : KingerService.java
	* 3. Comment : 관리자 > 마케팅 관리 > 고객체험단 상세정보 > 당첨여부업데이트
	* 4. 작성자 : khcho
	* 5. 작성일 : 2015. 12. 22.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateKingerWin(HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateKingerReviewBest
	* 2. ClassName : KingerService.java
	* 3. Comment : 관리자 > 마케팅 관리 > 고객체험단 상세정보 > 리뷰 베스트여부 업데이트
	* 4. 작성자 : khcho
	* 5. 작성일 : 2015. 12. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateKingerReviewBest(HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
	
 	
	/**
	* <pre>
	* 1. MethodName : selectKingerActivePopupListCount
	* 2. ClassName  : KingerService.java
	* 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 이미지형 팝업 상세정보 
	* 4. 작성자       : khcho
	* 5. 작성일       : 2015. 12. 20.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectKingerActivePopupListCount (Map<String, Object> commandMap) throws Exception;
	
	/**
    * <pre>
    * 1. MethodName : selectKingerActivePopupList
    * 2. ClassName  : KingerService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 이미지형 팝업 상세정보 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 20.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectKingerActivePopupList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectKingerMailInfo (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectKingerReviewMailInfo (Map<String, Object> commandMap) throws Exception;
	
    public List<Map<String, Object>> selectKingerEntryUrlList (Map<String, Object> commandMap) throws Exception;
	
}
