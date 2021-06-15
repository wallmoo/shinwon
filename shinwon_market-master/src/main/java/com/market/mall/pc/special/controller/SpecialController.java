package com.market.mall.pc.special.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.pc.special.service.SpecialService;

@Controller("pcSpecialController")
public class SpecialController {
    
    @Resource(name="pcSpecialService") SpecialService pcSpecialService;
    
	
    /**
     * @api {GET} /pc/special/specialList.do
     * @apiName 스페셜 메인화면
     * @apiGroup 스페셜
     * 
     * @apiSuccess {Integer} totalCount 스페셜 상품 총 개수
     */
    @RequestMapping("/pc/special/specialList")
    public ModelAndView specialList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();

        commandMap.put("CMN_COM_IDX", Code.PC_MAIN_SPECIAL_BANNER);
        commandMap.put("BNR_MST_ENV", Code.USER_ENV_TYPE_PC);// PC 배너
        
     
        // 상단 배너 리스트
        mv.addObject("toplist",  this.pcSpecialService.selectSpecialBannerList(commandMap));
        
        return mv;
    }
    
  
	@FrontBannerSkip()
    @RequestMapping("/pc/special/specialAjax")
    public JSON specialAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        JSON json = new JSON();

        commandMap.put("ENV_TYPE", "P");//PC 채널
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_SPECIAL); //스페셜 타입
        
 
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
        
        int offset = Integer.parseInt(StringUtil.getString(commandMap.get("cPage"), "1"));
        int pageSize = Integer.parseInt(StringUtil.getString(commandMap.get("pageSize"), "20"));
        
        commandMap.put("startNum", offset); 
        commandMap.put("endNum", offset + pageSize - 1); 
        
        commandMap.put("CMM_FLE_SORT", "3");//PC 채널
        commandMap.put("CMM_FLE_TB_TYPE", "P");//PC 채널        
        
        List<Map<String, Object>> list = this.pcSpecialService.selectSpecialList(commandMap);

        json.put("list", list);
        
        return json;
    }
	
    /**
     * @api {POST} /pc/special/specialView.do
     * @apiName 스페셜 상세화면
     * @apiGroup 스페셜
     * 
     * @apiSuccess {Object[]} productList 스페셜 상품 목록
     */
    @RequestMapping("/pc/special/specialView")
    public ModelAndView specialView (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();

        commandMap.put("searchCntMstShopType", "Y");        //PC용 컨텐츠
        commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");       //PC용 이미지
        commandMap.put("CMM_FLE_TB_TYPE", "P");             //PC용 이미지
        commandMap.put("CMM_FLE_SORT", "1");
        commandMap.put("ENV_TYPE", "P");                //PC 채널
        commandMap.put("PRD_CTG_ENV", "P");
        
        commandMap.put("THUMBNAIL_SIZE",        Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE);
        
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_SPECIAL); //채널온 타입
        
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
        
        Map<String, Object> specialInfo = this.pcSpecialService.selectSpecialInfo(commandMap);
        List<Map<String, Object>> specialProductList = this.pcSpecialService.selectSpecialProductList(commandMap);
        
        mv.addObject("info",  specialInfo);
        mv.addObject("list",  specialProductList);
        return mv;
    }

}
