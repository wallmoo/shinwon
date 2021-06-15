package com.market.mall.am.marketing.service.impl;

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
import com.market.mall.am.marketing.service.CardEventService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.marketing.service.impl
 * @FileName : CardEventServiceImpl.java
 * @Date : 2015. 11. 10.
 * @프로그램 설명 : 관리자 > 마케팅관리 > 카드행사관리를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("cardEventService")
public class CardEventServiceImpl implements CardEventService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    @SuppressWarnings("unused")
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    
    /**
    * <pre>
    * 1. MethodName : selectCardEventListCount
    * 2. ClassName  : CardEventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 목록 갯수 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCardEventListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("CardEvent.selectCardEventListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCardEventList
    * 2. ClassName  : CardEventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCardEventList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("CardEvent.selectCardEventList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCardEventInfo
    * 2. ClassName  : CardEventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 상세정보 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectCardEventInfo (Map<String, Object> commandMap) throws Exception
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        // 기본 정보
        returnMap.put("row", defaultDAO.select("CardEvent.selectCardEventInfo", commandMap));
        returnMap.put("detailList", defaultDAO.selectList("CardEvent.selectCardEventDetailList", commandMap));
        returnMap.put("productList", defaultDAO.selectList("CardEvent.selectCardEventProductList", commandMap));
        
        return returnMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : insertCardEvent
    * 2. ClassName  : CardEventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 등록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int insertCardEvent (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("CRD_PMT_REG_IP", request.getRemoteAddr());
        commandMap.put("CRD_PMT_REG_ID", admin.getADM_MST_ID());
        
        // 카드행사 관리 등록
        result = defaultDAO.insert("CardEvent.insertCardEvent", commandMap);
        
        if(result > 0)
        {
        	String [] PMT_CRD_IDX = StringUtil.getArray(commandMap, "PMT_CRD_IDX");
        	String [] PMT_CRD_SAL_GBN = StringUtil.getArray(commandMap, "PMT_CRD_SAL_GBN");
        	String [] PMT_CRD_SAL_PRC = StringUtil.getArray(commandMap, "PMT_CRD_SAL_PRC");
        	String [] PMT_CRD_SML_PRC = StringUtil.getArray(commandMap, "PMT_CRD_SML_PRC");
        	String [] PMT_CRD_MXM_PRC = StringUtil.getArray(commandMap, "PMT_CRD_MXM_PRC");
        	String [] PMT_CRD_DPL_YN = StringUtil.getArray(commandMap, "PMT_CRD_DPL_YN");
        	String [] PMT_CRD_ETC = StringUtil.getArray(commandMap, "PMT_CRD_ETC");
        	
            for(int y = 0;y < PMT_CRD_IDX.length;y++)
            {
            	commandMap.put("PMT_CRD_IDX", PMT_CRD_IDX[y]);
            	commandMap.put("PMT_CRD_SAL_GBN", PMT_CRD_SAL_GBN[y]);
            	commandMap.put("PMT_CRD_SAL_PRC", PMT_CRD_SAL_PRC[y]);
            	commandMap.put("PMT_CRD_SML_PRC", PMT_CRD_SML_PRC[y]);
            	commandMap.put("PMT_CRD_MXM_PRC", PMT_CRD_MXM_PRC[y]);
            	commandMap.put("PMT_CRD_DPL_YN", PMT_CRD_DPL_YN[y]);
            	commandMap.put("PMT_CRD_ETC", PMT_CRD_ETC[y]);
            	commandMap.put("PMT_CRD_PMT_IDX", commandMap.get("CRD_PMT_IDX"));
            	
            	
                //commandMap.put("PLN_DTL_ORDER", StringUtil.getString(commandMap.get("PLN_DTL_ORDER" + "_" + groupNum[i] + "_" + PLN_PRD_MST_CD[y]), ""));
                // 상품 구성 등록
                defaultDAO.insert("CardEvent.insertCardEventDetail", commandMap);
            }
            
            String [] PMT_PRD_MST_CD = StringUtil.getArray(commandMap, "PRD_MST_CD");
            for(int a = 0;a < PMT_PRD_MST_CD.length;a++)
            {
            	
            	commandMap.put("PMT_PRD_MST_CD", PMT_PRD_MST_CD[a]);
            	commandMap.put("PMT_CRD_PMT_IDX", commandMap.get("CRD_PMT_IDX"));
            	
                //commandMap.put("PLN_DTL_ORDER", StringUtil.getString(commandMap.get("PLN_DTL_ORDER" + "_" + groupNum[i] + "_" + PLN_PRD_MST_CD[y]), ""));
                // 상품 구성 등록
                defaultDAO.insert("CardEvent.insertCardEventProduct", commandMap);
            }
            
        }
        return result; 
    }
    
    /**
    * <pre>
    * 1. MethodName : updateCardEvent
    * 2. ClassName  : CardEventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 수정 
    * 4. 작성자       : khcho
    * 5. 작성일       :2015. 11. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public int updateCardEvent (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("CRD_PMT_UPD_IP", request.getRemoteAddr());
        commandMap.put("CRD_PMT_UPD_ID", admin.getADM_MST_ID());
        
        int result = 0;
        
        //카드행사 기본정보 수정
        result = defaultDAO.update("CardEvent.updateCardEvent", commandMap);
          
        if(result > 0)
        {
        	if(defaultDAO.delete("CardEvent.deleteCardEventDetail", commandMap) > -1)
        	{
	        	String [] PMT_CRD_IDX = StringUtil.getArray(commandMap, "PMT_CRD_IDX");
	        	String [] PMT_CRD_SAL_GBN = StringUtil.getArray(commandMap, "PMT_CRD_SAL_GBN");
	        	String [] PMT_CRD_SAL_PRC = StringUtil.getArray(commandMap, "PMT_CRD_SAL_PRC");
	        	String [] PMT_CRD_SML_PRC = StringUtil.getArray(commandMap, "PMT_CRD_SML_PRC");
	        	String [] PMT_CRD_MXM_PRC = StringUtil.getArray(commandMap, "PMT_CRD_MXM_PRC");
	        	String [] PMT_CRD_DPL_YN = StringUtil.getArray(commandMap, "PMT_CRD_DPL_YN");
	        	String [] PMT_CRD_ETC = StringUtil.getArray(commandMap, "PMT_CRD_ETC");
	        	
	            for(int y = 0;y < PMT_CRD_IDX.length;y++)
	            {
	            	commandMap.put("PMT_CRD_IDX", PMT_CRD_IDX[y]);
	            	commandMap.put("PMT_CRD_SAL_GBN", PMT_CRD_SAL_GBN[y]);
	            	commandMap.put("PMT_CRD_SAL_PRC", PMT_CRD_SAL_PRC[y]);
	            	commandMap.put("PMT_CRD_SML_PRC", PMT_CRD_SML_PRC[y]);
	            	commandMap.put("PMT_CRD_MXM_PRC", PMT_CRD_MXM_PRC[y]);
	            	commandMap.put("PMT_CRD_DPL_YN", PMT_CRD_DPL_YN[y]);
	            	commandMap.put("PMT_CRD_ETC", PMT_CRD_ETC[y]);
	            	commandMap.put("PMT_CRD_PMT_IDX", commandMap.get("CRD_PMT_IDX"));
	            	
	            	
	                //commandMap.put("PLN_DTL_ORDER", StringUtil.getString(commandMap.get("PLN_DTL_ORDER" + "_" + groupNum[i] + "_" + PLN_PRD_MST_CD[y]), ""));
	                // 상품 구성 등록
	                defaultDAO.insert("CardEvent.insertCardEventDetail", commandMap);
	            }
        	}
        	
        	if(defaultDAO.delete("CardEvent.deleteCardEventProduct", commandMap) > -1)
        	{
	        	String [] PMT_PRD_MST_CD = StringUtil.getArray(commandMap, "PRD_MST_CD");
	            for(int a = 0;a < PMT_PRD_MST_CD.length;a++)
	            {
	            	
	            	commandMap.put("PMT_PRD_MST_CD", PMT_PRD_MST_CD[a]);
	            	commandMap.put("PMT_CRD_PMT_IDX", commandMap.get("CRD_PMT_IDX"));
	            	
	                //commandMap.put("PLN_DTL_ORDER", StringUtil.getString(commandMap.get("PLN_DTL_ORDER" + "_" + groupNum[i] + "_" + PLN_PRD_MST_CD[y]), ""));
	                // 상품 구성 등록
	                defaultDAO.insert("CardEvent.insertCardEventProduct", commandMap);
	            }
        	}
        }
        return result;
    }
    /**
     * <pre>
     * 1. MethodName : selectCardCodeList
     * 2. ClassName  : CardEventService.java
     * 3. Comment    : 카드 코드조회 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCardCodeList () throws Exception
    {
        return (List<Map<String, Object>>)defaultDAO.selectList("CardEvent.selectCardCodeList", "");
    }
    
}
