package com.market.mall.batch.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.mall.batch.service.BatchMemberBlackCancelService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;


/**
 * @PackageName: com.market.mall.batch.service.impl
 * @FileName : BatchMemberBlackCancelServiceImpl.java
 * @Date : 2015. 12. 16
 * @프로그램 설명 : 관리자 > 블랙리스트 종료 회원 상태값 원복을 처리하는 Service Implement Class
 * @author 김소영
 */
@Service("batchMemberBlackCancelService")
public class BatchMemberBlackCancelServiceImpl implements BatchMemberBlackCancelService{

    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    
    public Map<String, Object> updateMemberState( final Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("result", "F");
    	this.defaultDAO.insert("BatchMemberBlackCancel.insertMemberHistory", commandMap);
    	this.defaultDAO.update("BatchMemberBlackCancel.updateMemberState", commandMap);
    	commandMap.put("result", "S");
    	return commandMap;
    }
    
}
