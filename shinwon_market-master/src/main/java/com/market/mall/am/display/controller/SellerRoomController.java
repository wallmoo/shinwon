package com.market.mall.am.display.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.display.service.BannerDisplayService;
import com.market.mall.am.display.service.SellerRoomService;
import com.market.mall.am.site.service.VendorManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.util.MakeCategoryHtmlUtil;

import sun.misc.BASE64Decoder;


@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class SellerRoomController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="SellerRoomService")
    private SellerRoomService sellerRoomService;
    
    @Resource(name="bannerDisplayService")
    private BannerDisplayService bannerDisplayService;
    
    @Resource(name="vendorManagerService")  private VendorManagerService vendorManagerService;
    @Resource(name="commonService") private CommonService commonService;
    
    @RequestMapping(value="/am/display/sellerRoomView")
    public ModelAndView sellerRoomView(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	
        	commandMap.put("VDR_MST_IDX", ADM_MST_SUB_IDX);
        	Map<String, Object> layoutInfo = this.sellerRoomService.selectSellerRoomLayoutInfo(commandMap);
        	
        	mv.addObject("layoutInfo", layoutInfo);
        }
        return mv;
    }
    
    @RequestMapping(value="/am/display/sellerRoomLayoutRegist")
    public ModelAndView sellerRoomLayoutRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerRoomView.do");
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX < 1){ //입점업체 관리자인 경우
        	mv.addObject("alertMsg", "등록에 실패하였습니다.");
        	return mv;
        }
                
        commandMap.put("VDR_MST_IDX", ADM_MST_SUB_IDX);
        
        int result = this.sellerRoomService.updateSellerRoomLayoutInfo(commandMap);
        
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        
        mv.setViewName("/am/common/result");
        
        return mv;
    }
    
    @RequestMapping("/am/display/sellerRoomPreviewPopup")
    public ModelAndView sellerRoomPreviewPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("BND_MST_LAY_TPY", StringUtil.getString(commandMap.get("BND_MST_LAY_TPY"), ""));
       
        return mv;
    }
    
    @RequestMapping(value="/am/display/sellerRoomBannerView")
    public ModelAndView sellerRoomBannerView(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        String searchGubun = StringUtil.getString(commandMap.get("searchGubun"), Code.USER_ENV_TYPE_PC);
       
        mv.addObject("searchGubun", searchGubun);
        mv.addObject("commandMap", commandMap);
        return mv;
    }

    @RequestMapping("/am/display/sellerRoomBannerAjax")
    public JSON sellerRoomBannerAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        commandMap.put("CODE", Code.COMMON_SELLER_ROOM_DISPLAY_BANNER);
        
        List<Map<String, Object>> list = this.bannerDisplayService.selectBannerDisplayCodeList(commandMap);
        String bannerListHtml = MakeCategoryHtmlUtil.makeCategoryHtml(list, "CMN_COM_LEVEL", "CMN_COM_IDX", "CMN_COM_NM");
        
        json.put("bannerList", bannerListHtml);
        
        return json;
    }
    
    @RequestMapping("/am/display/sellerRoomProdAjax")
    public JSON sellerRoomProdAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        commandMap.put("CODE",  StringUtil.getString( Code.COMMON_SELLER_ROOM_PRODUCT_MAIN_UP , ""));
        
        List<Map<String, Object>> list = this.bannerDisplayService.selectBannerDisplayCodeList(commandMap);
        String bannerListHtml = MakeCategoryHtmlUtil.makeCategoryHtml(list, "CMN_COM_LEVEL", "CMN_COM_IDX", "CMN_COM_NM");
        
        json.put("bannerList", bannerListHtml);
        
        return json;
    }    
    
    
    @RequestMapping(value="/am/display/sellerRoomBannerList")
    public ModelAndView sellerRoomBannerList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")))
        {	
        	 Admin admin = SessionsAdmin.getSessionAdmin(request);
        	 int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
             if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
             	commandMap.put("VDR_MST_IDX", ADM_MST_SUB_IDX);
             	Map<String, Object> layoutInfo = this.sellerRoomService.selectSellerRoomLayoutInfo(commandMap);
             	String BND_MST_LAY_TPY = "A";
             	if(layoutInfo != null) {
             		BND_MST_LAY_TPY = layoutInfo.get("BND_MST_LAY_TPY").toString();
             	}
             	commandMap.put("BNR_MST_GBN", BND_MST_LAY_TPY);
             }
             
            List<Map<String, Object>> list = this.bannerDisplayService.selectBannerDisplayList(commandMap);
            
            // 상위배너카테고리
            List<Map<String, Object>> bnrCatList = this.bannerDisplayService.selectBnrCatCodeList(commandMap);

            // 카테고리명
            mv.addObject("commandMap", commandMap);
            mv.addObject("bnrCatList", bnrCatList);
            mv.addObject("list", list);
        }
        return mv;
    }
    
    @RequestMapping("/am/display/sellerRoomBannerForm")
    public ModelAndView sellerRoomBannerForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
                
        // 상위배너카테고리
        List<Map<String, Object>> bnrCatList = this.bannerDisplayService.selectBnrCatCodeList(commandMap);
        mv.addObject("bnrCatList", bnrCatList);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    
    
    
    
    @RequestMapping("/am/display/sellerRoomBannerFormSellerPick")
    public ModelAndView sellerRoomBannerFormSellerPick(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
                
        // 상위배너카테고리
        List<Map<String, Object>> bnrCatList = this.bannerDisplayService.selectBnrCatCodeList(commandMap);
        mv.addObject("bnrCatList", bnrCatList);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
/*
    @RequestMapping("/am/display/searchSallerPickPopup")
    public ModelAndView searchSallerPickPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
                
        // 상위배너카테고리
        List<Map<String, Object>> bnrCatList = this.bannerDisplayService.selectBnrCatCodeList(commandMap);
        mv.addObject("bnrCatList", bnrCatList);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
*/    
    
    @RequestMapping(value="/am/display/searchSallerPickPopup")
    public ModelAndView searchSallerPickPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
                
        commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        
        int totalCount = 0;
        List<Map<String, Object>> list = null;
        Paging paging = null;
        
        totalCount = this.sellerRoomService.searchSallerPickListCount(commandMap);

        if(totalCount > 0)
        {
            paging = new Paging(totalCount, commandMap);
            
            commandMap.put("startNum", paging.getStartNum());
            commandMap.put("endNum"  , paging.getEndNum());
                    	
        	//셀러픽 검색 조회 
        	list = this.sellerRoomService.searchSallerPickList(commandMap);
        	mv.addObject("list", list);
        	mv.addObject("paging", paging);
        }
        
        //List<Map<String, Object>> bnrCatList = this.bannerDisplayService.selectBnrCatCodeList(commandMap);
        //mv.addObject("bnrCatList", bnrCatList);        
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    
    @RequestMapping(value="/am/display/sellerRoomBannerSellerPickRegist")
    public ModelAndView sellerRoomBannerSellerPickRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerRoomBannerView.do");
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX < 1){ //입점업체 관리자인 경우
        	mv.addObject("alertMsg", "등록에 실패하였습니다.");
        	return mv;
        }
                
        commandMap.put("VDR_MST_IDX", ADM_MST_SUB_IDX);
        
        int result = this.sellerRoomService.insertSellerPick(request,commandMap);
        
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        
        mv.setViewName("/am/common/result");
        
        return mv;
    }
    
    
    @RequestMapping(value="/am/display/sellerRoomBannerSellerPickModify")
    public ModelAndView sellerRoomBannerSellerPickModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerRoomBannerView.do");
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX < 1){ //입점업체 관리자인 경우
        	mv.addObject("alertMsg", "등록에 실패하였습니다.");
        	return mv;
        }
                
        commandMap.put("VDR_MST_IDX", ADM_MST_SUB_IDX);
        
        int result = this.sellerRoomService.updateSellerPick(request,commandMap);
        
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        
        mv.setViewName("/am/common/result");
        
        return mv;
    }
    
    
        
    @RequestMapping("/am/display/sellerRoomBannerEdit")
    public ModelAndView sellerRoomBannerEdit(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        String BNR_MST_GBN = StringUtil.getString(commandMap.get("BNR_MST_GBN"), "A");
        if(!"".equals(CMN_COM_IDX) && !"".equals(BNR_MST_IDX))
        {
        	Map<String, Object> resultMap = this.bannerDisplayService.selectBannerDisplayInfo(commandMap);
        	mv.addObject("row", resultMap.get("row"));
        	mv.addObject("fileList", resultMap.get("fileList"));
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
            
            
            // 배너 상품 조회  selectBannerProductList 
            List<Map<String, Object>> bnrProductList = this.bannerDisplayService.selectBannerProductList(commandMap);
            mv.addObject("bnrProList", bnrProductList);            
        }
        // 상위배너카테고리
        List<Map<String, Object>> bnrCatList = this.bannerDisplayService.selectBnrCatCodeList(commandMap);
        
   
        
        mv.addObject("bnrCatList", bnrCatList);

        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    

    @RequestMapping("/am/display/sellerRoomBannerEditSellerPick")
    public ModelAndView sellerRoomBannerEditSellerPick(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        String BNR_MST_GBN = StringUtil.getString(commandMap.get("BNR_MST_GBN"), "A");
        if(!"".equals(CMN_COM_IDX) && !"".equals(BNR_MST_IDX))
        {
        	
        	Admin admin = SessionsAdmin.getSessionAdmin(request);
        	commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        	
        	
        	Map<String, Object> resultMap = this.bannerDisplayService.selectBannerDisplayInfo(commandMap);
        	mv.addObject("row", resultMap.get("row"));
        	mv.addObject("fileList", resultMap.get("fileList"));
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
            
            
            
            // 배너 상품 조회  selectBannerProductList 
            List<Map<String, Object>> bnrCntList = this.sellerRoomService.selectBannerCNTList(commandMap);
            mv.addObject("bnrCntList", bnrCntList);            
        }
        // 상위배너카테고리
        List<Map<String, Object>> bnrCatList = this.bannerDisplayService.selectBnrCatCodeList(commandMap);
        
   
        
        mv.addObject("bnrCatList", bnrCatList);

        mv.addObject("commandMap", commandMap);
        return mv;
    }    
    
    
    @RequestMapping("/am/display/sellerRoomBannerModify")
    public ModelAndView sellerRoomBannerModify(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")) && !"".equals(StringUtil.getString(commandMap.get("BNR_MST_IDX"), "")))
        {
            // 관리자 관리 관리자 수정
            int result = this.bannerDisplayService.updateBannerDisplay((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerRoomBannerView.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerRoomBannerView.do");
            }
            
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    @RequestMapping("/am/display/sellerRoomBannerRegist")
    public ModelAndView sellerRoomBannerRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String searchGubun = StringUtil.getString(commandMap.get("searchGubun"), "");
        commandMap.put("BNR_MST_ENV", searchGubun);
        commandMap.put("PRD_CTG_ENV", searchGubun);
        if(!"".equals(CMN_COM_IDX))
        {
        	Admin admin = SessionsAdmin.getSessionAdmin(request);
        	commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        	
            // 관리자 관리 관리자 등록
            int result = this.bannerDisplayService.insertBannerDisplay((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "등록 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerRoomBannerView.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "등록에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerRoomBannerView.do");
            }
            commandMap.clear();
            List<Map<String, Object>> bnrCatList = this.bannerDisplayService.selectBnrCatCodeList(commandMap);
            
            commandMap.put("CMN_COM_IDX", CMN_COM_IDX);
            commandMap.put("searchGubun", searchGubun);            
            mv.addObject("commandMap", commandMap);
            mv.addObject("bnrCatList", bnrCatList);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    
    @RequestMapping(value="/am/display/sellerRoomProductAView")
    public ModelAndView sellerRoomProductAView(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        return mv;
    }

    
    
    @RequestMapping(value="/am/display/sellerRoomBannerAView")
    public ModelAndView sellerRoomBannerAView(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        

        return mv;
    }
    
    @RequestMapping(value="/am/display/sellerRoomBannerBView")
    public ModelAndView sellerRoomBannerBView(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        

        return mv;
    }
    
    @RequestMapping(value="/am/display/sellerRoomProductBView")
    public ModelAndView sellerRoomProductBView(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        

        return mv;
    }
    
    @RequestMapping(value="/am/display/sellerStoreList")
    public ModelAndView sellerStoreList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String serverName = request.getServerName().toString();
        
        int totalCount = 0;
        List<Map<String, Object>> list = null;
        Paging paging = null;
        
        if(serverName.indexOf("scm") >= 0)
        {
            if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX())
            {
            	commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
            	
                totalCount = this.sellerRoomService.selectSellerStoreListCount(commandMap);
                paging = new Paging(totalCount, commandMap);
                
                commandMap.put("startNum", paging.getStartNum());
                commandMap.put("endNum", paging.getEndNum());
                
                if(totalCount > 0)
                {
                	//매장 목록
                	list = this.sellerRoomService.selectSellerStoreList(commandMap);
                }
            }
        }
        else
        {
        	mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
        	mv.setViewName("/am/common/result");
        }
        
        String[] codes = {"AREA_CD"};
        mv.addObject("codes", this.commonService.selectCodes(codes));

        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    @RequestMapping(value="/am/display/sellerStoreForm")
    public ModelAndView sellerStoreForm(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String alertMsg = "";
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
            if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
                commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
                // 입점업체 관리자 상세 정보
                mv.addObject("vendorManagerInfo", this.vendorManagerService.selectVendorManagerInfo(commandMap));
                
                String[] codes = {"HP_CODE","TEL_CODE","AREA_CD"};
                mv.addObject("codes", this.commonService.selectCodes(codes));
                
                mv.addObject("commandMap", commandMap);
            }
            else{
                alertMsg = "등록 권한이 없습니다.";
                
                mv.addObject("alertMsg", alertMsg);
                mv.addObject("returnUrl", "/am/display/sellerStoreList.do");
                return mv;
            }
        }
        return mv;
    }
    
    @RequestMapping("/am/display/sellerStoreRegist")
	public ModelAndView sellerStoreRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		Admin admin = SessionsAdmin.getSessionAdmin(request);
		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
		// 매장 등록
        int result = this.sellerRoomService.insertSellerStore(commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerStoreList.do");
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerStoreList.do");
        }
        mv.setViewName("/am/common/result");
        
		return mv;
	}
    
    @RequestMapping("/am/display/sellerStoreEdit")
    public ModelAndView sellerStoreEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("SEL_SHP_IDX"), "")))
        {
            // 브랜드관리 상세정보
        	Map<String, Object> row = this.sellerRoomService.selectSellerStoreInfo(commandMap);
        	mv.addObject("row", row);
        	
            String[] codes = {"HP_CODE","TEL_CODE","AREA_CD"};
            mv.addObject("codes", this.commonService.selectCodes(codes));
        }

        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    @RequestMapping("/am/display/sellerStoreModify")
    public ModelAndView sellerStoreModify(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("SEL_SHP_IDX"), "")))
        {
            // 브랜드 관리 수정
            int result = this.sellerRoomService.updateSellerStore(commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerStoreList.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerStoreList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    @RequestMapping("/am/display/sellerStoreDelete")
    public ModelAndView employeeChangeNormal(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        //mv.setViewName("/am/common/result");
        //Admin admin = SessionsAdmin.getSessionAdmin(request);
        //if(!"admin".equals(admin.getADM_MST_ID())){
        //	mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
        //    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
        //    return mv;
        //}
        
        String[] array =  StringUtil.getArray(commandMap, "targetSellerList");
        commandMap.put("SELLER_LIST", array);
        int result = this.sellerRoomService.deleteSellerStore(commandMap);
        
        mv.addObject("alertMsg", "해당 매장이 삭제되었습니다.");
        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerStoreList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        return mv;
    }    
    
    /**
     * @api {POST} /am/display/sellerMediaList.do
     * @apiName 미디어관리 목록
     * @apiGroup EB전시관리
     * 
     * @apiParam {String} searchStartDate 검색 등록 시작일 
     * @apiParam {String} searchEndDate 검색 등록 종료일
     * @apiParam {String} searchSellerRoomMediaMstTitle 검색 제목
     * @apiParam {String} searchDisplayUseYn 검색 전시상태
     * 
     * @apiSuccess {Object[]} list 미디어관리 목록 [{CNT_MST_UPD_DT=2020-04-28, RNUM=1, CNT_MST_TITLE=수정타이틀22, CNT_MST_REG_DT=2020-04-28, CNT_MST_UPD_IP=0:0:0:0:0:0:0:1, CNT_MST_IDX=122, CNT_MST_USE_YN=Y, CNT_MST_REG_IP=0:0:0:0:0:0:0:1}]
     * @apiSuccess {Integer} totalCount 미디어 관리 목록 총 개수
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/display/sellerMediaList")
    public ModelAndView sellerMediaList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_MEDIA);
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        	commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        }
        // 미디어 관리 목록 갯수
        int totalCount = this.sellerRoomService.selectSellerMediaCount(commandMap);

        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            // 미디어관리 목록
            list = this.sellerRoomService.selectSellerMediaList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
    
    /**
     * @api {POST} /am/display/sellerMediaForm.do
     * @apiName 미디어 등록 화면
     * @apiGroup EB전시관리
     * 
     * @apiSuccess {Object} vendorManagerInfo 입점업체 관리자 상세 정보
     * @apiSuccess {Object} commandMap {VDR_MST_IDX : 입점업체관리_IDX}
     */
    @RequestMapping(value="/am/display/sellerMediaForm")
    public ModelAndView sellerMediaForm(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String alertMsg = "";
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
            if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
                commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
                // 입점업체 관리자 상세 정보
                mv.addObject("vendorManagerInfo", this.vendorManagerService.selectVendorManagerInfo(commandMap));
                mv.addObject("commandMap", commandMap);
            }
            else{
                alertMsg = "등록 권한이 없습니다.";
                
                mv.addObject("alertMsg", alertMsg);
                mv.addObject("returnUrl", "/am/display/sellerMediaList.do");
                return mv;
            }
        }
        return mv;
    }
    
    /**
     * @api {POST} /am/display/sellerMediaRegist.do
     * @apiName 미디어 등록 처리
     * @apiGroup EB전시관리
     * 
     * @apiParam {String} CNT_MST_TITLE 영상 제목
     * @apiParam {String} CNT_MST_URL 유튜브URL
     * @apiParam {String} CNT_MST_USE_YN 전시여부
     * @apiParam {File} pcFile PC 목록 이미지
     * @apiParam {String} CMN_FLE_ALT_TXT_P1 PC 목록 이미지 대체 텍스트
     * @apiParam {File} mobileFile Mobile 목록 이미지
     * @apiParam {String} CMN_FLE_ALT_TXT_M1 Mobile 목록 이미지 대체 텍스트
     * 
     * @apiSuccess {String} alertMsg 등록 성공/오류 메세지
     * @apiSuccess {String} returnUrl 등록 성공 이후 돌아가는 URL
     * @apiParam {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/display/sellerMediaRegist")
    public ModelAndView sellerMediaRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        int result = this.sellerRoomService.insertSellerMedia((MultipartHttpServletRequest)request, commandMap);
        
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerMediaList.do");
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/sellerMediaList.do");
        }
        
        mv.setViewName("am/common/result");
        
        return mv;
    }
    
    /**
     * @api {POST} /am/display/sellerMediaEdit.do
     * @apiName 미디어 상세 화면
     * @apiGroup EB전시관리
     * 
     * @apiParam {String} CNT_MST_IDX 미디어관리 IDX
     * 
     * @apiSuccess {Object} row 미디어 상세 정보  {CNT_MST_TYPE=TYPE_SELLER_MEDIA, CNT_MST_URL=http://abc.com, CNT_MST_TITLE=미디어 테스트, CNT_MST_REG_DT=20200428065617, CNT_MST_IDX=122, CNT_MST_USE_YN=Y(전시여부), CNT_MST_REG_IP=0:0:0:0:0:0:0:1, VDR_MST_IDX=53}
     * @apiSuccess {Object[]} fileList 첨부파일 목록 [{CMM_FLE_ATT_EXT=jpeg, CMM_FLE_ATT_SIZE=37866, CMM_FLE_SAVE_PATH=/mnt/data/tomcat/cdn/attach/default/2020/04/28/0e854b41-aafa-4047-bd04-ee54926fe483.jpeg, CMM_FLE_ATT_PATH=/attach/default/2020/04/28/, CMM_FLE_TB_NM=T_CNT_MST, CMM_FLE_ORG_NM=오리너구리.jpeg, CMM_FLE_SORT=1, CMM_FLE_SYS_PATH=/mnt/data/tomcat/cdn, CMM_FLE_TB_PK=122, CMM_FLE_USE_YN=Y, CMM_FLE_DW_CNT=0, CMM_FLE_IDX=5639, CMM_FLE_TB_TYPE=P, CMM_FLE_REG_DT=20200428065617, CMM_FLE_SYS_NM=0e854b41-aafa-4047-bd04-ee54926fe483.jpeg, CMN_FLE_ALT_TXT=PC 목록 이미지 대체 텍스트}, {CMM_FLE_ATT_EXT=jpg, CMM_FLE_ATT_SIZE=37725, CMM_FLE_SAVE_PATH=/mnt/data/tomcat/cdn/attach/default/2020/04/28/b0f22879-fc4c-4b55-8c2e-110857c4a1ad.jpg, CMM_FLE_ATT_PATH=/attach/default/2020/04/28/, CMM_FLE_TB_NM=T_CNT_MST, CMM_FLE_ORG_NM=엘사.jpg, CMM_FLE_SORT=1, CMM_FLE_SYS_PATH=/mnt/data/tomcat/cdn, CMM_FLE_TB_PK=122, CMM_FLE_USE_YN=Y, CMM_FLE_DW_CNT=0, CMM_FLE_IDX=5640, CMM_FLE_TB_TYPE=M, CMM_FLE_REG_DT=20200428065618, CMM_FLE_SYS_NM=b0f22879-fc4c-4b55-8c2e-110857c4a1ad.jpg, CMN_FLE_ALT_TXT=Mobile 목록 이미지 대체 텍스트}]
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping("/am/display/sellerMediaEdit")
    public ModelAndView sellerMediaEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
            // 미디어 관리 상세정보
            Map<String, Object> resultMap = this.sellerRoomService.selectSellerMediaInfo(commandMap);
            
            mv.addObject("row",resultMap.get("row"));   // 기본 정보
            mv.addObject("fileList", resultMap.get("fileList"));    // 첨부파일 목록
        }
        mv.addObject("commandMap",commandMap);
        
        return mv;
    }
    /**
     * @api {POST} /am/display/sellerMediaModify.do
     * @apiName 미디어 수정 처리
     * @apiGroup EB전시관리
     * 
     * @apiParam {String} CNT_MST_IDX 미디어관리 IDX
     * @apiParam {String} CNT_MST_TITLE 영상 제목
     * @apiParam {String} CNT_MST_URL 유튜브URL
     * @apiParam {String} CNT_MST_USE_YN 전시여부
     * @apiParam {String[]} CMM_FLE_IDX 첨부파일IDX
     * @apiParam {File} pcFile PC 목록 이미지
     * @apiParam {String} CMN_FLE_ALT_TXT_P1 PC 목록 이미지 대체 텍스트
     * @apiParam {File} mobileFile Mobile 목록 이미지
     * @apiParam {String} CMN_FLE_ALT_TXT_M1 Mobile 목록 이미지 대체 텍스트
     * 
     * @apiSuccess {String} alertMsg 수정 성공/오류 메세지
     * @apiSuccess {String} returnUrl 수정 성공 이후 돌아가는 URL
     * @apiParam {Object} commandMap 파라미터맵
     */
    @RequestMapping("/am/display/sellerMediaModify")
    public ModelAndView sellerMediaModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
            int result = this.sellerRoomService.updateSellerMedia((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                
            }
            
            
        }
        mv.addObject("commandMap", commandMap);
        mv.addObject("returnUrl", "/am/display/sellerMediaList.do");
        mv.setViewName("/am/common/result");
        
        return mv;
    }
    
    @RequestMapping(value="/am/display/sellerLookBookList")
    public ModelAndView sellerLookBookList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_LOOKBOOK);
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        // 룩북 관리 목록 갯수
        int totalCount = this.sellerRoomService.selectSellerLookBookCount(commandMap);

        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            // 룩북 관리 목록
            list = this.sellerRoomService.selectSellerLookBookList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        return mv;
    }
    
    /**
     * @api {POST} /am/display/sellerLookBookDelAjax.do
     * @apiName 룩북 삭제 
     * @apiGroup EB전시관리
     * 
     * @apiParam {String[]} sellerRoomIdxs 선택한 룩북 IDX
     * 
     * @apiSuccess {JSON} result success/error
     */
    @RequestMapping("/am/display/sellerLookBookDelAjax")
    public JSON sellerLookBookDelAjax(HttpServletRequest request, 
    		@RequestParam(value="sellerRoomIdxs[]") List<String> sellerRoomIdxs,
    		@RequestParams Map<String,Object> commandMap
             ) throws Exception
    {
        JSON json = new JSON();         
        
        commandMap.put("arrsellerRoomIdxs", sellerRoomIdxs);

        
        int result = this.sellerRoomService.deleteSellerLookBook(commandMap);

        if(result > 0)
        {
            json.put("result", "success");
        }     
        else
        {
            json.put("result", "error");
        }
        
        return json;
    }

    
    
    /**
     * @api {POST} /am/display/sellerLookBookForm.do
     * @apiName 룩북 등록 화면
     * @apiGroup EB전시관리
     * 
     * @apiSuccess {Object} vendorManagerInfo 입점업체 관리자 상세 정보
     * @apiSuccess {Object} commandMap {VDR_MST_IDX : 입점업체관리_IDX}
     * @apiSuccess {Object[]} seasonList 시즌 공통 코드리스트
     */
    @RequestMapping(value="/am/display/sellerLookBookForm")
    public ModelAndView sellerLookBookForm(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String alertMsg = "";
        String serverName = request.getServerName().toString();

        if(serverName.indexOf("scm") >= 0){
            if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
                commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
                // 입점업체 관리자 상세 정보
                mv.addObject("vendorManagerInfo", this.vendorManagerService.selectVendorManagerInfo(commandMap));
                mv.addObject("commandMap", commandMap);
            }
            else{
                alertMsg = "등록 권한이 없습니다.";
                
                mv.addObject("alertMsg", alertMsg);
                mv.addObject("returnUrl", "/am/display/sellerLookBookList.do");
                return mv;
            }
        }
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON")); //시즌 공통 코드
        return mv;
    }
    
    /**
     * @api {POST} /am/display/sellerLookBookRegist.do
     * @apiName 룩북 등록 처리
     * @apiGroup EB전시관리
     * 
     * @apiParam {String} CNT_MST_TITLE 이미지 제목
     * @apiParam {String} CNT_MST_USE_YN 전시여부
     * @apiParam {String} CNT_MST_SEASON 시즌정보
     * @apiParam {File} pcFile PC용 이미지 리스트
     * @apiParam {File} mobileFile Mobile용 이미지 리스트
     * 
     * @apiSuccess {String} alertMsg 등록 성공/오류 메세지
     * @apiSuccess {String} returnUrl 등록 성공 이후 돌아가는 URL
     * @apiParam {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/display/sellerLookBookRegist")
    public ModelAndView sellerLookBookRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        int result = this.sellerRoomService.insertSellerLookBook((MultipartHttpServletRequest)request, commandMap);
        
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerLookBookList.do");
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/sellerLookBookList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        
        return mv;
    }
    /**
     * @api {POST} /am/display/sellerLookBookEdit.do
     * @apiName 룩북 상세 화면
     * @apiGroup EB전시관리
     * 
     * @apiParam {String} CNT_MST_IDX 룩북관리 IDX
     * 
     * @apiSuccess {Object} row 룩북 상세 정보  {CMN_COM_IDX=3007(시즌 공통 코드값), CNT_MST_TYPE=TYPE_SELLER_LOOKBOOK, CNT_MST_TITLE=수정, CNT_MST_REG_DT=2020-04-28 09:42:55, CNT_MST_IDX=123, CNT_MST_USE_YN=Y, CNT_MST_REG_IP=0:0:0:0:0:0:0:1, SEASON_NM=F/W, VDR_MST_IDX=53}
     * @apiSuccess {Object[]} fileList 첨부파일 목록  [{CMM_FLE_ATT_EXT=jpg, CMM_FLE_ATT_SIZE=37725, CMM_FLE_SAVE_PATH=/mnt/data/tomcat/cdn/attach/default/2020/04/28/f3737670-a4dd-4cfe-890c-b8d6cb7d0874.jpg, CMM_FLE_ATT_PATH=/attach/default/2020/04/28/, CMM_FLE_TB_NM=T_CNT_MST, CMM_FLE_ORG_NM=엘사.jpg, CMM_FLE_SORT=1, CMM_FLE_SYS_PATH=/mnt/data/tomcat/cdn, CMM_FLE_TB_PK=123, CMM_FLE_USE_YN=Y, CMM_FLE_DW_CNT=0, CMM_FLE_IDX=5645, CMM_FLE_TB_TYPE=P, CMM_FLE_REG_DT=20200428094310, CMM_FLE_SYS_NM=f3737670-a4dd-4cfe-890c-b8d6cb7d0874.jpg}, {CMM_FLE_ATT_EXT=jpg, CMM_FLE_ATT_SIZE=55691, CMM_FLE_SAVE_PATH=/mnt/data/tomcat/cdn/attach/default/2020/04/28/2721985e-d9e3-44ae-a8e5-ed8362682689.jpg, CMM_FLE_ATT_PATH=/attach/default/2020/04/28/, CMM_FLE_TB_NM=T_CNT_MST, CMM_FLE_ORG_NM=elsa.jpg, CMM_FLE_SORT=2, CMM_FLE_SYS_PATH=/mnt/data/tomcat/cdn, CMM_FLE_TB_PK=123, CMM_FLE_USE_YN=Y, CMM_FLE_DW_CNT=0, CMM_FLE_IDX=5646, CMM_FLE_TB_TYPE=P, CMM_FLE_REG_DT=20200428094339, CMM_FLE_SYS_NM=2721985e-d9e3-44ae-a8e5-ed8362682689.jpg}, {CMM_FLE_ATT_EXT=jpeg, CMM_FLE_ATT_SIZE=25086, CMM_FLE_SAVE_PATH=/mnt/data/tomcat/cdn/attach/default/2020/04/28/925f5c81-6858-48f2-9278-8c41efa8de00.jpeg, CMM_FLE_ATT_PATH=/attach/default/2020/04/28/, CMM_FLE_TB_NM=T_CNT_MST, CMM_FLE_ORG_NM=품격있냥.jpeg, CMM_FLE_SORT=1, CMM_FLE_SYS_PATH=/mnt/data/tomcat/cdn, CMM_FLE_TB_PK=123, CMM_FLE_USE_YN=Y, CMM_FLE_DW_CNT=0, CMM_FLE_IDX=5647, CMM_FLE_TB_TYPE=M, CMM_FLE_REG_DT=20200428094413, CMM_FLE_SYS_NM=925f5c81-6858-48f2-9278-8c41efa8de00.jpeg}, {CMM_FLE_ATT_EXT=jpeg, CMM_FLE_ATT_SIZE=27046, CMM_FLE_SAVE_PATH=/mnt/data/tomcat/cdn/attach/default/2020/04/28/29ab8034-7252-45ca-8214-43a1e0958b1b.jpeg, CMM_FLE_ATT_PATH=/attach/default/2020/04/28/, CMM_FLE_TB_NM=T_CNT_MST, CMM_FLE_ORG_NM=품격있개.jpeg, CMM_FLE_SORT=2, CMM_FLE_SYS_PATH=/mnt/data/tomcat/cdn, CMM_FLE_TB_PK=123, CMM_FLE_USE_YN=Y, CMM_FLE_DW_CNT=0, CMM_FLE_IDX=5648, CMM_FLE_TB_TYPE=M, CMM_FLE_REG_DT=20200428094419, CMM_FLE_SYS_NM=29ab8034-7252-45ca-8214-43a1e0958b1b.jpeg}]
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/display/sellerLookBookEdit")
    public ModelAndView sellerLookBookEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
            // 미디어 관리 상세정보
            Map<String, Object> resultMap = this.sellerRoomService.selectSellerLookBookInfo(commandMap);
            
            mv.addObject("row",resultMap.get("row"));   // 기본 정보
            mv.addObject("fileList", resultMap.get("fileList"));    // 첨부파일 목록
        }
        
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON")); //시즌 공통 코드
        mv.addObject("commandMap",commandMap);
        
        return mv;
    }
    
    /**
     * @api {POST} /am/display/sellerLookBookModify.do
     * @apiName 룩북 수정 처리
     * @apiGroup EB전시관리
     * 
     * @apiParam {String} CNT_MST_IDX 미디어관리 IDX
     * @apiParam {String} CNT_MST_TITLE 영상 제목
     * @apiParam {String} CNT_MST_SEASON 시즌 코드
     * @apiParam {String} CNT_MST_USE_YN 전시여부
     * @apiParam {String[]} CMM_FLE_IDX 첨부파일IDX 배열
     * @apiParam {File} pcFile PC 목록 이미지
     * @apiParam {File} mobileFile Mobile 목록 이미지
     * 
     * @apiSuccess {String} alertMsg 수정 성공/오류 메세지
     * @apiSuccess {String} returnUrl 수정 성공 이후 돌아가는 URL
     * @apiParam {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/display/sellerLookBookModify")
    public ModelAndView sellerLookBookModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
        
            int result = this.sellerRoomService.updateSellerLookBook((MultipartHttpServletRequest)request, commandMap);
      
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                
            }
            
            
        }
        mv.addObject("commandMap", commandMap);
        mv.addObject("returnUrl", "/am/display/sellerLookBookList.do");
        mv.setViewName("/am/common/result");
        
        return mv;
    }

    @RequestMapping(value="/am/display/sellerTagList")
    public ModelAndView sellerTagList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("CMN_COM_IDX", Code.SELLER_ROOM_TAG_DISPLAY);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    @RequestMapping("/am/display/sellerTagCategoryAjax")
    public JSON sellerTagCategoryAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        commandMap.put("CMN_COM_IDX", commandMap.get("CMN_COM_IDX") );
        List<Map<String, Object>> list = this.sellerRoomService.selectTagDisplayCategoryList(commandMap);
        String categoryHtml = MakeCategoryHtmlUtil.makeCategoryHtml(list, "CMN_COM_LEVEL", "CMN_COM_IDX", "CMN_COM_NM");
        json.put("tagCategoryList", categoryHtml);
        
        return json;
    }
    
    @RequestMapping("/am/display/sellerTagDisplayList")
    public ModelAndView sellerTagDisplayList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
    	
    	if("".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")))
    	{
    		return mv;
    	}
    	commandMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_BRAND);
    	commandMap.put("TAG_BND_ID", Integer.toString(admin.getADM_MST_SUB_IDX()));
    	
    	List<Map<String, Object>> list = sellerRoomService.selectTagDisplayList(commandMap);
    	
    	List<Map<String, Object>> tagDisplayCodeList = sellerRoomService.selectTagDisplayCategoryCodeList(commandMap);
    	
    	mv.addObject("tagDisplayCodeList", tagDisplayCodeList);
    	mv.addObject("commandMap", commandMap);
    	mv.addObject("list", list);
    	
    	return mv;
    }
    
    @RequestMapping("/am/display/sellerTagDispalyRegist")
    public ModelAndView sellerTagDispalyRegist(HttpServletRequest request, @RequestParams String[] TAG_MST_IDs, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
    	
    	commandMap.put("TAG_MST_IDs", TAG_MST_IDs);
    	commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
    	
    	int result = this.sellerRoomService.insertTagDisplay(commandMap);
    	
		if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerTagList.do");
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerTagList.do");
        }
		commandMap.put("SUB_CMN_COM_IDX", commandMap.get("CMN_COM_IDX"));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
    	return mv;
    }
    
    @RequestMapping("/am/display/sellerRoomProductDisplayList")
    public ModelAndView sellerRoomProductDisplayList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));        
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
         	commandMap.put("VDR_MST_IDX", ADM_MST_SUB_IDX);
         	Map<String, Object> layoutInfo = this.sellerRoomService.selectSellerRoomLayoutInfo(commandMap);
         	String BND_MST_LAY_TPY = "A";
         	if(layoutInfo != null) {
         		BND_MST_LAY_TPY = layoutInfo.get("BND_MST_LAY_TPY").toString();
         	}
         	commandMap.put("DSP_MST_ENV", BND_MST_LAY_TPY);
         }
        
        commandMap.put("DSP_MST_GBN",     StringUtil.getString(commandMap.get("searchGubun"), ""));
        
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")))
        {
            String searchBnrMstTitle = StringUtil.getString(commandMap.get("searchBnrMstTitle"), "");
            if(!"".equals(searchBnrMstTitle))
            {
                BASE64Decoder decoder = new BASE64Decoder();
                searchBnrMstTitle = new String(decoder.decodeBuffer(searchBnrMstTitle));
                commandMap.put("searchBnrMstTitle", searchBnrMstTitle);
            }
            commandMap.put("PRODUCT_THUMBNAIL_IMAGE_WIDTH", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
            
            // 배너관리 목록 갯수
            int totalCount = this.sellerRoomService.selectSellerRommProductDisplayListCount(commandMap);
            
            Paging paging = new Paging(totalCount, commandMap);
            mv.addObject( "paging", paging );
            
            List<Map<String, Object>> list = null;
            if (totalCount > 0){
                
                // 상품관리 목록
                list = this.sellerRoomService.selectSellerRommProductDisplayList(commandMap);
            }
            
            // 상위배너카테고리
            List<Map<String, Object>> productCatList = this.sellerRoomService.selectProductCatCodeList(commandMap);
            
            // 상품 최대 등록 개수 조회 
            Map<String, Object> resultMap = this.sellerRoomService.selectSellerProductInfo(commandMap);
            
            mv.addObject("row",resultMap.get("row"));   // 기본 정보
            mv.addObject("totalCount", totalCount);
            mv.addObject("productCatList", productCatList);
            mv.addObject("commandMap", commandMap);
            mv.addObject("list", list);
        }        
        return mv;
    }    
    
    //
    
    @RequestMapping("/am/display/sellerproductDisplayRegist")
    public ModelAndView sellerproductDisplayRegist(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
    		, @RequestParams(value="REG_DSP_MST_IDX") String[] REG_DSP_MST_IDX
    		, @RequestParams(value="DSP_MST_TXTs") String[] DSP_MST_TXTs) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String PRD_CTG_ENV = StringUtil.getString(commandMap.get("PRD_CTG_ENV"), "");
        String searchGubun = StringUtil.getString(commandMap.get("searchGubun"), "");
        

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX < 1){ //입점업체 관리자인 경우
        	mv.addObject("alertMsg", "등록에 실패하였습니다.");
        	return mv;
        }        
        
        
        
        if(!"".equals(CMN_COM_IDX))
        {
            commandMap.put("arrDSP_MST_IDX" , REG_DSP_MST_IDX);
            commandMap.put("arrDSP_MST_TXTs", DSP_MST_TXTs);
        	commandMap.put("DSP_MST_REG_IP" , request.getRemoteAddr());
            commandMap.put("DSP_MST_REG_ID" , admin.getADM_MST_ID());
            commandMap.put("VDR_MST_IDX"    , ADM_MST_SUB_IDX);
            commandMap.put("DSP_MST_USE_YN" , "Y");
            commandMap.put("DSP_MST_GBN"    , commandMap.get("searchGubun"));
            
            System.out.println(  "================> DSP_MST_REG_IP"  + commandMap.get("DSP_MST_REG_IP")  );
            System.out.println(  "================> DSP_MST_REG_ID"  + commandMap.get("DSP_MST_REG_ID")  );
            System.out.println(  "================> VDR_MST_IDX"  + commandMap.get("VDR_MST_IDX")  );
            System.out.println(  "================> DSP_MST_USE_YN"  + commandMap.get("DSP_MST_USE_YN")  );
            System.out.println(  "================> DSP_MST_ENV"  + commandMap.get("DSP_MST_ENV")  );
            System.out.println(  "================> DSP_MST_GBN"  + commandMap.get("DSP_MST_GBN")  );
             
            
            // 관리자 관리 관리자 등록
            int result = this.sellerRoomService.insertSellerProductDisplay(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "등록 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerRoomProductView.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "등록에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/sellerRoomProductView.do");
            }
            commandMap.clear();
            commandMap.put("CMN_COM_IDX", CMN_COM_IDX);
            commandMap.put("PRD_CTG_ENV", PRD_CTG_ENV);
            commandMap.put("searchGubun", searchGubun);
            
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    //sellerProductDisplayRemove
    @RequestMapping("/am/display/sellerProductDisplayRemove")
    public ModelAndView sellerProductDisplayRemove(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
    		, @RequestParams(value="DSP_MST_IDX") String[] DSP_MST_IDX) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
       	Admin admin = SessionsAdmin.getSessionAdmin(request);
		commandMap.put("DSP_MST_REG_IP", request.getRemoteAddr());
		commandMap.put("DSP_MST_REG_DT", admin.getADM_MST_ID());
		commandMap.put("arrDSP_MST_IDX", DSP_MST_IDX);

		int result = this.sellerRoomService.deleteSellerProductDisplay(request, commandMap);

		// view Page Info
		if (result > 0) {
			mv.addObject("alertMsg", "삭제 되었습니다.");
			mv.addObject("returnUrl", "/am/display/sellerRoomProductView.do");
		} else {
			mv.addObject("alertMsg", "삭제에 실패하였습니다.");
			mv.addObject("returnUrl", "/am/display/sellerRoomProductView.do");
		}

		mv.addObject("commandMap", commandMap);
		mv.setViewName("/am/common/result");

        return mv;
    }    
    
    
    @RequestMapping("/am/display/sellerProductDisplaySortArrayAjax")
    public JSON sellerProductDisplaySortArrayAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
    {
        JSON json = new JSON();
        int result = 0;
        
        if(commandMap.get("DSP_MST_IDX[]") != null && commandMap.get("DSP_MST_USE_YN[]") != null)
        {
            result = this.sellerRoomService.updateProductDisplaySellerOrder(request, commandMap);
        }
        else
        {	
            json.put("message", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
        }
        if(result > 0)
        {
            json.put("message", "저장에 성공하였습니다.");
        }
        else
        {
            json.put("message", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
        }
        return json;
    }
    
    
    
    
}
