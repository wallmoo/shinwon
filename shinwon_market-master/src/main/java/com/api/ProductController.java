package com.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.pc.product.service.ProductService;

@Controller
public class ProductController
{
    
    @Resource(name="productService") 
    private ProductService productService;
    
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping(value = "/api/productUpdate", method = RequestMethod.POST)
    public Map<String, Object> productUpdate(@RequestBody Map<String, Object> params) throws Exception
    {
        Map<String, Object> result = new HashMap<String, Object>();

        String paramStyleNo = StringUtil.getString(params.get("STYLE_NO"));
        if (paramStyleNo == null || paramStyleNo.equals(""))
        {
            result.put("resultCode", 300);
            return result;
        }
        Map<String,Object> dataMap = ErpRequest.requestProductMaster2(paramStyleNo);
        List<Map<String, Object>> masterList = (List<Map<String, Object>>) dataMap.get("masterList");
        Map<String, Object> updateMap = (Map<String, Object>) dataMap.get("masterUpdateMap");
        // 상품등록이 안돼 있을 때 401
        if (masterList == null || masterList.size() < 1)
        {
            result.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
            return result;
        }
        else // 디비에 넣어야함
        {
            //마스터 테이블 수정
            productService.updateMaster(updateMap);
            
            //OPT 테이블 수정
            productService.updateOpt(masterList);
        }
        
        result.put("resultCode", 200);
        return result;
    }
}
