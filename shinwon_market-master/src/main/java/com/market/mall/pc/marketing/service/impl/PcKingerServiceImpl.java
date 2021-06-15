package com.market.mall.pc.marketing.service.impl;

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

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Paging;
import com.market.mall.pc.marketing.service.PcKingerService;

@Service("pcKingerService")
public class PcKingerServiceImpl implements PcKingerService{

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Autowired 
    private FileUpload fileUpload;
	
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

	public String insertKigerReq(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int iResult 			= 0;
			
		String strResultMsg 	= "";
		
		commandMap.put("EXP_ETR_REG_IP", request.getRemoteAddr());
//		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		
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

	public Map selectKingerReqInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount			= defaultDAO.selectCount("pcKinger.selectKingerReqCount", commandMap);
		commandMap.put("cPage", commandMap.get("reqCPage"));
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
		commandMap.put("cPage", commandMap.get("reviewCPage"));
		Paging paging 			= new Paging(totalCount, commandMap);
		List list				= defaultDAO.selectList("pcKinger.selectKingerReviewList", commandMap); 
	
		resultMap.put("reviewPaging", 	paging);
		resultMap.put("reviewList", 	list);
		
		return resultMap;
	}

	public String deleteKigerReq(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int iResult				= 0;
		String strResultMsg 	= "";
		
//		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		
		iResult					= defaultDAO.delete("pcKinger.deleteKigerReq", commandMap);
		
		if(iResult > 0){
			strResultMsg		= "삭제했습니다.";
		}else{
			strResultMsg		= "삭제에 실패했습니다.";
		}
		
		return strResultMsg;
	}

	public Map selectKingerRevView(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcKinger.selectKingerRevView", commandMap);
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
//		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		
		return defaultDAO.select("pcKinger.selectKingerMissionInfo", commandMap);
	}

	public int selectKingerMissionInfoCnt(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcKinger.selectKingerMissionInfoCnt", commandMap);
	}

	public int updateKingerConsntSend(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
//		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		
		return defaultDAO.update("pcKinger.updateKingerConsntSend", commandMap);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public int insertKingerReview(MultipartHttpServletRequest request, Map<String, Object> commandMap)
			throws Exception {
		// TODO Auto-generated method stub
		 
		int result = 0;
		 
//		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		commandMap.put("MEM_MST_REG_IP", request.getRemoteAddr()); 
		
		result = defaultDAO.insert("pcKinger.insertKingerReview", commandMap);
		
		if(result > 0){
			//PC용 이미지
            List<CommonsMultipartFile> fileList = (List) request.getFiles("multiFile");
            
            if(fileList.size() > 0){
            	int fileSort = 0;
            	
            	commandMap.put("CMM_FLE_TB_NM", "T_EXP_REV");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EXP_REV_IDX"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                
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

	public int selectKingerMyReqCnt(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcKinger.selectKingerMyRevCnt", commandMap);
	}

	public int selectKingerMyRevCnt(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcKinger.selectKingerMyReqCnt", commandMap);
	}

	public int updateKingerWinVist(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.update("pcKinger.updateKingerWinVist", commandMap);
	}

	public int updateKingerReview(MultipartHttpServletRequest request, Map<String, Object> commandMap)
			throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		 
		String CMM_FLE_SAVE_PATH = "";
		
//		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		commandMap.put("MEM_MST_REG_IP", request.getRemoteAddr());
		
		result = defaultDAO.update("pcKinger.updateKingerReview", commandMap);
		
		if(result > 0){
			
			//기존 파일 삭제
        	String[] arrCMM_FLE_IDX = request.getParameterValues("inp_file_del");
        	
        	//물리적 파일 삭제를 위한 tempList
            List<String> tempRemoveList = new ArrayList<String>();
            
//            System.out.println("::::::::>" + arrCMM_FLE_IDX);
            if(arrCMM_FLE_IDX != null)
            {
            	for(int i=0;i<arrCMM_FLE_IDX.length;i++)
            	{
            		System.out.println(":::::>" + arrCMM_FLE_IDX[i]);
            		//파일 상세 정보
            		commandMap.put("CMM_FLE_IDX", arrCMM_FLE_IDX[i]);
            		Map<String, Object> row = (Map<String, Object>) defaultDAO.select("Common.selectCommonFileInfo", commandMap);
            		CMM_FLE_SAVE_PATH = StringUtil.getString(row.get("CMM_FLE_SAVE_PATH"), "");
            		
            		 if(row != null && !"".equals(CMM_FLE_SAVE_PATH))
                     {
                         commandMap.put("CMM_FLE_USE_YN", "N");
                         
                         // 파일 DB 수정
                         defaultDAO.update("Common.deleteCommonFile", commandMap);
                         
                         // 물리적 삭제할 파일 경로에 추가
                         tempRemoveList.add(CMM_FLE_SAVE_PATH);
                     }
            	}
            }
        
			//PC용 이미지
            List<CommonsMultipartFile> fileList = (List) request.getFiles("multiFile");
            
            if(fileList.size() > 0){
            	int fileSort = 0;
            	
            	commandMap.put("CMM_FLE_TB_NM", "T_EXP_REV");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EXP_REV_IDX"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                
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
}
