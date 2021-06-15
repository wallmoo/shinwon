package com.market.mall.pc.mypage.service.impl;

import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.mypage.service.MyPointService;

import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * 
 * @PackageName: com.market.mall.pc.mypage.service.impl
 * @FileName : MyPointServiceImpl.java
 * @Date : 2014. 6. 16.
 * @프로그램 설명 : 프론트 > 마이페이지 > 쇼핑해택 > 포인트 Service Implement Class
 * @author DEV_SONGJEONGEUN
 */
@Service("pcMyPointService")
public class MyPointServiceImpl implements MyPointService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name ="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    private ErpRequest erpRequest;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPointListCount
     * 2. ClassName		: MyPointServiceImpl.java
     * 3. Comment    	: 프론트 > 마이페이지 > 쇼핑혜택 > 포인트 목록 갯수  
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 6. 16. 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectMyPointListCount(HttpServletRequest request,Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("PcMyPoint.selectMyPointListCount",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPointList
     * 2. ClassName		: MyPointServiceImpl.java
     * 3. Comment    	: 프론트 > 마이페이지 > 쇼핑혜택 > 포인트 목록
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 6. 16. 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMyPointList(HttpServletRequest request,Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcMyPoint.selectMyPointList",commandMap);
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPointList
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 쇼핑카트 > 통합포인트 잔여(가용) 포인트 조회
     * 4. 작성일			: 2020. 6. 23. 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("static-access")
	@Override
	public Map<String, Object> selectMyTpoint(Map<String, Object> innerMap) throws Exception{
    	Map<String, Object> selectMap = new HashMap<String, Object>();
    	selectMap.put("ESHOP_ID",StringUtil.getString(innerMap.get("MEM_MST_MEM_ID"),"0"));
    	
    	Map<String, Object> tPointResultMap = erpRequest.requestMemberPointCheck(selectMap);
		
    	return tPointResultMap;
	}
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPointList
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 쇼핑혜택 > 포인트 목록 (통합포인트)
     * 4. 작성일			: 2015. 6. 18. 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("static-access")
    public List<Map<String, Object>> selectMyTotPointList(HttpServletRequest request,Map<String, Object> commandMap) throws Exception {

    	Map<String, Object> selectMap = new HashMap<String, Object>();
    	selectMap.put("ESHOP_ID",StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"),"0"));
    	//selectMap.put("ESHOP_ID","ds2bwq");//쇼핑몰 아이디 varchar2(30)
    	selectMap.put("FDATE",StringUtil.remove((String)commandMap.get("fromDate"),'-' ));
    	selectMap.put("TDATE", StringUtil.remove((String)commandMap.get("toDate"),'-' ));
    	
    	int cPage = Integer.valueOf(StringUtil.getString(commandMap.get("cPage"), "1"));
    	if(cPage != 1) {
    		cPage = (cPage*10-9);
    	}    	
    	selectMap.put("OFFSET",cPage);
    	selectMap.put("LIMIT","10");//몇 개의 데이터를 가지고 올 것인지
    	    	
		List<Map<String, Object>> tpnMapList = erpRequest.requestGetPointView(selectMap);
		
		Collections.sort(tpnMapList, new Comparator<Map<String, Object >>() {
            @Override
            public int compare(Map<String, Object> first, Map<String, Object> second) {
                return (Integer.valueOf((String) second.get("RANK"))).compareTo( Integer.valueOf((String) first.get("RANK"))); //descending order
            }

        });
    	
    	return tpnMapList;
    	
    }
    
    /**
	 * <pre>
     * 1. MethodName	: selectMyEpoint
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 사용가능한 E포인트 조회
     * 4. 작성일			: 2020. 6. 16. 
     * </pre>
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "static-access", "unchecked" })
	public Map<String, Object> selectMyEpoint(Map<String, Object> commandMap) throws Exception {  
    	
    	//2020.06.20 MEM_MST_MEM_ID 가 없을 때 임의의 값
    	String id = StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "0");
    	if(id.equals("0")) {
    		commandMap.put("MEM_MST_MEM_ID",id);
    	}    	    	
    	Map<String, Object> myEpointMap = defaultDAO.select("PcMyPoint.selectMyEpoint",commandMap);    	
    	if(myEpointMap != null) {
    		Map<String, Object> selectMap = new HashMap<String, Object>();
        	selectMap.put("ESHOP_ID",StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"),"0"));
    		myEpointMap.put("myTotPoint",erpRequest.requestMemberPointCheck(selectMap));
    	}    	       	
    	return myEpointMap;
    }
    
    
    /**
	 * <pre>
     * 1. MethodName	: selectAjaxEpoint
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 주문서 > 사용가능한 E포인트 조회
     * 4. 작성일			: 2015. 6. 24. 
     * </pre>
     * @param userId
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	public int selectAjaxEpoint(Map<String, Object> commandMap) throws Exception {
    	int epn = 0;    	
    	Map<String, Object> myEpointMap = defaultDAO.select("PcMyPoint.selectMyEpoint",commandMap);    	
    	epn = StringUtil.getInt(myEpointMap.get("MEM_PIT_TOT_PIT"));
    	return epn;
    }
    
    
    /**
	 * <pre>
     * 1. MethodName	: selectMyEpoint
     * 2. ClassName		: selectMyTotPoint.java
     * 3. Comment    	: 프론트 > 주문서 > 사용가능한 통합포인트 조회
     * 4. 작성일			: 2015. 6. 16. 
     * </pre>
     * @param userId
     * @return
     * @throws Exception
     */
    public int selectMyTotPoint(String userId) throws Exception {
    	int top = 0;
    	
    	Map<String, Object> selectMap = new HashMap<String, Object>();
    	selectMap.put("ESHOP_ID",userId);
		Map<String, Object> myEpointMap = erpRequest.requestMemberPointCheck(selectMap);
		
		top = StringUtil.getInt(myEpointMap.get("MemberPointCheckResult"));
    	
    	return top;
    }
    
    /**
	 * <pre>
     * 1. MethodName	: selectMyInfo
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 회원정보조회
     * 4. 작성일			: 2020. 6. 16. 
     * </pre>
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectMyInfo(Map<String, Object> commandMap) throws Exception {
    	return defaultDAO.select("PcMyPoint.selectMyInfo",commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName	: selectMyPointSwOne
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 임직원 포인트조회 (쇼윈도우에서 데이터 적재하게 될 때 사용예정)
     * 4. 작성일			: 2020. 6. 16. 
     * </pre>
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMyPointSwOne(Map<String, Object> commandMap) throws Exception {
    	Map<String, Object> selectMap = new HashMap<String, Object>();
    	int year = Calendar.getInstance().get(Calendar.YEAR);
    	String byy = Integer.toString(year);//현재 연도 yyyy
    	selectMap.put("YY", byy);
    	List<Map<String, Object>> list = ErpRequest.requestAnnualWelfarePoints(selectMap);
    	//    	return defaultDAO.select("PcMyPoint.selectMyPointSwOne",commandMap);
    	
    	return list;
    }
    /**
     * <pre>
     * 1. MethodName	: selectMyPointSwOne
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 임직원  추가포인트조회 (쇼윈도우에서 데이터 적재하게 될 때 사용예정)
     * 4. 작성일			: 2020. 6. 16. 
     * </pre>
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectUserAddEmpPointLimit(Map<String, Object> commandMap) throws Exception {
    	Map<String, Object> selectMap = new HashMap<String, Object>();
    	
    	int year = Calendar.getInstance().get(Calendar.YEAR);
    	String byy = Integer.toString(year);//현재 연도 yyyy
    	String userID = StringUtil.getString(commandMap.get("TMM.MEM_MST_SW_ID"),"0");
    	selectMap.put("BYY", byy);
    	selectMap.put("USER_ID", userID);
    	
    	List<Map<String, Object>> returnList = ErpRequest.requestAddtionalPoint(selectMap);
//    	return defaultDAO.select("PcMyPoint.selectMyPointSwOne",commandMap);
    	return returnList;
    }

}
