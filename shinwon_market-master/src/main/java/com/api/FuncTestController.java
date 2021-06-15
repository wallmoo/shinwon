package com.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.common.kakao.service.BusinessKakaoTalkService;
import com.market.mall.common.mail.service.MailService;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.orderErpApi.erpApi.com.market.mall.pc.brand.service.OrderErpApiService;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class FuncTestController
{
	
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name = "orderErpApiService") protected OrderErpApiService orderErpApiService;
	@Resource(name="mailSendingService") 
	protected MailService mailService;
	
	@Resource(name="kakaoService")
	BusinessKakaoTalkService kakaoService;
	
    @ResponseBody
    @RequestMapping(value = "/api/test/email/joinus", method = RequestMethod.POST)
    public Map<String, Object> joinusEmailTest(@RequestBody Map<String, Object> params)
    {
    	//String[] targetList = {"alalike@sw.co.kr","ytbs3@nate.com","hebs3@hanmail.net","hebs3@naver.com","parknana1975@gmail.com"};
    	String[] targetList = {"sdh0823@naver.com","dhseo@monkey-soft.com","zzzigs@gmail.com"};
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> testParam = new HashMap<String, Object>();
        testParam.put("MEM_MST_MEM_ID", "sdh0823");
        testParam.put("MEM_MST_MEM_NM", "서덕희");
        for(int i=0;i<targetList.length;i++) {
        	testParam.put("MEM_MST_MAIL", targetList[i]);
            mailService.sendJoinusComplete(testParam);
        }
        result.put("resultCode", 200);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/test/kakao/joinus", method = RequestMethod.POST)
    public Map<String, Object> joinusKakaoTest(@RequestBody Map<String, Object> params) throws Exception
    {
    	//회원가입완료
    	Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> testParam = new HashMap<String, Object>();
        testParam.put("MEM_MST_MEM_NM", "서덕희");
        testParam.put("PHONE", "01096070502");
    	kakaoService.sendSwd57(testParam);
    	result.put("resultCode", 200);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/test/kakao/vendorBusinessShare", method = RequestMethod.POST)
    public Map<String, Object> vendorBusinessShareKakaoTest(@RequestBody Map<String, Object> params) throws Exception
    {
    	//업무공유 관리자 답변등록
    	Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> testParam = new HashMap<String, Object>();
        testParam.put("LINK", propertiesService.getString("front.domain")+"/am/vendor/vendorLoginManagerForm.do");
        testParam.put("VDR_MST_NM", "MARKM");
        testParam.put("PHONE", "01096070502");
    	kakaoService.sendSwd64(testParam);
    	result.put("resultCode", 200);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/api/test/kakao/restockRequest", method = RequestMethod.POST)
    public Map<String, Object> restockRequest(@RequestBody Map<String, Object> params) throws Exception
    {
    	//재입고알림톡
    	Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> testParam = new HashMap<String, Object>();
        testParam.put("LINK", propertiesService.getString("front.domain")+"/am/vendor/vendorLoginManagerForm.do");
        testParam.put("VDR_MST_NM", "MARKM");
        testParam.put("PHONE", "01024306117");
        testParam.put("CALLBACK", "021234567");
        
    	kakaoService.sendSwd61(testParam);
    	result.put("resultCode", 200);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/test/Erp/OrderInfo", method = RequestMethod.POST)
    public Map<String, Object> OrderInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
    	//재입고알림톡
    	Map<String, Object> result = new HashMap<String, Object>();
    	Map<String, Object> Orderresult = new HashMap<String, Object>();
    	
    	System.out.println("=========================>>  "+request.getParameter("ORD_MST_CD"));
    	System.out.println("=========================>>  "+request.getParameter("ORD_PRD_IDX"));
    	System.out.println("=========================>>  "+request.getParameter("ORD_PRD_ORD_STATE"));
    	commandMap.put("ORD_MST_CD", request.getParameter("ORD_MST_CD"));//주문번호
    	commandMap.put("ORD_PRD_IDX", request.getParameter("ORD_PRD_IDX"));        //주문상세번호
    	commandMap.put("ORD_PRD_ORD_STATE", request.getParameter("ORD_PRD_ORD_STATE"));     //주문단계
        
    	//List<String> keyList = new ArrayList<>(Orderresult.keySet());    	
    	
    	Orderresult = orderErpApiService.orderErpApiTrans(request, commandMap);
    	result.put("resultCode", 200);
    	result.put("OrderInfo", Orderresult);
        return result;
    }
    /*재입고 알림 리스트*/
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("api/order/OrderInfo")
    public ModelAndView restockNotificationList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
    	Map<String, Object> result = new HashMap<String, Object>();
    	Map<String, Object> Orderresult = new HashMap<String, Object>();
    	ModelAndView mv = new ModelAndView();
    	commandMap.put("ORD_MST_CD", "2020062404316");//주문번호
    	commandMap.put("ORD_PRD_IDX", 342005);        //주문상세번호
    	commandMap.put("ORD_PRD_ORD_STATE", 407);     //주문단계
        
    	Orderresult = orderErpApiService.orderErpApiTrans(request, commandMap);
    	result.put("resultCode", 200);
    	result.put("OrderInfo", Orderresult);      
        
        mv.addObject("OrderInfo", Orderresult);
        mv.addObject("commandMap", commandMap);
        
        
        
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/api/test/Erp/requestProductMaster2", method = RequestMethod.POST)
    public Map<String, Object> requestProductMaster2(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
    	//재입고알림톡
    	Map<String, Object> result = new HashMap<String, Object>();
    	String styleNo ="VAB24540";
    	ErpRequest erpRequest =new ErpRequest();
    	Map<String, Object> Prd_result = erpRequest.requestProductMaster2(styleNo);
    	result.put("resultCode", 200);
    	result.put("OrderInfo", Prd_result);
        return result;
    }
    
}
