package com.market.mall.batch.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.mall.batch.service.BatchDeleteCIService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;


/**
 * @PackageName: com.market.mall.batch.service.impl
 * @FileName : BatchCIDeleteServiceImpl.java
 * @Date : 2015. 12. 16
 * @프로그램 설명 : 관리자 > 탈퇴회원 CI 값 삭제를 처리하는 Service Implement Class
 * @author 김소영
 */
@Service("batchCIDeleteService")
public class BatchDeleteCIServiceImpl implements BatchDeleteCIService{

    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    
    public Map<String, Object> deleteCI( final Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("result", "F");
    	this.defaultDAO.update("BatchDeleteCI.deleteCI", commandMap);
    	
    	commandMap.put("result", "S");
    	return commandMap;
    }
    
}
