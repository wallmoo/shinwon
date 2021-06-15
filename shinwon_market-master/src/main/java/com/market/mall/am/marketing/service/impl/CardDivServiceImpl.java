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
import com.market.mall.am.marketing.service.CardDivService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.marketing.service.impl
 * @FileName : CardDivServiceImpl.java
 * @Date : 2015. 11. 10.
 * @프로그램 설명 : 관리자 > 마케팅관리 > 카드할부관리를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("cardDivService")
public class CardDivServiceImpl implements CardDivService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    @SuppressWarnings("unused")
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    
    /**
    * <pre>
    * 1. MethodName : selectCardDivListCount
    * 2. ClassName  : CardDivServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드할부관리 목록 갯수 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCardDivListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("CardDiv.selectCardDivListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCardDivList
    * 2. ClassName  : CardDivServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드할부관리 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCardDivList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("CardDiv.selectCardDivList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCardDivInfo
    * 2. ClassName  : CardDivServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드할부관리 상세정보 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectCardDivInfo (Map<String, Object> commandMap) throws Exception
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        // 기본 정보
        returnMap.put("row", defaultDAO.select("CardDiv.selectCardDivInfo", commandMap));
        returnMap.put("detailList", defaultDAO.selectList("CardDiv.selectCardDivDetailList", commandMap));
        returnMap.put("detailInfo", defaultDAO.selectList("CardDiv.selectCardDivDetailInfo", commandMap));
        
        return returnMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : insertCardDiv
    * 2. ClassName  : CardDivServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드할부관리 등록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 02.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int insertCardDiv (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("CRD_DIV_REG_IP", request.getRemoteAddr());
        commandMap.put("CRD_DIV_REG_ID", admin.getADM_MST_ID());
        
        // 카드할부 관리 등록
        result = defaultDAO.insert("CardDiv.insertCardDiv", commandMap);
        
        if(result > 0)
        {
        	String [] DIV_DTL_CD = StringUtil.getArray(commandMap, "DIV_DTL_CD");
        	String [] DIV_DTL_PRC = StringUtil.getArray(commandMap, "DIV_DTL_PRC");
        	String [] NUM = StringUtil.getArray(commandMap, "NUM");
        	
            for(int y = 0;y < DIV_DTL_CD.length;y++)
            {
            	commandMap.put("DIV_DTL_CD", DIV_DTL_CD[y]);
            	commandMap.put("DIV_DTL_PRC", DIV_DTL_PRC[y]);
            	
                // 상품 구성 등록
            	int resultDetail = defaultDAO.insert("CardDiv.insertCardDivDetail", commandMap);
            	
                if(resultDetail > 0)
                {
                
	                String [] DIV_INF_MNT = StringUtil.getArray(commandMap, "DIV_INF_MNT"+NUM[y]);
	                String [] DIV_INF_GBN = StringUtil.getArray(commandMap, "DIV_INF_GBN"+NUM[y]);
	                String [] DIV_INF_NTC = StringUtil.getArray(commandMap, "DIV_INF_NTC"+NUM[y]);
	                String [] DIV_INF_USE_YN = StringUtil.getArray(commandMap, "DIV_INF_USE_YN"+NUM[y]);
	                
	                for(int i = 0;i < DIV_INF_MNT.length;i++)
	                {
	                	commandMap.put("DIV_INF_MNT", DIV_INF_MNT[i]);
	                	commandMap.put("DIV_INF_GBN", DIV_INF_GBN[i]);
	                	commandMap.put("DIV_INF_NTC", DIV_INF_NTC[i]);
	                	commandMap.put("DIV_INF_USE_YN", DIV_INF_USE_YN[i]);
	                	
	                	defaultDAO.insert("CardDiv.insertCardDivInfo", commandMap);
	                }
                }
                
            }
            
            
        }
        return result; 
    }
    
    /**
    * <pre>
    * 1. MethodName : updateCardDiv
    * 2. ClassName  : CardDivServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드할부관리 수정 
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
    public int updateCardDiv (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
    	int result = 0;
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("CRD_DIV_UPD_IP", request.getRemoteAddr());
        commandMap.put("CRD_DIV_UPD_ID", admin.getADM_MST_ID());
        
        // 카드할부 관리 등록
        result = defaultDAO.update("CardDiv.updateCardDiv", commandMap);
        
        if(result > 0)
        {
        	defaultDAO.delete("CardDiv.deleteCardDivInfo", commandMap);
        	defaultDAO.delete("CardDiv.deleteCardDivDetail", commandMap);
        	
        	String [] DIV_DTL_CD = StringUtil.getArray(commandMap, "DIV_DTL_CD");
        	String [] DIV_DTL_PRC = StringUtil.getArray(commandMap, "DIV_DTL_PRC");
        	String [] NUM = StringUtil.getArray(commandMap, "NUM");
        	
            for(int y = 0;y < DIV_DTL_CD.length;y++)
            {
            	commandMap.put("DIV_DTL_CD", DIV_DTL_CD[y]);
            	commandMap.put("DIV_DTL_PRC", DIV_DTL_PRC[y]);
            	
                // 상품 구성 등록
            	int resultDetail = defaultDAO.insert("CardDiv.insertCardDivDetail", commandMap);
            	
                if(resultDetail > 0)
                {
                	
                
	                String [] DIV_INF_MNT = StringUtil.getArray(commandMap, "DIV_INF_MNT"+NUM[y]);
	                String [] DIV_INF_GBN = StringUtil.getArray(commandMap, "DIV_INF_GBN"+NUM[y]);
	                String [] DIV_INF_NTC = StringUtil.getArray(commandMap, "DIV_INF_NTC"+NUM[y]);
	                String [] DIV_INF_USE_YN = StringUtil.getArray(commandMap, "DIV_INF_USE_YN"+NUM[y]);
	                
	                for(int i = 0;i < DIV_INF_MNT.length;i++)
	                {
	                	commandMap.put("DIV_INF_MNT", DIV_INF_MNT[i]);
	                	commandMap.put("DIV_INF_GBN", DIV_INF_GBN[i]);
	                	commandMap.put("DIV_INF_NTC", DIV_INF_NTC[i]);
	                	commandMap.put("DIV_INF_USE_YN", DIV_INF_USE_YN[i]);
	                	
	                	defaultDAO.insert("CardDiv.insertCardDivInfo", commandMap);
	                }
                }
                
            }
            
            
        }
        return result; 
    }
    
}
