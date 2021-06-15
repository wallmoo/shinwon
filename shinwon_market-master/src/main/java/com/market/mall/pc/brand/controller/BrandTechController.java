package com.market.mall.pc.brand.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.pc.brand.service.BrandTechService;

/**
 * @PackageName: com.market.mall.pc.brand.controller
 * @FileName : BrandTechController.java
 * @Date : 2015. 6. 11.
 * @프로그램 설명 : 사용자 > 브랜드사이트 > Tech관련하여 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */

@Controller("pcBrandTechController")
public class BrandTechController 
{
	@Resource(name="pcBrandTechService") private BrandTechService pcBrandTechService;
	
	/**
	* <pre>
	* 1. MethodName : brandTechnology
	* 2. ClassName : BrandTechController.java
	* 3. Comment : 사용자 > tech > technology 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 11.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/brand/brandTechnology")
	public ModelAndView brandTechnology (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
        commandMap.put("CMM_FLE_TB_NM", "T_BRD_SHG");// 아이콘 이미지
        
        // 브랜드 코드 가져오기
        commandMap.put("BRAND_CD", request.getAttribute("serverBrandCd"));
        
        // technology 코드 값
        commandMap.put("BRD_CMN_COM_IDX", Code.COMMON_SHOPPING_GUIDE_PRODUCT_TECHINFO);

        // technology 목록 갯수
        commandMap.put("pageSize", "20");
        int totalCount = this.pcBrandTechService.selectBrandTechCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        if(totalCount>0)
        {
        	// technology 목록
            mv.addObject("technologyList",  this.pcBrandTechService.selectBrandTechList(commandMap));
        }        
        
        // 해당 브랜드로 이동
        mv.setViewName("pc/brand/brandTechnology");
        
        //RETURN OBJECT
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        
        return mv;
        
	}
	
	/**
	* <pre>
	* 1. MethodName : brandEquipmentKeep
	* 2. ClassName : BrandTechController.java
	* 3. Comment : 사용자 > tech > 장비유지팁 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 11.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/brand/brandEquipmentKeep")
	public ModelAndView brandEquipmentKeep (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
        commandMap.put("CMM_FLE_TB_NM", "T_BRD_SHG");// 아이콘 이미지
        
        // 브랜드 코드 가져오기
        commandMap.put("BRAND_CD", request.getAttribute("serverBrandCd"));
        
        // 장비유지팁 코드 값
        commandMap.put("BRD_CMN_COM_IDX", Code.COMMON_SHOPPING_GUIDE_EQUIPMENT_KEEP);

        // 장비유지팁 목록 갯수
        commandMap.put("pageSize", "20");
        int totalCount = this.pcBrandTechService.selectBrandTechCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        if(totalCount>0)
        {
        	// 장비유지팁 목록
            mv.addObject("technologyList",  this.pcBrandTechService.selectBrandTechList(commandMap));
        }        
        
        // 해당 브랜드로 이동
        mv.setViewName("pc/brand/brandEquipmentKeep");
        
        //RETURN OBJECT
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        
        return mv;
        
	}
	
	/**
	* <pre>
	* 1. MethodName : brandUseMenual
	* 2. ClassName : BrandTechController.java
	* 3. Comment : 사용자 > tech > 사용메뉴얼 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 11.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/brand/brandUseMenual")
	public ModelAndView brandUseMenual (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
        commandMap.put("CMM_FLE_TB_NM", "T_BRD_SHG");// 아이콘 이미지
        
        // 브랜드 코드 가져오기
        commandMap.put("BRAND_CD", request.getAttribute("serverBrandCd"));
        
        // 사용메뉴얼 코드 값
        commandMap.put("BRD_CMN_COM_IDX", Code.COMMON_SHOPPING_GUIDE_USE_MENUAL);

        // 사용메뉴얼 목록 갯수
        commandMap.put("pageSize", "20");
        int totalCount = this.pcBrandTechService.selectBrandTechCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        if(totalCount>0)
        {
        	// 사용메뉴얼 목록
            mv.addObject("technologyList",  this.pcBrandTechService.selectBrandTechList(commandMap));
        }        
        
        // 해당 브랜드로 이동
        mv.setViewName("pc/brand/brandUseMenual");
        
        //RETURN OBJECT
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        
        return mv;
        
	}
	
}
