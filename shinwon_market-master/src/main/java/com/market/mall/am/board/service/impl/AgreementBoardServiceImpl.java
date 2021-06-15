package com.market.mall.am.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.am.board.service.AgreementBoardService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.board.service.impl
 * @FileName : AgreementBoardServiceImpl.java
 * @Date : 2016. 8. 17.
 * @프로그램 설명 : 관리자 > 고객센터 >이용약관관리 처리하는 serviceImpl
 * @author DEV_LEESANGWOOK
 */

@Service("agreementBoardService")
public class AgreementBoardServiceImpl implements AgreementBoardService {
	 @Resource(name="defaultDAO") 
	    private CommonDefaultDAO defaultDAO;


	/**
	 * <pre>
	 * 1. MethodName : selectAgreementList
	 * 2. ClassName  : AgreementBoardServiceImpl.java
	 * 3. Comment    : 관리자 > 고객센터 > 이용약관 목록 
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAgreementList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("AgreementBoard.selectAgreementList", commandMap);
	}

	/**
	 * <pre>
	 * 1. MethodName : selectAgreementInfo
	 * 2. ClassName  : AgreementBoardServiceImpl.java
	 * 3. Comment    : 관리자 > 고객센터 > 이용약관 상세조회, 이용약관 개정이력
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectAgreementInfo(Map<String, Object> commandMap) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		//이용약관 상세
		returnMap.put("info", defaultDAO.select("AgreementBoard.selectAgreementInfo", commandMap));
		
		//선택한 이용약관의 히스토리
		returnMap.put("historyList", defaultDAO.selectList("AgreementBoard.selectAgreementHistoryList", commandMap));
		return returnMap;
	}

	/**
	 * <pre>
	 * 1. MethodName : insertAgreementBoard
	 * 2. ClassName  : AgreementBoardServiceImpl.java
	 * 3. Comment    : 관리자 > 고객센터 > 이용약관 등록
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertAgreementBoard(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		Admin admin = SessionsAdmin.getSessionAdmin(request);        
        commandMap.put("BRD_AGR_REG_ID", admin.getADM_MST_ID());
        commandMap.put("BRD_AGR_REG_IP", request.getRemoteAddr());
        commandMap.put("BRD_AGR_HIS_REG_IP", request.getRemoteAddr());
        commandMap.put("BRD_AGR_HIS_REG_ID", admin.getADM_MST_ID());
		//이용약관 등록
		int result = defaultDAO.insert("AgreementBoard.insertAgreementBoard", commandMap);
		
		//개정이력 등록
		if(!"".equals(commandMap.get("BRD_AGR_IDX"))){
		    defaultDAO.insert("AgreementBoard.insertAgreementHistory", commandMap);
		}
		
		return result;
	}
	
	
	/**
	 * <pre>
	 * 1. MethodName : updateAgreementBoard
	 * 2. ClassName  : AgreementBoardServiceImpl.java
	 * 3. Comment    : 관리자 > 고객센터 > 이용약관 수정
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateAgreementBoard(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		Admin admin = SessionsAdmin.getSessionAdmin(request);        
        commandMap.put("BRD_AGR_UPD_ID", admin.getADM_MST_ID());
        commandMap.put("BRD_AGR_UPD_IP", request.getRemoteAddr());
        
        
        //이용약관 수정
        int result = defaultDAO.update("AgreementBoard.updateAgreementBoard", commandMap);
        
        if(result > 0){
        	//개정이력 등록
            commandMap.put("BRD_AGR_HIS_REG_IP", request.getRemoteAddr());
            commandMap.put("BRD_AGR_HIS_REG_ID", admin.getADM_MST_ID());
        	result = defaultDAO.insert("AgreementBoard.insertAgreementHistory", commandMap);
        }
        
        return result;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectAgreementBoardTypeCnt
	 * 2. ClassName  : AgreementBoardServiceImpl.java
	 * 3. Comment    : 관리자 > 고객센터 > 약관동의 등록, 수정시에 유형 중복 체크
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectAgreementBoardTypeCnt(Map<String, Object> commandMap) throws Exception {
		int cnt = defaultDAO.selectCount("AgreementBoard.selectAgreementBoardTypeCnt", commandMap);
		commandMap.put("cnt", cnt);
		return commandMap;
	}

}
