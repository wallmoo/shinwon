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
import com.market.mall.am.site.service.BenefitManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

@Service("benefitManagerService")
public class BenefitManagerServiceImpl implements BenefitManagerService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : selectBenefitManagerListCount
	* 2. ClassName  : BenefitManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템 관리 > 추가혜택 관리 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectBenefitManagerListCount(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("BenefitManager.selectBenefitManagerListCount", commandMap);
	}
	/**
	* <pre>
	* 1. MethodName : selectBenefitManagerList
	* 2. ClassName  : BenefitManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템 관리 > 추가혜택 관리 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 3. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBenefitManagerList(Map<String, Object> commandMap) throws Exception {
		return (List<Map<String, Object>>)defaultDAO.selectList("BenefitManager.selectBenefitManagerList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertBenefitManager
	* 2. ClassName  : BenefitManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 추가혜택관리 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertBenefitManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BNF_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("BNF_MST_REG_ID", admin.getADM_MST_ID());
        
        //추가혜택 관리 등록
        int result = defaultDAO.insert("BenefitManager.insertBenefitManager", commandMap);
        
        commandMap.put("BNF_MST_IDX", StringUtil.getString(commandMap.get("BNF_MST_IDX")));
        
        if(result > 0)
        {
            String jsonList = StringUtil.getString(commandMap.get("jsonData"),"");
            
            ObjectMapper mapper = new ObjectMapper();
            TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
            
            List<Map<String,Object>> benefitDetailList = mapper.readValue(jsonList,typeRef);

            for(int index=0; index < benefitDetailList.size(); index ++){
                String title = StringUtil.getString(benefitDetailList.get(index).get("BNF_DTL_NM"));
                String content = StringUtil.getString(benefitDetailList.get(index).get("BNF_DTL_DESC"));
                String displayUseYN = StringUtil.getString(benefitDetailList.get(index).get("BNF_DTL_DPL_USE_YN"));
                
                commandMap.put("BNF_DTL_NM", title);
                commandMap.put("BNF_DTL_DESC", content);
                commandMap.put("BNF_DTL_DPL_USE_YN", displayUseYN);
                
                //추가혜택 상세 목록 등록
                defaultDAO.insert("BenefitManager.insertDetailBenefitManager", commandMap);
            }
        }
        return result;
	}

	/**
	* <pre>
	* 1. MethodName : selectBenefitManagerInfo
	* 2. ClassName  : BenefitManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템 관리 > 브랜드 관리 상세정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 3. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectBenefitManagerInfo(Map<String, Object> commandMap) throws Exception 
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    returnMap.put("row", defaultDAO.select("BenefitManager.selectBenefitManagerInfo", commandMap));
	    
	    commandMap.put("BNF_MST_IDX", StringUtil.getString(commandMap.get("BNF_MST_IDX")));
	    
	    returnMap.put("detailList",defaultDAO.selectList("BenefitManager.selectBenefitManagerDetail", commandMap));
	    return returnMap;
	}

	/**
	* <pre>
	* 1. MethodName : updateBenefitManager
	* 2. ClassName  : BenefitManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템 관리 > 추가혜택  관리 수정
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 3. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateBenefitManager(HttpServletRequest request, Map<String, Object> commandMap) throws Exception 
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BNF_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("BNF_MST_UPD_ID", admin.getADM_MST_ID());
        
        int result = 0;
        
        // 추가혜택 관리 수정
        result = defaultDAO.update("BenefitManager.updateBenefitManager", commandMap);
        
        if(result > 0)
        {
        	String jsonList = StringUtil.getString(commandMap.get("jsonData"),"");
            
            ObjectMapper mapper = new ObjectMapper();
            TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
            
            defaultDAO.delete("BenefitManager.deleteBenefitDetail", commandMap);
            
            List<Map<String,Object>> benefitDetailList = mapper.readValue(jsonList,typeRef);

            for(int index=0; index < benefitDetailList.size(); index ++){
                String title = StringUtil.getString(benefitDetailList.get(index).get("BNF_DTL_NM"));
                String content = StringUtil.getString(benefitDetailList.get(index).get("BNF_DTL_DESC"));
                String displayUseYN = StringUtil.getString(benefitDetailList.get(index).get("BNF_DTL_DPL_USE_YN"));
                
                commandMap.put("BNF_DTL_NM", title);
                commandMap.put("BNF_DTL_DESC", content);
                commandMap.put("BNF_DTL_DPL_USE_YN", displayUseYN);
                
                //추가혜택 상세 목록 등록
                defaultDAO.insert("BenefitManager.insertDetailBenefitManager", commandMap);
            }
            
        }
        
        return result;
	}
	

}
