package com.market.mall.am.marketing.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.TimeSaleService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;

/**
 * @PackageName: com.market.mall.am.marketing.controller
 * @FileName : TimeSaleController.java
 * @Date : 2015. 11. 26.
 * @프로그램 설명 : 관리자 > 프로모션관리 > 원데이특가를 처리하는 Controller Class
 * @author khcho
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class TimeSaleController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="timeSaleService") private TimeSaleService timeSaleService;
    @Resource(name="commonService") private CommonService commonService;    

    /**
     * <pre>
     * 1. MethodName : timeSaleList
     * 2. ClassName  : TimeSaleController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 타임세일 목록 갯수 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * 6. 수정일       : 2020. 06. 09.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/timeSaleList")
    public ModelAndView timeSaleList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
    	
    	String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -7);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        
        //페이징
        int totalCount = this.timeSaleService.selectTimeSaleCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        mv.addObject("paging", paging);
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        List<Map<String, Object>> productList = null;
        
        commandMap.put("THUMBNAIL_SIZE",Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        
        if(totalCount > 0)
        {
        	//타임세일 상품 리스트 조회
        	productList = this.timeSaleService.selectTimeSaleProductList(commandMap);
        	
        	List<String> arrTIM_SAL_IDX = new ArrayList<String>();
        	for(int index=0; index < productList.size(); index++) {
        		String idx = StringUtil.getString(productList.get(index).get("TIM_SAL_IDX"));
        		arrTIM_SAL_IDX.add(idx);
        	}
        	
        	commandMap.put("arrTIM_SAL_IDX",arrTIM_SAL_IDX);
        	
        	//타임세일 리스트 조회
        	list = this.timeSaleService.selectTimeSaleList(commandMap);
        	
        	for(int index = 0; index < list.size(); index++) {
        		Map<String, Object> timeSaleItem = list.get(index);
        		List<Map<String, Object>> timeSaleProdutList = new ArrayList();
        		for(int productIndex = 0; productIndex < productList.size(); productIndex++) {
        			if(list.get(index).get("TIM_SAL_IDX").equals(productList.get(productIndex).get("TIM_SAL_IDX"))) {
        				timeSaleProdutList.add(productList.get(productIndex));
        			}
        		}
        		timeSaleItem.put("productList", timeSaleProdutList);
        	}
        }
        
        // 광고 노출 페이지
        //List<Map<String, Object>> viewLocationList = this.commonService.selectCode("COMMON_POPUP_VIEW_LOCATION");
        
        //RETURN OBJECT
        mv.addObject("totalCount", totalCount);
        mv.addObject("list", list);
        //mv.addObject("productList", productList);
        mv.addObject("commandMap", commandMap);

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : timeSaleEdit
     * 2. ClassName  : TimeSaleController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 타임세일 수정 화면  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * 6. 작성일       : 2020. 06. 09.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */

    /**
     * @api {POST} /am/marketing/timeSaleEdit.do
     * @apiName 타임세일 수정 화면
     * @apiGroup 타임세일
     * 
     * @apiParam {String} TIM_SAL_IDX 타임세일IDX
     * 
     * @apiSuccess {Object} info 타임세일 기본 정보  {TIM_SAL_USE_YN=Y, TIM_SAL_UPD_DT=20200503054004, TIM_SAL_NM=타임스페셜 테스트, TIM_SAL_REG_DT=20200503054004, TIM_SAL_ED_DT=20200531, TIM_SAL_ED_HH=23, TIM_SAL_ED_MM=59, TIM_SAL_IDX=37, TIM_SAL_ST_DT=20200503, TIM_SAL_ST_HH=20, TIM_SAL_ST_MM=10, TIM_SAL_REG_IP=0:0:0:0:0:0:0:1}
     * @apiSuccess {Object[]} detailGroupList 상품구성 그룹 목록 [{PRD_MST_NM=한성판매! 여성원피스! 핫템!, PRD_IMAGE=/attach/product/2020/04/27/S0012158/S0012158_0_500.jpg, TIM_DTL_ORDER=1, TIM_PRD_MST_SALE_RATE=10, PRD_MST_SEL_CNT=777, TIM_DTL_IDX=8, PRD_MST_PRC=88000, TIM_PRD_MST_UNT=R, TIM_PRD_MST_CD=S0012158, BND_MST_BRAND_NM=GINNASIX2, PRD_MST_DPL_STATE=Y}, {PRD_MST_NM=옥스포드 셔츠, PRD_IMAGE=/attach/product/2020/04/27/S0012159/S0012159_0_500.jpg, TIM_DTL_ORDER=2, TIM_PRD_MST_SALE_RATE=1000, PRD_MST_SEL_CNT=50, TIM_DTL_IDX=9, PRD_MST_PRC=25000, TIM_PRD_MST_UNT=S, TIM_PRD_MST_CD=S0012159, BND_MST_BRAND_NM=GINNASIX2, PRD_MST_DPL_STATE=Y}]
     * @apiSuccess {Object[]} tagList 태그 리스트 [{TAG_MST_ID=0f6b08e3-aafb-4fb0-9546-e6a1b3967c5d, TAG_MST_TITLE=#포도, TAG_BND_REP=Y}, {TAG_MST_ID=42ab4d51-62bb-4cc2-8cec-437199a64c7f, TAG_MST_TITLE=#청, TAG_BND_REP=N}]
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/marketing/timeSaleEdit")
    public ModelAndView timeSaleEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("TIM_SAL_IDX"), "")))
        {
            //타임세일  상세 정보
            Map<String, Object> resultMap = this.timeSaleService.selectTimeSaleInfo(commandMap);
            
            //RETURN OBJECT
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("detailList", resultMap.get("detailList")); //상품구성 그룹 목록
            mv.addObject("tagList", resultMap.get("tagList"));//태그 목록
        }

        mv.addObject("commandMap", commandMap);
        
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : timeSaleRegist
     * 2. ClassName  : TimeSaleController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 타임세일 등록 처리 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    /**
     * @api {POST} /am/marketing/timeSaleRegist.do
     * @apiName 타임세일 등록
     * @apiGroup 타임세일
     * 
     * @apiParam {String} TIM_SAL_TYPE 타임세일구분(G:일반, T:타임스페셜)
     * @apiParam {String} PRD_MST_CD 타임세일 구분이 G 일때 상품 코드
     * @apiParam {String} TIM_PRD_MST_CD 타임세일 구분이 T 일때 상품 코드 배열  ex) [S0012158, S0012159]
     * @apiParam {String} TIM_PRD_MST_SALE_RATE 타임세일 구분이 G일때 할인금액
     * @apiParam {String} TIM_PRD_MST_UNT 타임세일 구분이 G일때 정율(R)/정액(S)
     * @apiParam {String} TIM_PRD_MST_SALE_RATE_상품코드 타임세일 구분이 T일때 할인금액
     * @apiParam {String} TIM_PRD_MST_UNT_상품코드 타임세일 구분이 T일때 정율(R)/정액(S)
     * @apiParam {String} TIM_SAL_NM 제목
     * @apiParam {String} TIM_SAL_ST_DT 적용시작일자
     * @apiParam {String} TIM_SAL_ST_HH 적용시작시간
     * @apiParam {String} TIM_SAL_ST_MM 적용시작분
     * @apiParam {String} TIM_SAL_ED_DT 적용종료일자
     * @apiParam {String} TIM_SAL_ED_HH 적용종료시간
     * @apiParam {String} TIM_SAL_ED_MM 적용종료분
     * @apiParam {String} TIM_SAL_USE_YN 사용여부
     * @apiParam {String} TIM_SAL_PRD_CNT 상품재고
     * 
     * @apiSuccess {String} alertMsg 등록 성공/실패 메세지 
     * @apiSuccess {String} returnUrl 등록 성공 이후 돌아가는 URL
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/marketing/timeSaleRegist")
    public ModelAndView timeSaleRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 등록자 ID, IP
        commandMap.put("TIM_SAL_REG_IP", request.getRemoteAddr());
        commandMap.put("TIM_SAL_REG_ID", admin.getADM_MST_ID());
        
        result = this.timeSaleService.insertTimeSale((MultipartHttpServletRequest)request, commandMap);
        if(result > 0)
        {
            alertMsg = "정상적으로 등록되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/marketing/timeSaleList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : timeSaleModify
     * 2. ClassName  : TimeSaleController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 타임세일 수정 처리  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    /**
     * @api {POST} /am/marketing/timeSaleModify.do
     * @apiName 타임세일 수정 처리
     * @apiGroup 타임세일
     * 
     * @apiParam {String} TIM_SAL_IDX 타임세일IDX
     * @apiParam {String} TIM_SAL_TYPE 타임세일구분(G:일반, T:타임스페셜)
     * @apiParam {String} PRD_MST_CD 타임세일 구분이 G 일때 상품 코드
     * @apiParam {String} TIM_PRD_MST_CD 타임세일 구분이 T 일때 상품 코드 배열  ex) [S0012158, S0012159]
     * @apiParam {String} TIM_DTL_ORDER_상품코드  타임세일 구분이 T일때 전시순서  ex) TIM_DTL_ORDER_S0012158 = 1
     * @apiParam {String} TIM_DTL_ORDER_상품코드  타임세일 구분이 T일때 전시순서 ex) TIM_DTL_ORDER_S0012159 = 2
     * @apiParam {String} TIM_PRD_MST_SALE_RATE 타임세일 구분이 G일때 할인금액
     * @apiParam {String} TIM_PRD_MST_UNT 타임세일 구분이 G일때 정율(R)/정액(S)
     * @apiParam {String} TIM_PRD_MST_SALE_RATE_상품코드 타임세일 구분이 T일때 할인금액
     * @apiParam {String} TIM_PRD_MST_UNT_상품코드 타임세일 구분이 T일때 정율(R)/정액(S)
     * @apiParam {String} TIM_SAL_NM 제목
     * @apiParam {String} TIM_SAL_ST_DT 적용시작일자
     * @apiParam {String} TIM_SAL_ST_HH 적용시작시간
     * @apiParam {String} TIM_SAL_ST_MM 적용시작분
     * @apiParam {String} TIM_SAL_ED_DT 적용종료일자
     * @apiParam {String} TIM_SAL_ED_HH 적용종료시간
     * @apiParam {String} TIM_SAL_ED_MM 적용종료분
     * @apiParam {String} TIM_SAL_USE_YN 사용여부
     * @apiParam {String} TIM_SAL_PRD_CNT 상품재고
     * @apiParam {JSON} tagData 태그리스트  [{"TAG_MST_ID":"0f6b08e3-aafb-4fb0-9546-e6a1b3967c5d","TAG_BND_STATUS":"USE","TAG_BND_REP":"Y"}, {"TAG_MST_ID":"42ab4d51-62bb-4cc2-8cec-437199a64c7f","TAG_BDN_STATUS":"USE","TAG_BND_REP":"N"}]
     * 
     * @apiSuccess {String} alertMsg 수정 성공/실패 메세지 
     * @apiSuccess {String} returnUrl 수정 성공 이후 돌아가는 URL
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/marketing/timeSaleModify")
    public ModelAndView timeSaleModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("TIM_SAL_UPD_IP", request.getRemoteAddr());
        commandMap.put("TIM_SAL_UPD_ID", admin.getADM_MST_ID());

        result = this.timeSaleService.updateTimeSale((MultipartHttpServletRequest)request, commandMap);
        if(result > 0)
        {
            alertMsg = "정상적으로 수정되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/marketing/timeSaleList.do");
        mv.setViewName("am/common/result");

        return mv;
    }
    

    /**
     * <pre>
     * 1. MethodName : timeSaleForm
     * 2. ClassName  : TimeSaleController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 등록 화면 
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/timeSaleForm")
    public ModelAndView timeSaleForm(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        // 광고 노출 페이지
        List<Map<String, Object>> wchList = this.commonService.selectCode("COMMON_AD_WCH");
        mv.addObject("wchList", wchList);
        
        return mv;
    }
    
    @RequestMapping(value="/am/marketing/timeSaleListModify")
    public ModelAndView timeSaleListModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("TIM_SAL_UPD_IP", request.getRemoteAddr());
        commandMap.put("TIM_SAL_UPD_ID", admin.getADM_MST_ID());
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_TIME_SALE);
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        String timeSaleData = StringUtil.getString(commandMap.get("selectedTimeSaleList"),"");
        List<Map<String, Object>> selectedTimeSaleList = mapper.readValue(timeSaleData, typeRef);
        
        commandMap.put("selectedTimeSaleList", selectedTimeSaleList);
        
        if(selectedTimeSaleList != null && selectedTimeSaleList.size() > 0)
        {
        	if("admin".equals(admin.getADM_MST_ID()))
        	{
                // 관리자 수정
                this.timeSaleService.updateTimeSaleList(commandMap);
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/timeSaleList.do");
        	}
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/timeSaleList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : searchTimeSaleProduct
     * 2. ClassName  : TimeSaleController.java
     * 3. Comment    : 관리자 > 테마전시상품관리 > 타임특가플로팅팝업 화면
     * 4. 작성자       : 김혜원
     * 5. 작성일       : 2020. 6. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/searchTimeSaleProductPopup")
    public ModelAndView searchTimeSaleProductPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        int totalCount = 0;
        List<Map<String, Object>> list = null;
        Paging paging = null;
        
        totalCount = this.timeSaleService.selectSearchTimeSaleProductCount(commandMap);
        paging = new Paging(totalCount, commandMap); 
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        if(totalCount > 0) {
        	list = this.timeSaleService.selectSearchTimeSaleProductList(commandMap);
        }
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    
}
