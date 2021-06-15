package com.market.mall.mobile.contents.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.mobile.contents.service.EmagazineService;
import com.market.mall.model.Paging;

@Service("mobileEmagazineService")
public class EmagazineServiceImpl implements EmagazineService{

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	public List<Map<String, Object>> selectEmagazineManyRead(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEmagazine.selectEmagazineManyRead", commandMap);
	}
	
	public String selectEmagazineCtgName(String MGZ_MST_CTG) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectStr("pcEmagazine.selectEmagazineCtgName", MGZ_MST_CTG);
	}
	
	/**
     * <pre>
     * 1. MethodName : selectCodeByCode
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 공통코드 조회 (코드받아서)
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 10. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectCodeByCode (String code) throws Exception
     {
         return (List<Map<String, Object>>)defaultDAO.selectList("Common.selectCodeList", code);
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
	public List<Map<String, Object>> selectMobileEmagazineProductList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEmagazine.selectMobileEmagazineProductList", commandMap);
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
}
