package com.market.mall.pc.event.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.event.service.EventMainService;

@Service("pcEventMainService")
public class EventMainServiceImpl implements EventMainService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	@Autowired 
    private FileUpload fileUpload;
	
	public int selectEventListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEventListCount", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEventList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("pcEventMain.selectEventList", commandMap);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEventBannerList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("pcEventMain.selectEventBannerList", commandMap);
	}
	
	public Map<String, Object> selectEventInfo(Map<String, Object> commandMap) throws Exception {
		
		return defaultDAO.select("pcEventMain.selectEventInfo", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectImageAllList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("pcEventMain.selectEventAllImageList", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEventAllProductList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("pcEventMain.selectEventAllProductList", commandMap);
	}
	
	public int selectEventEntryCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEventEntryCount", commandMap);
	}

	public int insertEventEntry(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.insert("pcEventMain.insertEventEntry", commandMap);
	}

	public List selectEventyDtlList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEventMain.selectEventyDtlList", commandMap);
	}

	public int selectEventSurveyCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEventSurveyCount", commandMap);
	}

	public int insertEventSurvey(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.insert("pcEventMain.insertEventSurvey", commandMap);
	}

	public int selectEventCommentCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEventCommentCount", commandMap);
	}

	public List selectEventCommentList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEventMain.selectEventCommentList", commandMap);
	}

	public int insertEventComment(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.insert("pcEventMain.insertEventComment", commandMap);
	}

	public List selectEventImageList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEventMain.selectEventImageList", commandMap);
	}

	public int selectEventImageListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEventImageListCount", commandMap);
	}

	public int insertEventImage(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		
		result = defaultDAO.insert("pcEventMain.insertEventImage", commandMap);
		
		if(result > 0){
			//PC용 이미지
            List<CommonsMultipartFile> fileList = (List) request.getFiles("multiFile");
            
            if(fileList.size() > 0){
            	int fileSort = 0;
            	
            	commandMap.put("CMM_FLE_TB_NM", "T_EVT_IMG");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_IMG_IDX"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("MEM_MST_MEM_ID"));
                
                for(int i = 0;i < fileList.size();i++){
                	
                    CommonsMultipartFile file = fileList.get(i);
                    
                    if(!file.isEmpty()){
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                    }
                }
            }
            
		}
		return result;
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

	public Map selectEventDetailImg(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcEventMain.selectEventDetailImg", commandMap);
	}

	public int updateEventImgDpl(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.update("pcEventMain.updateEventImgDpl", commandMap);
	}
	
	/** 통합포인트 적립 */
	public int insertTotPoint(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String nameSpace = "Point_TOT";
		return insertPointExecute(nameSpace, request, commandMap);
	}
	
	/** E포인트 적립 */
	public int insertPoint(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String nameSpace = "Point";
		return insertPointExecute(nameSpace, request, commandMap);
	}
	
	public int insertPointExecute(String nameSpace, HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int result = 1;

		String PIT_MST_GBN = (String)commandMap.get("PIT_MST_GBN");
        String PIT_MST_PIT = (String)commandMap.get("PIT_MST_PIT").toString();
        String PIT_MST_BRK_DWN = (String)commandMap.get("PIT_MST_BRK_DWN");
        
		result = defaultDAO.insert(nameSpace + ".insertPoint", commandMap);
		
		if(result > 0){
			
			commandMap.put("MEM_PIT_GBN",PIT_MST_GBN );
	        commandMap.put("MEM_PIT_BRK_DWN",PIT_MST_BRK_DWN );
	        
			if("P".equals(PIT_MST_GBN))commandMap.put("MEM_PIT_PLS", PIT_MST_PIT );
	        if("M".equals(PIT_MST_GBN))commandMap.put("MEM_PIT_MNS", PIT_MST_PIT );
	        
	        int MEM_PIT_TOT_PIT = defaultDAO.selectCount(nameSpace + ".selectPointMemberSum", commandMap);
            
            if("M".equals(PIT_MST_GBN) && MEM_PIT_TOT_PIT <  Integer.parseInt(PIT_MST_PIT)){
            	if("M".equals(PIT_MST_GBN))commandMap.put("MEM_PIT_MNS",MEM_PIT_TOT_PIT );
            }
            
            if("P".equals(PIT_MST_GBN))MEM_PIT_TOT_PIT = MEM_PIT_TOT_PIT + Integer.parseInt(PIT_MST_PIT);
            else MEM_PIT_TOT_PIT = MEM_PIT_TOT_PIT - Integer.parseInt(PIT_MST_PIT);
            
            if(MEM_PIT_TOT_PIT < 0)MEM_PIT_TOT_PIT = 0;
            
            commandMap.put("MEM_PIT_TOT_PIT",MEM_PIT_TOT_PIT );
	        
            result = defaultDAO.insert(nameSpace + ".insertPointMember", commandMap);
            
		}
		return result;
	}

	public int selectEvnetPointCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEvnetPointCount", commandMap);
	}

	public int updateEventRplDpl(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.update("pcEventMain.updateEventRplDpl", commandMap);
	}

	public int selectEvtPointUseYN(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectEvtPointUseYN", commandMap);
	}

}
