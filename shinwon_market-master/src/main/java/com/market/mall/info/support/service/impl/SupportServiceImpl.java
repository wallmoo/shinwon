package com.market.mall.info.support.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.info.support.service.SupportService;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;

@Service("supportService")
public class SupportServiceImpl implements SupportService{

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	public int selectNoticeListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("Support.selectNoticeListCount", commandMap);
	}

	public List<Map<String, Object>> selectNoticeList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("Support.selectNoticeList", commandMap);
	}
	
	public List<Map<String, Object>> selectNoticeListMain(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("Support.selectNoticeListMain", commandMap);
	}
 
	public int updateNoticeReadCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int iResult 			= 0;
		
		iResult				= defaultDAO.insert("Support.updateNoticeReadCount", commandMap);
		 
		return iResult;
	}

	public Map selectNoticeInfo(Map<String, Object> commandMap) throws Exception {
		Map<String, Object> info = new HashMap<String, Object>();
	 	
		Map<String, Object> returnMap = new HashMap<String, Object>();
	    commandMap.put("CMM_FLE_TB_NM", "T_DRT_NTS");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("DRT_NTS_IDX"), ""));
	    returnMap.put("fileList", defaultDAO.selectList("Support.selectCommonFileList", commandMap));
	    returnMap.put("row", defaultDAO.select("Support.selectNoticeInfo", commandMap));
        return returnMap;
		
	}
	
	public int selectErpEmpListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("Support.selectErpEmpListCount", commandMap);
	}

	public List<Map<String, Object>> selectErpEmpList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("Support.selectErpEmpList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectCode
	* 2. ClassName  : CommonServiceImpl.java
	* 3. Comment    : 공통코드 조회 
	* 4. 작성자       : khcho
	* 5. 작성일       : 2016. 2. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCode (String code) throws Exception
	{
	    return (List<Map<String, Object>>)defaultDAO.selectList("Branch.selectCodeList", Code.class.getDeclaredField(code).get(Code.class).toString());
	}
	
	public Map<String, Object> selectPraiseMailInfo(Map<String, Object> commandMap) throws Exception {
		
	    return defaultDAO.select("Support.selectPraiseMailInfo", commandMap);
        
	}
	/**
	* <pre>
	* 1. MethodName : insertPraise
	* 2. ClassName  : SupportServiceImpl.java
	* 3. Comment    : 인포사이트 > 칭찬하기 등록 
	* 4. 작성자       : khcho
	* 5. 작성일       : 2016. 02. 26.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertPraise (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
	{
	    Admin admin = SessionsAdmin.getSessionAdmin(request);
	    commandMap.put("EMP_THK_REG_IP", request.getRemoteAddr());
	    int result = defaultDAO.insert("Support.insertPraise", commandMap);
	    if(result > 0)
	    {
	    	Map<String, Object> crmMap = new HashMap<String, Object>();
	    	
	    	//String IN_ADMIN_ID = "101845";//테스트 ID 오픈시 변경해야함
	    	String IN_ADMIN_ID = "";//운영
	    	String EMP_THK_BRC_CD = StringUtil.getString(commandMap.get("EMP_THK_BRC_CD"),"");
    		String EMP_THK_CHG_SBN = StringUtil.getString(commandMap.get("EMP_THK_CHG_SBN"),"");
    		String EMP_THK_CTR_CD = StringUtil.getString(commandMap.get("EMP_THK_CTR_CD"),"");
    		String EMP_THK_DRV_SBN = StringUtil.getString(commandMap.get("EMP_THK_DRV_SBN"),"");
    		
    		if("0".equals(EMP_THK_BRC_CD))EMP_THK_BRC_CD="";
    		if("0".equals(EMP_THK_CHG_SBN))EMP_THK_CHG_SBN="";
    		if("0".equals(EMP_THK_CTR_CD))EMP_THK_CTR_CD="";
    		if("0".equals(EMP_THK_DRV_SBN))EMP_THK_DRV_SBN="";
	    	
    		
	    	
	    	crmMap.put("BBS_GB","0006");//고객만족/칭찬접수
    		crmMap.put("ARTL_SNO", commandMap.get("EMP_THK_IDX"));
    		crmMap.put("MEM_NM", commandMap.get("EMP_THK_CST_NM"));
    		crmMap.put("TEL1", commandMap.get("EMP_THK_TEL1"));
    		crmMap.put("TEL2", commandMap.get("EMP_THK_TEL2"));
    		crmMap.put("TEL3", commandMap.get("EMP_THK_TEL3"));
    		crmMap.put("HTEL1", commandMap.get("EMP_THK_HP1"));
    		crmMap.put("HTEL2", commandMap.get("EMP_THK_HP2"));
    		crmMap.put("HTEL3", commandMap.get("EMP_THK_HP3"));
    		crmMap.put("EMAIL", commandMap.get("EMP_THK_MAIL"));
    		crmMap.put("SHOP_CD", commandMap.get("EMP_THK_BRC_CD"));
    		crmMap.put("BBS_YMD", commandMap.get("EMP_THK_VST_DT"));
    		crmMap.put("PRD_NM", "");//제품번호-칭찬하기는 없음
    		crmMap.put("TITLE", commandMap.get("EMP_THK_TITLE"));
    		crmMap.put("NOTE", commandMap.get("EMP_THK_CONTENTS"));
    		crmMap.put("AN_NOTE", "");//답변내용 - 답변은 하지 않음
    		crmMap.put("STATUS", "N");//답변여무 - 하지않은상태로 넘김 N
    		crmMap.put("IN_ADMIN_ID", IN_ADMIN_ID);
    		crmMap.put("P_BRANCH", EMP_THK_BRC_CD);
    		crmMap.put("P_PSAWON", EMP_THK_CHG_SBN);
    		crmMap.put("P_CENTER", "");
    		crmMap.put("P_VSAWON", "");
    		crmMap.put("REGUSER", "SGSPLUS");
    		
    		//물류센터코드가 있는 경우 한번 더 보냄
    		if(!"".equals(EMP_THK_CTR_CD))
    		{
    			crmMap.put("P_BRANCH", "");
        		crmMap.put("P_PSAWON", "");
    			crmMap.put("P_CENTER", EMP_THK_CTR_CD);
        		crmMap.put("P_VSAWON", EMP_THK_DRV_SBN);
    		}
    			
    		
	    } 
	    return result;
	}
	
	public String selectPraiseRegCheck (HttpServletRequest request) throws Exception
	{
	    String ip = request.getRemoteAddr();
	    return defaultDAO.selectStr("Support.selectPraiseRegCheck", ip);
	}
	
	public List<Map<String, Object>> selectCounselBranchList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("Support.selectCounselBranchList", commandMap);
	}
	/**
	* <pre>
	* 1. MethodName : insertCounsel
	* 2. ClassName  : SupportServiceImpl.java
	* 3. Comment    : 인포사이트 > 상담하기 등록 
	* 4. 작성자       : khcho
	* 5. 작성일       : 2016. 02. 26.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertCounsel (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
	{
	    commandMap.put("MEM_CST_REG_IP", request.getRemoteAddr());
	    int result = defaultDAO.insert("Support.insertCounsel", commandMap); 
	    
	    if(result > 0)
	    {
	    	Map<String, Object> crmMap = new HashMap<String, Object>();
	    	
	    	//String IN_ADMIN_ID = "101845";//테스트 ID 오픈시 변경해야함
	    	String IN_ADMIN_ID = "";//운영
	    	
	    	crmMap.put("BBS_GB",commandMap.get("MEM_CST_TYPE"));//고객만족/칭찬접수
    		crmMap.put("ARTL_SNO", commandMap.get("MEM_CST_IDX"));
    		crmMap.put("MEM_NM", commandMap.get("MEM_CST_NM"));
    		crmMap.put("TEL1", commandMap.get("MEM_CST_TEL1"));
    		crmMap.put("TEL2", commandMap.get("MEM_CST_TEL2"));
    		crmMap.put("TEL3", commandMap.get("MEM_CST_TEL3"));
    		crmMap.put("HTEL1", commandMap.get("MEM_CST_HP1"));
    		crmMap.put("HTEL2", commandMap.get("MEM_CST_HP2"));
    		crmMap.put("HTEL3", commandMap.get("MEM_CST_HP3"));
    		crmMap.put("EMAIL", commandMap.get("MEM_CST_MAIL"));
    		crmMap.put("SHOP_CD", commandMap.get("MEM_CST_SHP_CD"));
    		crmMap.put("BBS_YMD", commandMap.get("MEM_CST_VST_DT"));
    		crmMap.put("PRD_NM", commandMap.get("MEM_CST_MDL_NO"));//제품번호
    		crmMap.put("TITLE", commandMap.get("MEM_CST_TITLE"));
    		crmMap.put("NOTE", commandMap.get("MEM_CST_CONTENTS"));
    		crmMap.put("AN_NOTE", "");//답변내용 - 답변은 하지 않음
    		crmMap.put("STATUS", "N");//답변여무 - 하지않은상태로 넘김 N
    		crmMap.put("IN_ADMIN_ID", IN_ADMIN_ID);
    		crmMap.put("P_BRANCH", ""); //칭찬지점코드
    		crmMap.put("P_PSAWON", "");//칭찬판매사원코드
    		crmMap.put("P_CENTER", "");//칭찬물류코드
    		crmMap.put("P_VSAWON", "");//칭찬물류사원코드
    		crmMap.put("REGUSER", "SGSPLUS");
	    } 
	    
	    return result;
	    
	    
	}
	public int selectFaqListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("Support.selectFaqListCount", commandMap);
	}

	public List<Map<String, Object>> selectFaqList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("Support.selectFaqList", commandMap);
	}
}
