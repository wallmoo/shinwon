package com.market.mall.am.marketing.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.am.marketing.service.PointService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.marketing.service.impl
 * @FileName : PointServiceImpl.java
 * @Date : 2015. 10. 22.
 * @프로그램 설명 : 관리자 > 프로모션 관리 > 포인트 관리를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("pointService")
public class PointServiceImpl implements PointService{
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    private ErpRequest erpRequest;
    
    /**
    * <pre>
    * 1. MethodName : selectPointListCount
    * 2. ClassName  : PointServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 포인트리스트 관리 목록 갯수 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 27.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectPointListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Point.selectPointListCount", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectPointDetailCount
     * 2. ClassName  : PointServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 포인트리스트 관리 목록 갯수 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectPointDetailCount (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectCount("Point.selectPointDetailCount", commandMap);
     }
    
    /**
    * <pre>
    * 1. MethodName : selectPointList
    * 2. ClassName  : PointServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 포인트 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 10. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectPointList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("Point.selectPointList", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectPointPopup
     * 2. ClassName  : PointServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 포인트 상세 팝업 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 30.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectPointPopup (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectList("Point.selectPointPopup", commandMap);
     }
     
     /**
      * <pre>
      * 1. MethodName : selectPointDetail
      * 2. ClassName  : PointServiceImpl.java
      * 3. Comment    : 관리자 > 프로모션 관리 > 포인트 목록 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 11. 27.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      @SuppressWarnings("unchecked")
      public List<Map<String, Object>> selectPointDetail (Map<String, Object> commandMap) throws Exception
      {
          return defaultDAO.selectList("Point.selectPointDetail", commandMap);
      }
    
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPointMember (List<Map<String, Object>> memberList) throws Exception
    {
    	Map<String, Object> commandMap = new HashMap<String, Object>();
        Map<String, Object> returnMap = new HashMap<String, Object>();
        List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
        for(int i=0;i<memberList.size();i++)
        {
    	    Map<String, Object> tempList = null;
    	    tempList = memberList.get(i);
    	    String MEM_MST_MEM_ID = (String)tempList.get("MEMBER_ID");
    	    
    	    commandMap.put("MEM_MST_MEM_ID", MEM_MST_MEM_ID);
    	    
    	    returnMap = defaultDAO.select("Point.selectPointMember", commandMap);
    	    listMap.add(returnMap);
        }
       
       return listMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : insertPoint
    * 2. ClassName  : PointServiceImpl.java
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
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int insertPoint (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 1;
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("PIT_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("PIT_MST_REG_ID", admin.getADM_MST_ID());
        
        commandMap.put("MEM_PIT_REG_IP", request.getRemoteAddr());
        commandMap.put("MEM_PIT_REG_ID", admin.getADM_MST_ID());
        
        String PIT_MST_GBN = (String)commandMap.get("PIT_MST_GBN");
        String PIT_MST_PIT = (String)commandMap.get("PIT_MST_PIT");
        String PIT_MST_BRK_DWN = (String)commandMap.get("PIT_MST_BRK_DWN");
        
        result = defaultDAO.insert("Point.insertPoint", commandMap);
        // 이벤트 기본정보 등록
        if(result > 0)
        {
	        String [] ID = StringUtil.getArray(commandMap, "ID");
	        String [] ID_CHK = StringUtil.getArray(commandMap, "ID_CHK");
	        
	        commandMap.put("MEM_PIT_GBN",PIT_MST_GBN );
	        commandMap.put("MEM_PIT_BRK_DWN",PIT_MST_BRK_DWN );
	        
	        if("P".equals(PIT_MST_GBN))commandMap.put("MEM_PIT_PLS",PIT_MST_PIT );
	        if("M".equals(PIT_MST_GBN))commandMap.put("MEM_PIT_MNS",PIT_MST_PIT );
	        if("D".equals(PIT_MST_GBN))commandMap.put("MEM_PIT_EXT",PIT_MST_PIT );

	        
	        if(ID_CHK != null)
	        {
		        for(int y = 0;y < ID_CHK.length;y++)
		        {
		        			            
		            commandMap.put("MEM_PIT_MEM_ID",ID_CHK[y] );
		            
		            int MEM_PIT_TOT_PIT = defaultDAO.selectCount("Point.selectPointMemberSum", commandMap);
		            
		            if("M".equals(PIT_MST_GBN) && MEM_PIT_TOT_PIT <  Integer.parseInt(PIT_MST_PIT))
		            {
		            	if("M".equals(PIT_MST_GBN))commandMap.put("MEM_PIT_MNS",MEM_PIT_TOT_PIT );
		            }
		            
		            if("P".equals(PIT_MST_GBN))MEM_PIT_TOT_PIT = MEM_PIT_TOT_PIT + Integer.parseInt(PIT_MST_PIT);
		            else MEM_PIT_TOT_PIT = MEM_PIT_TOT_PIT - Integer.parseInt(PIT_MST_PIT);
		            
		            if(MEM_PIT_TOT_PIT < 0)MEM_PIT_TOT_PIT = 0;
		            
		            commandMap.put("MEM_PIT_TOT_PIT",MEM_PIT_TOT_PIT );
			        
		            result = defaultDAO.insert("Point.insertPointMember", commandMap);
		        }
	        }
        }
        
        //defaultDAO.insert("Point.insertPoint", commandMap);
        
       
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectMemberPointCount
     * 2. ClassName  : PointServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 회원 E포인트 목록객수
     * 4. 작성자       : khcho
     * 5. 작성일       : 2016. 2. 3.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectMemberEpointCount (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectCount("Point.selectMemberPointCount", commandMap);
     }
     /**
      * <pre>
      * 1. MethodName : selectMemberPointCount
      * 2. ClassName  : PointServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 회원 통합포인트 목록객수
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 3.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
     @Override
      public int selectMemberTpointCount (Map<String, Object> commandMap) throws Exception
      {
          return defaultDAO.selectCount("Point.selectMemberPointCount", commandMap);
      }
      /**
       * <pre>
       * 1. MethodName : selectMemberPointCount
       * 2. ClassName  : PointServiceImpl.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 회원 임직원포인트 목록객수
       * 4. 작성자       : khcho
       * 5. 작성일       : 2016. 2. 3.
       * </pre>
       *
       * @param commandMap
       * @return
       * @throws Exception
       */
      @Override
       public int selectMemberSwPointCount (Map<String, Object> commandMap) throws Exception
       {
           return defaultDAO.selectCount("Point.selectMemberPointCount", commandMap);
       }
     /**
      * <pre>
      * 1. MethodName : selectMemberPoint
      * 2. ClassName  : PointServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 회원포인트 목록
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 3.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      @SuppressWarnings("unchecked")
      public List<Map<String, Object>> selectMemberPoint (Map<String, Object> commandMap) throws Exception
      {
          return defaultDAO.selectList("Point.selectMemberPoint", commandMap);
      }
      /**
       * <pre>
       * 1. MethodName : selectMemberPointSum
       * 2. ClassName  : PointServiceImpl.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 회원포인트 목록
       * 4. 작성자       : khcho
       * 5. 작성일       : 2016. 2. 3.
       * </pre>
       *
       * @param commandMap
       * @return
       * @throws Exception
       */
       @SuppressWarnings("unchecked")
       public Map<String, Object> selectMemberPointSum (Map<String, Object> commandMap) throws Exception
       {
           return defaultDAO.select("Point.selectMemberPointSum", commandMap); //E-point 
       }
       
       
       // 신원 통합포인트 잔여(가용) 포인트 조회
       @Override
       public Map<String, Object> getTpointAmount(Map<String,Object> commandMap) throws Exception {
    	   
    	   String eShopId = StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "0");
    	   
