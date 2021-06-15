package com.market.mall.pc.common.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.ExceptionDepthComparator;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.pc.common.service
 * @FileName : CommonService.java
 * @Date : 2014. 6. 25.
 * @프로그램 설명 : 프론트 > 공통로직을 처리하는 Service Interface
 * @author LJH
 */
public interface CommonService {

	/**
	 * <pre>
	 * 1. MethodName	: selectCode
	 * 2. ClassName		: CommonService.java
     * 3. Comment    	: 공통코드 하위코드 조회 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 6. 25. 오후 2:35:07
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param code
	 * @return
	 * @throws Exception
	 */
     public List<Map<String, Object>> selectCode (String code) throws Exception;
     
     /**
    * <pre>
    * 1. MethodName : selectCodeIdxList
    * 2. ClassName : CommonService.java
    * 3. Comment : 코드 IDX로 하위 코드 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 19.
    * </pre>
    *
    * @param code
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCodeIdxList (String code) throws Exception;
     
     /**
      * <pre>
      * 1. MethodName	: selectCodes
      * 2. ClassName	: CommonService.java
      * 3. Comment    	: 공통 코드 묶음 하위 코드 조회 
      * 4. 작성자		: LeeJongHo
      * 5. 작성일		: 2014. 6. 25. 오후 2:35:29
      * </pre>
      *
      * @return Map<String,Object>
      * @param codes
      * @return
      * @throws Exception
      */
     public Map<String, Object> selectCodes (String[] codes) throws Exception;
     
     /**
      * <pre>
      * 1. MethodName	: selectTopCode
      * 2. ClassName	: CommonService.java
      * 3. Comment    	: 공통코드 하위코드 조회 
      * 4. 작성자		: LeeJongHo
      * 5. 작성일		: 2014. 6. 25. 오후 2:35:53
      * </pre>
      *
      * @return List<Map<String,Object>>
      * @param code
      * @return
      * @throws Exception
      */
     public List<Map<String, Object>> selectTopCode (String code) throws Exception;
     
     /**
      * <pre>
      * 1. MethodName	: selectTopCodes
      * 2. ClassName	: CommonService.java
      * 3. Comment    	: 공통 코드 묶음 하위 코드 조회
      * 4. 작성자		: LeeJongHo
      * 5. 작성일		: 2014. 6. 25. 오후 2:36:22
      * </pre>
      *
      * @return Map<String,Object>
      * @param codes
      * @return
      * @throws Exception
      */
     public Map<String, Object> selectTopCodes (String[] codes) throws Exception;
     
     
     /**
      * <pre>
      * 1. MethodName	: selectCodeInfo
      * 2. ClassName	: CommonService.java
      * 3. Comment    	: 공통 코드 상세 정보 
      * 4. 작성자		: LeeJongHo
      * 5. 작성일		: 2014. 6. 25. 오후 2:36:44
      * </pre>
      *
      * @return Map<String,Object>
      * @param commandMap
      * @return
      * @throws Exception
      */
     public Map<String, Object> selectCodeInfo (Map<String, Object> commandMap) throws Exception;
     
     /**
      * <pre>
      * 1. MethodName	: updateCommonFileDownCount
      * 2. ClassName	: CommonService.java
      * 3. Comment    	: 파일 다운로드 수 증가
      * 4. 작성자		: LeeJongHo
      * 5. 작성일		: 2014. 6. 25. 오후 2:37:39
      * </pre>
      *
      * @return int
      * @param commandMap
      * @return
      * @throws Exception
      */
     public int updateCommonFileDownCount (Map<String, Object> commandMap) throws Exception;
     
