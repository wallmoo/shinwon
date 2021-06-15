package com.market.mall.am.display.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.PopupService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.display.service.impl
 * @FileName : PopupServiceImpl.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 전시관리 > 팝업관리를 처리하는 Service Implement Class
 * @author ejpark
 */
@Service("popupService")
public class PopupServiceImpl implements PopupService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "defaultDAO")
	private CommonDefaultDAO defaultDAO;

	@Autowired
	private FileUpload fileUpload;

	/**
	 * <pre>
	 * 1. MethodName : selectPopupCount
	 * 2. ClassName  : PopupServiceImpl.java
	 * 3. Comment    : 관리자 > 전시관리 > 팝업관리 목록 갯수
	 * 4. 작성자       : ejpark
	 * 5. 작성일       : 2014. 4. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectPopupCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("Popup.selectPopupCount", commandMap);
	}
 
	/**
	 * <pre>
	 * 1. MethodName : selectPopupList
	 * 2. ClassName  : PopupServiceImpl.java
	 * 3. Comment    : 관리자 > 전시관리 > 팝업관리 목록
	 * 4. 작성자       : ejpark
	 * 5. 작성일       : 2014. 4. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPopupList(Map<String, Object> commandMap) throws Exception {
		commandMap.put("CODE_COMMON_POPUP_VIEW_LOCATION", Code.COMMON_POPUP_VIEW_LOCATION);
		return defaultDAO.selectList("Popup.selectPopupList", commandMap);
	}

	/**
	 * <pre>
	 * 1. MethodName : selectPopupView
	 * 2. ClassName  : PopupServiceImpl.java
	 * 3. Comment    : 관리자 > 전시관리 > 팝업관리 상세보기
	 * 4. 작성자       : ejpark
	 * 5. 작성일       : 2014. 4. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPopupView(Map<String, Object> commandMap) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("row", defaultDAO.select("Popup.selectPopupInfo", commandMap));

		commandMap.put("CMM_FLE_TB_NM", "T_POP_MST");
		commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("POP_MST_IDX"), ""));

		// 첨부파일 정보
		returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));

		return returnMap;
	}

	/**
	 * <pre>
	 * 1. MethodName : insertPopup
	 * 2. ClassName  : PopupServiceImpl.java
	 * 3. Comment    : 관리자 > 전시관리 > 팝업관리 등록 처리  
	 * 4. 작성자       : ejpark
	 * 5. 작성일       : 2014. 4. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int insertPopup(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		int result = 0;
		Admin admin = SessionsAdmin.getSessionAdmin(request);

		String startDate = StringUtil.getString(commandMap.get("POP_MST_ST_DT"), "");
		String endDate = StringUtil.getString(commandMap.get("POP_MST_ED_DT"), "");

		commandMap.put("POP_MST_ST_DT", startDate.replaceAll("-", ""));
		commandMap.put("POP_MST_ED_DT", endDate.replaceAll("-", ""));

		result = defaultDAO.insert("Popup.insertPopup", commandMap);

		if (result > 0) {
			commandMap.put("CMM_FLE_TB_NM", "T_POP_MST");
			commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("POP_MST_IDX"), ""));
			commandMap.put("CMM_FLE_TB_TYPE", "P");
			commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());

		}

		return result;
	}

	/**
	 * <pre>
	 * 1. MethodName : updatePopup
	 * 2. ClassName  : PopupServiceImpl.java
	 * 3. Comment    : 관리자 > 전시관리 > 팝업관리 수정 처리  
	 * 4. 작성자       : khcho
	 * 5. 작성일       : 2015. 11. 30.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int updatePopup(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		int result = 0;
		Admin admin = SessionsAdmin.getSessionAdmin(request);

		String startDate = StringUtil.getString(commandMap.get("POP_MST_ST_DT"), "");
		String endDate = StringUtil.getString(commandMap.get("POP_MST_ED_DT"), "");
		commandMap.put("POP_MST_ST_DT", startDate.replaceAll("-", ""));
		commandMap.put("POP_MST_ED_DT", endDate.replaceAll("-", ""));

		result = defaultDAO.update("Popup.updatePopup", commandMap);

		
		return result;

	}

	/**
	 * <pre>
	 * 1. MethodName : popupFormMobile
	 * 2. ClassName  : PopupServiceImpl.java
	 * 3. Comment    : 관리자 > 전시관리 > 팝업관리 모바일팝업 등록 화면  
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 6. 30.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> popupFormMobile(Map<String, Object> commandMap) throws Exception {
		commandMap.put("CODE_COMMON_POPUP_VIEW_LOCATION", Code.COMMON_POPUP_VIEW_LOCATION);
		commandMap.put("POP_MST_VIEW_ENV", Code.CATEGORY_TYPE_MOBILE);
		return defaultDAO.selectList("Popup.selectPopupNotUsedViewLocation", commandMap);
	}

	/**
	 * <pre>
	 * 1. MethodName : selectViewPageCnt
	 * 2. ClassName : PopupServiceImpl.java
	 * 3. Comment : 노출페이지 중복체크
	 * 4. 작성자 : DEV_KIMSOYOUNG
	 * 5. 작성일 : 2015. 8. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */

	public Map<String, Object> selectViewPageCnt(Map<String, Object> commandMap) throws Exception {
		int cnt = defaultDAO.selectCount("Popup.selectViewPageCnt", commandMap);
		commandMap.put("cnt", cnt);
		return commandMap;
	}
	
	public int updatePopupStatus (HttpServletRequest request, Map<String, Object> commandMap) throws Exception{

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("POP_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("POP_MST_UPD_ID", admin.getADM_MST_ID());
        
        int result = 0;

        String USE_YN_LIST = StringUtil.getString(commandMap.get("USE_YN_LIST"),"");
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        List<Map<String,Object>> popupList = mapper.readValue(USE_YN_LIST,typeRef);
        
        for(int index = 0; index < popupList.size(); index++){
            
            String popIdx = StringUtil.getString(popupList.get(index).get("POP_MST_IDX"),"");
            String popUseYN = StringUtil.getString(popupList.get(index).get("POP_MST_USE_YN"),"Y");
            
            commandMap.put("POP_MST_IDX", popIdx);
            commandMap.put("POP_MST_USE_YN", popUseYN);
            
            result = defaultDAO.update("Popup.updatePopupStatus", commandMap);
            
        }
        
        return result; 
    }
}
