package com.market.mall.batch.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.batch.service.BatchManagerService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.batch.service.impl
 * @FileName : BatchService.java
 * @Date : 2014. 8. 5.
 * @프로그램 설명 : 관리자 > 배치작업 관리 를 처리하는 Service Implement Class
 * @author 이미정
 */
@Service("batchManagerService")
public class BatchManagerServiceImpl implements BatchManagerService{

    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * <pre>
     * 1. MethodName : selectBatchListCount
     * 2. ClassName  : BatchManagerServiceImpl.java
     * 3. Comment    : 관리자 > 배치작업 이력
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 5.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectBatchListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("BatchManager.selectBatchListCount",commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectBatchList
     * 2. ClassName  : BatchManagerServiceImpl.java
     * 3. Comment    : 관리자 > 배치작업 이력
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 5.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBatchList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("BatchManager.selectBatchList",commandMap);
    }
    
    
    /**
     * <pre>
     * 1. MethodName : insertBatchInfo
     * 2. ClassName  : BatchManagerServiceImpl.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 5.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertBatchInfo(Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.insert("BatchManager.insertBatchInfo", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : updateBatchStdt
     * 2. ClassName  : BatchManagerServiceImpl.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 5.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateBatchStdt(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.update("BatchManager.updateBatchStdt", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : updateBatchEtdt
     * 2. ClassName  : BatchManagerServiceImpl.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 5.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateBatchEtdt(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.update("BatchManager.updateBatchEtdt", commandMap);
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectBatchExcuteYn
     * 2. ClassName		: BatchManagerServiceImpl.java
     * 3. Commnet		: 배치 스케쥴잡 실행여부 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 11. 19. 오후 5:10:06
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public String selectBatchExcuteYn(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectStr("BatchManager.selectBatchExcuteYn", commandMap);
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectBatchExcuteYnList
     * 2. ClassName		: BatchManagerServiceImpl.java
     * 3. Comment    	: 관리자 > 배치작업 > 배치 스케쥴잡 실행여부 목록
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 11. 19. 오후 6:38:14
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBatchExcuteYnList(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("BATCH_CODE_PRODUCT_EXCEL_UPLOAD", Code.BATCH_CODE_PRODUCT_EXCEL_UPLOAD);

    	return defaultDAO.selectList("BatchManager.selectBatchExcuteYnList",commandMap);
    }

    public int updateBatchExcuteYn(Map<String, Object> commandMap) throws Exception 
    {
		int result = 0;
    	// 스케쥴잡 실행
        if (!StringUtil.getString(commandMap.get("ID_ExcuteYs"),"").equals(""))
        {
            String[] ID_EXCUTE_Y = StringUtil.split(StringUtil.getString(commandMap.get("ID_ExcuteYs"),""), "|"); 
            String[] NM_EXCUTE_Y = StringUtil.split(StringUtil.getString(commandMap.get("NM_ExcuteYs"),""), "|"); 

            for (int i=0; i<ID_EXCUTE_Y.length; i++)
            {
            	String BCH_OPT_ID = StringUtil.replace(ID_EXCUTE_Y[i],"|","").trim();
            	String BCH_OPT_NM = StringUtil.replace(NM_EXCUTE_Y[i],"|","").trim();
            	if (!BCH_OPT_ID.equals(""))
            	{
                    commandMap.put("BCH_OPT_ID", BCH_OPT_ID);
                    commandMap.put("BCH_OPT_NM", BCH_OPT_NM);
                    commandMap.put("BCH_OPT_EXCUTE_YN", "Y");
                    result += defaultDAO.update("BatchManager.updateBatchExcuteYn", commandMap);
            	}
            }
        }
        
    	// 스케쥴잡 중지
        if (!StringUtil.getString(commandMap.get("ID_ExcuteNs"),"").equals(""))
        {
            String[] ID_EXCUTE_N = StringUtil.split(StringUtil.getString(commandMap.get("ID_ExcuteNs"),""), "|"); 
            String[] NM_EXCUTE_N = StringUtil.split(StringUtil.getString(commandMap.get("NM_ExcuteNs"),""), "|"); 

            for (int i=0; i<ID_EXCUTE_N.length; i++)
            {
            	String BCH_OPT_ID = StringUtil.replace(ID_EXCUTE_N[i],"|","").trim();
            	String BCH_OPT_NM = StringUtil.replace(NM_EXCUTE_N[i],"|","").trim();
            	if (!BCH_OPT_ID.equals(""))
            	{
                    commandMap.put("BCH_OPT_ID", BCH_OPT_ID);
                    commandMap.put("BCH_OPT_NM", BCH_OPT_NM);
                    commandMap.put("BCH_OPT_EXCUTE_YN", "N");
                    result += defaultDAO.update("BatchManager.updateBatchExcuteYn", commandMap);
            	}
            }
        }

        return result;
    }
}
