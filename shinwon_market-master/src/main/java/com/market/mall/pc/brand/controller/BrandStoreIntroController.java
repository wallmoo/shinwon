package com.market.mall.pc.brand.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.model.Paging;
import com.market.mall.pc.brand.service.BrandStoreIntroService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.brand.controller
 * @FileName : BrandStoreIntroController.java
 * @Date : 2015. 6. 12.
 * @프로그램 설명 : 사용자 > 브랜드사이트 > 매장안내 관련하여 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */

@Controller("pcBrandStoreIntroController")
public class BrandStoreIntroController 
{
	@Resource(name="pcBrandStoreIntroService") private BrandStoreIntroService pcBrandStoreIntroService;
	
	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
	
	/**
	* <pre>
	* 1. MethodName : brandStoreIntroMarmot
	* 2. ClassName : BrandStoreIntroController.java
	* 3. Comment : 사용자 > 마모트 > 매장 > 매장 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/brand/brandStoreIntroMarmot")
	public ModelAndView brandStoreIntroMarmot (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
       
        // 브랜드 코드 가져오기
        commandMap.put("BRAND_CD", request.getAttribute("serverBrandCd"));
        
        // 회사코드
		commandMap.put("COMP_CD", request.getAttribute("serverCompCd"));
		
		// 지역코드 default
		if("".equals(StringUtil.getString(commandMap.get("searchAreaCd"),"")))
		{
			commandMap.put("searchAreaCd", "01");	// 서울
		}
		
		// 지역코드 이름 가져오기
		String searchAreaNm = this.pcBrandStoreIntroService.selectStoreAreaNm(commandMap);
		
        // 매장 지역 관련 목록
        List<Map<String,Object>> storeAreaList = this.pcBrandStoreIntroService.selectStoreAreaList(commandMap);
        
        // 매장 목록 갯수
        commandMap.put("pageSize", "10");
        int marmotTotalCount = this.pcBrandStoreIntroService.selectMarmotStoreCount(commandMap);
        Paging paging = new Paging(marmotTotalCount, commandMap); 
        
        if(marmotTotalCount > 0)
        {
        	// 매장  목록
            mv.addObject("marmotStoreList",  this.pcBrandStoreIntroService.selectMarmotStoreList(commandMap));
        }        
        
        // 해당 브랜드로 이동
        mv.setViewName("pc/brand/brandStoreIntroMarmot");
        
        //RETURN OBJECT
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        mv.addObject("searchAreaNm",searchAreaNm);
        mv.addObject("storeAreaList" , storeAreaList);
        mv.addObject("marmotTotalCount",marmotTotalCount);
        
        return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : brandAddrPopup
	* 2. ClassName : BrandStoreIntroController.java
	* 3. Comment : 사용자 > 마모트 > 매장 > 매장 지도보기 팝업
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/brand/brandStoreAddrPopup")
	public ModelAndView brandAddrPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 지도 api키 담기
		commandMap.put("apiKey", propertiesService.getString("daum.map.api.key"));
		// 해당 브랜드로 이동
        mv.setViewName("pc/brand/brandStoreAddrPopup");
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : brandStoreIntroMountia
	* 2. ClassName : BrandStoreIntroController.java
	* 3. Comment : 사용자 > 마운티아 > 매장 > 매장 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/brand/brandStoreIntroMountia")
	public ModelAndView brandStoreIntroMountia (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
       
        // 브랜드 코드 가져오기
        commandMap.put("BRAND_CD", request.getAttribute("serverBrandCd"));
        
        // 회사코드
		commandMap.put("COMP_CD", request.getAttribute("serverCompCd"));
		
		// 지역코드 default
		if("".equals(StringUtil.getString(commandMap.get("searchAreaCd"),"")))
		{
			commandMap.put("searchAreaCd", "01");	// 서울
		}
		
		// 지역코드 이름 가져오기
		String searchAreaNm = this.pcBrandStoreIntroService.selectStoreAreaNm(commandMap);
		
        // 매장 지역 관련 목록
        List<Map<String,Object>> storeAreaList = this.pcBrandStoreIntroService.selectStoreAreaList(commandMap);
        
        // 매장 목록 갯수
        commandMap.put("pageSize", "10");
        int mountiaTotalCount = this.pcBrandStoreIntroService.selectMountiaStoreCount(commandMap);
        Paging paging = new Paging(mountiaTotalCount, commandMap); 
        
        if(mountiaTotalCount > 0)
        {
        	// 매장  목록
            mv.addObject("mountiaStoreList",  this.pcBrandStoreIntroService.selectMountiaStoreList(commandMap));
        }        
        
        // 해당 브랜드로 이동
        mv.setViewName("pc/brand/brandStoreIntroMountia");
        
        //RETURN OBJECT
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        mv.addObject("searchAreaNm",searchAreaNm);
        mv.addObject("storeAreaList" , storeAreaList);
        mv.addObject("mountiaTotalCount",mountiaTotalCount);
        
        return mv;
	}
}