     /**
      * <pre>
      * 1. MethodName	: selectCommonZipCodeListCount
      * 2. ClassName		: CommonService.java
      * 3. Comment    : 우편번호 검색 목록 갯수 
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
     * 1. MethodName	: selectRegistInfo
     * 2. ClassName		: CommonService.java
     * 3. Comment    	: 게시글의 등록자 확인 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 25. 오후 2:39:08
    * ========================================================
    * 
    * 설명 : 게시글 등록자와 로그인한 사용자를 비교한다.
    * 
    * ┌─필수 Parameter Info───────────────────────────────────
    * TABLE_NM : 테이블 명
    * COL_IDX : 테이블 고유 번호COLUMN명
    * COL_REG_ID : 게시글 등록자 ID COLUMN명
    * COL_IDX_VALUE : 테이블 고유 번호
    * └───────────────────────────────────────────────────────
    * ========================================================
     * </pre>
     *
     * @return String
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public String selectRegistInfo (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    

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
    * 1. MethodName : selectCardBoardList
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 카드 이벤트 안내 목록
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 8. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCardBoardList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCardBoardInfo
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 카드 이벤트 안내 상세
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 8. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectCardBoardInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
	* <pre>
	* 1. MethodName : selectPopupList
	* 2. ClassName  : CommonService.java
	* 3. Comment    : 팝업
	* 4. 작성자       : 이미정
	* 5. 작성일       : 2014. 9. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
    public List<Map<String, Object>> selectPopupList(Map<String, Object> commandMap) throws Exception;
    
    /**
   	* <pre>
   	* 1. MethodName : selectPopupList
   	* 2. ClassName  : CommonService.java
   	* 3. Comment    : 팝업
   	* 4. 작성자      	 	: 이미정
   	* 5. 작성일       		: 2014. 9. 4.
   	* </pre>
   	*
   	* @param commandMap
   	* @return
   	* @throws Exception
   	*/
    public Map<String, Object> selectPopupInfo(Map<String, Object> commandMap) throws Exception;

    public Map<String, Object> selectTimeSalePopup(Map<String, Object> commandMap) throws Exception;
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectMapLocation
     * 2. ClassName		: CommonService.java
     * 3. Commnet		: 주소명으로 GPS 좌표값 얻기
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 10. 13. 오후 2:01:25
     * </pre>
     *
     * @return Map<String,Object>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectMapLocation(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName	: selectGnbCategoryList
     * 2. ClassName		: CommonService.java
     * 3. Comment    	: 상담 GNB영역 메뉴 조회 
     * 4. 작성자			: 이미정
     * 5. 작성일			: 2014. 11. 18.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectGnbCategoryList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectGnbMenuList() throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectRealSearchTextList
    * 2. ClassName : CommonService.java
    * 3. Comment : 실시간 검색어 목록
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 23.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectRealSearchTextList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectRecentProductList
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 퀵메뉴 > 최근 본 상품 목록
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectRecentProductList (Map<String,Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName : selectIpCheckCount
     * 2. ClassName : CommonService.java
     * 3. Comment : 날씨 > IP 정보 DB 에 있는 지 체크 
     * 4. 작성자 : Lee
     * 5. 작성일 : 2016. 2. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectIpCheckCount(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName : selectIpLocationInfo
     * 2. ClassName : CommonService.java
     * 3. Comment : 날씨> IP 정보 반환 
     * 4. 작성자 : Lee
     * 5. 작성일 : 2016. 2. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map selectIpLocationInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertLocationIp
	 * 2. ClassName : CommonService.java
	 * 3. Comment : 날씨 > IP 정보 등록 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 4.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertLocationIp(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectAppIntroBannerList
	* 2. ClassName  : CommonService.java
	* 3. Comment    : 모바일 > app > 인트로
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 10.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public  List<Map<String, Object>> selectAppIntroBannerList (Map<String,Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCodeUpInfo
	 * 2. ClassName : CommonService.java
	 * 3. Comment : 내 코드와 상위 코드의 이름을 가져 온다. 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 14.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectCodeUpInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : updateLocationIp
	 * 2. ClassName : CommonService.java
	 * 3. Comment : 등록된 IP 가 있을 경우 바뀐 주소로 정보 업데이트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 14.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateLocationIp(Map<String, Object> commandMap) throws Exception;

	public Map<String, Object> selectIpYongsanTopInfo(Map<String, Object> commandMap) throws Exception;
	
	public String getAppName() throws Exception;

	public Map<String, Object> testUploadMultiImage(MultipartHttpServletRequest request, Map<String, Object> commandMap)throws Exception;
	
	public String testDeleteMultiImage(Map<String, Object> commandMap) throws Exception;
}
