package com.market.mall.am.marketing.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.epasscni.util.StringUtil;
import com.market.mall.am.marketing.service.FundingService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.marketing.service.impl
 * @FileName : FundingServiceImpl.java
 * @Date : 2020. 06. 10.
 * @프로그램 설명 : 관리자 > 프로모션관리 > 펀딩를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("fundingService")
public class FundingServiceImpl implements FundingService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	/**
     * <pre>
     * 1. MethodName : selectFundingCount
     * 2. ClassName  : FundingServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 목록 갯수
     * 4. 작성자       : khcho
     * 5. 작성일       : 2020. 06. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectFundingCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Funding.selectFundingCount",commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectFundingList
     * 2. ClassName  : FundingServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 목록
     * 4. 작성자       : khcho
     * 5. 작성일       : 2020. 06. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectFundingList(Map<String, Object> commandMap) throws Exception 
    {
    	return defaultDAO.selectList("Funding.selectFundingList",commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectFundingInfo
     * 2. ClassName  : FundingServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 목록
     * 4. 작성자       : khcho
     * 5. 작성일       : 2020. 06. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectFundingInfo(Map<String, Object> commandMap) throws Exception 
    {
    	return defaultDAO.select("Funding.selectFundingInfo",commandMap);
    }

    
    /**
     * <pre>
     * 1. MethodName : insertFunding
     * 2. ClassName  : FundingServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 등록 처리  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2020. 06. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int insertFunding(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
		result = defaultDAO.insert("Funding.insertFunding", commandMap);

				
		return result;
	}

    /**
     * <pre>
     * 1. MethodName : updateFunding
     * 2. ClassName  : FundingServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 수정 처리  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2020. 06. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int updateFunding(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String startDate = StringUtil.getString(commandMap.get("AD_MST_ST_DT"), "");
        String endDate = StringUtil.getString(commandMap.get("AD_MST_ED_DT"), "");
		commandMap.put("AD_MST_ST_DT", startDate.replaceAll("-", ""));
		commandMap.put("AD_MST_ED_DT", endDate.replaceAll("-", ""));

		result = defaultDAO.update("Funding.updateFunding", commandMap);
		 
		return result;
	}
  
	@Override
	public int updateFundingList(Map<String, Object> commandMap) throws Exception {
    	return defaultDAO.update("Funding.updateFundingList", commandMap);
	}    
}
