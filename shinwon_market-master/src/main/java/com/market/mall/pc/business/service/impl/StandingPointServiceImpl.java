package com.market.mall.pc.business.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsBusiness;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.pc.business.service.StandingPointService;
import com.market.mall.pc.common.service.CommonService;

/**
 * @PackageName: com.market.mall.pc.business.service.impl
 * @FileName : StandingPointServiceImpl.java
 * @Date : 2016. 2. 12.
 * @프로그램 설명 :  프론트 > 입점신청 관련 처리하는 Service Implement Class
 * @author : DEV_LEEKWANGWOON
 */
@Service("pcStandingPointService")
public class StandingPointServiceImpl implements StandingPointService {
	
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	
	@Resource(name="pcCommonService") private CommonService pcCommonService;	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FileUpload fileUpload;
		
	
	/**
	 * <pre>
	 * 1. MethodName : insertStandingPointCounsel
	 * 2. ClassName  : StandingPointServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 등록처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 12.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertStandingPointCounsel(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception{
		
		int result = 0;
		String CMM_FLE_TB_TYPE = "";
		String fileType = "counsel1";
		
		commandMap.put("VDR_CST_REG_IP", request.getRemoteAddr());
		
		result = defaultDAO.insert("PcStandingPoint.insertStandingPointCounsel", commandMap);
		//System.out.println("result >> " + result);
		if(result > 0)
		{
		    CommonsMultipartFile file = (CommonsMultipartFile) request.getFile("file");
		    
		    if(file != null && !file.isEmpty()){
		        int fileSort = 0;
		      //commandMap.put("CMM_FLE_REG_ID", commandMap.get("VDR_CST_REG_ID"));
		        commandMap.put("CMM_FLE_TB_NM", "T_VDR_CST");     // 테이블 이름
		        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("VDR_CST_IDX"), ""));
                commandMap.put("CMM_FLE_SORT", ++fileSort);
                commandMap.put("fileSizeYn","Y");
              
              //입점문의 첨부파일 등록
              result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "board", fileType, "Y"));
		    }
		    
        }		
		
		return result;
		
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectStandingPointCounselListCount
	 * 2. ClassName  : StandingPointServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 리스트 카운트 
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 15.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectStandingPointCounselListCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcStandingPoint.selectStandingPointCounselListCount",commandMap);
	}	
	
	
	/**
	 * <pre>
	 * 1. MethodName : selectStandingPointCounselList
	 * 2. ClassName  : StandingPointServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 리스트
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 15.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectStandingPointCounselList(Map<String, Object> commandMap) throws Exception {
	    return this.defaultDAO.selectList("PcStandingPoint.selectStandingPointCounselList",commandMap);	    
	}	
	
	/**
	 * <pre>
	 * 1. MethodName : selectStandingPointCounselView
	 * 2. ClassName  : StandingPointServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 상세정보 가져오기
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 15.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectStandingPointCounselView (Map<String,Object> commandMap) throws Exception
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		commandMap.put("CMM_FLE_TB_NM", "T_VDR_CST");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("VDR_CST_IDX"), ""));
	    
	    returnMap.put("fileList", defaultDAO.selectList("PcCommon.selectCommonFileList", commandMap));
	    
	    //  입점상당 상세정보
	    Map<String, Object> row = defaultDAO.select("PcStandingPoint.selectStandingPointCounselView", commandMap);
	    
		returnMap.put("row", row);
		
	    return returnMap;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : deleteStandingPointCounsel
	 * 2. ClassName  : StandingPointServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 삭제처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public int deleteStandingPointCounsel (Map<String, Object> commandMap) throws Exception {

		int result = defaultDAO.delete("PcStandingPoint.deleteStandingPointCounsel", commandMap);
		
		//첨부파일 삭제
		if(result > 0){
			Map<String, Object> removeMap = new HashMap<String, Object>();
			removeMap.put("CMM_FLE_TB_NM", "T_VDR_CST"); 
			removeMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("VDR_CST_IDX"),""));
			List<Map<String, Object>> fileList = defaultDAO.selectList("Common.selectCommonFileList", removeMap); 
	        
	        for(int i=0; i < fileList.size(); i++){
	        	String CMM_FLE_SAVE_PATH = StringUtil.getString(fileList.get(i).get("CMM_FLE_SAVE_PATH"), "");
	        	String CMM_FLE_IDX = StringUtil.getString(fileList.get(i).get("CMM_FLE_IDX"), "");
	    		
		   		 if(!"".equals(CMM_FLE_IDX) && !"".equals(CMM_FLE_SAVE_PATH))
		            {
		   			 	removeMap.put("CMM_FLE_USE_YN", "N");
		   			 	removeMap.put("CMM_FLE_IDX", CMM_FLE_IDX);
		   			 
		                // 파일 DB 수정
		                defaultDAO.update("Common.deleteCommonFile", removeMap);
		                
		                // 파일 물리적 삭제
		                fileUpload.delete(CMM_FLE_SAVE_PATH);
		            }
	        }
		}
		
		return result; 
	}	
    
	
	/**
	 * <pre>
	 * 1. MethodName : updateStandingPointCounsel
	 * 2. ClassName  : StandingPointServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 수정처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateStandingPointCounsel (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		
		if(SessionsBusiness.isLoginBusiness(request)){
			commandMap.put("VDR_CST_UPD_ID", SessionsBusiness.getSessionBusinessValue("VDR_LGN_BUSINESSID"));
			commandMap.put("VDR_LGN_IDX", SessionsBusiness.getSessionBusinessValue("VDR_LGN_IDX"));
		} 
		commandMap.put("VDR_CST_UPD_IP", request.getRemoteAddr());
		
    	int result = defaultDAO.update("PcStandingPoint.updateStandingPointCounsel", commandMap);
		String CMM_FLE_TB_TYPE = "";
		
    	
        String CMM_FLE_SAVE_PATH = "";
        //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
        
        if(result > 0)
        {
        	
        	String [] removeFileIdx = StringUtil.getArray(commandMap, "CMM_FLE_IDX");
        	
        	for(int i=0; i<removeFileIdx.length; i++)
        	{
        		
            	String CMM_FLE_IDX = StringUtil.getString(removeFileIdx[i]);
            	
            	commandMap.put("CMM_FLE_IDX", CMM_FLE_IDX);
            	//파일 상세 정보
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
        	
        //파일 insert
        List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
        if(fileList.size() > 0)
        {
        	int fileSort = 0;
            int fileSort2 = 0;
            commandMap.put("CMM_FLE_TB_NM", "T_VDR_CST");
            commandMap.put("CMM_FLE_TB_TYPE", "P");
            commandMap.put("CMM_FLE_TB_PK",  StringUtil.getString(commandMap.get("VDR_CST_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", commandMap.get("VDR_CST_REG_ID"));
            for(int i = 0;i < fileList.size();i++)
            {
                CommonsMultipartFile file = fileList.get(i);
                
                if(fileSort2 == 0 && !"".equals(StringUtil.getString(commandMap.get("file1"), "")) ){
                	CMM_FLE_TB_TYPE = "S";
                }else if(fileSort2 == 1 && !"".equals(StringUtil.getString(commandMap.get("file2"), "")) ){
                	CMM_FLE_TB_TYPE = "I";                	
                }else if(fileSort2 == 2 && !"".equals(StringUtil.getString(commandMap.get("file3"), "")) ){
                	CMM_FLE_TB_TYPE = "C";                	
                }
                commandMap.put("CMM_FLE_TB_TYPE", CMM_FLE_TB_TYPE);
                fileSort2++;
                
                if(!file.isEmpty())
                {
                    commandMap.put("CMM_FLE_SORT", ++fileSort);
                    // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "board", "fileType", "Y"));
                }
            }
        }
        
        //파일 삭제한 경우에만..
        if(tempRemoveList != null){
        	for(int i=0;i<tempRemoveList.size();i++){
        		fileUpload.delete(tempRemoveList.get(i));
        	}
        }
        
        return result;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectStandingPointApplicationCount
	 * 2. ClassName  : StandingPointServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점 신청서 카운트 
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectStandingPointApplicationCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcStandingPoint.selectStandingPointApplicationCount",commandMap);
	}
	
	
	/**
	 * <pre>
	 * 1. MethodName : insertStandingPointApplication
	 * 2. ClassName  : StandingPointServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점 신청서 등록처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertStandingPointApplication(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception{
		
		int result = 0;
					
		commandMap.put("VDR_REQ_REG_IP", request.getRemoteAddr());
		
		result = defaultDAO.insert("PcStandingPoint.insertStandingPointApplication", commandMap);

		String [] channelList = (String[]) commandMap.get("channelList");
		if(channelList != null){
		    for(int index=0; index < channelList.length; index++){
		        Map<String, Object> paramMap = new HashMap<String, Object>();
		        paramMap.put("VDR_REQ_IDX", StringUtil.getString(commandMap.get("VDR_REQ_IDX"), ""));
		        paramMap.put("VDR_REQ_CHN_TYPE", channelList[index]);
		        
		        //입점신청 외부채널 등록
		        result = defaultDAO.insert("PcStandingPoint.insertVendorRouteChannel", paramMap);
		    }
		}
		
		if(result > 0){
		    CommonsMultipartFile file = (CommonsMultipartFile) request.getFile("file");
		    if(file != null && !file.isEmpty()){
		        int fileSort = 0;
		        commandMap.put("CMM_FLE_TB_NM", "T_VDR_REQ");     // 테이블 이름
		        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("VDR_REQ_IDX"), ""));
		        commandMap.put("CMM_FLE_REG_ID", commandMap.get("VDR_CST_REG_ID"));
		        commandMap.put("CMM_FLE_SORT", ++fileSort);
		        commandMap.put("fileSizeYn","Y");
		        
		        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "board", "image", "Y"));
		    }   
		}
		return result;
	}	
	
	/**
	 * <pre>
	 * 1. MethodName : selectStandingPointApplication
	 * 2. ClassName  : StandingPointServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점 신청서 상세정보
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectStandingPointApplication (Map<String,Object> commandMap) throws Exception
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 입점신청서 상세정보
	    Map<String, Object> row = defaultDAO.select("PcStandingPoint.selectStandingPointApplication", commandMap);
	    
		returnMap.put("row", row);
		
	    return returnMap;
	}	
	
	/**
	 * <pre>
	 * 1. MethodName : updateStandingPointApplication
	 * 2. ClassName  : StandingPointServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점 신청서 수정처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 17.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateStandingPointApplication (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		
		if(SessionsBusiness.isLoginBusiness(request)){
			commandMap.put("VDR_REQ_UPD_ID", SessionsBusiness.getSessionBusinessValue("VDR_LGN_BUSINESSID"));
			commandMap.put("VDR_LGN_IDX", SessionsBusiness.getSessionBusinessValue("VDR_LGN_IDX"));
		} 
		commandMap.put("VDR_REQ_UPD_IP", request.getRemoteAddr());
		
    	int result = defaultDAO.update("PcStandingPoint.updateStandingPointApplication", commandMap);
        
        return result;
	}	
	
	/**
	 * <pre>
	 * 1. MethodName : selectStandingPointCounselStateCount
	 * 2. ClassName  : StandingPointServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 해당 카운트
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 17.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectStandingPointCounselStateCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcStandingPoint.selectStandingPointCounselStateCount",commandMap);
	}	
	
	/**
	* <pre>
	* 1. MethodName : selectBussinessCommonInfo
	* 2. ClassName  : StandingPointServiceImpl.java
	* 3. Comment    : 입점센터에서 공통으로 필요한 정보들
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 3. 29.
	* </pre>
	*
	* @param commandMap
	* VDR_LGN_IDX 만 넘기면 된다
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectBussinessCommonInfo (Map<String,Object> commandMap) throws Exception
	{
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 입점신청서 권한 확인
		commandMap.put("VDR_LGN_IDX", StringUtil.getInt(commandMap.get("VDR_LGN_IDX")));
	    String[] codes = {"STANDINGPOINT_CODE"};
	    Map<String,Object> returnMap = this.pcCommonService.selectCodes(codes);
	    // 계약승인 가져오기
	    
		List<Map<String, String>> returnDtlList = (List<Map<String,String>>)returnMap.get(codes[0]);
		Map<String,String> standingPointMap = (Map<String,String>)returnDtlList.get(5);
		commandMap.put("VDR_CST_GBN", StringUtil.getInt(standingPointMap.get("CMN_COM_IDX")));       
		
		int stateCount = this.selectStandingPointCounselStateCount(commandMap);   
		
		if(stateCount == 0){
			resultMap.put("VDR_LGN_APPLICATION_AUTH", "N");
		}else{
			resultMap.put("VDR_LGN_APPLICATION_AUTH", "Y");
			
			// TODO
			// 입점 신청서 접수전/접수중/승인 여부 체크
			String VDR_LGN_REQUEST_STATE = "";
			
			// 신청서 개수 체크
			int reqCount = this.selectStandingPointApplicationCount(commandMap);	
			
			if(reqCount > 0){
				commandMap.put("KICC_BANK_CD", Code.KICC_BANK_CD);
	           	Map<String, Object> dataMap = this.selectStandingPointApplication(commandMap);
	           	Map<String, String> returnDtlMap = (Map<String, String>) dataMap.get("row");
	           	
	           	// 등록된 신청서가 접수중일때
	           	if("N".equals(StringUtil.getString(returnDtlMap.get("VDR_REQ_GBN"), "")) ){
	           		VDR_LGN_REQUEST_STATE = "M";
	           	}else{	// 승인상태
	           		VDR_LGN_REQUEST_STATE = "V";
	           	}
			}else{// 신청서 없음
				VDR_LGN_REQUEST_STATE = "N";
			}
			
			resultMap.put("VDR_LGN_REQUEST_STATE", VDR_LGN_REQUEST_STATE);
		}
		
	    return resultMap;
	}	
	
	
}
