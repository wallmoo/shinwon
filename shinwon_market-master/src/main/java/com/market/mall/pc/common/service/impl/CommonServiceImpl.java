package com.market.mall.pc.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.pc.common.service.CommonService;

import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * @PackageName: com.market.mall.pc.common.service.impl
 * @FileName : CommonServiceImpl.java
 * @Date : 2014. 6. 25.
 * @프로그램 설명 : 프론트 > 공통로직을 처리하는 Service Implement Class
 * @author LJH
 */
@Service("pcCommonService")
public class CommonServiceImpl implements CommonService{

	@Resource(name = "propertiesService")	protected EgovPropertyService propertiesService;
    @Resource(name="defaultDAO")	private CommonDefaultDAO defaultDAO;
    @Autowired
    private FileUpload fileUpload;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
     * <pre>
     * 1. MethodName	: selectCode
     * 2. ClassName		: CommonServiceImpl.java
     * 3. Comment    	: 공통코드 조회 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 25. 오후 2:43:28
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCode (String code) throws Exception
    {
        return (List<Map<String, Object>>)defaultDAO.selectList("PcCommon.selectCodeList", Code.class.getDeclaredField(code).get(Code.class).toString());
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCodeIdxList
    * 2. ClassName : CommonServiceImpl.java
    * 3. Comment : 코드 IDX로 하위 코드 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 19.
    * </pre>
    *
    * @param code
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCodeIdxList (String code) throws Exception
    {
        return (List<Map<String, Object>>)defaultDAO.selectList("PcCommon.selectCodeList", code);
    }
    
    /**
     * <pre>
     * 1. MethodName	: selectCodes
     * 2. ClassName		: CommonServiceImpl.java
     * 3. Comment    	: 공통코드 묶음
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 25. 오후 2:44:02
     * </pre>
     *
     * @param codes
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCodes(String[] codes) throws Exception 
    {
        Map<String, Object> codeMap = new HashMap<String, Object>();
        
        for(int i=0;i<codes.length;i++)
        {
            codeMap.put(codes[i].toString(),defaultDAO.selectList("PcCommon.selectCodeList", Code.class.getDeclaredField(codes[i]).get(Code.class).toString()) );
        }
        return codeMap;
    }
    
    /**
     * <pre>
     * 1. MethodName	: selectCodeInfo
     * 2. ClassName		: CommonServiceImpl.java
     * 3. Comment    	: 공통코드 상세 정보 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 25. 오후 2:44:27
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectCodeInfo (Map<String, Object> commandMap) throws Exception
    {
        return (Map<String, Object>)defaultDAO.select("PcCommon.selectCodeInfo", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName	: selectTopCode
     * 2. ClassName		: CommonServiceImpl.java
     * 3. Comment    	: 공통코드 조회  
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 25. 오후 2:44:51
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
   public List<Map<String, Object>> selectTopCode (String code) throws Exception
   {
       return (List<Map<String, Object>>)defaultDAO.selectList("PcCommon.selectTopCodeList", Code.class.getDeclaredField(code).get(Code.class).toString());
   }
   
    /**
     * <pre>
     * 1. MethodName	: selectTopCodes
     * 2. ClassName		: CommonServiceImpl.java
     * 3. Comment    	: 공통코드 묶음 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 25. 오후 2:45:15
     * </pre>
     *
     * @param codes
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectTopCodes (String [] codes) throws Exception
   {
       Map<String, Object> codeMap = new HashMap<String, Object>();
       
       for(int i=0;i<codes.length;i++)
       {
           codeMap.put(codes[i].toString(),defaultDAO.selectList("PcCommon.selectTopCodeList", Code.class.getDeclaredField(codes[i]).get(Code.class).toString()) );
       }
       return codeMap;
   }
    
    /**
     * <pre>
     * 1. MethodName	: updateCommonFileDownCount
     * 2. ClassName		: CommonServiceImpl.java
     * 3. Comment    	: 파일 다운로드 수 증가 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 25. 오후 2:46:01
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCommonFileDownCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.update("PcCommon.updateCommonFileDownCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName	: selectCommonZipCodeListCount
     * 2. ClassName		: CommonServiceImpl.java
     * 3. Comment    	: 우편번호 검색 목록 갯수  
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 25. 오후 2:46:33
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCommonZipCodeListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("PcCommon.selectCommonZipCodeListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName	: selectCommonZipCodeList
     * 2. ClassName		: CommonServiceImpl.java
     * 3. Comment    	: 우편번호 검색 목록  
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 25. 오후 2:46:57
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCommonZipCodeList (Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.selectList("PcCommon.selectCommonZipCodeList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName	: selectRegistInfo
     * 2. ClassName		: CommonServiceImpl.java
     * 3. Comment    	: 게시글의 등록자 확인 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 25. 오후 2:47:24
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
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public String selectRegistInfo (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        String resultCode = "";
        String regId = StringUtil.getString(defaultDAO.selectStr("PcCommon.selectRegistInfo", commandMap), "");
        if(!"".equals(regId))
        {
            if(SessionsUser.isLogin(request))
            {
                User user = SessionsUser.getSessionUser(request);
                if(regId.equals(user.getMEM_MST_MEM_ID()))
                {
                    resultCode = "0";
                }
                else
                {
                    resultCode = "-2";
                    logger.info("========================================================================");
                    logger.info("resultCode : -2, resultMessage : 회원정보가 일치하지 않는 사용자 입니다.");
                    logger.info("========================================================================");
                }
            }
            else
            {
                resultCode = "-3";
                logger.info("========================================================================");
                logger.info("resultCode : -3, resultMessage : 로그인하지 않았습니다.");
                logger.info("========================================================================");
                //throw new PcAuthenticationException();
            }
        }
        else
        {
            resultCode = "-1";
            logger.info("=============================================================");
            logger.info("resultCode : -1, resultMessage : 존재하지 않는 게시글 입니다.");
            logger.info("=============================================================");
        }
        
        return resultCode;
    }

    /**
     * <pre>
     * 1. MethodName : selectZipcodeSigunguList
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 우편번호 검색 팝업에서 시/도 를 선택 후 해당 시/군/구 목록을 반환 
     * 4. 작성자       : 이상준
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
	public List<Map<String, Object>> selectZipcodeSigunguList(
			Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("PcCommon.selectZipcodeSigunguList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectCardBoardList
	* 2. ClassName  : CommonServiceImpl.java
	* 3. Comment    : 카드 이벤트 안내 목록
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 8. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCardBoardList(Map<String, Object> commandMap) throws Exception{
		return defaultDAO.selectList("PcCommon.selectCardBoardList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectCardBoardInfo
	* 2. ClassName  : CommonServiceImpl.java
	* 3. Comment    : 카드 이벤트 안내 상세
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 8. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCardBoardInfo(Map<String, Object> commandMap) throws Exception{
		return defaultDAO.select("PcCommon.selectCardBoardInfo", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectPopupList
	* 2. ClassName  : CommonServiceImpl.java
	* 3. Comment    : 팝업
	* 4. 작성자       : 이미정
	* 5. 작성일       : 2014. 9. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPopupList(Map<String, Object> commandMap) throws Exception{
		return defaultDAO.selectList("PcCommon.selectPopupList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectPopupList
	* 2. ClassName  : CommonServiceImpl.java
	* 3. Comment    : 팝업
	* 4. 작성자       : 이미정
	* 5. 작성일       : 2014. 9. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPopupInfo(Map<String, Object> commandMap) throws Exception{
		return defaultDAO.select("PcCommon.selectPopupInfo", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTimeSalePopup(Map<String, Object> commandMap) throws Exception{
		return defaultDAO.select("PcCommon.selectTimeSalePopup", commandMap);
	}

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMapLocation
     * 2. ClassName		: CommonServiceImpl.java
     * 3. Commnet		: 주소명으로 GPS 좌표값 얻기
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 10. 13. 오후 1:58:28
     * </pre>
     *
     * @return Map<String,Object>
     * @param commandMap
     *     ADDR1	주소명
     * @return
     *     POINT_X	경도(X좌표)
     *     POINT_Y	위도(Y좌표)
     * @throws Exception
     */
	public Map<String, Object> selectMapLocation( final Map<String, Object> commandMap) throws Exception 
    {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
		String daum_local_api_key = this.propertiesService.getString("daum.map.api.key");
		String daum_local_api_url = this.propertiesService.getString("daum.local.api.url");
		
		HttpClient client = new HttpClient();
		
		HttpMethod method = new GetMethod(daum_local_api_url);

		NameValuePair nvp1= new NameValuePair("apikey", daum_local_api_key);
        NameValuePair nvp2= new NameValuePair("output", "json");
        NameValuePair nvp3= new NameValuePair("q", StringUtil.getString(commandMap.get("ADDR1")));
		
		method.setQueryString(new NameValuePair[]{nvp1,nvp2, nvp3});
		
		int statusCode = client.executeMethod(method);
		
		String qry_result = method.getResponseBodyAsString();
		
		logger.debug("Address>>> "+StringUtil.getString(commandMap.get("ADDR1")));
		logger.debug("QueryString>>> "+method.getQueryString());
        logger.debug("Status Text>>>"+HttpStatus.getStatusText(statusCode));
        logger.debug("QueryResult Text>>>"+qry_result);
        
        String[] result_arr = qry_result.split(",");
        String k = "";
        String v = "";
        String point_X = "";
        String point_Y = "";
        
        for(String result:result_arr){
        	result = result.replaceAll("\\\"", "");
        	if(result.indexOf(":")>-1 && result.split(":").length>=2){
        		System.out.println(result);
        		k = result.split(":")[0];
        		v = result.split(":")[1];
        		if("point_x".equals(k)){
            		point_X = v;
        		}
        		if("point_y".equals(k)){
            		point_Y = v;
        		}
        	}
        }

        resultMap.put("POINT_X", point_X);
        resultMap.put("POINT_Y", point_Y);

    	return resultMap;
    }
	
	 /**
     * <pre>
     * 1. MethodName	: selectGnbCategoryList
     * 2. ClassName		: CommonServiceImpl.java
     * 3. Comment    	: 상담 GNB영역 메뉴 조회 
     * 4. 작성자			: 이미정
     * 5. 작성일			: 2014. 11. 18.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectGnbCategoryList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("PcCommon.selectGnbCategoryList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectRealSearchTextList
    * 2. ClassName : CommonServiceImpl.java
    * 3. Comment : 실시간 검색어 목록
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 23.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRealSearchTextList (Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.selectList("PcCommon.selectRealSearchTextList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectRecentProductList
    * 2. ClassName  : CommonServiceImpl.java
    * 3. Comment    : 퀵메뉴 > 최근 본 상품 목록
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectRecentProductList (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.selectList("PcCommon.selectRecentProductList", commandMap);
    }
    
    /**
	   * 
	   * <pre>
	   * 1. MethodName : selectIpCheckCount
	   * 2. ClassName : CommonServiceImpl.java
	   * 3. Comment : 날씨 > IP 정보 DB 에 있는 지 체크 
	   * 4. 작성자 : Lee
	   * 5. 작성일 : 2016. 2. 4.
	   * </pre>
	   *
	   * @param commandMap
	   * @return
	   * @throws Exception
	   */
	public int selectIpCheckCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("PcCommon.selectIpCheckCount", commandMap);
	}
	
