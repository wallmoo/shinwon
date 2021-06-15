/**
 * 
 */
package com.api.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.api.service.ApiService;
import com.market.mall.am.site.service.O2OStoreListService;
import com.market.mall.dao.CommonDefaultDAO;

/**
 * @author 51956676
 *
 */
@Service(value = "apiService")
public class ApiServiceImpl implements ApiService
{

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name = "o2oStoreListService")
    private O2OStoreListService o2oStoreListService;

    @Override
    public void updatePart(Map<String, Object> erpData) throws Exception
    {

        List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();
        dataList.add(erpData);
        
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("parts", dataList);
        
        this.o2oStoreListService.deleteO2OStore(erpData);
        this.o2oStoreListService.insertO2OStoreBatch(param);
    }

}
