package com.market.mall.am.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.market.mall.am.board.service.CommentBoardService;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.customer.service.InquiryService;
import com.market.mall.am.customer.service.ProductInquiryService;
import com.market.mall.am.marketing.service.EcouponService;
import com.market.mall.am.marketing.service.EventService;
import com.market.mall.am.marketing.service.PointService;
import com.market.mall.am.member.service.InfoMemberService;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.am.order.service.TaxIvcService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.tag.service.TagService;

import egovframework.rte.fdl.property.EgovPropertyService;
import oracle.sql.CLOB;

/**
 * 
 * @PackageName: com.market.mall.am.member.controller
 * @FileName : InfoMemberController.java
 * @Date : 2014. 6. 20.
 * @프로그램 설명 : 관리자 > 회원조회 > 회원정보관리를 처리하는 Controller Class
 * @author LJH
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class InfoMemberController {

	@Resource(name="commonService")  	private CommonService commonService;
	@Resource(name="infoMemberService") private InfoMemberService infoMemberService;
	@Resource(name="orderService") 		private OrderService orderService;
	@Resource(name="inquiryService") 	private InquiryService inquiryService;
	@Resource(name="taxIvcService")  private TaxIvcService taxIvcService;
	@Resource(name="ecouponService")  private EcouponService ecouponService;
	@Resource(name="pointService")  private PointService pointService;
	@Resource(name="eventService")  private EventService eventService;
	@Resource(name="commentBoardService")  private CommentBoardService commentBoardService;
	@Resource(name="productInquiryService")  private ProductInquiryService productInquiryService;
	@Autowired TagService tagService;
	
	@Resource	private CartService cartService;
	
    @Resource(name ="propertiesService") protected EgovPropertyService propertiesService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: infoMemberList
	 * 2. ClassName		: InfoMemberController.java
     * 3. Comment    	: 관리자 > 회원조회 > 회원현황 목록
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 6. 20. 오후 1:38:59
	 * </pre>
	 *
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception  
	 */
    @RequestMapping("/am/member/infoMemberList")
    public ModelAndView infoMemberList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 검색 클릭 시 history 저장
        if(StringUtil.getString(commandMap.get("searchYn"), "").equals("Y"))
        {
        	this.infoMemberService.insertSearchHistory(request,commandMap); 
        }

        // Common Codes
        String[] codes = {"COMMON_MEMBER_TYPE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));	
        
        // 회원정보관리 목록 갯수
        //int totalCount = StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ? 0 : this.infoMemberService.selectInfoMemberListCount(commandMap);
        int totalCount = this.infoMemberService.selectInfoMemberListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount > 0)
        {
            // 회원정보 관리 목록
        	list = this.infoMemberService.selectInfoMemberList(commandMap);
        	
        	for(int i=0;i < list.size();i++)
        	{
        		// 이름 마스킹처리
        		list.get(i).put("MEM_MST_MEM_NM", FormatUtil.markingName(StringUtil.getString(list.get(i).get("MEM_MST_MEM_NM"),"")));
        	}
        }        

        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : getMemGradeListAjax
     * 2. ClassName  : InfoMemberController.java
     * 3. Comment    : 관리자 > 회원관리 > 회원관리 목록 > 검색조건 - 회원등급 목록 
     * 4. 작성자       : DEV_KIMSOYOUNG
     * 5. 작성일       : 2015. 10. 23.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/member/getMemGradeListAjax")
      public JSON getMemGradeListAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
      {
     	 JSON json = new JSON();
     	 
     	 // 회원등급 목록
     	 List<Map<String, Object>> memGradeList = this.infoMemberService.selectMemberGradeList(commandMap);
     	 
      	 json.addObject("memGradeList", memGradeList);
     	 
     	 return json;
      }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: infoMemberPopup
     * 2. ClassName		: InfoMemberController.java
     * 3. Comment    	: 관리자 > 회원관리 > 개인회원정보 상세
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 20. 오후 1:39:53
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/member/infoMemberPopup")
    public ModelAndView infoMemberPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        final String userControlAuthField = "USER_CONTROL_AUTH";
    	ModelAndView mv = new ModelAndView();
        
        // 로그인 한 관리자 권한 가져오기
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        mv.addObject("AUT_MST_IDX", admin.getAUT_MST_IDX());
        
        commandMap.put("searchId", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
        
        // 회원 검색 history 저장
        this.infoMemberService.insertSearchHistory(request,commandMap);  
        
        // 개인회원 등급
        mv.addObject("priMemGradeList", this.commonService.selectCode("COMMON_PRI_MEMBER_GRADE"));	
        
        // 회원 상세 정보
        Map<String,Object> memberInfo = this.infoMemberService.selectMemberInfo(commandMap);
        
        Map<String,Object> deliveryInfo = this.infoMemberService.selectMemberDeliveryInfo(commandMap);
        
        commandMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_MEMBER);
        List<Map<String,Object>> tagList = this.tagService.selectTagListById(commandMap);
        // 기업회원일 경우
        if(StringUtil.getInt(memberInfo.get("MEM_MST_MEM_GBN"),0) == Code.COMMON_COMP_MEMBER_GRADE)
        {
        	// 기업회원 등급 목록
            mv.addObject("compMemGradeList", this.commonService.selectCode("COMMON_COMP_MEMBER_GRADE"));	
            
            // 회원 상세 정보
            mv.addObject("memberInfo", this.infoMemberService.selectCompMemberInfo(commandMap)); 
            mv.setViewName("/am/member/infoCompMemberPopup");
        }
        else
        {
        	mv.addObject("memberInfo", memberInfo);
        	mv.setViewName("/am/member/infoMemberPopup");
        }
        
        //권한조회 리뷰어 , OOTD 
        mv.addObject("previlege", this.infoMemberService.selectMemberPrivilegeInfo(commandMap)); 
        
        //권한조회 : 특정 이벤트 상품 
        mv.addObject("previlegeList",  this.infoMemberService.selectMemberPrivilegeList(commandMap) );        
        	
        //RETURN OBJECT
        mv.addObject("commandMap", commandMap);
        mv.addObject("deliveryInfo",deliveryInfo);
        mv.addObject("tagList",tagList);
        return mv;
    }
    
    
    @RequestMapping(value="/am/member/reviewEventSelectPopup")
    public ModelAndView reviewEventSelectPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        final String userControlAuthField = "USER_CONTROL_AUTH";
    	ModelAndView mv = new ModelAndView();
        
        // 로그인 한 관리자 권한 가져오기
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        mv.addObject("AUT_MST_IDX", admin.getAUT_MST_IDX());
        
        commandMap.put("searchId", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
        
     	List<Map<String, Object>> list = null;
     	list = this.infoMemberService.selectReviewEvent(commandMap);  // 진행중인 리뷰이벤트 목록 
     	
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);
        return mv;     	

    }
    
    //비동기식 리뷰이벤트 목록 조회 
    
    @RequestMapping("/am/member/getreviewEventListAjax")
    public JSON getreviewEventListAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
   	 JSON json = new JSON();
   	 
   	 // 회원등급 목록
   	 List<Map<String, Object>> reviewEventList = this.infoMemberService.selectReviewEvent(commandMap);
   	 
    	 json.addObject("reviewEventList", reviewEventList);
   	 
   	 return json;
    }    
    
    
    /**
    * <pre>
    * 1. MethodName : infoMemberPopupRegist
    * 2. ClassName : InfoMemberController.java
    * 3. Comment : 관리자 > 회원관리 > 회원정보 상세 > 개인회원정보 수정
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 4. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    
    @RequestMapping(value="/am/member/infoMemberPopupRegist")
    public ModelAndView infoMemberPopupRegist(HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	String MEM_MST_MEM_ID = StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "");
    	
    	if(!"".equals(MEM_MST_MEM_ID))
        {
    		// 회원정보 수정
        	Map<String,Object> returnMap = this.infoMemberService.updateInfoMember(request,commandMap);	
        	
    		Map<String,Object> erpParam = new HashMap<String,Object>();
            erpParam.put("ESHOP_ID", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
            erpParam.put("CELL_PHONE_NO1", StringUtil.getString(commandMap.get("MEM_MST_HP1")));
            erpParam.put("CELL_PHONE_NO2", StringUtil.getString(commandMap.get("MEM_MST_HP2")));
            erpParam.put("CELL_PHONE_NO3", StringUtil.getString(commandMap.get("MEM_MST_HP3")));
            erpParam.put("SMS_YN", StringUtil.getString(commandMap.get("TRM_YN0001"),"N"));
    		erpParam.put("TM_YN", StringUtil.getString(commandMap.get("TRM_YN0002"),"N"));
    		erpParam.put("DM_YN", StringUtil.getString(commandMap.get("TRM_YN0003"),"N"));
    		erpParam.put("EMAIL_YN", StringUtil.getString(commandMap.get("TRM_YN0004"),"N"));
    		erpParam.put("AD_YN", StringUtil.getString(commandMap.get("TRM_YN0005"),"N"));
    		erpParam.put("KKO_YN", StringUtil.getString(commandMap.get("TRM_YN0006"),"N"));
            erpParam.put("EMAIL1", StringUtil.getString(commandMap.get("MAIL_ID")));
            erpParam.put("EMAIL2", StringUtil.getString(commandMap.get("MAIL_DOMAIN")));
            if(commandMap.containsKey("MEM_DLV_ZIP_CDE5") &&commandMap.containsKey("MEM_DLV_DRO_ADR1")) {
            	erpParam.put("HOME_ZIP_NO", StringUtil.getString(commandMap.get("MEM_DLV_ZIP_CDE5")));
                erpParam.put("HOME_ADDR1", StringUtil.getString(commandMap.get("MEM_DLV_DRO_ADR1")));
                erpParam.put("HOME_ADDR2", StringUtil.getString(commandMap.get("MEM_DLV_ADR2")));
            }
            ErpRequest.requestMemberModify(erpParam);
        	
        	// 결과 값
			int result = Integer.valueOf(StringUtil.getString(returnMap.get("result"),""));
        				
    		if(result > 0)
            {
    			mv.addObject("alertMsg", "수정 되었습니다.");
    			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=" + MEM_MST_MEM_ID);
            }
    		else if(result == -99)
	        {
	        	logger.info("#################### 프로시져 에러 ###########################");
	        	// 프로시져 에러
	        	this.infoMemberService.insertErpError(returnMap);
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=" + MEM_MST_MEM_ID);
	        }
    		else if(result == 00)
	        {
	        	logger.info("#################### Excpetion 에러 ###########################");
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=" + MEM_MST_MEM_ID);
	        }
            else
            {
            	mv.addObject("alertMsg", "수정에 실패하였습니다.");
    			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=" + MEM_MST_MEM_ID);
            }
    		
            
    		mv.setViewName("/am/common/result");
        }
        
        return mv;
    }
    
     /**
     * <pre>
     * 1. MethodName : infoCompMemberPopupRegist
     * 2. ClassName  : InfoMemberController.java
     * 3. Comment    : 관리자 > 회원관리 > 기업회원상세 > 수정
     * 4. 작성자       : DEV_KIMSOYOUNG
     * 5. 작성일       : 2015. 10. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/member/infoCompMemberPopupRegist")
     public ModelAndView infoCompMemberPopupRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
     {
     	ModelAndView mv = new ModelAndView();
     	
     	String MEM_MST_MEM_ID = StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "");
     	String MEM_MST_MEM_GBN = StringUtil.getString(commandMap.get("MEM_MST_MEM_GBN"), "");
     			
     	if(!"".equals(MEM_MST_MEM_ID))
        {
     		// 회원정보 수정
         	Map<String,Object> returnMap = this.infoMemberService.updateInfoMember(request,commandMap);		
         	// 결과 값
         	int result = Integer.valueOf(StringUtil.getString(returnMap.get("result"),""));
         			
     		if(result > 0)
             {
     			mv.addObject("alertMsg", "수정 되었습니다.");
    			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=" + MEM_MST_MEM_ID + "&MEM_MST_MEM_GBN=" + MEM_MST_MEM_GBN);
             }
     		else if(result == -99)
	        {
	        	logger.info("#################### 프로시져 에러 ###########################");
	        	// 프로시져 에러
	        	this.infoMemberService.insertErpError(returnMap);
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=" + MEM_MST_MEM_ID + "&MEM_MST_MEM_GBN=" + MEM_MST_MEM_GBN);
	        }
    		else if(result == 00)
	        {
	        	logger.info("#################### Excpetion 에러 ###########################");
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=" + MEM_MST_MEM_ID + "&MEM_MST_MEM_GBN=" + MEM_MST_MEM_GBN);
	        }
             else
             {
                 mv.addObject("alertMsg", "수정에 실패하였습니다.");
                 mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=" + MEM_MST_MEM_ID + "&MEM_MST_MEM_GBN=" + MEM_MST_MEM_GBN);
             }
             
     		 mv.setViewName("/am/common/result");
        }
         
         return mv;
     }
     
     /**
    * <pre>
    * 1. MethodName : sendMemTempPwAjax
    * 2. ClassName  : InfoMemberController.java
    * 3. Comment    : 관리자 > 회원관리 > 회원(기업,개인,간편)상세 > 임시 비밀번호 발송
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 11. 2.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/member/sendMemTempPwAjax")
    public JSON sendMemTempPwAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		JSON json = new JSON();
         
        // 임시 비밀번호 발송
        int result = this.infoMemberService.updateMemberTempPw(request,commandMap);
         
		if(result > 0)
		{
		    json.put("resultYn", "Y");           
		}
		else 
		{
			if(result == -1)
			{
				json.put("resultYn", "E");
			}
			else
			{
				json.put("resultYn", "N");	
			}
		}
         
        return json;
    }
     
	/**
	* <pre>
	* 1. MethodName : searchMemberPopup
	* 2. ClassName  : InfoMemberController.java
	* 3. Comment    : 회원 검색 팝업
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 25.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/member/searchMemberPopup")
	public ModelAndView searchMemberPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	{
	    ModelAndView mv = new ModelAndView();
	
	    // 검색 클릭 시 history 저장
        if(StringUtil.getString(commandMap.get("searchYn"), "").equals("Y"))
        {
        	this.infoMemberService.insertSearchHistory(request,commandMap); 
        }

        // Common Codes
        String[] codes = {"COMMON_PRI_MEMBER_GRADE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));	
        
        // 회원정보관리 목록 갯수
        int totalCount = StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ? 0 : this.infoMemberService.selectInfoMemberListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
            // 회원정보 관리 목록
        	list = this.infoMemberService.selectInfoMemberList(commandMap);
        	
        	for(int i=0;i < list.size();i++)
        	{
        		// 이름 마스킹처리
        		list.get(i).put("MEM_MST_MEM_NM", FormatUtil.markingName(StringUtil.getString(list.get(i).get("MEM_MST_MEM_NM"),"")));
        	}
        }        

        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        
	    return mv;
	}
     
    /**
     * <pre>
     * 1. MethodName : infoMemberOrderPopup
     * 2. ClassName  : InfoMemberController.java
     * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 주문정보
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 9.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/member/infoMemberOrderPopup")
    public ModelAndView infoMemberOrderPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
        
        //주문상태값
        String searchOrdPrdOrderState = StringUtil.getString(commandMap.get("searchOrdPrdOrderState"), "");
        
        // 기본값 설정 - 검색 시작날짜 (today - 30)
        String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
        
        commandMap.put("searchDateType", StringUtil.getString(commandMap.get("searchDateType"), "order"));
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        commandMap.put("searchOrdMstCd", StringUtil.getString(commandMap.get("searchOrdMstCd"), "").toUpperCase());
        commandMap.put("searchProduct", StringUtil.getString(commandMap.get("searchProduct"), "").toUpperCase());
        commandMap.put("searchOrderId", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), ""));
        commandMap.put("searchOrdPrdOrderState", searchOrdPrdOrderState);
        
        // 주문 상태값 리스트
        commandMap.put("OST", Code.OST);
        mv.addObject("orderStateCodeList", this.orderService.selectOrderStateCodeList(commandMap));

        // Common Codes
        String[] codes = {"DLV_TYPE", "PAY_TYPE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        
        // 관리자 입점업체 IDX(SCM용)
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("ADM_MST_SUB_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        }
        
        int totalCount = this.orderService.selectOrderCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);

    	List<Map<String, Object>> list = null;
       	if(totalCount>0)
       	{
       		list = this.orderService.selectOrderList(commandMap);
        }

       	// 회원 상세 정보
        mv.addObject("memberInfo", this.infoMemberService.selectMemberInfo(commandMap));
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : infoMemberTaxIvcPopup
    * 2. ClassName  : InfoMemberController.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 세금계산서
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 26.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/member/infoMemberTaxIvcPopup")
    public ModelAndView infoMemberTaxIvcPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
        
    	commandMap.put("searchTaxIvcState", StringUtil.getString(commandMap.get("searchTaxIvcState"),"N")); //default 미발행 체크
        
        // 기본값 설정 - 검색 시작날짜 (today - 7)
        String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -7);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        
        // 세금계산서 신청관리 목록 갯수
        int totalCount = this.taxIvcService.selectTaxIvcCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            // 세금계산서 신청관리 목록
            list = this.taxIvcService.selectTaxIvcList(commandMap);
        }
        
        // 회원 상세 정보
        mv.addObject("memberInfo", this.infoMemberService.selectMemberInfo(commandMap));
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : infoMemberCart
    * 2. ClassName  : InfoMemberController.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 장바구니
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 26.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/member/infoMemberCart")
    public ModelAndView infoMemberCart(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
        
        // 기본값 설정 - 검색 시작날짜 (today - 7)
        String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -7);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        
        commandMap.put("searchPrdMstCd", StringUtil.getString(commandMap.get("searchPrdMstCd")).trim());
        commandMap.put("searchPrdMstNm", StringUtil.getString(commandMap.get("searchPrdMstNm")).trim());
        
        // 장바구니 목록 갯수
        int totalCount = this.infoMemberService.selectInfoMemberCartListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            list = this.infoMemberService.selectInfoMemberCartList(commandMap);
            
            for(Map<String, Object> cart : list){
				int PRD_OPT_IDX = StringUtil.getInt(cart.get("PRD_OPT_IDX"));//필수옵션값
				if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
					List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(cart);
					cart.put("optionList", optionList);//해당 상품 필수옵션 리스트
				}
				
				//서브 옵션 리스트
				List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
				int SUB_OPTION_CNT =  StringUtil.getInt(cart.get("SUB_OPTION_CNT"));
				if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
					subPrdList = this.cartService.selectCartSubPrdList(cart);
					cart.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
				}
			}
        }
        
        // 회원 상세 정보
        mv.addObject("memberInfo", this.infoMemberService.selectMemberInfo(commandMap));
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : infoMemberKeepingPopup
    * 2. ClassName  : InfoMemberController.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 키핑상품
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 26.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/member/infoMemberKeepingPopup")
    public ModelAndView infoMemberKeepingPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
        
        // 기본값 설정 - 검색 시작날짜 (today - 7)
        String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -7);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        
        commandMap.put("searchPrdMstCd", StringUtil.getString(commandMap.get("searchPrdMstCd")).trim());
        commandMap.put("searchPrdMstNm", StringUtil.getString(commandMap.get("searchPrdMstNm")).trim());
        
        // 키핑상품 목록 갯수
        int totalCount = this.infoMemberService.selectInfoMemberKeepingListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            list = this.infoMemberService.selectInfoMemberKeepingList(commandMap);
        }
        
        // 회원 상세 정보
        mv.addObject("memberInfo", this.infoMemberService.selectMemberInfo(commandMap));
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: infoMemberPointPopup
     * 2. ClassName		: InfoMemberController.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보 상세 > 포인트내역
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 30. 오후 4:58:17
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/member/infoMemberPointPopup")
    public ModelAndView infoMemberPointPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        // 회원 상세 정보
        Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
        Map<String, Object> memberInfo = (Map<String, Object>)memberMap.get("memberInfo");
        
        if(memberInfo != null)
        {
	        commandMap.put("COMP_CD", StringUtil.getString(memberInfo.get("COMP_CD")));
	    	commandMap.put("CUST_NO", StringUtil.getString(memberInfo.get("CUST_NO")));
        }
        
        // 포인트 거래내역 갯수
        int totalCount = this.infoMemberService.selectMemberPointListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
            // 포인트 거래내역
        	list = this.infoMemberService.selectMemberPointList(commandMap);
        }        
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("memberInfo", memberInfo);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }

    /**
    * <pre>
    * 1. MethodName : infoMemberPointPopup
    * 2. ClassName  : InfoMemberController.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 1:1문의 내역 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/member/infoMemberInquiryListPopup")
    public ModelAndView infoMemberInquiryListPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        List<Map<String, Object>> list = null;
        Map<String, Object> memberName = null;
        
        // 회원 상세 정보
		Map<String, Object> resultMap = this.infoMemberService.selectMemberInfo(commandMap);
		Map<String, Object> memberInfo = (Map<String,Object>)resultMap.get("memberInfo");
        
        
        // 기본값 설정 - 검색 시작날짜 (today - 30)
        String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
        
        // 기본값 설정 - 검색 날짜
        if (!StringUtil.getString(commandMap.get("searchTotal"), "N").equals("Y")) {
            commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));
            commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
        }
        
        if(!"".equals(StringUtil.getString(commandMap.get("CUST_ID"), "")))
        {
        	commandMap.put("BRD_INQ_TYPE", Code.BOARD_INQ_TYPE_CUSTOMER);
	        // 1:1 문의 목록 갯수
	        int totalCount = this.inquiryService.selectInquiryListCount(commandMap);
	        Paging paging = new Paging(totalCount, commandMap);
	        mv.addObject( "paging", paging );
	
	        commandMap.put("startNum", paging.getStartNum());
	        commandMap.put("endNum", paging.getEndNum());
	        
	        if (totalCount > 0){
	            // 1:1 문의 목록
	            list = this.inquiryService.selectInquiryList(commandMap);
	        }
	        
	        // 회원 정보 
            memberName = this.infoMemberService.selectMemberName(commandMap);
        }
        
        // 문의 유형 코드 목록
        mv.addObject("inqTypeCodeList", this.commonService.selectCode("ONE_TO_ONE_INQUIRY_TYPE_CODE"));

        mv.addObject("memberName", memberName);
        mv.addObject("memberInfo", memberInfo);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : infoMemberInquiryViewPopup
    * 2. ClassName  : InfoMemberController.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 1:1문의 내역 상세정보 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/member/infoMemberInquiryViewPopup")
    public ModelAndView infoMemberInquiryViewPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("CUST_ID"), "")) && !"".equals(StringUtil.getString(commandMap.get("BRD_INQ_IDX"), "")))
        {
            Map<String, Object> resultMap = this.inquiryService.selectInquiryInfo(commandMap);
            
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("fileList", resultMap.get("fileList"));
            
            // 회원 상세 정보
    		Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
    		Map<String, Object> memberInfo = (Map<String,Object>)memberMap.get("memberInfo");
            
            
            // Common Codes
            String[] codes = {"ONE_TO_ONE_INQUIRY_TYPE_CODE","HP_CODE"};
            mv.addObject("codes", this.commonService.selectCodes(codes));
            mv.addObject("commandMap", commandMap);
            mv.addObject("memberInfo", memberInfo);
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : inquiryModify
     * 2. ClassName  : InquiryController.java
     * 3. Comment    : 관리자 > 고객센터 > 1:1 문의 답변 수정
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 11. 07.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/member/infoMemberInquiryModify")
     public ModelAndView infoMemberInquiryModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         if(!"".equals(StringUtil.getString(commandMap.get("BRD_INQ_IDX"), "")))
         {        	 
             int result = this.inquiryService.updateInquiry(request, commandMap);
             
             // view Page Info
             if(result > 0)
             {
                 mv.addObject("alertMsg", "수정 되었습니다.");
                 mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/infoMemberInquiryListPopup.do");
                 
             }
             else
             {
                 mv.addObject("alertMsg", "수정에 실패하였습니다.");
                 mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/infoMemberInquiryListPopup.do");
             }
         }
         mv.addObject("commandMap", commandMap);
         mv.setViewName("/am/common/result");
         return mv;
     }
     
     /**
      * <pre>
      * 1. MethodName : infoMemberMileagePopup
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 주문정보
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 1.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     @RequestMapping(value="/am/member/infoMemberCouponPopup")
     public ModelAndView infoMemberCouponPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
    	 ModelAndView mv = new ModelAndView();
         
    	 String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
         searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchCouponStDt", StringUtil.getString(commandMap.get("searchCouponStDt"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchCouponEdDt", StringUtil.getString(commandMap.get("searchCouponEdDt"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
    	 
 		 int totalCount = this.ecouponService.selectMemberCouponListCount(commandMap);
 			        
 		 Paging paging = new Paging(totalCount, commandMap);
 		 mv.addObject( "paging", paging );
 			
 		 commandMap.put("startNum", paging.getStartNum());
 		 commandMap.put("endNum", paging.getEndNum());
 			        
 		 List<Map<String, Object>> list = null;
 		 if (totalCount > 0){
 			 // 이벤트 목록
 			 list = this.ecouponService.selectMemberCouponList(commandMap);
 			            
 			 mv.addObject("list", list);
 			            
 		 }
 		 Map<String, Object> couponSumMap = this.ecouponService.selectMemberCouponSum(commandMap);
 		 mv.addObject("couponSum", couponSumMap);	
 		
 		  
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
 		 
 		 
         mv.addObject("couponTypeList", this.commonService.selectCode("COUPON_TYPE"));
 		 mv.addObject("memberInfo", memberMap);
         mv.addObject("commandMap", commandMap);
         //mv.addObject("list", list);
         return mv;
     }
     
     /**
      * <pre>
      * 1. MethodName : infoMemberPitPopup
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 포인트정보
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 3.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     @RequestMapping(value="/am/member/infoMemberPitPopup") //개인 회원정보 포인트탭 
     public ModelAndView infoMemberPitPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
    	 ModelAndView mv = new ModelAndView();
    	 JSON json = new JSON();
        
    	 Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
    	 //일반회원 임직원 구분한다
  		 memberMap = this.infoMemberService.selectMemberGBNInfo(commandMap);
  		 
  		 //formType 설정
//  		 String formType = StringUtil.getString(commandMap.get("formType"), "tPointForm");
// 		 commandMap.put("formType", formType);
 		 
  		 //포인트 발생기간
  		 String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
         searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchPointStDt", StringUtil.getString(commandMap.get("searchPointStDt"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchPointEdDt", StringUtil.getString(commandMap.get("searchPointEdDt"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
    	 
    	 //--------------- E-point ----------------------------------------
 		 int ePointTotalCount = this.pointService.selectMemberEpointCount(commandMap);
 			        
 		 Paging ePointPaging = new Paging(ePointTotalCount, commandMap);
 		 mv.addObject( "ePointPaging", ePointPaging );
 			
 		 commandMap.put("startNum", ePointPaging.getStartNum());
 		 commandMap.put("endNum", ePointPaging.getEndNum());
 			        
 		 List<Map<String, Object>> ePointList = null;
 		 if (ePointTotalCount > 0){
 			 // 포인트 적립 차감 내역 목록
 			 ePointList = this.pointService.selectMemberPoint(commandMap);
 			 mv.addObject("ePointList", ePointList);
 		 }
 		 //총적립, 총차감, 현재 잔여
 		 Map<String, Object> ePointSumMap = this.pointService.selectMemberPointSum(commandMap);
 		 mv.addObject("ePointSumMap", ePointSumMap);	
 		 //---------------E-point end-----------------------------------------
 		
 		 //---------------통합 포인트 (잔여포인트만 ERP 연동) -------------------------------------------
 		
 		 int tPointTotalCount = this.pointService.selectMemberTpointCount(commandMap); //Paging을 위해 DB row 개수 조회
 		 Paging tPointPaging = new Paging(tPointTotalCount, commandMap);
 		 mv.addObject("tPointPaging",tPointPaging);
 		 commandMap.put("startNum", tPointPaging.getStartNum());
 		 commandMap.put("endNum",tPointPaging.getEndNum());
 		 //통합포인트 총잔여
 		 Map<String,Object> tPointBalanceMap = this.pointService.getTpointAmount(commandMap);//ERP에서 통합포인트 잔여금액 조회
 		 String tPointBalance = StringUtil.getString(tPointBalanceMap.get("MemberPointCheckResult"), "0");
 		 commandMap.put("tPointBalance", tPointBalance); //현재 잔여 통합포인트
 		
 		 List<Map<String, Object>> tPointList = null;
 		 if (tPointTotalCount > 0){
			 // SHOWINDOW 내에서 발생한 통합포인트 적립 차감 내역 목록
 			 tPointList = this.pointService.selectMemberPoint(commandMap); 
			 mv.addObject("tPointList", tPointList);
		 }
 		 //SHOWINDOW 내에서 발생한 통합포인트 총적립, 총차감
 		 Map<String, Object> tPointSumMap = this.pointService.selectMemberPointSum(commandMap);
 		 mv.addObject("tPointSumMap", tPointSumMap);	
 		 
 		 // 		List<Map<String, Object>> tpnMapList = pointService.selectMyTonghapPointList(request, commandMap);        	
//    	int tonghapPointTotalCount = 0;
// 		if(tpnMapList != null && tpnMapList.size() > 0) {
//    		tonghapPointTotalCount = Integer.valueOf((String) tpnMapList.get(0).get("TOTAL_COUNT"));
//    		System.out.println("===============================tonghapPointTotalCount : "+tonghapPointTotalCount);
//    		System.out.println("===============================tpnMapList : "+tpnMapList);
//    		mv.addObject("tpnMapList",tpnMapList);
//    	}  
 		 
 		 //---------------통합 포인트 end---------------------------------------- 
         
 		//----------------임직원 포인트 (잔여포인트만 ERP 연동)---------------------------------------------
 		int memSwId = 0;    
 		if(memberMap.get("TMM.MEM_MST_SW_ID") != null) {        	
        	memSwId = Integer.valueOf(StringUtil.getString(memberMap.get("TMM.MEM_MST_SW_ID"),"-1"));
        	
        	//ERP 에서 올해 given point 조회한다. 
        	List<Map<String,Object>> annualWelfarePointsList = pointService.selectEmployeePointList(commandMap);
        	int initialSwPoint = (int)annualWelfarePointsList.get(0).get("LIMIT_AMT");//연간 임직원포인트
        	
        	//ERP 에서 개인 추가포인트 조회한다. 
        	List<Map<String,Object>> mySwAddPointList = pointService.selectUserAddEmpPointLimit(commandMap);
        	int additionalSwPoint = (int)mySwAddPointList.get(0).get("OCCUR_POINT");
        	
        	//현재 잔여 암직원포인트 
        	int swPointBalance = initialSwPoint + additionalSwPoint;
        	mv.addObject("swPointBalance", swPointBalance);
        	
        	//RDB 에서 임직원 포인트 사용내역 조회한다.
        	int swPointTotalCount = pointService.selectMemberSwPointCount(commandMap); //임직원 포인트 DB 개수 count
//        	mv.addObject("memSwOne",memSwOne);
        	Paging swPointPaging = new Paging(tPointTotalCount, commandMap);
    		mv.addObject("swPointPaging",swPointPaging);
    		commandMap.put("startNum", swPointPaging.getStartNum());
    		commandMap.put("endNum",swPointPaging.getEndNum());
    		
    		List<Map<String, Object>> swPointList = null;
    		if (swPointTotalCount > 0){
    			 // RDB에서 포인트 차감 내역 목록 
    			swPointList = this.pointService.selectMemberPoint(commandMap);
    			 mv.addObject("swPointList", swPointList);
    		}
    		//SHOWINDOW 내에서 발생한 통합포인트 총차감
    		 Map<String, Object> swPointSumMap = this.pointService.selectMemberPointSum(commandMap);
    		 mv.addObject("swPointSumMap", swPointSumMap);	
        }
 		
 		//----------------임직원 포인트 end---------------------------------------- 
 		 mv.addObject("memberInfo", memberMap);
         mv.addObject("commandMap", commandMap);
//         mv.addObject("list", list);
         System.out.println("-----------------------------------------commandMap : "+commandMap);
         return mv;
     }
     
     @RequestMapping("/am/member/infoMemberPitPopupTpointPaging")
     public JSON tPointPagingAjax() throws Exception {
    	 JSON json = new JSON();
    	 int result = 0; 
    	 
    	 Map<String, Object> map = new HashMap<String, Object>();
    	 json.put("map", map);
    	 
    	 
    	 return null;
     }
     @RequestMapping("/am/member/infoMemberPitPopupEpointPaging")
     public JSON ePointPagingAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap, String cPage, String pageSize, String MEM_ID) throws Exception {
    	 //--------------- E-point ----------------------------------------
    	 commandMap.put("cPage", cPage);
    	 commandMap.put("pageSize", pageSize);
    	 System.out.println("---------------------------- cPage : "+cPage);
    	 System.out.println("---------------------------- pageSize : "+pageSize);
    	 String MEM_MST_MEM_ID = MEM_ID;
    	 System.out.println("--------------------------- MEM_MST_MEM_ID" +MEM_MST_MEM_ID );
//    	 String id = 'tskootest6';
    	 commandMap.put("MEM_MST_MEM_ID", MEM_MST_MEM_ID);
    	 int ePointTotalCount = this.pointService.selectMemberEpointCount(commandMap);
	        
 		 Paging ePointPaging = new Paging(ePointTotalCount, commandMap);
 		 commandMap.put("startNum", ePointPaging.getStartNum());
 		 commandMap.put("endNum", ePointPaging.getEndNum());	        
// 		 commandMap.put(key, value);
 		 commandMap.put("gotPageSize", ePointPaging.getPageSize());
 		 commandMap.put("totalRecordCount", ePointPaging.getTotalRecordCount());
 		 commandMap.put("totalPageCount", ePointPaging.getTotalPageCount());
 		 commandMap.put("firstPageNoOnPageList", ePointPaging.getFirstPageNoOnPageList());
 		 commandMap.put("lastPageNoOnPageList",ePointPaging.getLastPageNoOnPageList());
 		 commandMap.put("listNum",ePointPaging.getListNum());
 		 commandMap.put("pagingSize", ePointPaging.getPagingSize());
 		 
 		 
 		 List<Map<String, Object>> ePointList = null;
 	     // 포인트 적립 차감 내역 목록
 		 ePointList = this.pointService.selectMemberPoint(commandMap);
    	 
 		 JSON json = new JSON();
 		 json.put("ePointPaging", ePointPaging);
 		 json.put("commandMap", commandMap);
 		 json.put("ePointTotalCount", ePointTotalCount);
    	 json.put("ePointListJSON", ePointList);
    	 
    	 
    	 
    	 return json;
     }
     @RequestMapping("/am/member/infoMemberPitPopupSwPointPaging")
     public JSON swPointPagingAjax() throws Exception {
    	 JSON json = new JSON();
    	 int result = 0; 
    	 
    	 Map<String, Object> map = new HashMap<String, Object>();
    	 json.put("map", map);
    	 
    	 return null;
     }
     /**
      * <pre>
      * 1. MethodName : infoMemberEventPopup
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 포인트정보
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 3.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     @RequestMapping(value="/am/member/infoMemberEventPopup")
     public ModelAndView infoMemberEventPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
    	 ModelAndView mv = new ModelAndView();
              
    	 String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
         searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchEventStDt", StringUtil.getString(commandMap.get("searchEventStDt"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchEventEdDt", StringUtil.getString(commandMap.get("searchEventEdDt"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
         
 		 int totalCount = this.eventService.selectMemberEventListCount(commandMap);
 			        
 		 Paging paging = new Paging(totalCount, commandMap);
 		 mv.addObject( "paging", paging );
 			
 		 commandMap.put("startNum", paging.getStartNum());
 		 commandMap.put("endNum", paging.getEndNum());
 			        
 		 List<Map<String, Object>> list = null;
 		 if (totalCount > 0){
 			 // 이벤트 목록
 			 list = this.eventService.selectMemberEventList(commandMap);
 			            
 			 mv.addObject("list", list);
 			            
 		 }
 		   
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
 		  
 		 mv.addObject("memberInfo", memberMap);
 		 
 		 mv.addObject("eventTypeList", this.commonService.selectCode("COMMON_EVENT_TYPE_GROUP"));
         mv.addObject("commandMap", commandMap);
         //mv.addObject("list", list);
         return mv;
     }
     
     /**
      * <pre>
      * 1. MethodName : infoMemberEventEtrPopup
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 포인트정보
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 3.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     @RequestMapping(value="/am/member/infoMemberEventEtrPopup")
     public ModelAndView infoMemberEventEtrPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
    	 ModelAndView mv = new ModelAndView();
              
    	 List<Map<String, Object>> list = this.eventService.selectMemberEventEtrPopup(commandMap);
    	 Map<String, Object> eventInfo = this.eventService.selectEventInfo(commandMap);
    	 
    	 mv.addObject("eventInfo", eventInfo.get("row"));
 		 mv.addObject("list", list);
 		 
 		 mv.addObject("commandMap", commandMap);
         //mv.addObject("list", list);
         return mv;
     }
     
     /**
      * <pre>
      * 1. MethodName : infoMemberEventWinPopup
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 포인트정보
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 3.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     @RequestMapping(value="/am/member/infoMemberEventWinPopup")
     public ModelAndView infoMemberEventWinPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
    	 ModelAndView mv = new ModelAndView();
              
    	 List<Map<String, Object>> list = this.eventService.selectMemberEventWinPopup(commandMap);
    	 Map<String, Object> eventInfo = this.eventService.selectEventInfo(commandMap);
    	 
    	 mv.addObject("eventInfo", eventInfo.get("row"));
 		 mv.addObject("list", list);
 		 
 		 mv.addObject("commandMap", commandMap);
         //mv.addObject("list", list);
         return mv;
     }
     
     /**
      * <pre>
      * 1. MethodName : infoMemberEventWinPopup
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 포인트정보
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 3.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     @RequestMapping(value="/am/member/infoMemberEventPopupExcelDown")     
     public ModelAndView infoMemberEventPopupExcelDown(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
    	 
    	 String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
         searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
         commandMap.put("excelDown", "Y");
         
 		 int totalCount = this.eventService.selectMemberEventListCount(commandMap);         
         
         if(totalCount > 0){
         	List<Map<String, Object>> list = null;
         	 
         	String fileName = "memberEventList_"+ commandMap.get("MEM_MST_MEM_ID") +"_"+ DateUtil.getToday();


         	String [] rowTitle = { "번호"  ,"이벤트유형"         ,"이벤트명"        , "이벤트시작일자"     ,"이벤트종료일자"     , "응모일"        ,"상태"        ,"발표일"           };
            String [] dataName = { "RNUM" ,"EVT_MST_TYPE_NM" ,"EVT_MST_TITLE" , "EVT_MST_ST_DTS" ,"EVT_MST_ED_DTS" , "EVT_REG_DT"  ,"EVT_STATUS" ,"EVT_MST_WIN_DT" } ;
            String [] cellSize = {"50" , "80", "160","90","90","100","80","80"};
            String [] dataType = {"String","String","String","String","String","String","String","String"};            
            
            ArrayList<String> dataTypeList = new ArrayList<String>();
            ArrayList<String> cellSizeList = new ArrayList<String>();

            
         	//일정 건수가 넘으면 excel 대신 csv 처리
             if(totalCount > 30000){
             	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
             	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
             	commandMap.put("rowTitleArr", rowTitle); //필드제목
             	commandMap.put("dataNameArr", dataName); //필드명
             	commandMap.put("responseForCsv", response); //response
             }
            
         	//list = this.eventService.selectMemberEventList(commandMap);
            list = this.eventService.selectMemberEventListExcel(commandMap);
         	
         	
         	
         	if(list != null){
                 ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
         	}
         }
          
         return null;
         
     }
     
     
     /**
      * <pre>
      * 1. MethodName : infoMemberEventPopup
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 포인트정보
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 3.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     @RequestMapping(value="/am/member/infoMemberReviewPopup")
     public ModelAndView infoMemberReviewPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
    	 ModelAndView mv = new ModelAndView();
    	 
    	 //System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@MEM_MST_MEM_ID : "+ commandMap.get("MEM_MST_MEM_ID"));
    	 
    	 String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
         searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
                       

         
 		 int totalCount = this.commentBoardService.selectCommentBoardListCount(commandMap);
 			        
 		 Paging paging = new Paging(totalCount, commandMap);
 		 mv.addObject( "paging", paging );
 			
 		 commandMap.put("startNum", paging.getStartNum());
 		 commandMap.put("endNum", paging.getEndNum());
 			        
 		 List<Map<String, Object>> list = null;
 		 if (totalCount > 0){
 			 // 이벤트 목록
 			 list = this.commentBoardService.selectCommentBoardList(commandMap);
 			            
 			 mv.addObject("list", list);
 			            
 		 }
 		   
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
 		  
 		 mv.addObject("memberInfo", memberMap);
 		 mv.addObject("commandMap", commandMap);
         //mv.addObject("list", list);
         return mv;
     }
     
     


     @RequestMapping("/am/member/infoMemberReviewPopupExcelDown") 
     public ModelAndView infoMemberReviewPopupExcelDown(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
     	 
         commandMap.put("excelDown", "Y"); 
    	 
    	 
    	 String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
         searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/    	 
    	 
         int totalCount = this.commentBoardService.selectCommentBoardListCount(commandMap);
         
         //if(totalCount > 0){
         	List<Map<String, Object>> list = null;
         	 
         	String fileName = "infoMemberReviewList_"+DateUtil.getToday();
         	
         	
         	String [] rowTitle = { "번호"  , "상품코드"          , "상품명"      , "만족도 평가"     , "등록일"                 };
            String [] dataName = { "RNUM" , "PRD_PRD_MST_CD" , "PRD_MST_NM" , "PRD_REV_STAR" , "PRD_REV_REG_DT_CHAR"  } ;
            String [] cellSize = { "50"   , "80"              , "100"       , "120"          , "80"                   };
            String [] dataType = { "String","String","String","String","String"                                       };            
            
            ArrayList<String> dataTypeList = new ArrayList<String>();
            ArrayList<String> cellSizeList = new ArrayList<String>();
            
         	//일정 건수가 넘으면 excel 대신 csv 처리
             if(totalCount > 30000){
             	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
             	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
             	commandMap.put("rowTitleArr", rowTitle); //필드제목
             	commandMap.put("dataNameArr", dataName); //필드명
             	commandMap.put("responseForCsv", response); //response
             }
            
             list = this.commentBoardService.selectCommentBoardList(commandMap); 	
         	
         	//if(list != null){
                 ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
         	//}
         //}
          
         return null;
      }  

     
     
     
     /**
      * <pre>
      * 1. MethodName : infoMemberQnaPopup
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 상품QNA정보
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 11.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     @RequestMapping(value="/am/member/infoMemberQnaPopup")
     public ModelAndView infoMemberQnaPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
    	 ModelAndView mv = new ModelAndView();
    	 
    	 commandMap.put("BRD_INQ_TYPE", Code.BOARD_INQ_TYPE_PRODUCT);
    	 
    	 String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
         searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
         
 		 int totalCount = this.productInquiryService.selectProductInquiryListCount(commandMap);
 			        
 		 Paging paging = new Paging(totalCount, commandMap);
 		 mv.addObject( "paging", paging );
 			
 		 commandMap.put("startNum", paging.getStartNum());
 		 commandMap.put("endNum", paging.getEndNum());
 			        
 		 List<Map<String, Object>> list = null;
 		 if (totalCount > 0){
 			 // 이벤트 목록
 			 list = this.productInquiryService.selectProductInquiryList(commandMap);
 			            
 			 mv.addObject("list", list);
 			            
 		 }
 		   
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
 		  
 		 mv.addObject("memberInfo", memberMap);
 		 mv.addObject("commandMap", commandMap);
         //mv.addObject("list", list);
         return mv;
     }
     /**
      * <pre>
      * 1. MethodName : infoMemberQnaDetailPopup
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 상품QNA정보 상세
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 11.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     @RequestMapping(value="/am/member/infoMemberQnaDetailPopup")
     public ModelAndView infoMemberQnaDetailPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
    	 ModelAndView mv = new ModelAndView();
    	 
    	 //System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@MEM_MST_MEM_ID : "+ commandMap.get("MEM_MST_MEM_ID"));
    	 
    	 commandMap.put("BRD_INQ_TYPE", Code.BOARD_INQ_TYPE_PRODUCT);
    	 	 // 이벤트 목록
    	 Map<String, Object> row = this.productInquiryService.selectProductInquiryInfo(commandMap);
 			            
 		 mv.addObject("row", row.get("row"));
 		   
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
 		  
 		 mv.addObject("memberInfo", memberMap);
 		 mv.addObject("commandMap", commandMap);
         //mv.addObject("list", list);
         return mv;
     }
     

     @RequestMapping("/am/member/infoMemberQnaPopupExcelDown") 
     public ModelAndView infoMemberQnaPopupExcelDown(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
     	 
         commandMap.put("excelDown", "Y"); 
    	 commandMap.put("BRD_INQ_TYPE", Code.BOARD_INQ_TYPE_PRODUCT);
    	 
    	 String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
         searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/    	 
    	 
         int totalCount = this.productInquiryService.selectProductInquiryListCount(commandMap);
         
         if(totalCount > 0){
         	List<Map<String, Object>> list = null;
         	 
         	String fileName = "infoMemberInqList_"+DateUtil.getToday();
 
         	
         	String [] rowTitle = { "번호"  , "상품코드"             , "상품명"                  , "제목"            , "등록일"               , "답변상태"           , "답변일"                 , "답변자ID"            , "답변자명"           };
            String [] dataName = { "RNUM" , "BRD_PRD_MST_CD" , "BRD_PRD_MST_NM" , "BRD_INQ_TITLE" , "BRD_INQ_REG_DT_CHAR" , "BRD_INQ_REPLY_CD_NM" ,"BRD_INQ_REPLY_DT_CHAR" , "BRD_INQ_REPLY_ID" , "BRD_INQ_REPLY_NM" } ;
            String [] cellSize = { "50"   , "80"              , "100"                     , "120"           , "80"                  , "50"               ,"80"                    , "80"                , "80"               };
            String [] dataType = { "String","String","String","String","String","String","String","String","String","String"};            
            
            ArrayList<String> dataTypeList = new ArrayList<String>();
            ArrayList<String> cellSizeList = new ArrayList<String>();
            
         	//일정 건수가 넘으면 excel 대신 csv 처리
             if(totalCount > 30000){
             	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
             	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
             	commandMap.put("rowTitleArr", rowTitle); //필드제목
             	commandMap.put("dataNameArr", dataName); //필드명
             	commandMap.put("responseForCsv", response); //response
             }
            
             list = this.productInquiryService.selectProductInquiryList(commandMap); 	
         	
         	if(list != null){
                 ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
         	}
         }
          
         return null;
      }  


     
     
     
     /**
      * <pre>
      * 1. MethodName : infoMemberInqPopup
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 고객상담
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 16.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     @RequestMapping(value="/am/member/infoMemberInqPopup")
     public ModelAndView infoMemberInqPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
    	 ModelAndView mv = new ModelAndView();
    	 
    	 //System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@MEM_MST_MEM_ID : "+ commandMap.get("MEM_MST_MEM_ID"));
    	 
    	 //commandMap.put("BRD_INQ_TYPE", Code.BOARD_INQ_TYPE_PRODUCT);
    	 
    	 String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
         searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
         
 		 int totalCount = this.inquiryService.selectInquiryListCount(commandMap);
 			        
 		 Paging paging = new Paging(totalCount, commandMap);
 		 mv.addObject( "paging", paging );
 			
 		 commandMap.put("startNum", paging.getStartNum());
 		 commandMap.put("endNum", paging.getEndNum());
 			        
 		 List<Map<String, Object>> list = null;
 		 if (totalCount > 0){
 			 // 이벤트 목록
 			 list = this.inquiryService.selectInquiryList(commandMap);
 			            
 			 mv.addObject("list", list);
 			            
 		 }
 		   
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
         
         mv.addObject("inqTypeCodeList", this.commonService.selectCode("ONE_TO_ONE_INQUIRY_TYPE_CODE"));
 		  
 		 mv.addObject("memberInfo", memberMap);
 		 mv.addObject("commandMap", commandMap);
         //mv.addObject("list", list);
         return mv;
     }
     
     
     @RequestMapping("/am/member/infoMemberInqPopupExcelDown") 
     public ModelAndView infoMemberInqPopupExcelDown(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
     	 
         commandMap.put("excelDown", "Y"); 
         int totalCount = this.inquiryService.selectInquiryListCount(commandMap);
         
         if(totalCount > 0){
         	List<Map<String, Object>> list = null;
         	 
         	String fileName = "infoMemberInqList_"+DateUtil.getToday();
         	
         	String [] rowTitle = { "번호"  , "구분"             , "문의유형"                  , "제목"            , "등록일"               , "답변상태"           , "답변일"                 , "답변자ID"            , "답변자명"           };
            String [] dataName = { "RNUM" , "MEM_ADV_TYPE_NM" , "MEM_ADV_QST_TYPE_UP_NMS" , "MEM_ADV_TITLE" , "MEM_ADV_REG_DT_CHAR" , "MEM_ADV_RPL_YN_NM" ,"MEM_ADV_UPD_DT_CHAR" , "MEM_ADV_UPD_ID" , "MEM_ADV_UPD_NM" } ;
            String [] cellSize = { "50"   , "80"              , "100"                     , "120"           , "80"                  , "50"               ,"80"                    , "80"                , "80"               };
            String [] dataType = { "String","String","String","String","String","String","String","String","String","String"};            
            
            ArrayList<String> dataTypeList = new ArrayList<String>();
            ArrayList<String> cellSizeList = new ArrayList<String>();
            
         	//일정 건수가 넘으면 excel 대신 csv 처리
             if(totalCount > 30000){
             	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
             	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
             	commandMap.put("rowTitleArr", rowTitle); //필드제목
             	commandMap.put("dataNameArr", dataName); //필드명
             	commandMap.put("responseForCsv", response); //response
             }
            
             list = this.inquiryService.selectInquiryList(commandMap);       	
         	
         	if(list != null){
                 ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
         	}
         }
          
         return null;
      }     
     
     /**
      * <pre>
      * 1. MethodName : infoMemberInqDetailPopup
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 고객상담정보 상세
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 16.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     @RequestMapping(value="/am/member/infoMemberInqDetailPopup")
     public ModelAndView infoMemberInqDetailPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
    	 ModelAndView mv = new ModelAndView();
    	 
    	 //System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@MEM_MST_MEM_ID : "+ commandMap.get("MEM_MST_MEM_ID"));
    	 
    	 
    	 	 // 이벤트 목록
    	 Map<String, Object> row = this.inquiryService.selectInquiryInfo(commandMap);
 			            
 		 mv.addObject("row", row.get("row"));
 		 mv.addObject("fileList", row.get("fileList"));
 		   
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
 		  
         String[] codes = {"ONE_TO_ONE_INQUIRY_TYPE_CODE","HP_CODE"};
         mv.addObject("codes", this.commonService.selectCodes(codes));
         
 		 mv.addObject("memberInfo", memberMap);
 		 mv.addObject("commandMap", commandMap);
         //mv.addObject("list", list);
         return mv;
     }
     
     @RequestMapping("/am/member/sellerInquiryPopup")
     public ModelAndView sellerInquiryList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         

    	 String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
    	 searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
    	 
         //RETURN OBJECT
         //mv.addObject("list", list);
         //mv.addObject("paging", paging);
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
		 
		 int totalCount = this.inquiryService.selectInfoMemberVendorInquiryListCount(commandMap);
	        
 		 Paging paging = new Paging(totalCount, commandMap);
 		 mv.addObject( "paging", paging );
 			
 		 commandMap.put("startNum", paging.getStartNum());
 		 commandMap.put("endNum", paging.getEndNum());
 			        
 		 List<Map<String, Object>> list = null;
 		 if (totalCount > 0){

 			 list = this.inquiryService.selectInfoMemberVendorInquiryList(commandMap);
 			            
 			 mv.addObject("list", list);
 			            
 		 }
         
 		 mv.addObject("memberInfo", memberMap);
         mv.addObject("commandMap", commandMap);
         return mv;
     }
     
     
     @RequestMapping("/am/member/sellerInquiryPopupExcelDown") 
     public ModelAndView sellerInquiryPopupExcelDown(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
     	 
         commandMap.put("excelDown", "Y"); 
         int totalCount = this.inquiryService.selectInfoMemberVendorInquiryListCount(commandMap);
         
         if(totalCount > 0){
         	List<Map<String, Object>> list = null;
         	 
         	String fileName = "memberSellerInquiryList_"+DateUtil.getToday();
         	
         	String [] rowTitle = { "번호"  , "입점사명"     , "제목"            , "등록일"               , "답변상태"           , "답변일"                 , "답변자ID"            , "답변자명"           };
            String [] dataName = { "RNUM" , "VDR_MST_NM" , "BRD_INQ_TITLE" , "BRD_INQ_REG_DT_CHAR" , "BRD_INQ_REPLY_CD_NM" ,"BRD_INQ_REPLY_DT_CHAR" , "BRD_INQ_REPLY_ID" , "BRD_INQ_REPLY_NM" } ;
            String [] cellSize = { "50"   , "100"        , "120"           , "80"                  , "50"               ,"80"                    , "80"                , "80"               };
            String [] dataType = { "String","String","String","String","String","String","String","String","String"};            
            
            ArrayList<String> dataTypeList = new ArrayList<String>();
            ArrayList<String> cellSizeList = new ArrayList<String>();
            
         	//일정 건수가 넘으면 excel 대신 csv 처리
             if(totalCount > 30000){
             	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
             	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
             	commandMap.put("rowTitleArr", rowTitle); //필드제목
             	commandMap.put("dataNameArr", dataName); //필드명
             	commandMap.put("responseForCsv", response); //response
             }
            
             list = this.inquiryService.selectInfoMemberVendorInquiryList(commandMap);         	
         	
         	if(list != null){
                 ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
         	}
         }
          
         return null;
      }
     
     //
     
     /**
      * <pre>
      * 1. MethodName : getSellerListAjax
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 셀러문의> 검색조건 - 셀러 콤보 조회  
      * 4. 작성자       : 이한영
      * 5. 작성일       : 2020.06.17
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      @RequestMapping("/am/member/getSellerListAjax")
       public JSON getSellerListAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
       {
      	 JSON json = new JSON();
      	 
      	 // 회원등급 목록
      	 List<Map<String, Object>> sellerList = this.infoMemberService.selectSellerList(commandMap);
      	 
       	 json.addObject("sellerList", sellerList);
      	 
      	 return json;
       }     
     
     
     @RequestMapping("/am/member/sellerInquiryDetailPopup")
     public ModelAndView sellerDetail(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         

         //RETURN OBJECT
         //mv.addObject("list", list);
         //mv.addObject("paging", paging);
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
         Map<String, Object> sellerDetail = this.inquiryService.selectInfoMemberVendorInquiryDetail(commandMap);
         if(sellerDetail!=null && sellerDetail.containsKey("BRD_INQ_CONTENTS") && sellerDetail.get("BRD_INQ_CONTENTS") instanceof CLOB) {
        	 CLOB clob = (CLOB)sellerDetail.get("BRD_INQ_CONTENTS");
        	 sellerDetail.put("BRD_INQ_CONTENTS", StringUtil.clobToStr(clob));
         }
         if(sellerDetail!=null && sellerDetail.containsKey("BRD_INQ_REPLY_CONTENTS") && sellerDetail.get("BRD_INQ_REPLY_CONTENTS") instanceof CLOB) {
        	 CLOB clob = (CLOB)sellerDetail.get("BRD_INQ_REPLY_CONTENTS");
        	 sellerDetail.put("BRD_INQ_REPLY_CONTENTS", StringUtil.clobToStr(clob));
         }
         mv.addObject("sellserDetail",sellerDetail);
 		 mv.addObject("memberInfo", memberMap);
         mv.addObject("commandMap", commandMap);
         return mv;
     }
     
     @RequestMapping("/am/member/cartListPopup")
     public ModelAndView cartListPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         User user = new User();
         user.setMEM_MST_MEM_ID(StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
         commandMap.put("user", user); 
         int totalCount = this.cartService.selectCartCnt(commandMap);
         Paging paging = new Paging(totalCount, commandMap);
 		 mv.addObject( "paging", paging );
 		 commandMap.put("CART_PC_MOBILE_GUBUN", "P");
		 commandMap.put("startNum", paging.getStartNum());
		 commandMap.put("endNum", paging.getEndNum());
		 Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
		 cartService.selectCartlist(commandMap);
         //RETURN OBJECT
         //mv.addObject("list", list);
         //mv.addObject("paging", paging);
         mv.addObject("commandMap", commandMap);
         mv.addObject("cartlist",commandMap.get("cartlist"));
        
		  
 		 mv.addObject("memberInfo", memberMap);
         return mv;
     }
     
     @RequestMapping("/am/member/commentListPopup")
     public ModelAndView commentListPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
    	 
    	 ModelAndView mv = new ModelAndView();
        
    	 
    	 String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
    	 searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
    	 
    	 
 		 int totalCount = this.infoMemberService.selectMemberCommentListCount(commandMap);
 			        
 		 Paging paging = new Paging(totalCount, commandMap);
 		 mv.addObject( "paging", paging );
 			
 		 commandMap.put("startNum", paging.getStartNum());
 		 commandMap.put("endNum", paging.getEndNum());
 			        
 		 List<Map<String, Object>> list = null;
 		 if (totalCount > 0){
 			 // 이벤트 목록
 			 list = this.infoMemberService.selectMemberCommentList(commandMap);
 			            
 			 mv.addObject("list", list);
 			            
 		 }
 		  
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);

         
 		 mv.addObject("memberInfo", memberMap);
         mv.addObject("commandMap", commandMap);
         //mv.addObject("list", list);
         return mv;
     }
     
     @RequestMapping("/am/member/commentListPopupExcelDown") 
     public ModelAndView commentListPopupExcelDown(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
     	 
         commandMap.put("excelDown", "Y"); 
         int totalCount = this.infoMemberService.selectMemberCommentListCount(commandMap);
         
         if(totalCount > 0){
         	List<Map<String, Object>> list = null;
         	 
         	String fileName = "memberCommentList_"+DateUtil.getToday();

         	
         	String [] rowTitle = { "번호"  , "제목"            ,"댓글"         , "등록일"                 };
            String [] dataName = { "RNUM" , "CNT_MST_TITLE"  ,"OTD_RPL_CTS" , "OTD_RPL_REG_DT_CHAR"  } ;
            String [] cellSize = { "50"   , "120"            , "150"         , "50"                   };
            String [] dataType = { "String","String","String","String"};            
            
            ArrayList<String> dataTypeList = new ArrayList<String>();
            ArrayList<String> cellSizeList = new ArrayList<String>();
            
         	//일정 건수가 넘으면 excel 대신 csv 처리
             if(totalCount > 30000){
             	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
             	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
             	commandMap.put("rowTitleArr", rowTitle); //필드제목
             	commandMap.put("dataNameArr", dataName); //필드명
             	commandMap.put("responseForCsv", response); //response
             }
            
         	list = this.infoMemberService.selectMemberCommentList(commandMap);  // 엑셀다운로드         	
         	
         	if(list != null){
                 ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
         	}
         }
          
         return null;
      }     
     
     
     
     @RequestMapping("/am/member/infoMemberCartPopup")
     public ModelAndView infoMemberCartPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
         int totalCount = this.infoMemberService.selectInfoMemberLikeProductListCount(commandMap);
	        
 		 Paging paging = new Paging(totalCount, commandMap);
 		 mv.addObject("paging", paging );
 			
 		 
 		 List<Map<String, Object>> list = null;
 		if (totalCount > 0){
 			commandMap.put("startNum", paging.getStartNum());
 	 		commandMap.put("endNum", paging.getEndNum());
 			list = this.infoMemberService.selectInfoMemberLikeProductList(commandMap);
 			mv.addObject("list", list);
 		}
         mv.addObject("commandMap", commandMap);
         mv.addObject("memberInfo", memberMap);
         return mv;
     }
     
     
     @RequestMapping("/am/member/infoMemberReviewDetailPopup")
     public ModelAndView infoMemberReviewDetailPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);
         Map<String, Object> reviewDetail = this.commentBoardService.selectCommentBoardInfo(commandMap);
         if(reviewDetail!=null && reviewDetail.containsKey("PRD_REV_CONTENTS") && reviewDetail.get("PRD_REV_CONTENTS") instanceof CLOB) {
        	 CLOB clob = (CLOB)reviewDetail.get("PRD_REV_CONTENTS");
        	 reviewDetail.put("PRD_REV_CONTENTS", StringUtil.clobToStr(clob));
         }
         mv.addObject("reviewDetail",reviewDetail);      
         mv.addObject("commandMap", commandMap);
         mv.addObject("memberInfo", memberMap);
         return mv;
     }
     
     @RequestMapping("/am/member/infoMemberExcelDownload") 
     public ModelAndView basicProductListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
     	 
         commandMap.put("excelDown", "Y"); 
         int totalCount = this.infoMemberService.selectInfoMemberListCount(commandMap);
         
         if(totalCount > 0){
         	List<Map<String, Object>> list = null;
         	 
         	String fileName = "memberList_"+DateUtil.getToday();
         	
         	/*								
        	String [] rowTitle = { "아이디","ESHOP아이디","이름","성별","생년월일","실명인증여부","임직원등급","회원등급","회원등급코드","우편번호","주소(동/읍/면)","주소(번지 미만)","전화번호","휴대폰번호","이메일","SMS 수신여부","e메일 수신여부","카카오톡 수신여부","통합포인트","E포인트","회원 가입일","가입시간","누적주문건수","실결제금액","총 실주문건수","총 구매금액","최종 주문일","접속 IP","임직원포인트","리뷰어회원 여부","이벤트 당첨건수"};
           String [] dataName = { "MEM_MST_MEM_ID" ,"MEM_MST_ERP_ID"    ,"MEM_MST_MEM_NM" , "MEM_IPN_SEX_NM","MEM_IPN_BIR", "REAL_NAME_CHECK","MEM_MST_SW_TYPE", "MEM_MST_MEM_GBN_NM","MEM_MST_MEM_GRD", "MEM_MST_ZIP_CDE5","MEM_MST_DRO_ADR1","MEM_MST_DRO_ADR2","MEM_MST_TEL", "MEM_MST_HP","MEM_MST_MAIL","SMS_YN", "EMAIL_YN","KAKAO_YN","MEM_TOT_POINT", "MEM_E_POINT","MEM_REG_DT","MEM_REG_TM", "TOT_ORD_CNT","TOT_ORD_PAY","REAL_ORD_CNT","REAL_ORD_PAY","LAST_ORD_DT","MEM_MST_UPD_IP", "MEM_SW_POINT","REVIEWER_TYPE","TOT_EVT_WIN_COUNT"} ;
           String [] cellSize = {"50" , "50", "50","50","50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50"};
           String [] dataType = {"String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String"};            
           
            */
            
         	String [] rowTitle = { "아이디","ESHOP아이디","이름","성별","생년월일","실명인증여부","회원등급","회원등급코드","우편번호","주소(동/읍/면)","주소(번지 미만)","전화번호","휴대폰번호","이메일","SMS 수신여부","e메일 수신여부","카카오톡 수신여부","통합포인트","E포인트","회원 가입일","가입시간","누적주문건수","실결제금액","총 실주문건수","총 구매금액","최종 주문일","접속 IP","임직원포인트","리뷰어회원 여부","이벤트 당첨건수"};
            String [] dataName = { "MEM_MST_MEM_ID" ,"MEM_MST_ERP_ID"    ,"MEM_MST_MEM_NM" , "MEM_IPN_SEX_NM","MEM_IPN_BIR", "REAL_NAME_CHECK", "MEM_MST_MEM_GBN_NM","MEM_MST_MEM_GRD", "MEM_MST_ZIP_CDE5","MEM_MST_DRO_ADR1","MEM_MST_DRO_ADR2","MEM_MST_TEL", "MEM_MST_HP","MEM_MST_MAIL","SMS_YN", "EMAIL_YN","KAKAO_YN","MEM_TOT_POINT", "MEM_E_POINT","MEM_REG_DT","MEM_REG_TM", "TOT_ORD_CNT","TOT_ORD_PAY","REAL_ORD_CNT","REAL_ORD_PAY","LAST_ORD_DT","MEM_MST_UPD_IP", "MEM_SW_POINT","REVIEWER_TYPE","TOT_EVT_WIN_COUNT"} ;
            String [] cellSize = {"50" , "50", "50","50","50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50"};
            String [] dataType = {"String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String"};            
            
            ArrayList<String> dataTypeList = new ArrayList<String>();
            ArrayList<String> cellSizeList = new ArrayList<String>();
            /*
            for(int i=0;i<rowTitle.length;i++) {
            	cellSizeList.add("50");
            	dataTypeList.add("String");
            }
            String [] dataType = (String[]) dataTypeList.toArray();
            String [] cellSize = (String[]) cellSizeList.toArray();
            */
            
         	//일정 건수가 넘으면 excel 대신 csv 처리
             if(totalCount > 30000){
             	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
             	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
             	commandMap.put("rowTitleArr", rowTitle); //필드제목
             	commandMap.put("dataNameArr", dataName); //필드명
             	commandMap.put("responseForCsv", response); //response
             }
            
         	//list = this.infoMemberService.selectInfoMemberList(commandMap);  // 엑셀다운로드
         	list = this.infoMemberService.selectInfoMemberListExcel(commandMap);  // 엑셀다운로드         	
         	
         	
         	if(list != null){
                 ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
         	}
         }
          
         return null;
      }
     
     @RequestMapping("/am/member/infoMemberCouponListExcelDownload") 
     public ModelAndView infoMemberCouponListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         commandMap.put("excelDown", "Y"); 
         
         String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
         searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchCouponStDt", StringUtil.getString(commandMap.get("searchCouponStDt"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchCouponEdDt", StringUtil.getString(commandMap.get("searchCouponEdDt"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
    	 
         List<Map<String, Object>> list = null;
     	 
         list = this.infoMemberService.selectMemberCouponList(commandMap);  // 엑셀다운로드         	
     	
         if(list != null){
        	 String fileName = "memberCouponList_"+DateUtil.getToday();
        	 String [] rowTitle = { "NO","쿠폰번호","쿠폰종류","쿠폰명","할인금액/율","최대할인금액","유효기간(시작)","유효기간(종료)","사용일","주문번호"};
        	 String [] dataName = { "RNUM", "CPN_MST_IDX", "CPN_MST_GBN_NM", "CPN_MST_TITLE", "CPN_MST_SAL_PRC", "CPN_MST_MXM_PRC", "CPN_USE_ST_DT", "CPN_USE_ED_DT", "CPN_USE_DT", "CPN_USE_ORD_NO"} ;
        	 String [] cellSize = {"50" , "70", "100","200","70","70","80","80","80","80"};
        	 String [] dataType = {"int","String","String","String","String","String","String","String","String","String"}; 
        	 
        	 ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
         }
          
         return null;
      }
     
     


     /**
      * <pre>
      * 1. MethodName : infoMemberOOTDPopup
      * 2. ClassName  : InfoMemberController.java
      * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > OOTD
      * 4. 작성자       : 이한영
      * 5. 작성일       : 2020. 06. 16.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
     @RequestMapping(value="/am/member/infoMemberOOTDPopup")
     public ModelAndView infoMemberOOTDPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
    	 ModelAndView mv = new ModelAndView();
        
    	 
    	 String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
    	 searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                 
         commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
    	 
    	 
 		 int totalCount = this.infoMemberService.selectMemberOOTDCount(commandMap);
 			        
 		 Paging paging = new Paging(totalCount, commandMap);
 		 mv.addObject( "paging", paging );
 			
 		 commandMap.put("startNum", paging.getStartNum());
 		 commandMap.put("endNum", paging.getEndNum());
 			        
 		 List<Map<String, Object>> list = null;
 		 if (totalCount > 0){
 			 // 이벤트 목록
 			 list = this.infoMemberService.selectMemberOOTDList(commandMap);
 			            
 			 mv.addObject("list", list);
 			            
 		 }
 		  
         Map<String, Object> memberMap = this.infoMemberService.selectMemberInfo(commandMap);

         
 		 mv.addObject("memberInfo", memberMap);
         mv.addObject("commandMap", commandMap);
         //mv.addObject("list", list);
         return mv;
     }
	 
     @RequestMapping("/am/member/infoMemberOOTDPopupExcelDown") 
     public ModelAndView infoMemberOOTDPopupExcelDown(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
     	 
         commandMap.put("excelDown", "Y"); 
         int totalCount = this.infoMemberService.selectMemberOOTDCount(commandMap);
         
         if(totalCount > 0){
         	List<Map<String, Object>> list = null;
         	 
         	String fileName = "memberOOTDList_"+DateUtil.getToday();

         	
         	String [] rowTitle = { "번호"  , "제목"            ,"등록일"                , "댓글수"          , "상태"               };
            String [] dataName = { "RNUM" , "CNT_MST_TITLE"  ,"CNT_MST_REG_DT_CHAR" , "COMMENT_COUNT" , "CNT_MST_USE_YN_NM" } ;
            String [] cellSize = { "50"   , "120"            , "50"                 , "50"            , "50"                };
            String [] dataType = { "String","String","String","String","String"};            
            
            ArrayList<String> dataTypeList = new ArrayList<String>();
            ArrayList<String> cellSizeList = new ArrayList<String>();
            
         	//일정 건수가 넘으면 excel 대신 csv 처리
             if(totalCount > 30000){
             	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
             	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
             	commandMap.put("rowTitleArr", rowTitle); //필드제목
             	commandMap.put("dataNameArr", dataName); //필드명
             	commandMap.put("responseForCsv", response); //response
             }
            
         	list = this.infoMemberService.selectMemberOOTDList(commandMap);  // 엑셀다운로드         	
         	
         	if(list != null){
                 ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
         	}
         }
          
         return null;
      }
     
     
     
     
     
}
