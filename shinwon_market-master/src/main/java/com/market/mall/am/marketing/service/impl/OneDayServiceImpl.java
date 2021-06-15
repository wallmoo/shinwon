package com.market.mall.am.marketing.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.marketing.service.OneDayService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.marketing.service.impl
 * @FileName : OneDayServiceImpl.java
 * @Date : 2015. 11. 26.
 * @프로그램 설명 : 관리자 > 프로모션관리 > 원데이특가를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("oneDayService")
public class OneDayServiceImpl implements OneDayService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	/**
     * <pre>
     * 1. MethodName : selectOneDayCount
     * 2. ClassName  : OneDayServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 목록 갯수
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectOneDayCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("OneDay.selectOneDayCount",commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectOneDayList
     * 2. ClassName  : OneDayServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 목록
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOneDayList(Map<String, Object> commandMap) throws Exception 
    {
    	return defaultDAO.selectList("OneDay.selectOneDayList",commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectOneDayInfo
     * 2. ClassName  : OneDayServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 목록
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectOneDayInfo(Map<String, Object> commandMap) throws Exception 
    {
    	return defaultDAO.select("OneDay.selectOneDayInfo",commandMap);
    }

    
    /**
     * <pre>
     * 1. MethodName : insertOneDay
     * 2. ClassName  : OneDayServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 등록 처리  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int insertOneDay(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        
		result = defaultDAO.insert("OneDay.insertOneDay", commandMap);

				
		return result;
	}

    /**
     * <pre>
     * 1. MethodName : updateOneDay
     * 2. ClassName  : OneDayServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 수정 처리  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int updateOneDay(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String startDate = StringUtil.getString(commandMap.get("AD_MST_ST_DT"), "");
        String endDate = StringUtil.getString(commandMap.get("AD_MST_ED_DT"), "");
		commandMap.put("AD_MST_ST_DT", startDate.replaceAll("-", ""));
		commandMap.put("AD_MST_ED_DT", endDate.replaceAll("-", ""));

		result = defaultDAO.update("OneDay.updateOneDay", commandMap);
		 
		return result;
			
		 
		
	}
  
    
}
