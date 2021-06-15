package com.market.mall.mobile.event.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.mobile.event.service.EventService;

@Service("mEventService")
public class EventServiceImpl implements EventService{

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	public int selectEventListCount(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEventListCount", commandMap);
	}

	public List selectEventList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEventMain.selectEventList", commandMap);
	}

	public Map selectEventInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcEventMain.selectEventInfo", commandMap);
	}

	public int selectEventEntryCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEventEntryCount", commandMap);
	}

	public int selectEventSurveyCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEventSurveyCount", commandMap);
	}

	public int selectEventCommentCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEventCommentCount", commandMap);
	}

	public int selectEventImageListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEventImageListCount", commandMap);
	}

	public int insertEventEntry(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.insert("pcEventMain.insertEventEntry", commandMap);
	}

	public int insertEventSurvey(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.insert("pcEventMain.insertEventSurvey", commandMap);
	}

	public int insertEventComment(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.insert("pcEventMain.insertEventComment", commandMap);
	}

	public List selectEventCommentList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEventMain.selectEventCommentList", commandMap);
	}

	public List selectEventyDtlList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEventMain.selectEventyDtlList", commandMap);
	}

	public List selectEventImageList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEventMain.selectEventImageList", commandMap);
	}

	public int deleteEventComment(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.delete("pcEventMain.deleteEventComment", commandMap);
	}

	public int deleteEventImage(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.delete("pcEventMain.deleteEventImage", commandMap);
	}

	public int selectEventImageRcmCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEventImageRcmCount", commandMap);
	}

	public int insertEventImageRcm(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.insert("pcEventMain.insertEventImageRcm", commandMap);
	}

	public int updateEventImageRemCnt(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.update("pcEventMain.updateEventImageRemCnt", commandMap);
	}

	public Map selectEventImageInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcEventMain.selectEventImageInfo", commandMap);
	}

	public int selectEvnetPointCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEvnetPointCount", commandMap);
	}

	public int insertPoint(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int result = 1;

		String PIT_MST_GBN = (String)commandMap.get("PIT_MST_GBN");
        String PIT_MST_PIT = (String)commandMap.get("PIT_MST_PIT").toString();
        String PIT_MST_BRK_DWN = (String)commandMap.get("PIT_MST_BRK_DWN");
        
		result = defaultDAO.insert("Point.insertPoint", commandMap);
		
		if(result > 0){
			
			commandMap.put("MEM_PIT_GBN",PIT_MST_GBN );
	        commandMap.put("MEM_PIT_BRK_DWN",PIT_MST_BRK_DWN );
	        
			if("P".equals(PIT_MST_GBN))commandMap.put("MEM_PIT_PLS", PIT_MST_PIT );
	        if("M".equals(PIT_MST_GBN))commandMap.put("MEM_PIT_MNS", PIT_MST_PIT );
	        
	        int MEM_PIT_TOT_PIT = defaultDAO.selectCount("Point.selectPointMemberSum", commandMap);
            
            if("M".equals(PIT_MST_GBN) && MEM_PIT_TOT_PIT <  Integer.parseInt(PIT_MST_PIT)){
            	if("M".equals(PIT_MST_GBN))commandMap.put("MEM_PIT_MNS",MEM_PIT_TOT_PIT );
            }
            
            if("P".equals(PIT_MST_GBN))MEM_PIT_TOT_PIT = MEM_PIT_TOT_PIT + Integer.parseInt(PIT_MST_PIT);
            else MEM_PIT_TOT_PIT = MEM_PIT_TOT_PIT - Integer.parseInt(PIT_MST_PIT);
            
            if(MEM_PIT_TOT_PIT < 0)MEM_PIT_TOT_PIT = 0;
            
            commandMap.put("MEM_PIT_TOT_PIT",MEM_PIT_TOT_PIT );
	        
            result = defaultDAO.insert("Point.insertPointMember", commandMap);
            
		}
		return result;
	}

	public int selectEvtPointUseYN(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEvtPointUseYN", commandMap);
	}

}
