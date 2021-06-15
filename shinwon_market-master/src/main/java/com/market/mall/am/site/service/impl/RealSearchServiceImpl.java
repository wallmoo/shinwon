package com.market.mall.am.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.site.service.RealSearchService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.site.service.impl
 * @FileName : RealSearchServiceImpl.java
 * @Date : 2015. 5. 6.
 * @프로그램 설명 : 관리자 > 사이트관리 > 실시간 검색어 관리를 처리하는 Service Implement Class
 * @author DEV_KIMSOYOUNG
 */
@Service("realSearchService")
public class RealSearchServiceImpl implements RealSearchService {
	
    
	@Resource(name = "defaultDAO")
	private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : selectRealSearchListCount
	* 2. ClassName : RealSearchServiceImpl.java
	* 3. Comment : 관리자 > 사이트 관리 > 실시간 검색어 관리 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectRealSearchListCount(Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("RealSearch.selectRealSearchListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectRealSearchList
	* 2. ClassName : RealSearchServiceImpl.java
	* 3. Comment : 관리자 > 사이트 관리 > 실시간 검색어 관리 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectRealSearchList(Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("RealSearch.selectRealSearchList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertRealSearch
	* 2. ClassName : RealSearchServiceImpl.java
	* 3. Comment : 관리자 > 사이트 관리 > 실시간 검색어 관리 등록/수정
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 6.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertRealSearch(HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		int result = 0;
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("REL_SCH_UPD_IP", request.getRemoteAddr());
        commandMap.put("REL_SCH_UPD_ID", admin.getADM_MST_ID());
        
        if(!"".equals(StringUtil.getString(commandMap.get("REL_SCH_BRAND_CD"),"")))
        {
        	// 브랜드 별 전체 삭제
            defaultDAO.delete("RealSearch.deleteRealSearch", commandMap);
        }
            
    	String[] realSearchIdxs = request.getParameterValues("REL_SCH_IDX");
		String[] realSearchTxts = request.getParameterValues("REL_SCH_TXT");
		
		for(int i=0; i< realSearchIdxs.length; i++)
		{
			if(realSearchIdxs[i] != "")
			{
				commandMap.put("REL_SCH_IDX", realSearchIdxs[i]);
				commandMap.put("REL_SCH_TXT", realSearchTxts[i]);
				
				// 브랜드 별 전체 등록
		        result = defaultDAO.insert("RealSearch.insertRealSearch", commandMap);
			}
		}
		
        return result;
	}
	
}
