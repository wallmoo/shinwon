package com.market.mall.am.marketing.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.marketing.service.TimeSaleService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;
import com.market.util.ObjectToJsonUtil;

/**
 * @PackageName: com.market.mall.am.marketing.service.impl
 * @FileName : TimeSaleServiceImpl.java
 * @Date : 2015. 11. 26.
 * @프로그램 설명 : 관리자 > 프로모션관리 > 원데이특가를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("timeSaleService")
public class TimeSaleServiceImpl implements TimeSaleService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Autowired TagService tagService;
	/**
     * <pre>
     * 1. MethodName : selectTimeSaleCount
     * 2. ClassName  : TimeSaleServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 목록 갯수
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectTimeSaleCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("TimeSale.selectTimeSaleCount",commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectTimeSaleList
     * 2. ClassName  : TimeSaleServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 타임세일  목록
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectTimeSaleList(Map<String, Object> commandMap) throws Exception 
    {
    	return defaultDAO.selectList("TimeSale.selectTimeSaleList",commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectTimeSaleInfo
     * 2. ClassName  : TimeSaleServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 타임세일 목록
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * 6. 수정일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectTimeSaleInfo(Map<String, Object> commandMap) throws Exception 
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        //기본 정보
        returnMap.put("row", defaultDAO.select("TimeSale.selectTimeSaleInfo", commandMap));
        
        returnMap.put("detailList", defaultDAO.selectList("TimeSale.selectTimeSaleDetailList", commandMap));
        
        //태그 리스트
        commandMap.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_TIME_SALE);
        commandMap.put(TAG_MODEL.TAG_BND_ID, StringUtil.getString(commandMap.get("TIM_SAL_IDX"), ""));
        returnMap.put("tagList", defaultDAO.selectList("Tag.selectContentWithTagList", commandMap));
        
    	return returnMap;
    }

    
    /**
     * <pre>
     * 1. MethodName : insertTimeSale
     * 2. ClassName  : TimeSaleServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 등록 처리  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int insertTimeSale(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
                
		result = defaultDAO.insert("TimeSale.insertTimeSale", commandMap);

		if(result > 0)
		{
		    String timeSaleType = StringUtil.getString(commandMap.get("TIM_SAL_TYPE"),"G");
		    
		    if(timeSaleType.equals("G"))
		    {
		        int order = 0;
		        commandMap.put("TIM_PRD_MST_CD", commandMap.get("normalProductCode"));
		        commandMap.put("TIM_DTL_ORDER", ++order);
		        
		        defaultDAO.insert("TimeSale.insertTimeSaleProduct", commandMap);
		    }
		    
		    if(timeSaleType.equals("T"))
		    {
		        String [] TIM_PRD_MST_CD = StringUtil.getArray(commandMap, "PRD_MST_CD");
		        for(int index = 0; index < TIM_PRD_MST_CD.length; index++)
		        {
		            Map<String, Object> paramMap = new HashMap<String, Object>();
		            paramMap.put("TIM_SAL_IDX", commandMap.get("TIM_SAL_IDX"));
		            paramMap.put("TIM_PRD_MST_CD", TIM_PRD_MST_CD[index]);
		            paramMap.put("TIM_DTL_ORDER", index+1);
		            paramMap.put("TIM_PRD_MST_SALE_RATE", StringUtil.getString(commandMap.get("TIM_PRD_MST_SALE_RATE" + "_" + TIM_PRD_MST_CD[index]), ""));
		            paramMap.put("TIM_PRD_MST_UNT", StringUtil.getString(commandMap.get("TIM_PRD_MST_UNT" + "_" + TIM_PRD_MST_CD[index]), ""));
		            
		            //타임스페셜일때 상품 구성 등록
		            defaultDAO.insert("TimeSale.insertTimeSaleProduct", paramMap);
		        }
		    }
		    
            //태그 등록
            Map<String, Object> param = new HashMap<String, Object>();
            param.put(TAG_MODEL.TAG_BND_ID, commandMap.get("TIM_SAL_IDX"));
            param.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_TIME_SALE);
            param.put("TAG_MST_IDs", commandMap.get("TAG_MST_ID"));
            param.put("TAG_BND_REP_ID", commandMap.get("TAG_BND_REP_ID"));

            this.tagService.insertTagBindBatch(param);
		}	
		return result;
	}

    /**
     * <pre>
     * 1. MethodName : updateTimeSale
     * 2. ClassName  : TimeSaleServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 수정 처리  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int updateTimeSale(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
//        String startDate = StringUtil.getString(commandMap.get("AD_MST_ST_DT"), "");
//        String endDate = StringUtil.getString(commandMap.get("AD_MST_ED_DT"), "");
//		commandMap.put("AD_MST_ST_DT", startDate.replaceAll("-", ""));
//		commandMap.put("AD_MST_ED_DT", endDate.replaceAll("-", ""));

		String timeSaleType = StringUtil.getString(commandMap.get("TIM_SAL_TYPE"),"G");
		
		result = defaultDAO.update("TimeSale.updateTimeSale", commandMap);
		 
		if(defaultDAO.delete("TimeSale.deleteTimeSaleDetailGroup", commandMap) > -1)
		{
		    if(timeSaleType.equals("G"))
            {
                int order = 0;
                commandMap.put("TIM_PRD_MST_CD", commandMap.get("PRD_MST_CD"));
                commandMap.put("TIM_DTL_ORDER", ++order);
                
                result = defaultDAO.insert("TimeSale.insertTimeSaleProduct", commandMap);
            }
            
            if(timeSaleType.equals("T"))
            {
                String [] TIM_PRD_MST_CD = StringUtil.getArray(commandMap, "PRD_MST_CD");
                for(int index = 0; index < TIM_PRD_MST_CD.length; index++)
                {
                    Map<String, Object> paramMap = new HashMap<String, Object>();
                    paramMap.put("TIM_SAL_IDX", commandMap.get("TIM_SAL_IDX"));
                    paramMap.put("TIM_PRD_MST_CD", TIM_PRD_MST_CD[index]);
                    paramMap.put("TIM_DTL_ORDER", index+1);
                    paramMap.put("TIM_PRD_MST_SALE_RATE", StringUtil.getString(commandMap.get("TIM_PRD_MST_SALE_RATE" + "_" + TIM_PRD_MST_CD[index]), ""));
                    paramMap.put("TIM_PRD_MST_UNT", StringUtil.getString(commandMap.get("TIM_PRD_MST_UNT" + "_" + TIM_PRD_MST_CD[index]), ""));
                    
                    //타임스페셜일때 상품 구성 등록
                    result = defaultDAO.insert("TimeSale.insertTimeSaleProduct", paramMap);
                }
            }
            
            commandMap.put(TAG_MODEL.TAG_BND_ID, commandMap.get("TIM_SAL_IDX"));
            commandMap.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_TIME_SALE);
            
            //태그 수정
            Map<String, Object> tagParam = new HashMap<String, Object>();
            tagParam.put(TAG_MODEL.TAG_BND_ID, commandMap.get("TIM_SAL_IDX"));
            tagParam.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_TIME_SALE);
            //태그 삭제
            defaultDAO.delete("PcTag.deleteTagBind", tagParam);
            
            tagParam.put("TAG_MST_IDs", commandMap.get("TAG_MST_ID"));
            tagParam.put("TAG_BND_REP_ID", commandMap.get("TAG_BND_REP_ID"));
        	//태그 등록
            this.tagService.insertTagBindBatch(tagParam);
            
		}
		
		return result;
			
		 
		
	}
    
    //타임세일 목록 > 전시여부 수정
    public int updateTimeSaleList(Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.update("TimeSale.updateTimeSaleList", commandMap);
    }
    
    public List<Map<String, Object>> selectTimeSaleProductList(Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.selectList("TimeSale.selectTimeSaleProductList", commandMap);
    }
    
    public int selectSearchTimeSaleProductCount(Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.selectCount("TimeSale.selectSearchTimeSaleProductCount", commandMap);
    }
    
    public List<Map<String, Object>> selectSearchTimeSaleProductList(Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.selectList("TimeSale.selectSearchTimeSaleProductList", commandMap);
    }
    
}