    	   Map<String,Object> selectMap = new HashMap<String, Object>();
    	   selectMap.put("ESHOP_ID", eShopId);
    	   
    	  Map<String, Object> returnMap =  ErpRequest.requestMemberPointCheck(selectMap);
    	   return returnMap;
       }
       
       // 신원 통합포인트 사용내역
       @SuppressWarnings("static-access")
       @Override
       public List<Map<String, Object>> selectMyTonghapPointList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
    	    Map<String, Object> selectMap = new HashMap<String, Object>();
	       	selectMap.put("ESHOP_ID",StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"),"0"));
	       	//selectMap.put("ESHOP_ID","ds2bwq");//쇼핑몰 아이디 varchar2(30)
	       	
//	       	selectMap.put("FDATE",StringUtil.remove((String)commandMap.get("searchPointStDt"),'-' ));
	       	selectMap.put("FDATE", "20180611");
	       	selectMap.put("TDATE", StringUtil.remove((String)commandMap.get("searchPointEdDt"),'-' ));
	    
//	       	int cPage = Integer.valueOf(StringUtil.getString(commandMap.get("cPage"), "1"));
//	       	if(cPage != 1) {
//	       		cPage = (cPage*10-9);
//	       	}    	
//	       	selectMap.put("OFFSET",cPage);
	       	selectMap.put("OFFSET",0);
	       	selectMap.put("LIMIT","20");//몇 개의 데이터를 가지고 올 것인지
	       	    	
	   		List<Map<String, Object>> tpnMapList = erpRequest.requestGetPointView(selectMap);
	   		
	   		Collections.sort(tpnMapList, new Comparator<Map<String, Object >>() {
	               @Override
	               public int compare(Map<String, Object> first, Map<String, Object> second) {
	                   return (Integer.valueOf((String) second.get("RANK"))).compareTo( Integer.valueOf((String) first.get("RANK"))); //descending order
	               }
	
	        });
       	
	   		return tpnMapList;
       }
       
       //신원 임직원 포인트 가용포인트 확인 (ERP통신)
       
       //신원 임직원 포인트 
       @Override
       public List<Map<String, Object>> selectEmployeePointList(Map<String, Object> commandMap) throws Exception {
    	    Map<String, Object> selectMap = new HashMap<String, Object>();
       		int year = Calendar.getInstance().get(Calendar.YEAR);
       		String yy = Integer.toString(year);//현재 연도 yyyy
       		selectMap.put("YY", yy);
       		List<Map<String, Object>> list = ErpRequest.requestAnnualWelfarePoints(selectMap);
       	//    	return defaultDAO.select("PcMyPoint.selectMyPointSwOne",commandMap);
       	
       		return list;
       }
       
//     임직원  추가포인트조회
       @Override
       public List<Map<String, Object>> selectUserAddEmpPointLimit(Map<String, Object> commandMap) throws Exception {
	       	Map<String, Object> selectMap = new HashMap<String, Object>();
	       	
	       	int year = Calendar.getInstance().get(Calendar.YEAR);
	       	String byy = Integer.toString(year);//현재 연도 yyyy
	       	String userID = StringUtil.getString(commandMap.get("TMM.MEM_MST_SW_ID"),"0");
	       	selectMap.put("BYY", byy);
	       	selectMap.put("USER_ID", userID);
	       	
	       	List<Map<String, Object>> returnList = ErpRequest.requestAddtionalPoint(selectMap);
	//       	return defaultDAO.select("PcMyPoint.selectMyPointSwOne",commandMap);
	       	return returnList;
       }
       
}