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
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.product.service.BrandPointService;
import com.market.mall.am.product.service.DiscountService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;


@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class PartnerDiscountController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="brandPointService") private BrandPointService brandPointService;
    @Resource(name="discountService") private DiscountService discountService;
    @Resource(name="commonService") private CommonService commonService;
    
    /**
     * @api {POST} /am/product/partnerDiscountList.do
     * @apiName 제휴사 할인관리 화면
     * @apiGroup SB상품관리
     *
     * @apiParam {String} searchSeason 검색 시즌 코드 값
     * @apiParam {String} searchType 검색 연도 타입 (전체:S_ALL, 연도:S_YEAR)
     * @apiParam {String} searchYear 검색 연도
     * @apiParam {String} searchItemType 검색품목(일반:A,G제외, 악세서리:A, 퍼/가죽:G)
     *
     * @apiSuccess {Object[]} seasons 시즌 코드 리스트 [{CMN_COM_IDX=3006, CMN_COM_LEVEL=3, CMN_COM_NM=전체, CMN_COM_REG_DT=20200302011614, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=3005, CMN_COM_TOP_IDX=10, CMN_COM_SORT=1, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=전체, CMN_COM_REG_ID=admin}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302011625, CMN_COM_UP_IDX=3005, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3007, CMN_COM_LEVEL=3, CMN_COM_NM=F/W, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302011648, CMN_COM_SORT=2, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=F/W}, {CMN_COM_IDX=3008, CMN_COM_LEVEL=3, CMN_COM_NM=S/S, CMN_COM_REG_DT=20200302011641, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=3005, CMN_COM_TOP_IDX=10, CMN_COM_SORT=3, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=S/S, CMN_COM_REG_ID=admin}]
     * @apiSuccess {Object[]} brandList 자사 브랜드 리스트 [{BND_MST_BRAND_TYPE=O, BND_MST_IDX=1798, BND_MST_USE_YN=Y, BND_MST_BRAND_NM=타사브랜드테스트01}, {BND_MST_BRAND_TYPE=O, BND_MST_IDX=1819, BND_MST_USE_YN=Y, BND_MST_BRAND_NM=GINNASIX2}]
     * @apiSuccess {Object[]} discountList 할인관리 리스트  [{DSC_MST_IDX=5, DSC_MST_NM=A, DSC_MST_YEAR=2020, DSC_MST_RATE=10, DSC_MST_TYPE=E, BND_MST_BRAND_NM=타사브랜드테스트01, SEASON_NM=F/W}, {DSC_MST_IDX=6, DSC_MST_NM=A, DSC_MST_YEAR=2021, DSC_MST_RATE=15, DSC_MST_TYPE=E, BND_MST_BRAND_NM=GINNASIX2, SEASON_NM=F/W}]
     */
    @RequestMapping(value="/am/product/partnerDiscountList")
    public ModelAndView partnerDiscountList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchYear", StringUtil.getString(commandMap.get("searchYear"), "S_ALL"));
        commandMap.put("DSC_MST_TYPE", "P"); //제휴사 타입
        
        //할인 상세 리스트
        List<Map<String, Object>> discountList = this.discountService.selectDiscountList(commandMap);
        //자사 브랜드 리스트
        List<Map<String, Object>> brandList = this.brandPointService.selectBrandList(commandMap);
        
        mv.addObject("discountList", discountList);
        mv.addObject("seasons", this.commonService.selectCode("COMMON_PRODUCT_SEASON")); // 시즌 코드
        mv.addObject("brandList", brandList);
        
        
        return mv;
    }
    
    /**
     * @api {POST} /am/product/partnerDiscountRegist.do
     * @apiName 제휴사 할인관리 저장
     * @apiGroup SB상품관리
     * 
     * @apiParam {JSON} discountList [{"BND_MST_IDX":"브랜드IDX" , "DSC_MST_SEASON":"시즌코드값", "DSC_MST_YEAR":"연도", "DSC_MST_RATE":"할인율"}]
     *
     * @apiSuccess {String} alertMsg 저장 성공/실패 메세지
     * @apiSuccess {String} returnUrl 저장 성공/실패시 RETURN URL
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/product/partnerDiscountRegist")
    public ModelAndView partnerDiscountRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        result = this.discountService.insertDiscountInfo(request, commandMap);
        
        if(result > 0){
            alertMsg = "등록 되었습니다.";
        } else {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/empDiscountList.do");
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
}
