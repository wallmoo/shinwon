package com.market.mall.am.site.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.site.service.BrandManagerService;
import com.market.mall.am.site.service.VendorManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.site.controller
 * @FileName : BrandManagerController.java
 * @Date : 2015. 3. 23.
 * @프로그램 설명 : 관리자 > 시스템관리 > 브랜드 관리를 처리하는 Controller Class
 * @author DEV_KANGHYUNKYU
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class BrandManagerController {
	
	@Resource(name="brandManagerService") private BrandManagerService brandManagerService;
	@Resource(name="vendorManagerService") private VendorManagerService vendorManagerService;
	
	/**
	* <pre>
	* 1. MethodName : brandManagerList
	* 2. ClassName  : BrandManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 브랜드 관리 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 3. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	
	/**
     * @api {POST} /am/site/brandManagerList.do
     * @apiName 브랜드 목록
     * @apiGroup 브랜드관리
     * 
     * @apiParam {String} searchBrandNm 검색 브랜드 명
     * @apiParam {String} searchBrandUseYn 검색 브랜드 사용 여부
     * @apiParam {String} searchBrandDplState 검색 브랜드 노출 상태(Y,N)
     * 
     * @apiSuccess {Object[]} list 브랜드관리 목록  [{BND_MST_DPL_STATE=Y(브랜드 노출 상태(Y,N)), BND_MST_BRAND_TYPE=(I:자사, O:타사), RNUM=1, VDR_MST_NM=MARKM, BND_MST_IDX=1778, BND_MST_USE_YN=Y, BND_MST_BRAND_NM=MARKM(브랜드명), BND_MST_REG_DT=20200413101530, VDR_MST_IDX=53}]
     * @apiSuccess {Integer} totalCount 브랜드 관리 목록 총 개수
     * @apiSuccess {Object} commandMap 파라미터맵
     */
	@RequestMapping("/am/site/brandManagerList")
    public ModelAndView brandManagerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        // 브랜드 관리 목록 갯수
        int totalCount = 0;

        //입점업체일 경우 입점업체로만 검색
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
            if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
                commandMap.put("searchVdrMstIdx", admin.getADM_MST_SUB_IDX());
            }
        }
        
        List<Map<String, Object>> list = null;
        totalCount = this.brandManagerService.selectBrandManagerListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        if(totalCount > 0)
        {
        	// 브랜드 관리 목록
        	list = this.brandManagerService.selectBrandManagerList(commandMap);
        }
        
        mv.addObject("paging", paging );
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : brandManagerForm
	* 2. ClassName  : BrandManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 브랜드 관리 등록 폼
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/brandManagerForm")
	public ModelAndView brandManagerForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : brandManagerRegist
	* 2. ClassName  : BrandManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 브랜드관리 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/brandManagerRegist")
	public ModelAndView brandManagerRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 브랜드 관리 등록
        int result = this.brandManagerService.insertBrandManager((MultipartHttpServletRequest)request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/brandManagerList.do");
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/brandManagerList.do");
        }
        mv.setViewName("/am/common/result");
        
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : brandManagerEdit
	* 2. ClassName  : BrandManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 브랜드관리 수정폼 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 3. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	/**
     * @api {POST} /am/site/brandManagerEdit.do
     * @apiName 브랜드 상세 화면
     * @apiGroup 브랜드관리
     * 
     * @apiParam {String} BND_MST_IDX 브랜드 IDX
     * 
     * @apiSuccess {Object} row 브랜드 상세 정보  {BND_MST_DPL_STATE=Y, BND_MST_BRAND_TYPE=I, BND_MST_IDX=1778, BND_MST_DTL= 브랜드 소개, BND_MST_USE_YN=Y, BND_MST_URL=www.sw.co.kr/business/brand.php, BND_MST_SEL_NM=MARKM, BND_MST_BRAND_NM=MARKM, BND_MST_SRC_EN=영문검색어, BND_MST_SRC_KR=마크엠, VDR_MST_IDX=53}
     * @apiSuccess {Object[]} fileList 브랜드 이미지 [{CMM_FLE_ATT_EXT=jpg, CMM_FLE_ATT_SIZE=459231, CMM_FLE_SAVE_PATH=/mnt/data/tomcat/cdn/attach/default/2020/04/13/378a09e4-6a51-4851-a344-f1b2cdd71c95.jpg, CMM_FLE_ATT_PATH=/attach/default/2020/04/13/, CMM_FLE_REG_ID=admin, CMM_FLE_TB_NM=T_BND_MST, CMM_FLE_ORG_NM=markm900450.jpg, CMM_FLE_SORT=1, CMM_FLE_SYS_PATH=/mnt/data/tomcat/cdn, CMM_FLE_TB_PK=1778, CMM_FLE_USE_YN=Y, CMM_FLE_DW_CNT=0, CMM_FLE_IDX=5533, CMM_FLE_REG_DT=20200413101531, CMM_FLE_SYS_NM=378a09e4-6a51-4851-a344-f1b2cdd71c95.jpg}]
     * @apiSuccess {Object[]} sellerFile 셀러이미지 
     */
	@RequestMapping("/am/site/brandManagerEdit")
    public ModelAndView brandManagerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("BND_MST_IDX"), "")))
        {
            // 브랜드관리 상세정보
        	Map<String, Object> resultMap = this.brandManagerService.selectBrandManagerInfo(commandMap);
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("fileList", resultMap.get("fileList"));
            mv.addObject("sellerFile", resultMap.get("sellerFile"));
        }

        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : brandManagerModify
	* 2. ClassName  : BrandManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 브랜드관리 수정
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 3. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
    /**
     * @api {POST} /am/site/brandManagerModify.do
     * @apiName 브랜드 수정 처리
     * @apiGroup 브랜드관리
     * 
     * @apiParam {String} BND_MST_IDX 브랜드관리 IDX
     * @apiParam {String} BND_MST_SRC_KR 국문_검색명
     * @apiParam {String} BND_MST_SRC_EN false
     * @apiParam {String} BND_MST_QLY_ASR 품질보증기준
     * @apiParam {String} BND_MST_SERV 서비스센터
     * @apiParam {String} BND_MST_URL 브랜드 URL
     * @apiParam {String} BND_MST_DTL 브랜드 소개
     * @apiParam {String} BND_MST_DPL_STATE 브랜드 안내 설정 
     * @apiParam {String[]} CMM_FLE_IDX 첨부파일IDX
     * @apiParam {File} file 브랜드 이미지 파일
     * @apiParam {File} sellerFile 셀러 이미지 파일
     * 
     * @apiSuccess {String} alertMsg 수정 성공/오류 메세지
     * @apiSuccess {String} returnUrl 수정 성공 이후 돌아가는 URL
     * @apiParam {Object} commandMap 파라미터맵
     */
	@RequestMapping("/am/site/brandManagerModify")
    public ModelAndView brandManagerModify(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("BND_MST_IDX"), "")))
        {
            // 브랜드 관리 수정
            int result = this.brandManagerService.updateBrandManager((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/brandManagerList.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/brandManagerList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : brandManagerNmCheckAjax
	* 2. ClassName  : BrandManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 브랜드관리 > 브랜드명 중복체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/brandManagerSellerNmCheckAjax")
	public JSON brandManagerSellerNmCheckAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
        if(!"".equals(StringUtil.getString(commandMap.get("BND_MST_SEL_NM"), "")))
        {
            // 브랜드명 중복 체크
            int brandNmCount = this.brandManagerService.selectSellerNmCheckCount(commandMap);
            
            if( brandNmCount > 0)
            {
                json.put("resultYn", "N");
            }
            else
            {
                json.put("resultYn", "Y");
            }
            json.put("successYn", "Y");
        }
        else 
        {
            json.put("successYn", "N");
        }
        
        return json;
	}
	
	@RequestMapping("/am/site/brandManagerNmCheckAjax")
    public JSON brandManagerNmCheckAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        if(!"".equals(StringUtil.getString(commandMap.get("BND_MST_BRAND_NM"), "")))
        {
            // 브랜드명 중복 체크
            int brandNmCount = this.brandManagerService.selectBrandManagerNmCheckCount(commandMap);
            
            if( brandNmCount > 0)
            {
                json.put("resultYn", "N");
            }
            else
            {
                json.put("resultYn", "Y");
            }
            json.put("successYn", "Y");
        }
        else 
        {
            json.put("successYn", "N");
        }
        
        return json;
    }
	
    /**
     * @api {POST} /am/site/brandManagerStatusChangeAjax.do
     * @apiName 브랜드 목록 다건 status 수정
     * @apiGroup SB시스템관리
     * 
     * @apiParam {JSON} BRAND_ID_LIST [{"BND_MST_IDX":"55", "BND_MST_USE_YN":"Y", "BND_MST_DPL_STATE":"N"}] 
     * 
     * @apiSuccess {String} alertMsg 수정 성공/실패 메세지
     */
    @RequestMapping("/am/site/brandManagerStatusChangeAjax")
    public JSON brandManagerStatusChangeAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        int result = 0;
        
        result = this.brandManagerService.updateBrandStatus(request, commandMap);
        
        if(result > 0){
            json.put("alertMsg", "변경되었습니다");
        } else {
            json.put("alertMsg", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
        }
        
        return json;
    }
	
	/**
	* <pre>
	* 1. MethodName : searchBrandMultiPopup
	* 2. ClassName  : BrandManagerController.java
	* 3. Comment    : 브랜드 다중 검색 팝업
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 25.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/searchBrandMultiPopup")
	public ModelAndView searchBrandMultiPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 브랜드 관리 목록 갯수
        int totalCount = this.brandManagerService.selectBrandManagerListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
		mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        
        if(totalCount > 0)
        {
        	// 브랜드 관리 목록
        	list = this.brandManagerService.selectBrandManagerList(commandMap);
        }
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
		return mv;
	}
	
    @RequestMapping("/am/site/searchBrandVendorPopup")
    public ModelAndView searchBrandVendorPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        commandMap.put("VDR_MST_USE_YN", "Y");
        
        //사용중 입점업체 목록 갯수
        int totalCount = this.vendorManagerService.selectVendorManagerListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        if(totalCount > 0)
        {
             //사용중 입점업체 목록
             list = this.vendorManagerService.selectVendorManagerList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }

    //브랜드 등록할때 사용하는 입점사 검색 팝업
    @RequestMapping("/am/site/searchRegistVendorPopup")
    public ModelAndView searchRegistVendorPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        
        int totalCount = this.vendorManagerService.selectRegistVendorListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        if(totalCount > 0)
        {
             list = this.vendorManagerService.selectRegistVendorList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
    
    
    @RequestMapping("/am/site/brandListModify")
    public ModelAndView brandListModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        //기본값 설정
        commandMap.put("BND_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("BND_MST_UPD_ID", admin.getADM_MST_ID());
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        String brandData = StringUtil.getString(commandMap.get("selectedBrandList"),"");
        List<Map<String, Object>> selectedBrandList = mapper.readValue(brandData, typeRef);
        
        commandMap.put("selectedBrandList", selectedBrandList);
        
        if(selectedBrandList != null && selectedBrandList.size() > 0)
        {
        	if("admin".equals(admin.getADM_MST_ID()))
        	{
        		int result = 0;
        		for(int index=0; index < selectedBrandList.size(); index++) {
        			if(!selectedBrandList.get(index).get("BND_MST_USE_YN_ORG").equals(selectedBrandList.get(index).get("BND_MST_USE_YN"))){
        				result++;
        			}
        			if(!selectedBrandList.get(index).get("BND_MST_DPL_STATE_ORG").equals(selectedBrandList.get(index).get("BND_MST_DPL_STATE"))){
        				result++;
        			}
        		}
                // 관리자 수정
                this.brandManagerService.updateBrandList(commandMap);
                
                if(result > 0) {
                	mv.addObject("alertMsg", "변경되었습니다.");
                }
                else {
                	mv.addObject("alertMsg", "변경된 정보가 없습니다.");	
                }
                
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/brandManagerList.do");
        	}
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/brandManagerList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    @RequestMapping("/am/site/brandManagerListExcelDownload")
    public ModelAndView brandManagerListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();

        int totalCount = this.brandManagerService.selectBrandManagerListCount(commandMap);

        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        commandMap.put("excelDown", "Y");
        
        if(totalCount > 0){
        	 List<Map<String, Object>> list = null;
        	 
        	 String fileName = "brandList_"+DateUtil.getToday();

        	 String [] rowTitle = { "NO","입점사명","브랜드코드","브랜드명","서비스센터", "등록일", "브랜드 안내 설정", "사용 설정"};      
             String [] cellSize = { "20","100","50","100","100", "50","50","50"};
           	 String [] dataName = { "RNUM","VDR_MST_NM","BND_MST_IDX", "BND_MST_BRAND_NM","BND_MST_SERV", "BND_MST_REG_DT", "BND_MST_DPL_STATE", "BND_MST_USE_YN"};
             String [] dataType = { "String", "String","String","String","String" ,"Date", "String","String"};
        	//일정 건수가 넘으면 excel 대신 csv 처리
            if(totalCount > 30000){
            	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
            	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
            	commandMap.put("rowTitleArr", rowTitle); //필드제목
            	commandMap.put("dataNameArr", dataName); //필드명
            	commandMap.put("responseForCsv", response); //response
            }
        	list = this.brandManagerService.selectBrandManagerList(commandMap);

        	if(list != null){
                // 제조사 목록 엑셀 다운로드
                ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
        	}
        }
         
        return null;
     }
    
    

	@RequestMapping("/am/site/brandManagerDeleteList")
	public ModelAndView vendorManagerDeleteList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		
        String[] array =  StringUtil.getArray(commandMap, "targetBndList");
        commandMap.put("BND_LIST", array);
        
		
		int result = this.brandManagerService.deleteBrandrManager(request, commandMap);

		
		// view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "삭제 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/brandManagerList.do");
        }
        else  
        {
            mv.addObject("alertMsg", "삭제 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/brandManagerList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        
		return mv;
	}
    
    
}