	/**
     * 
     * <pre>
     * 1. MethodName : selectIpLocationInfo
     * 2. ClassName : CommonServiceImpl.java
     * 3. Comment : 날씨> IP 정보 반환 
     * 4. 작성자 : Lee
     * 5. 작성일 : 2016. 2. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map selectIpLocationInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("PcCommon.selectIpLocationInfo", commandMap);
	}

	/**
     * 
     * <pre>
     * 1. MethodName : insertLocationIp
     * 2. ClassName : CommonServiceImpl.java
     * 3. Comment : 날씨> IP 정보 등록  
     * 4. 작성자 : Lee
     * 5. 작성일 : 2016. 2. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public int insertLocationIp(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.insert("PcCommon.insertLocationIp", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectAppIntroBannerList
	* 2. ClassName  : CommonServiceImpl.java
	* 3. Comment    : 모바일 > app > 인트로
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 10.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAppIntroBannerList (Map<String,Object> commandMap) throws Exception
	{
		Map<String, Object> bannerMap = new HashMap<String, Object>();
    	bannerMap.put("BANNER_IDX", Code.MOBILE_APP_INTRO_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", "M");
    	
    	return defaultDAO.selectList("PcCommon.selectAppIntroBannerList", bannerMap);
	}

	public Map selectCodeUpInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("PcCommon.selectCodeUpInfo", commandMap);
	}

	public int updateLocationIp(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.update("PcCommon.updateLocationIp", commandMap);
	}

	public Map<String, Object> selectIpYongsanTopInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("PcCommon.selectIpYongsanTopInfo", commandMap);
	}

	@Override
	public String getAppName() throws Exception {
		// TODO Auto-generated method stub
		return StringUtil.getString(propertiesService.getString("app.name"),"");
	}
	@Override
	public Map<String, Object> testUploadMultiImage(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
	    String pathType = StringUtil.getString(commandMap.get("pathType"), "default");
	    String Allow = StringUtil.getString(commandMap.get("Allow"), "image");
	    String dateFolderFlag = StringUtil.getString(commandMap.get("dateFolderFlag"), "");
	    commandMap.put("makeThumbnail", "Y");
	    CommonsMultipartFile file = (CommonsMultipartFile)request.getFile("upload");
	    commandMap = this.fileUpload.productImageExecute(commandMap, file, pathType, Allow, dateFolderFlag);
	    return commandMap;
	  }
	@Override
	  public String testDeleteMultiImage(Map<String, Object> commandMap) throws Exception {
	    String resultCode = "";
	    int result = 0;
	    commandMap.put("CMM_FLE_SYS_NM", StringUtil.getString(commandMap.get("createdUUID"), "").replace("/", ""));
	    Map<String, Object> fileMap = this.defaultDAO.select("Common.selectCommonFileInfo", commandMap);
	    if (!StringUtil.nullCheck(fileMap)) {
	      result = this.defaultDAO.update("Common.deleteCommonFileUUID", fileMap);
	      if (result > 0) {
	        this.fileUpload.delete(StringUtil.getString(fileMap.get("CMM_FLE_SAVE_PATH"), ""));
	        resultCode = "true";
	      } 
	    } else {
	      resultCode = "false";
	    } 
	    return resultCode;
	  }

	@Override
	public List<Map<String, Object>> selectGnbMenuList() throws Exception {
		return this.defaultDAO.selectList("PcCommon.selectGnbMenuList", null);
	}    
}
