package com.market.mall.am.common.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.am.common.service
 * @FileName : CommonService.java
 * @Date : 2014. 3. 28.
 * @프로그램 설명 : 공통요소를 처리하는 Service Interface
 * @author epasscni
 */
public interface CommonService {
    
	/**
    * <pre>
    * 1. MethodName : selectErpCode
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 공통코드 하위코드 조회 
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2014. 4. 07.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
	public List<Map<String, Object>> selectErpCode (String code, String compCd) throws Exception;
	
	/**
    * <pre>
    * 1. MethodName : selectCommonList
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 공통코드 하위코드 조회 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 3. 24.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCode (String code) throws Exception;
    
    
    /**
     * <pre>
     * 1. MethodName : selectCodeByCode
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 공통코드 조회 (코드받아서)
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 10. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String, Object>> selectCodeByCode (String code) throws Exception;
     
  	/**
  	* <pre>
  	* 1. MethodName : selectCodes
  	* 2. ClassName  : CommonService.java
  	* 3. Comment    : 공통 코드 묶음 하위 코드 조회 
  	* 4. 작성자       : kanghk
  	* 5. 작성일       : 2014. 4. 4.
  	* </pre>
  	*
  	* @param codes
  	* @return
  	* @throws Exception
  	*/
  	public Map<String, Object> selectCodes (String[] codes) throws Exception;
  	
  	/**
  	* <pre>
  	* 1. MethodName : selectTopCode
  	* 2. ClassName  : CommonService.java
  	* 3. Comment    : 공통코드 하위코드 조회 
  	* 4. 작성자       : kanghk
  	* 5. 작성일       : 2014. 4. 4.
  	* </pre>
  	*
  	* @param code
  	* @return
  	* @throws Exception
  	*/
  	public List<Map<String, Object>> selectTopCode (String code) throws Exception;
  	
  	/**
  	* <pre>
  	* 1. MethodName : selectTopCodes
  	* 2. ClassName  : CommonService.java
  	* 3. Comment    : 공통 코드 묶음 하위 코드 조회
  	* 4. 작성자       : kanghk
  	* 5. 작성일       : 2014. 4. 4.
  	* </pre>
  	*
  	* @param codes
  	* @return
  	* @throws Exception
  	*/
  	public Map<String, Object> selectTopCodes (String[] codes) throws Exception;
  	
  	
  	/**
  	* <pre>
  	* 1. MethodName : selectCodeInfo
  	* 2. ClassName  : CommonService.java
  	* 3. Comment    : 공통 코드 상세 정보 
  	* 4. 작성자       : kanghk
  	* 5. 작성일       : 2014. 4. 17.
  	* </pre>
  	*
  	* @param code
  	* @return
  	* @throws Exception
  	*/
  	public Map<String, Object> selectCodeInfo (Map<String, Object> commandMap) throws Exception;
  	
  	/**
  	* <pre>
  	* 1. MethodName : updateCommonFileDownCount
  	* 2. ClassName  : CommonService.java
  	* 3. Comment    : 파일 다운로드 수 증가
  	* 4. 작성자       : kanghk
  	* 5. 작성일       : 2014. 4. 7.
  	* </pre>
  	*
  	* @param commandMap
  	* @return
  	* @throws Exception
  	*/
  	public int updateCommonFileDownCount (Map<String, Object> commandMap) throws Exception;
  	
  	/**
     * <pre>
     * 1. MethodName	: selectCommonZipCodeListCount
     * 2. ClassName		: CommonService.java
     * 3. Comment       : 우편번호 검색 목록 갯수 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 25. 오후 2:38:04
     * </pre>
     *
     * @return int
     * @param commandMap
     * @return
     * @throws Exception
     */
   public int selectCommonZipCodeListCount (Map<String, Object> commandMap) throws Exception;
    
   /**
    * 
    * <pre>
    * 1. MethodName	: selectCommonZipCodeList
    * 2. ClassName		: CommonService.java
    * 3. Comment    	: 우편번호 검색 목록 
    * 4. 작성자			: LeeJongHo
    * 5. 작성일			: 2014. 6. 25. 오후 2:38:44
    * </pre>
    *
    * @return List<Map<String,Object>>
    * @param commandMap
    * @return
    * @throws Exception
    */
   public List<Map<String, Object>> selectCommonZipCodeList (Map<String, Object> commandMap) throws Exception;
   
   /**
    * <pre>
    * 1. MethodName : selectZipcodeSigunguList
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 우편번호 검색 팝업에서 시/도 를 선택 후 해당 시/군/구 목록을 반환 
    * 4. 작성자       : 이상준
    * 5. 작성일       : 2014. 6. 30.
    * </pre>
    *
    * @param code
    * @return
    * @throws Exception
    */
   public List<Map<String, Object>> selectZipcodeSigunguList(Map<String, Object> commandMap) throws Exception;
   
   /**
	* <pre>
	* 1. MethodName : selectBanWrdKeyWord
	* 2. ClassName : CommonService.java
	* 3. Comment : 금칙어 키워드 불러오기
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 8.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
  public Map<String, Object> selectBanWrdKeyWord (Map<String, Object> commandMap) throws Exception;
   
}
