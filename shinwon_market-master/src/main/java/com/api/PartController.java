/**
 * 
 */
package com.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.service.ApiService;

/**
 * @author "arangluv"
 *
 */
@Controller
public class PartController
{
    
    @Resource(name="apiService") 
    private ApiService apiService;
    
    @ResponseBody
    @RequestMapping(value = "/api/partUpdate", method = RequestMethod.POST)
    public Map<String, Object> partUpdate(@RequestBody Map<String, List<String>> params) throws Exception
    {
        Map<String, Object> result = new HashMap<String, Object>();

        if (params == null || params.isEmpty())
        {
            result.put("resultCode", 300);
            return result;
        }
        
        int arrSize = ((List<String>) params.get("PART_DIV")).size();

        for(int i=0; i<arrSize; i++)
        {
            Map<String, Object> paraMap = new HashMap<String, Object>();
            paraMap.put("PART_DIV", ((List<String>) params.get("PART_DIV")).get(i));
            paraMap.put("PART_NO", ((List<String>) params.get("PART_NO")).get(i));
            paraMap.put("BRAND", ((List<String>) params.get("BRAND")).get(i));
            paraMap.put("STATE", ((List<String>) params.get("STATE")).get(i));
            paraMap.put("ZIP_NO", ((List<String>) params.get("ZIP_NO")).get(i));
            paraMap.put("ADDR", ((List<String>) params.get("ADDR")).get(i));
            paraMap.put("PART_PHONE_NO", ((List<String>) params.get("PART_PHONE_NO")).get(i));
            paraMap.put("CELL_PHONE_NO", ((List<String>) params.get("CELL_PHONE_NO")).get(i));
            
            apiService.updatePart(paraMap);
        }

        result.put("resultCode", 200);
        return result;
    }
}