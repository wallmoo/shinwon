package com.market.mall.batch.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.mall.batch.service.BatchDeleteOrderTempService;
import com.market.mall.dao.CommonDefaultDAO;


/**
 * @PackageName: com.market.mall.am.batch.service.impl
 * @FileName : updateCartProduct.java
 * @Date : 2014. 8. 6.
 * @프로그램 설명 : 관리자 > 배치작업 관리 를 처리하는 Service Implement Class
 * @author 이미정
 */
@Service("batchDeleteOrderTempService")
public class BatchDeleteOrderTempServiceImpl implements BatchDeleteOrderTempService{

    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    
    public Map<String, Object> deleteOrderTemp( final Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("result", "F");
    	this.defaultDAO.delete("BatchDeleteOrderTemp.deleteProductTemp", commandMap);
    	this.defaultDAO.delete("BatchDeleteOrderTemp.deleteOrderTemp", commandMap);
    	commandMap.put("result", "S");
    	return commandMap;
    }
    
}
