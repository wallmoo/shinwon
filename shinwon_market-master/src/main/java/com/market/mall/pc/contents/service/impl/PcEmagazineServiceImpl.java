package com.market.mall.pc.contents.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.contents.service.PcEmagazineService;

@Service("pcEmagazineService")
public class PcEmagazineServiceImpl implements PcEmagazineService{

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	public List<Map<String, Object>> selectEmagazineManyRead(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEmagazine.selectEmagazineManyRead", commandMap);
	}

	public int selectEmagazineMainCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEmagazine.selectEmagazineMainCount", commandMap);
	}

	public List<Map<String, Object>> selectEmagazineMain(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEmagazine.selectEmagazineMain", commandMap);
	}

	public Map selectEmagazineViewInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcEmagazine.selectEmagazineView", commandMap);
	}

	public List<Map<String, Object>> selectEmagazineProductList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEmagazine.selectEmagazineProductList", commandMap);
	}
	
	public List<Map<String, Object>> selectPcEmagazineQnaList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEmagazine.selectPcEmagazineQnaList", commandMap);
	}
	
	public int selectPcEmagazineQnaCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEmagazine.selectPcEmagazineQnaCount", commandMap);
	}
	
	public String insertEmagazineQna(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int iResult 			= 0;
			
		String strResultMsg 	= "";
		
		commandMap.put("MGZ_QNA_REG_IP", request.getRemoteAddr());
//		commandMap.put("MGZ_QNA_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		
		iResult				= defaultDAO.insert("pcEmagazine.insertEmagazineQna", commandMap);
			
		if(iResult > 0){
			strResultMsg	= "Y";
		}else{
			strResultMsg	= "N";
		}
		
		return strResultMsg;
	}
	public int updateEmagazineReadCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int iResult 			= 0;
		
		iResult				= defaultDAO.insert("pcEmagazine.updateEmagazineReadCount", commandMap);
		 
		return iResult;
	}

	
	
	
	public Map selectEmagazineReqInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount			= defaultDAO.selectCount("pcEmagazine.selectEmagazineReqCount", commandMap);
		commandMap.put("cPage", commandMap.get("reqCPage"));
		Paging paging 			= new Paging(totalCount, commandMap);
		
		List list				= defaultDAO.selectList("pcEmagazine.selectEmagazineReqList", commandMap); 
	
		resultMap.put("reqPaging", 	paging);
		resultMap.put("reqList", 	list);
		
		return resultMap;
	}

	public Map selectEmagazineReviewInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount			= defaultDAO.selectCount("pcEmagazine.selectEmagazineReviewCount", commandMap);
		commandMap.put("cPage", commandMap.get("reviewCPage"));
		Paging paging 			= new Paging(totalCount, commandMap);
		List list				= defaultDAO.selectList("pcEmagazine.selectEmagazineReviewList", commandMap); 
	
		resultMap.put("reviewPaging", 	paging);
		resultMap.put("reviewList", 	list);
		
		return resultMap;
	}

	public String deleteEmagazineQna(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int iResult				= 0;
		String strResultMsg 	= "";
		
//		commandMap.put("MGZ_QNA_UPD_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		commandMap.put("MGZ_QNA_UPD_IP", request.getRemoteAddr());
		
		iResult					= defaultDAO.delete("pcEmagazine.deleteEmagazineQna", commandMap);
		
		if(iResult > 0){
			strResultMsg		= "삭제했습니다.";
		}else{
			strResultMsg		= "삭제에 실패했습니다.";
		}
		
		return strResultMsg;
	}

	public Map selectEmagazineRevView(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcEmagazine.selectEmagazineRevView", commandMap);
	}

	public int selectEmagazineWinListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEmagazine.selectEmagazineWinListCount", commandMap);
	}

	public List<Map<String, Object>> selectEmagazineWinList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEmagazine.selectEmagazineWinList", commandMap);
	}

	public Map selectEmagazineWinView(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcEmagazine.selectEmagazineWinView", commandMap);
	}

	public List selectEmagazineWinerList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEmagazine.selectEmagazineWinerList", commandMap);
	}

	public List<Map<String, Object>> selectEmagazineWinerSearchList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEmagazine.selectEmagazineWinerSearchList", commandMap);
	}

	public Map selectEmagazineMissionInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
//		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
	
		return defaultDAO.select("pcEmagazine.selectEmagazineMissionInfo", commandMap);
	}

	public int selectEmagazineMissionInfoCnt(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEmagazine.selectEmagazineMissionInfoCnt", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectInterestContentsCheckCount
	* 2. ClassName  : PcEmagazineServiceImpl.java
	* 3. Comment    : 프론트 > 장바구니 > 관심컨텐츠 중복 체크
	* 4. 작성자       : khcho
	* 5. 작성일       : 2016. 2. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectInterestContentsCheckCount (HttpServletRequest request , Map<String,Object> commandMap) throws Exception
	{
		User user = SessionsUser.getSessionUser(request);
		
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		
		return defaultDAO.selectCount("pcEmagazine.selectInterestContentsCheckCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertInterestProduct
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 프론트 > 장바구니 > 관심컨텐츠 등록 
	* 4. 작성자       : khcho
	* 5. 작성일       : 2016. 2. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertInterestContents (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		User user = SessionsUser.getSessionUser(request);
		
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CTS_REG_IP", request.getRemoteAddr());
		
		return defaultDAO.insert("pcEmagazine.insertInterestContents", commandMap);
	}

	public int selectEmagazineMyReqCnt(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEmagazine.selectEmagazineMyReqCnt", commandMap);
	}
	
}
