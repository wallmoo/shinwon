package com.market.mall.am.product.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epasscni.util.DateUtil;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.product.service.DiscountService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

@Service("discountService")
public class DiscountServiceImpl implements DiscountService{
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

    public int insertDiscountInfo (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<Map<String, Object>>> typeRef = new TypeReference<List<Map<String, Object>>>(){};
        
        String jsonList = StringUtil.getString(commandMap.get("discountList"),"");
        List<Map<String,Object>> discountList = mapper.readValue(jsonList,typeRef);

        if(discountList != null){
            for(int index = 0; index < discountList.size(); index++){
                Map<String, Object> paramMap = new HashMap<String, Object>();
                
                String discountIdx = StringUtil.getString(commandMap.get("DSC_MST_IDX"),"");
                
                //기본값 설정 - 등록자 ID, IP
                paramMap.put("DSC_MST_REG_IP", request.getRemoteAddr());
                paramMap.put("DSC_MST_REG_ID", admin.getADM_MST_ID());
                
                paramMap.put("DSC_MST_TYPE", commandMap.get("DSC_MST_TYPE"));
                paramMap.put("BND_MST_IDX", StringUtil.getInt(discountList.get(index).get("BND_MST_IDX")));
                paramMap.put("DSC_MST_SEASON", StringUtil.getInt(discountList.get(index).get("DSC_MST_SEASON")));
                paramMap.put("DSC_MST_YEAR", StringUtil.getInt(discountList.get(index).get("DSC_MST_YEAR")));
                paramMap.put("DSC_MST_NM", discountList.get(index).get("DSC_MST_NM"));
                
                int saleRate = StringUtil.getInt(discountList.get(index).get("DSC_MST_RATE"));
                
                paramMap.put("DSC_MST_RATE", saleRate);

                if(!discountIdx.equals(""))
                {
                    //기본값 설정 - 수정자 ID, IP
                    paramMap.put("DSC_MST_UPD_IP", request.getRemoteAddr());
                    paramMap.put("DSC_MST_UPD_ID", admin.getADM_MST_ID());
                    paramMap.put("DSC_MST_IDX", discountIdx);
                    
                    result = defaultDAO.update("Discount.updateDiscountInfo", paramMap);
                }
                else
                {
                    result = defaultDAO.insert("Discount.insertDiscountInfo", paramMap);
                }
            }
        }
        return result;
    }
    
    public List<Map<String, Object>> selectDiscountList (Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("Discount.selectDiscountList", commandMap);
    }
    
    
}
