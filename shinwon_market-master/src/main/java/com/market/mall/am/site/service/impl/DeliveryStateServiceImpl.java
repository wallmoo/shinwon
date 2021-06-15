package com.market.mall.am.site.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.site.service.DeliveryStateService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;


@Service("deliveryStateService")
public class DeliveryStateServiceImpl implements DeliveryStateService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    public int selectDeliveryStateListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("DeliveryState.selectDeliveryStateListCount", commandMap);
    }
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectDeliveryStateList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("DeliveryState.selectDeliveryStateList", commandMap);
    }
    
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectDeliveryStateInfo (Map<String, Object> commandMap) throws Exception
    {
    	 Map<String, Object> returnMap = new HashMap<String, Object>();
    	 
    	 List<Map<String, Object>> detailList = defaultDAO.selectList("DeliveryState.selectDeliveryStateInfo", commandMap);
    	 
    	 if(detailList.size() > 0 && detailList != null) {
    		 returnMap.put("DLV_INF_IDX" , detailList.get(0).get("DLV_INF_IDX"));
    	 }
    	 returnMap.put("detailList", detailList);
        
    	 return returnMap;
     }
     
     public int insertDeliveryState (Map<String, Object> commandMap) throws Exception
     {
    	 int result = 0;
    	 if(!"".equals(StringUtil.getString(commandMap.get("DLV_INF_IDX"),""))) {
    		 //update
    		 result = defaultDAO.delete("DeliveryState.deleteDeliveryStateDetail", commandMap);
    	 }
    	 else {
    		 //초기 정보 등록
    		 result = defaultDAO.insert("DeliveryState.insertDeliveryState", commandMap); 
    	 }

    	 if(result > 0)
    	 {
             ObjectMapper mapper = new ObjectMapper();
             TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
             
             List<Map<String,Object>> DeliveryStateDetailList = mapper.readValue(StringUtil.getString(commandMap.get("jsonData"),""), typeRef);
             for(int index=0; index < DeliveryStateDetailList.size(); index++) {
            	 DeliveryStateDetailList.get(index).put("DLV_INF_IDX", commandMap.get("DLV_INF_IDX"));
             }
             commandMap.put("DeliveryStateDetailList", DeliveryStateDetailList);
             
             result = defaultDAO.insert("DeliveryState.insertDeliveryStateDetail", commandMap);
    	 }
    	 
    	 return result;
     }
     
}
