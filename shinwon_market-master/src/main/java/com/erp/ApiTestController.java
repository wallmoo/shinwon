/**
 * project : shinwon_market
 * package : com.erp
 * file    : ApiTestController.java
 * createDt : 2020. 6. 12.
 * user    : 이찬희
 * 
 * git     : 
 *
 * todo    : API를 테스트 하기 위한 Controller로써 운영반영은 하지 않는다. (개발 완료시 삭제할 파일)
 */
package com.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.mall.am.site.service.O2OStoreListService;
import com.market.mall.pc.mypage.service.MyInfoService;
import com.market.mall.pc.product.service.ProductService;

/**
 * @author 이찬희
 * @description api를 테스트하기 위한 Controller
 *
 */
@Controller
public class ApiTestController
{

    
    @Resource(name="pcMyInfoService")
    private MyInfoService pcMyInfoService;
    
    @Resource(name="o2oStoreListService") 
    private O2OStoreListService o2oStoreListService;
    
    @Resource(name="productService") 
    private ProductService productService;
    
    @ResponseBody
    @RequestMapping(value="/api/partInfoTest", method=RequestMethod.POST)
    public Map<String,Object> partInfoTest (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
    {
        List<Map<String,Object>> list = ErpRequest.requestPartInfo();
        
        Map<String,Object> returnMap = new HashMap<String,Object>();
        
        returnMap.put("resultCode", HttpServletResponse.SC_OK);
        if(list==null || list.isEmpty()) {
            returnMap.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
            return returnMap;
        }
        
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("parts", list);
        
        this.o2oStoreListService.deleteO2OStoreListAll();
        this.o2oStoreListService.insertO2OStoreBatch(param);
        
        returnMap.put("list", list);
        return returnMap;
    }
    
    @ResponseBody
    @RequestMapping(value="/api/stockInfoTest", method=RequestMethod.POST)
    public Map<String,Object> stockInfoTest (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
    {
        List<Map<String,Object>> list = ErpRequest.requestStockInfo(commandMap);
        Map<String,Object> returnMap = new HashMap<String,Object>();
        
        returnMap.put("resultCode", HttpServletResponse.SC_OK);
        if(list==null || list.isEmpty()) {
            returnMap.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
            return returnMap;
        }
        
        returnMap.put("list", list);
        return returnMap;
        
    }
    
    @ResponseBody
    @RequestMapping(value="/api/allStockInfoTest", method=RequestMethod.POST)
    public Map<String,Object> allStockInfoTest (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
    {
        List<Map<String,Object>> list = ErpRequest.requestAllStockInfo(commandMap);
        Map<String,Object> returnMap = new HashMap<String,Object>();
        
        returnMap.put("resultCode", HttpServletResponse.SC_OK);
        if(list==null || list.isEmpty()) {
            returnMap.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
            return returnMap;
        }
        
        returnMap.put("list", list);
        return returnMap;
        
    }
    
    @ResponseBody
    @RequestMapping(value="/api/productMaster2", method=RequestMethod.POST)
    public Map<String,Object> allProductMaster2Test (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
    {
        String styleNo = (String) commandMap.get("STYLE_NO");
        Map<String,Object> dataMap = ErpRequest.requestProductMaster2(styleNo);
        List<Map<String, Object>> list = (List<Map<String, Object>>) dataMap.get("masterList");
        Map<String, Object> updateMap = (Map<String, Object>) dataMap.get("masterUpdateMap");
        Map<String,Object> returnMap = new HashMap<String,Object>();
        
        returnMap.put("resultCode", HttpServletResponse.SC_OK);
        if(list==null || list.isEmpty()) {
            returnMap.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
            return returnMap;
        }

        productService.updateMaster(updateMap);
        
        returnMap.put("list", list);
        return returnMap;
        
    }
    
    @ResponseBody
    @RequestMapping(value="/api/o2oFeeRateTest", method=RequestMethod.POST)
    public Map<String,Object> o2oFeeRateTest (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
    {
        List<Map<String,Object>> list = ErpRequest.requestO2OFeeRate(commandMap);
        Map<String,Object> returnMap = new HashMap<String, Object>();
        
        returnMap.put("resultCode", HttpServletResponse.SC_OK);
        if(returnMap==null || returnMap.isEmpty()) {
            returnMap.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
            return returnMap;
        }
        returnMap.put("list", list);
        return returnMap;
        
    }
    
    @SuppressWarnings("finally")
    @ResponseBody
    @RequestMapping(value="/api/o2oFeeRateResultTest", method=RequestMethod.POST)
    public Map<String,Object> o2oFeeRateResultTest (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        try
        {
            ErpRequest.requestO2OFeeRateResult(commandMap);
            returnMap.put("resultCode", HttpServletResponse.SC_OK);
        } 
        catch (Exception e)
        {
            // TODO Auto-generated catch block
            returnMap.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
            e.printStackTrace();
        } 
        finally 
        {
            return returnMap;
            
        }
    }
}
