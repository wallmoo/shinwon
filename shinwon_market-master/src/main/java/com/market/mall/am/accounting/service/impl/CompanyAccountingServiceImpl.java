package com.market.mall.am.accounting.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.FileUpload;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.accounting.service.CompanyAccountingService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.accounting.service.impl
 * @FileName : ShopInqServiceImpl.java
 * @Date : 2016. 04. 07.
 * @프로그램 설명 : 관리자 > 업체정산 > 정산목록를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("companyAccountingService")
public class CompanyAccountingServiceImpl implements CompanyAccountingService {
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCompanyAccountingList(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("Accounting.selectCompanyAccountingList",commandMap);
	}
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectVdrMstList(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("Accounting.selectVdrMstList",commandMap);
	}
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectAdmMstList(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("Accounting.selectAdmMstList",commandMap);
	}
	
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectJungsanYearList(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("Accounting.selectJungsanYearList",commandMap);
	}
	
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectJungsanMonthList(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("Accounting.selectJungsanMonthList",commandMap);
	}
	
	public int insertAccountingRequest(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        //commandMap.put("ACC_REQ_IP", request.getRemoteAddr());
        commandMap.put("ACC_REQ_ID", admin.getADM_MST_ID());
		
		String[] vdrMstIdxs = request.getParameterValues("vdrMstIdxs[]");
		String[] accMonths = request.getParameterValues("accMonths[]");
		
		int result = 0;
		
		for(int i=0; i< vdrMstIdxs.length; i++)
		{
			String vdrMstIdx = vdrMstIdxs[i];
			String accYear = accMonths[i].substring(0,4);
			String accMonth = accMonths[i].substring(4,6);
			String ACC_MONTH = accMonths[i];
			
			commandMap.put("ACC_VDR_MST_IDX", vdrMstIdx);
			commandMap.put("VDR_MST_IDX", vdrMstIdx);
			commandMap.put("ACC_REQ_YEAR", accYear);
			commandMap.put("ACC_REQ_MON", accMonth);
			commandMap.put("ACC_REQ_STATUS", "R");
			commandMap.put("ACC_REQ_MON", accMonth);
			commandMap.put("ACC_MONTH", ACC_MONTH);
			
			int reqCnt = defaultDAO.selectCount("Accounting.selectAccReqCnt",commandMap);
			
			if(reqCnt < 1)
			{
				result = defaultDAO.insert("Accounting.insertAccountingRequest", commandMap);
				if(result >0)defaultDAO.insert("Accounting.insertAccountingOrder", commandMap);
			}
				
			//String 	ACC_REQ_IDX = (Integer)commandMap.get("ACC_REQ_IDX")+"";
			 
		}
		
		return result;
		
	}
	
	public int updateAccountingRequestCnfm(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        //commandMap.put("ACC_REQ_IP", request.getRemoteAddr());
        commandMap.put("ACC_REQ_CNF_ID", admin.getADM_MST_ID());
		
		String[] vdrMstIdxs = request.getParameterValues("vdrMstIdxs[]");
		String[] accMonths = request.getParameterValues("accMonths[]");
		
		int result = 0;
		
		for(int i=0; i< vdrMstIdxs.length; i++)
		{
			String vdrMstIdx = vdrMstIdxs[i];
			String accYear = accMonths[i].substring(0,4);
			String accMonth = accMonths[i].substring(4,6);
			String ACC_MONTH = accMonths[i];
			
			commandMap.put("ACC_VDR_MST_IDX", vdrMstIdx);
			commandMap.put("VDR_MST_IDX", vdrMstIdx);
			commandMap.put("ACC_REQ_YEAR", accYear);
			commandMap.put("ACC_REQ_MON", accMonth);
			commandMap.put("ACC_REQ_STATUS", "Y");
			commandMap.put("ACC_REQ_MON", accMonth);
			commandMap.put("ACC_MONTH", ACC_MONTH);
			
			int reqCnt = defaultDAO.selectCount("Accounting.selectAccReqCnt",commandMap);
			
			if(reqCnt > 0)
			{
				result = defaultDAO.update("Accounting.updateAccountingRequestCnfm", commandMap);
			}
				
			//String 	ACC_REQ_IDX = (Integer)commandMap.get("ACC_REQ_IDX")+"";
			 
		}
		
		return result;
		
	}
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCompanyAccountingDetail(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("Accounting.selectCompanyAccountingDetail",commandMap);
	}
	 
}
