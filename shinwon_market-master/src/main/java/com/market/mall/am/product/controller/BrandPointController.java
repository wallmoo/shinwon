package com.market.mall.am.product.controller;

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
import com.epasscni.util.StringUtil;
import com.market.mall.am.product.service.BrandPointService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin.ROLEADMIN;


@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class BrandPointController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="brandPointService") private BrandPointService brandPointService;
    
    /**
     * @api {POST} /am/product/brandPointList.do
     * @apiName 통합포인트 적립률 관리 목록
     * @apiGroup SB상품관리
     * 
     * @apiSuccess {Object[]} brandList 자사 브랜드 리스트 [{BND_MST_BRAND_TYPE=I, BND_MST_IDX=1858, BND_MST_USE_YN=Y, BND_MST_BRAND_NM=테스트브랜드}, {BND_MST_BRAND_TYPE=I, BND_MST_IDX=1778, BND_MST_USE_YN=Y, BND_MST_BRAND_NM=MARKM}]
     * @apiSuccess {Object[]} brandPointList 자사 통합포인트 적립률관리 목록 [{BND_PIT_IDX=272, BND_MST_BRAND_TYPE=I, BND_MST_IDX=1778, BND_PIT_MAX_RATE=20, BND_PIT_PIT=3, BND_MST_BRAND_NM=MARKM, BND_PIT_MIN_RATE=0}, {BND_PIT_IDX=271, BND_MST_BRAND_TYPE=I, BND_MST_IDX=1858, BND_PIT_MAX_RATE=10, BND_PIT_PIT=5, BND_MST_BRAND_NM=테스트브랜드, BND_PIT_MIN_RATE=0}]
     * @apiSuccess {Object[]} otherBrandPointList 타사 통합포인트 적립률관리 목록 [{BND_PIT_IDX=274, BND_PIT_MAX_RATE=30, BND_PIT_PIT=3, BND_PIT_MIN_RATE=20}]
     */
    @RequestMapping(value="/am/product/brandPointList")
    public ModelAndView brandPointList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        List<Map<String, Object>> brandList = this.brandPointService.selectBrandList(commandMap); //자사 브랜드 리스트
        
        List<Map<String, Object>> brandPointList = this.brandPointService.selectBrandPointList(request, commandMap); //자사 통합포인트 적립률관리 목록
        List<Map<String, Object>> otherBrandPointList = this.brandPointService.selectOtherBrandPointList(commandMap); //자사 통합포인트 적립률관리 목록
        
        mv.addObject("brandList", brandList);
        mv.addObject("brandPointList", brandPointList);
        mv.addObject("otherBrandPointList", otherBrandPointList);
        
        return mv;
    }
    

    /**
     * @api {POST} /am/product/brandPointRegist.do
     * @apiName 통합포인트 적립률 관리 등록
     * @apiGroup SB상품관리
     *
     * @apiParam {JSON} brandPointList 브랜드 적립률 리스트 [{"BND_MST_IDX":"브랜드 IDX", "BND_PIT_MIN_RATE":"최소할인율구간", "BND_PIT_MAX_RATE":"최대할인율구간", "BND_PIT_PIT":"포인트_적립률"}]
     * @apiParam {String[]} BND_MST_IDXs 브랜드 코드 리스트 
     * @apiParam {Object} commandMap 파라미터맵
     * 
     * @apiSuccess {String} alertMsg 등록 성공/오류 메세지
     * @apiSuccess {String} returnUrl 등록 성공 이후 돌아가는 URL
     * @apiParam {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/product/brandPointRegist")
    public ModelAndView brandPointRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
            , @RequestParams(value="BND_MST_IDXs") String[] BND_MST_IDXs ) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        String brandPointData = StringUtil.getString(commandMap.get("brandPointList"));
        
        int result = 0;
        commandMap.put("arrBND_MST_IDX", BND_MST_IDXs); //브랜드 코드 리스트
        
        // 추가혜택 등록
        result = this.brandPointService.insertBrandPoint(request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록/수정 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/product/brandPointList.do");
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/product/brandPointList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    
}
