package com.market.mall.am.batch.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.batch.service.BatchStoreInfoService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.common.service.CommonService;

import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * @PackageName: com.market.mall.am.batch.service.impl
 * @FileName : updateStoreInfo.java
 * @Date : 2014. 8. 6.
 * @프로그램 설명 : 관리자 > 배치작업 관리 를 처리하는 Service Implement Class
 * @author 이미정
 */
@Service("batchStoreInfoService")
public class BatchStoreInfoServiceImpl implements BatchStoreInfoService{

	@Resource(name = "propertiesService")	protected EgovPropertyService propertiesService;
    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Resource(name = "pcCommonService")	private CommonService pcCommonService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 
     * <pre>
     * 1. MethodName	: updateStoreInfo
     * 2. ClassName		: BatchStoreInfoServiceImpl.java
     * 3. Commnet		: 관리자 > 배치작업 > POS 매장정보 수신
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 6. 오전 9:46:14
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> updateStoreInfo( final Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("result", "F");
    	this.defaultDAO.update("BatchStoreInfo.updateStoreInfo", commandMap);
    	commandMap.put("result", "S");
    	return commandMap;
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: updateStoreLocation
     * 2. ClassName		: BatchStoreInfoServiceImpl.java
     * 3. Commnet		: 관리자 > 배치작업 > 매장 GPS 좌표값 셋팅
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 10. 13. 오전 9:46:42
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> updateStoreLocation( final Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("result", "F");

    	List<Map<String, Object>> cornerList = this.defaultDAO.selectList("BatchStoreInfo.selectNoLocationCornerList", commandMap);

    	for(Map<String,Object> cornerInfo:cornerList)
        {
            Map<String,Object> addressMap = new HashMap<String,Object>();
    		addressMap.put("ADDR1", StringUtil.getString(cornerInfo.get("ADDR1")));
    		
    		// 주소로 GPS좌표값 얻기
    		addressMap = pcCommonService.selectMapLocation(addressMap);
            String point_X = StringUtil.getString(addressMap.get("POINT_X"),"");
            String point_Y = StringUtil.getString(addressMap.get("POINT_Y"),"");

            if (!point_X.equals("") && !point_Y.equals(""))
            {
                Map<String,Object> paramMap = new HashMap<String,Object>();
        		paramMap.put("CORNER_CD", StringUtil.getString(cornerInfo.get("CORNER_CD")));
        		paramMap.put("POINT_X", point_X);
        		paramMap.put("POINT_Y", point_Y);
            	this.defaultDAO.update("BatchStoreInfo.updateStoreLocation", paramMap);
            }
        }

    	commandMap.put("result", "S");

    	return commandMap;
    }
}
