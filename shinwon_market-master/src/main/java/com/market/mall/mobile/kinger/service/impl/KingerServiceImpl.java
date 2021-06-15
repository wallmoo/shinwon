package com.market.mall.mobile.kinger.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.mobile.kinger.service.KingerService;
import com.market.mall.model.Paging;

@Service("mKingerService")
public class KingerServiceImpl implements KingerService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	public Map getPcKingerIngInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcKinger.selectKingerIngInfo", commandMap);
	}

	public int selectKingerListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcKinger.selectKingerListCount", commandMap);
	}

	public List selectKingerList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcKinger.selectKingerList", commandMap);
	}

	public Map selectKingerViewInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcKinger.selectKingerView", commandMap);
	}

	public Map selectKingerReqInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount			= defaultDAO.selectCount("pcKinger.selectKingerReqCount", commandMap);
		commandMap.put("totalCount", totalCount);
		Paging paging 			= new Paging(totalCount, commandMap);
		
		List list				= defaultDAO.selectList("pcKinger.selectKingerReqList", commandMap); 
	
		resultMap.put("reqPaging", 	paging);
		resultMap.put("reqList", 	list);
		
		return resultMap;
	}

	public Map selectKingerReviewInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount			= defaultDAO.selectCount("pcKinger.selectKingerReviewCount", commandMap);
		commandMap.put("totalCount", totalCount);
		Paging paging 			= new Paging(totalCount, commandMap);
		List list				= defaultDAO.selectList("pcKinger.selectKingerReviewList", commandMap); 
	
		resultMap.put("reviewPaging", 	paging);
		resultMap.put("reviewList", 	list);
		
		return resultMap;
	}
	
	public String insertKigerReq(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int iResult 			= 0;
			
		String strResultMsg 	= "";
		
		commandMap.put("EXP_ETR_REG_IP", request.getRemoteAddr());
		// 신청 여부 체크하기
		iResult					= defaultDAO.selectCount("pcKinger.selectKingerReqCheck", commandMap);
		
		if(iResult > 0){
			strResultMsg		= "이미 신청하셨습니다.";
		}else{
			iResult				= defaultDAO.insert("pcKinger.insertKigerReq", commandMap);
			
			if(iResult > 0){
				strResultMsg	= "신청되었습니다.";
			}else{
				strResultMsg	= "등록이 실패했습니다/n담당자께 문의하세요.";
			}
		}
		return strResultMsg;
	}
	
	public String deleteKigerReq(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int iResult				= 0;
		String strResultMsg 	= "";
		
		iResult					= defaultDAO.delete("pcKinger.deleteKigerReq", commandMap);
		
		if(iResult > 0){
			strResultMsg		= "삭제했습니다.";
		}else{
			strResultMsg		= "삭제에 실패했습니다.";
		}
		
		return strResultMsg;
	}

	public String deleteKigerReview(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int iResult				= 0;
		String strResultMsg 	= "";
		
		iResult					= defaultDAO.delete("pcKinger.deleteKigerReview", commandMap);
		
		if(iResult > 0){
			strResultMsg		= "삭제했습니다.";
		}else{
			strResultMsg		= "삭제에 실패했습니다.";
		}
		
		return strResultMsg;
	}
	
	public int selectKingerWinListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcKinger.selectKingerWinListCount", commandMap);
	}

	public List<Map<String, Object>> selectKingerWinList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcKinger.selectKingerWinList", commandMap);
	}

	public Map selectKingerWinView(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcKinger.selectKingerWinView", commandMap);
	}

	public List selectKingerWinerList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcKinger.selectKingerWinerList", commandMap);
	}

	public List<Map<String, Object>> selectKingerWinerSearchList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcKinger.selectKingerWinerSearchList", commandMap);
	}

	public Map selectKingerMissionInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcKinger.selectKingerMissionInfo", commandMap);
	}

	public int selectKingerMissionInfoCnt(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcKinger.selectKingerMissionInfoCnt", commandMap);
	}

	public int updateKingerConsntSend(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.update("pcKinger.updateKingerConsntSend", commandMap);
	}

	public int selectKingerMyRevCnt(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcKinger.selectKingerMyReqCnt", commandMap);
	}

	public int updateKingerWinVist(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.update("pcKinger.updateKingerWinVist", commandMap);
	}

	public int selectKingerMyReqCnt(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcKinger.selectKingerMyRevCnt", commandMap);
	}

	public Map selectKingerRevView(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcKinger.selectKingerRevView", commandMap);
	}
	
}
