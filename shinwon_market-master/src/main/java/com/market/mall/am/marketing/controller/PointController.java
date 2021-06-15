package com.market.mall.am.marketing.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.PagingRenderer;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.PointService;
import com.market.mall.am.member.service.InfoMemberService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.marketing.controller
 * @FileName : PointController.java
 * @Date : 2015. 10. 22.
 * @프로그램 설명 : 관리자 > 프로모션 관리 > 포인트 관리를 처리하는 Controller Class
 * @author khcho
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class PointController {

    
    @Resource(name="pointService")
    private PointService pointService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    
    @Resource(name="infoMemberService") private InfoMemberService infoMemberService;
    
    @RequestMapping("/am/marketing/point_MemberPointCheck")
    public ModelAndView callMemberPointCheck(HttpServletRequest request) throws Exception {
    	//(9)회원 통합 포인트조회 : 입력값 : 쇼핑몰 아이디
    	ModelAndView mav = new ModelAndView();
    		
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("ESHOP_ID","sw180111");//쇼핑몰 아이디 varchar2(30)
    	
    	Map<String, Object> map = ErpRequest.requestMemberPointCheck(params);
    	
    	mav.addObject("map", map);
    	return mav;
    }
    
    @RequestMapping("/am/marketing/point_UserAddEmpPointLimit")
    public ModelAndView callUserAddEmpPointLimit(HttpServletRequest request) throws Exception {
    	//(15)연도별 임직원 포인트 조회. 입력값 : 연도
    	ModelAndView mav = new ModelAndView();
    		
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("BYY","2019");//연도
    	
    	List<Map<String, Object>> list = ErpRequest.requestAddtionalPoint(params);
    	
    	mav.addObject("list", list);
    	return mav;
    }
    
    @RequestMapping("/am/marketing/point_GetPointView")
    public ModelAndView callGetPointView(HttpServletRequest request) throws Exception {
    	//(21) 포인트 사용리스트. 입력값 : 쇼핑몰 ID, 시작일, 종료일, 시작범위, LIMIT(데이터 개수)
    	ModelAndView mav = new ModelAndView();
    	
//    	String eshop_id = request.getParameter(name);
//    	String fDate = request.getParameter(name);
//    	String tDate = request.getParameter(name);
//    	String offDate = request.getParameter(name);
//    	String limit = request.getParameter(name);
    	
    	//API request
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("ESHOP_ID","ds2bwq");//쇼핑몰 아이디 varchar2(30)
    	params.put("FDATE","20180611"); //시작일 varchar2(8)
    	params.put("TDATE", "20200618");//종료일 varchar2(8)
    	params.put("OFFSET","1");//시작범위 Number
    	params.put("LIMIT","20");//몇 개의 데이터를 가지고 올 것인지

    	//API response
    	List<Map<String, Object>> list = ErpRequest.requestGetPointView(params);
    	
    	String occurName = null;
    	String totalPoint = null;
    	String totalCount = null;
    	String rank = null;
    	String occurDate =null;
    	String occurPoint = null;
    	
    	for (int i=0; i<list.size(); i++) {
    		occurName = list.get(i).get("OCCUR_NAME").toString();
    		totalPoint = list.get(i).get("TOTAL_POINT").toString();
        	totalCount = list.get(i).get("TOTAL_COUNT").toString();
        	rank = list.get(i).get("RANK").toString();
        	occurDate = list.get(i).get("OCCUR_DATE").toString();
        	occurPoint = list.get(i).get("OCCUR_POINT").toString();
        	
    		System.out.println("occurName : "+occurName);
    		System.out.println("totalPoint : "+totalPoint);
    		System.out.println("totalCount : "+totalCount);
    		System.out.println("rank : "+rank);
    		System.out.println("occurDate : "+occurDate);
    		System.out.println("occurPoint : "+occurPoint);
    	}
    	
//    	mav.addObject("occurName", occurName);
//    	mav.addObject("totalPoint", totalPoint);
//    	mav.addObject("totalCount", totalCount);
//    	mav.addObject("rank", rank);
//    	mav.addObject("occurDate", occurDate);
//    	mav.addObject("occurPoint", occurPoint);
    	
    	mav.addObject("list", list);
    	return mav;
    }
    

    /**
    * <pre>
    * 1. MethodName : pointList
    * 2. ClassName  : PointController.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 포인트리스트
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 10. 21.
    * </pre>
    *
    * @param request
    * @param commadnMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/pointList")
    public ModelAndView pointList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -7);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                
        commandMap.put("searchPointStDt", StringUtil.getString(commandMap.get("searchPointStDt"), searchStartDate));/*DateUtil.getToday("-")*/
        commandMap.put("searchPointEdDt", StringUtil.getString(commandMap.get("searchPointEdDt"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        
        // 이벤트 목록 갯수
        int totalCount = this.pointService.selectPointListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        System.out.println("-----------------------------------------포인트 컨트롤러 페이징 : "+paging);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            list = this.pointService.selectPointList(commandMap);
        }
        
        //mv.addObject("pointTypeList", this.commonService.selectCode("COMMON_POINT_TYPE"));
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~pointList : list "+list);
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: pointListExcel
     * 2. ClassName		: PointController.java
     * 3. Comment    	: 관리자 > 프로모션관리 > 전체포인트리스트 엑셀저장
     * 4. 작성자			: khcho
     * 5. 작성일			: 2015.11.27.
     * </pre>
     *
     * @return void
     * @param request
     * @param response
     * @param commandMap
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/pointListExcel")
    public void pointListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        // list Info
        commandMap.put("excelDown", "Y");
        
        int totalCount = this.pointService.selectPointListCount(commandMap);
        
        if(totalCount > 0){
       	 	List<Map<String, Object>> dataList = null;
	       	 
	       	String[] rowTitle = {"번호", "구분","내역","관리자메모","개별포인트","대상인원수","총포인트","처리자","처리일"};
	        String[] cellSize = {"20", "40","60","80","40","30","50","30","50" };
	        String[] dataName = {"RNUM", "PIT_MST_GBN_NM", "PIT_MST_BRK_DWN_NM", "PIT_MST_MEMO", "PIT_MST_PIT","PIT_MST_CNT","PIT_MST_PIT_TOTAL","PIT_MST_REG_NM", "PIT_MST_REG_DT_EXCEL"};
	        String[] dataType = {"String", "String", "String", "String", "Dollar", "Dollar", "Dollar","String", "String"};
	          
	        commandMap.put("startNum", "0");
	        commandMap.put("endNum", "999999999999");
	        
	        dataList =  this.pointService.selectPointList(commandMap);
	       	
	       	if(dataList != null){
	               // 엑셀 다운로드
	       		   ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "pointList_"+DateUtil.getToday());
	       	}
       }
    }
    
    /**
     * <pre>
     * 1. MethodName : pointDetail
     * 2. ClassName  : PointController.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 포인트내역조회 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 10. 21.
     * </pre>
     *
     * @param request
     * @param commadnMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/marketing/pointDetail")
     public ModelAndView pointDetail(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -7);
         searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchPointStDt", StringUtil.getString(commandMap.get("searchPointStDt"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchPointEdDt", StringUtil.getString(commandMap.get("searchPointEdDt"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
         
         // 이벤트 목록 갯수
         int totalCount = this.pointService.selectPointDetailCount(commandMap);
         
         Paging paging = new Paging(totalCount, commandMap);
         mv.addObject( "paging", paging );

         commandMap.put("startNum", paging.getStartNum());
         commandMap.put("endNum", paging.getEndNum());
         
         List<Map<String, Object>> list = null;
         if (totalCount > 0){
             list = this.pointService.selectPointDetail(commandMap);
         }
          
         mv.addObject("totalCount", totalCount);
         mv.addObject("commandMap", commandMap);
         mv.addObject("list", list);
         return mv;
     }
     
     /**
      * <pre>
      * 1. MethodName : pointDetail
      * 2. ClassName  : PointController.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 포인트내역조회 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 10. 21.
      * </pre>
      *
      * @param request
      * @param commadnMap
      * @return
      * @throws Exception
      */
      @RequestMapping("/am/marketing/searchPointDetailPopup")
      public ModelAndView searchPointDetailPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
      {
          ModelAndView mv = new ModelAndView();
                   
          List<Map<String, Object>> list = null;
         
          list = this.pointService.selectPointPopup(commandMap);
          
          mv.addObject("list", list);
          return mv;
      }
     
     /**
      * 
      * <pre>
      * 1. MethodName	: pointDetailExcel
      * 2. ClassName	: PointController.java
      * 3. Comment    	: 관리자 > 프로모션관리 > 전체포인트리스트 엑셀저장
      * 4. 작성자			: khcho
      * 5. 작성일			: 2015.11.27.
      * </pre>
      *
      * @return void
      * @param request
      * @param response
      * @param commandMap
      * @throws Exception
      */
     @RequestMapping(value="/am/marketing/pointDetailExcel")
     public void pointDetailExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
     {
         // list Info
         commandMap.put("excelDown", "Y");
         
         int totalCount = this.pointService.selectPointDetailCount(commandMap);
         
         if(totalCount > 0){
        	 	List<Map<String, Object>> dataList = null;
 	       	 
 	       	String[] rowTitle = {"번호", "이름","구분","내역","적립","차감","소멸","잔여포인트","처리자","적립/차감/소멸일시"};
 	        String[] cellSize = {"20", "60","30","50","40","40","40","50","60","60" };
 	        String[] dataName = {"RNUM", "MEM_EXCEL", "MEM_PIT_GBN_NM", "MEM_PIT_BRK_DWN_NM", "MEM_PIT_PLS","MEM_PIT_MNS","MEM_PIT_EXT","MEM_PIT_TOT_PIT","REG_EXCEL", "MEM_PIT_REG_DT_EXCEL"};
 	        String[] dataType = {"String", "String", "String", "String", "Dollar", "Dollar", "Dollar", "Dollar","String", "String"};
 	          
 	        commandMap.put("startNum", "0");
 	        commandMap.put("endNum", "999999999999");
 	        
 	        dataList =  this.pointService.selectPointDetail(commandMap);
 	       	
 	       	if(dataList != null){
 	               // 엑셀 다운로드
 	       		   ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "pointDetail_"+DateUtil.getToday());
 	       	}
        }
     }
    /**
    * <pre>
    * 1. MethodName : eventForm
    * 2. ClassName  : EventController.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 등록 폼 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/pointForm")
    public ModelAndView pointForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : pointCodeAjax
     * 2. ClassName  : PointController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 포인트내역 조회
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/marketing/pointCodeAjax")
     public JSON pointCodeAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
    	 System.out.println("pointCodeAjax Start");
    	 JSON json = new JSON();
         String gb = (String)commandMap.get("code");
         String code = "";
         
         //System.out.println("pointCodeAjax code : "+code);
         
         // 엑셀 파일 read
         if("P".equals(gb))code = "1870";//적립
         if("M".equals(gb))code = "1871";//차감
         if("D".equals(gb))code = "1872";//소멸
         
         List<Map<String, Object>> subCodeList =this.commonService.selectCodeByCode(code);
         
         json.put("list",  subCodeList);
         
//         for(int i=0;i<subCodeList.size();i++)
//         {
//         	Map<String, Object> tempList = null;
//         	tempList = memberList.get(i);
//         	String t1 = (String)tempList.get("MEMBER_ID");
//         	String t2 = (String)tempList.get("MEMBER_NAME");
//         	
//         	System.out.println("row : "+i+" t1 : "+t1);
//         	System.out.println("row : "+i+" t2 : "+t2);
//         	
//         	
//         }
        
         //mv.setViewName("/am/common/result");
         
         return json;
     }    
    
    /**
    * <pre>
    * 1. MethodName : pointMemberUploadPopup
    * 2. ClassName  : PointController.java
    * 3. Comment    : 관리자 > 상품관리 > 상품상태값 변경팝업
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/pointMemberUploadPopup")
    public ModelAndView pointMemberUploadPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        return mv;
    }    
    
    /**
    * <pre>
    * 1. MethodName : pointMemberUploadAjax
    * 2. ClassName  : PointController.java
    * 3. Comment    : 관리자 > 프로모션관리 > 엑셀업로드 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 27.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/pointMemberUploadAjax")
    public JSON pointMemberUploadAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	JSON json = new JSON();
        int result = 0;

    	String [] columName = new String[]{"MEMBER_ID", "MEMBER_NAME"};
    	            
        MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
        CommonsMultipartFile file = (CommonsMultipartFile) multiRequest.getFile("file");
        
        System.out.println("file.getOriginalFilename() : "+file.getOriginalFilename());
        
        // 엑셀 파일 read
        List<Map<String, Object>> memberList = ExcelUtil.excelRead(file, columName);
        
        List<Map<String, Object>> memberDBList = this.pointService.selectPointMember(memberList);
        
        
        System.out.println("memberDBList.size() : "+memberDBList.size());
        
        json.put("list",  memberDBList);
        
//        for(int i=0;i<memberList.size();i++)
//        {
//        	Map<String, Object> tempList = null;
//        	tempList = memberList.get(i);
//        	String t1 = (String)tempList.get("MEMBER_ID");
//        	String t2 = (String)tempList.get("MEMBER_NAME");
//        	
//        	System.out.println("row : "+i+" t1 : "+t1);
//        	System.out.println("row : "+i+" t2 : "+t2);
//        	
//        	
//        }
       
        //mv.setViewName("/am/common/result");
        return json;
    }    

    
    /**
    * <pre>
    * 1. MethodName : pointFormRegist
    * 2. ClassName  : PointController.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 포인트 적립 등록 등록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 27.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/pointFormRegist")
    public ModelAndView pointFormRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int result = this.pointService.insertPoint(request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/pointForm.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/pointForm.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
        
}
