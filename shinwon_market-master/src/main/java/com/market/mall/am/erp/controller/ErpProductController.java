package com.market.mall.am.erp.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.market.mall.am.erp.service.ErpProductService;
import com.market.mall.am.product.service.BasicProductService;

@Controller
public class ErpProductController {
	
	@Resource(name="erpProductService")
    private ErpProductService erpProductService;
	
	@Resource(name="basicProductService") 
	private BasicProductService basicProductService;
    
	
	@SuppressWarnings("unchecked")
    @RequestMapping(value="/am/erp/productDataAjax", method=RequestMethod.POST)
	public JSON productDataAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap){
		JSON json = new JSON(); 
		json.put("resultCode", "300");
		String styleNo = StringUtil.getString(commandMap.get("styleNo"), "");
		if(styleNo.isEmpty()) {
			return json;
		}
		commandMap.put("PRD_MST_ERP_CD", styleNo);
		boolean exists = basicProductService.erpDuplicateCheck(commandMap);
		if(exists) {
			json.put("resultCode", "301");
			return json;
		}
		
		Map<String, Object> resultMap = ErpRequest.requestProductMaster2(styleNo);
		List<Map<String, Object>> master = (List<Map<String, Object>>) resultMap.get("masterList");
		json.put("resultCode", "200");
		if(master.size() < 1) {
			json.put("resultCode", "400");
			return json;
		}
		
		List<Map<String, Object>> detail = ErpRequest.requestDetail(styleNo);
		
		json.put("productMaster", master);
		json.put("productDetail", detail);
		return json;
	}
    
    /**
    public JSON getProductDetailAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        JSON json = new JSON();
        String PRD_MST_CD = commandMap.get("STYLE_NO").toString();
        if(PRD_MST_CD!=null && !PRD_MST_CD.isEmpty()) {
        	erpProductService.updateProduct(PRD_MST_CD);
        }
        json.put("STATUS", Integer.toString(HttpServletResponse.SC_OK));
        return json;
        
    }
    */
	
	/**
	 * @api {POST} /am/erp/productUpdateAjax.do
	 * @apiName  ERP 상품 업데이트
	 * @apiGroup ERP
	 * @apiParam {String} PRD_MST_SEASON 시즌코드
	 * @apiParam {Array} PRD_MST_COLOR 색상
	 * @apiParam {Array} PRD_MST_SIZE 사이즈
	 * @apiParam {Array} PRD_MST_SIZE 색상
	 * @apiParam {String} PRD_MST_NM 상품명
	 * @apiParam {String} PRD_MST_PRC 상품가격
	 * @apiParam {String} PRD_MST_TAG_PRC 태그가격
	 * 
	 * @apiSuccess {JSON} STATUS:200
	 * @apiError {JSON} STATUS:400
	 */
	
    @RequestMapping(value="/am/erp/productUpdateAjax")
    public JSON productUpdateAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	JSON response = new JSON();
    	if(!commandMap.containsKey("PRD_MST_CD")) {
    		response.put("STATUS", ""+HttpServletResponse.SC_BAD_GATEWAY);
    		return response;
    	}
    	
    	response.put("STATUS", ""+HttpServletResponse.SC_OK);
        return response;
    }    
}
