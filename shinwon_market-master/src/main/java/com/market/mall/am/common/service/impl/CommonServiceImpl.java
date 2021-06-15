package com.market.mall.am.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.common.service.impl
 * @FileName : CommonCodeServiceImpl.java
 * @Date : 2014. 3. 24.
 * @프로그램 설명 : 공통코드를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("commonService")
public class CommonServiceImpl implements CommonService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    /**
     * <pre>
     * 1. MethodName : selectErpCode
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 공통코드 조회 
     * 4. 작성자       : DEV_KIMSOYOUNG
     * 5. 작성일       : 2014. 4. 07.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectErpCode (String code, String compCd) throws Exception
     {
    	 Map<String, Object> parmMap = new HashMap<String, Object>();
    	 parmMap.put("CODE", code);
    	 parmMap.put("COMP_CD", compCd);
         return (List<Map<String, Object>>)defaultDAO.selectList("Common.selectErpCodeList", parmMap);
     }
    
    /**
    * <pre>
    * 1. MethodName : selectCode
    * 2. ClassName  : CommonServiceImpl.java
    * 3. Comment    : 공통코드 조회 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 3. 24.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCode (String code) throws Exception
    {
        return (List<Map<String, Object>>)defaultDAO.selectList("Common.selectCodeList", Code.class.getDeclaredField(code).get(Code.class).toString());
    }
    /**
     * <pre>
     * 1. MethodName : selectCodeByCode
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 공통코드 조회 (코드받아서)
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 10. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectCodeByCode (String code) throws Exception
     {
         return (List<Map<String, Object>>)defaultDAO.selectList("Common.selectCodeList", code);
     }
    
    /**
    	 * <pre>
    	 * 1. MethodName : selectCodes
    	 * 2. ClassName  : CommonServiceImpl.java
    	 * 3. Comment    : 공통코드 묶음
    	 * 4. 작성자       : epasscni
    	 * 5. 작성일       : 2014. 3. 28.
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
  		    codeMap.put(codes[i].toString(),defaultDAO.selectList("Common.selectCodeList", Code.class.getDeclaredField(codes[i]).get(Code.class).toString()) );
        }
  	    return codeMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCodeInfo
    * 2. ClassName  : CommonServiceImpl.java
    * 3. Comment    : 공통코드 상세 정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 18.
    * </pre>
    *
    * @param CODE
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectCodeInfo (Map<String, Object> commandMap) throws Exception
    {
        return (Map<String, Object>)defaultDAO.select("Common.selectCodeInfo", commandMap);
    }
    
   /**
    * <pre>
    * 1. MethodName : selectTopCode
    * 2. ClassName  : CommonServiceImpl.java
    * 3. Comment    : 공통코드 조회  
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 4.
    * </pre>
    *
    * @param code
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
   public List<Map<String, Object>> selectTopCode (String code) throws Exception
   {
       return (List<Map<String, Object>>)defaultDAO.selectList("Common.selectTopCodeList", Code.class.getDeclaredField(code).get(Code.class).toString());
   }
   
   /**
    * <pre>
    * 1. MethodName : selectTopCodes
    * 2. ClassName  : CommonServiceImpl.java
    * 3. Comment    : 공통코드 묶음 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 4.
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
           codeMap.put(codes[i].toString(),defaultDAO.selectList("Common.selectTopCodeList", Code.class.getDeclaredField(codes[i]).get(Code.class).toString()) );
       }
       return codeMap;
   }
    
    /**
    * <pre>
    * 1. MethodName : updateCommonFileDownCount
    * 2. ClassName  : CommonServiceImpl.java
    * 3. Comment    : 파일 다운로드 수 증가 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateCommonFileDownCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.update("Common.updateCommonFileDownCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCommonZipCodeListCount
    * 2. ClassName  : CommonServiceImpl.java
    * 3. Comment    : 우편번호 검색 목록 갯수  
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 10. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCommonZipCodeListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Common.selectCommonZipCodeListCount", commandMap);
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
    	return defaultDAO.selectList("Common.selectCommonZipCodeList", commandMap);
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
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectZipcodeSigunguList(
			Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("Common.selectZipcodeSigunguList", commandMap);
	}
	
	/**
    * <pre>
    * 1. MethodName : selectBanWrdKeyWord
    * 2. ClassName : CommonServiceImpl.java
    * 3. Comment : 금칙어 키워드 불러오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 10. 8.
    * </pre>
    *
    * @return
    */
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectBanWrdKeyWord (Map<String, Object> commandMap) throws Exception
    {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("BanKeyWord", defaultDAO.select("Common.selectBanWrdKeyWord",commandMap).get("BAN_TXT_LONG_TXT"));
        
        return returnMap;
    }
    
}
