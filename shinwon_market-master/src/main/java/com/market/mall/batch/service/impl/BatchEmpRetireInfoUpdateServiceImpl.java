package com.market.mall.batch.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.market.mall.batch.service.BatchEmpRetireInfoUpdateService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("batchEmpRetireInfoUpdateService")
public class BatchEmpRetireInfoUpdateServiceImpl implements BatchEmpRetireInfoUpdateService {
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    
	/**
	 * <pre> 
	 * 1. MethodName : updateEmpRetireInfoMonth
	 * 2. ClassName  : BatchEmpRetireInfoUpdateServiceImpl.java
	 * 3. Comment    : 퇴직자 변경처리
     * 4. 작성자       : 
     * 5. 작성일       : 
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")   

	public Map<String, Object> updateEmpRetireInfoMonth(Map<String, Object> commandMap) throws Exception {

    	commandMap.put("result", "F");
		commandMap.put("MASK", 	 "?");	// 물음표 파람처리    	
 		commandMap.put("WORK_DATE", "20200611");
		
        /**
		 *  step 1. 퇴직자 조회
         **/
    	List<Map<String, Object>> list = ErpRequest.requestEmpRetireInfo(commandMap);

    	/**
		 *  step 2. 퇴직자 처리
         **/
    	
    	logger.debug("===============================================>>>>>>>>>  "+list.get(0).get("EMP_NO").toString());
        if (list.size()>0) {
  		  for(int i=0;i<list.size();i++) {
	    		commandMap.put("MEM_MST_ERP_ID", list.get(i).get("EMP_NO").toString());	// 등급 업데이트 상향
	    		defaultDAO.update("BatchMemberGradeMonth.updateEmpRetireInfo", commandMap);			  
     		    
	    		commandMap.put("EMP_NO", list.get(i).get("EMP_NO").toString());
      		    ErpRequest.requestEmpRetireInfoResult(commandMap);
  		  }
  		
        }
    	
    	commandMap.put("result", "S");
    	return commandMap;
	}

}
