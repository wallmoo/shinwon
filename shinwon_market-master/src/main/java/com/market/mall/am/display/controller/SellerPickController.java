package com.market.mall.am.display.controller;

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
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.display.service.BannerDisplayService;
import com.market.mall.am.display.service.SellerPickService;
import com.market.mall.am.display.service.SellerRoomService;
import com.market.mall.am.site.service.VendorManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.util.TestLoginSession;


@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class SellerPickController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="SellerPickService")  private SellerPickService sellerPickService;
    @Resource(name="vendorManagerService")  private VendorManagerService vendorManagerService;
    @Resource(name="commonService") private CommonService commonService;
    
    @RequestMapping(value="/am/display/vendorSellerPickList")
    public ModelAndView vendorSellerPickList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        int totalCount = 0;
        List<Map<String, Object>> list = null;
        Paging paging = null;
        
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
            if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
                commandMap.put("searchPrdMstVdrYn", "Y");
                commandMap.put("searchPrdMstVdrIdx", admin.getADM_MST_SUB_IDX());
                
                commandMap.put("ADM_MST_SUB_IDX", admin.getADM_MST_SUB_IDX());
                commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
                
                // 입점업체 관리자 상세 정보
                mv.addObject("vendorManagerInfo", this.vendorManagerService.selectVendorManagerInfo(commandMap));
                
                totalCount = this.sellerPickService.selectSellerPickListCount(commandMap);
                paging = new Paging(totalCount, commandMap);
                
                if(totalCount > 0)
                {
                    list = this.sellerPickService.selectSellerPickList(commandMap);
                }

            }
        }

        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("list", list);

        return mv;
    }
    
    @RequestMapping(value="/am/display/vendorSellerPickForm")
    public ModelAndView vendorSellerPickForm(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping(value="/am/display/vendorSellerPickRegist")
    public ModelAndView vendorSellerPickRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
            if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){

                commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
                commandMap.put("CNT_MST_REG_IP", request.getRemoteAddr());
                commandMap.put("CNT_MST_REG_ID", admin.getADM_MST_ID());
                
                // 입점업체 셀러픽 등록
                int result = this.sellerPickService.insertSellerPick((MultipartHttpServletRequest)request, commandMap);

                // view Page Info
                if(result > 0)
                {
                    mv.addObject("alertMsg", "등록 되었습니다.");
                    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/vendorSellerPickList.do");
                    
                }
                else
                {
                    mv.addObject("alertMsg", "등록에 실패하였습니다.");
                    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/vendorSellerPickList.do");
                }
            }
        }

        mv.setViewName("/am/common/result");
        return mv;
    }
    
    @RequestMapping(value="/am/display/vendorSellerPickEdit")
    public ModelAndView vendorSellerPickEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
            commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
            
            // 기획전관리 상세정보
            Map<String, Object> resultMap = this.sellerPickService.selectSellerPickInfo(commandMap);
            
            // 기본 정보
            mv.addObject("row",resultMap.get("row"));
            
            // 첨부파일 목록
            mv.addObject("fileList", resultMap.get("fileList"));
            
            // 상품구성 목록
            mv.addObject("detailList", resultMap.get("detailList"));
            
            mv.addObject("tagList", resultMap.get("tagList"));
        }
        
        mv.addObject("commandMap",commandMap);
        
        return mv;
    }
    
    @RequestMapping("/am/display/vendorSellerPickModify")
    public ModelAndView vendorSellerPickModify(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0) {
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		
        		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        		commandMap.put("CNT_MST_UPD_IP", request.getRemoteAddr());
                commandMap.put("CNT_MST_UPD_ID", admin.getADM_MST_ID());
                
                if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
                {
                    // 셀러픽 관리 수정
                    int result = this.sellerPickService.updateSellerPick((MultipartHttpServletRequest)request, commandMap);
                    
                    // view Page Info
                    if(result > 0)
                    {
                        mv.addObject("alertMsg", "수정 되었습니다.");
                        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/vendorSellerPickList.do");
                    }
                    else
                    {
                        mv.addObject("alertMsg", "수정에 실패하였습니다.");
                        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/vendorSellerPickList.do");
                    }
                    mv.addObject("commandMap", commandMap);
                    mv.setViewName("/am/common/result");
                }
        	}
        }
        return mv;
    }
    
    @RequestMapping(value="/am/display/sellerPickListModify")
    public ModelAndView sellerPickListModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String serverName = request.getServerName().toString();
        String alertMsg = "";
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("CNT_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_UPD_ID", admin.getADM_MST_ID());
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_SELLER_PICK);
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        String sellerPickData = StringUtil.getString(commandMap.get("selectedSellerPickList"),"");
        List<Map<String, Object>> selectedSellerPickList = mapper.readValue(sellerPickData, typeRef);
        
        commandMap.put("selectedSellerPickList", selectedSellerPickList);

    	if(serverName.indexOf("scm") >= 0 && Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()) 
    	{
			if(selectedSellerPickList != null && selectedSellerPickList.size() > 0) 
			{
				int result = 0;
        		for(int index=0; index < selectedSellerPickList.size(); index++) {
        			if(!selectedSellerPickList.get(index).get("CNT_MST_USE_YN_ORG").equals(selectedSellerPickList.get(index).get("CNT_MST_USE_YN"))){
        				result++;
        			}
        		}
                // 관리자 셀러픽 목록 상태 다중 수정
                this.sellerPickService.updateSellerPickList(commandMap);
                
                if(result > 0)
                {
                	mv.addObject("alertMsg", "수정 되었습니다.");
                }
                else
                {
                	mv.addObject("alertMsg", "변경된 정보가 없습니다.");
                }
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/vendorSellerPickList.do");
			}
            else
            {
            	mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/vendorSellerPickList.do");
            }
        	
    	}
    	else
    	{
    		mv.addObject("alertMsg", "수정 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/vendorSellerPickList.do");
    	}
    	
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        
        return mv;
    }
}
