package com.market.mall.pc.mypage.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.DateUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyBuyShoppingService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyShoppingService;

/**
 * @PackageName: com.market.mall.pc.mypage.controller
 * @FileName : MyBuyShoppingController.java
 * @Date : 2016. 1. 19.
 * @프로그램 설명 : 내가 구매한 상품 처리하는 Controller Class
 * @author DEV_KIMMINHO    
 */
@Controller("pcMyBuyShoppingController")
public class MyBuyShoppingController {
	
	@Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
    
	@Resource
	private CartService cartService;
	
	@Resource(name="pcMyShoppingService")
    private MyShoppingService pcMyShoppingService;
	
	@Resource(name="pcMyBuyShoppingService")
	private MyBuyShoppingService pcMyBuyShoppingService;
	 
    @Resource(name="pcCommonService")
    private CommonService pcCommonService;
    
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_SMALL;
	
	/**
	* <pre>
	* 1. MethodName : myBuyShoppingList
	* 2. ClassName : MyBuyShoppingController.java
	* 3. Comment : 내가 구매한 상품 리스트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myBuyShoppingList")
    public ModelAndView myBuyShoppingList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            
        	commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            // 기본값 설정 - 검색 날짜(-6개월 고정)
            commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-"));
            commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
            commandMap.put("searchMaxDate", DateUtil.getToday("-"));
            commandMap.put("searchMinDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-"));
            
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            int totalCount = this.pcMyBuyShoppingService.selectProductListCount(commandMap);
            
            // 페이지당 기본 출력 갯수는 12개 이다.
            commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "12"));
            commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
            Paging paging = new Paging(totalCount, commandMap);
            List<Map<String, Object>> listProduct = null;
            if(totalCount> 0)
            {
            	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
            	listProduct = this.pcMyBuyShoppingService.selectProductList(commandMap);
            	
            	// TODO 상품 옵션 가져오기
         		for(Map<String, Object> ordPrd : listProduct){
         			int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
         			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
         				List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(ordPrd);
         				ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
         			}
         			
         			//서브 옵션 리스트
         			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
         			int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
         			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
        				subPrdList = this.pcMyShoppingService.selectOrderSubPrdList(ordPrd);
        				ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
         			}
         		}
            }
            
            //RETURN OBJECT
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("totalCount", totalCount);
            mv.addObject("paging", paging);
            mv.addObject("listProduct", listProduct);
            mv.addObject("commandMap", commandMap);
            
            return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
    }
}
