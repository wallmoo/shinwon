package com.market.mall.am.marketing.service.impl;

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

import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.marketing.service.ChannelService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.marketing.service.impl
 * @FileName : ChannelServiceImpl.java
 * @Date : 2015. 12. 01.
 * @프로그램 설명 : 관리자 > 프로모션관리 > 채널관리를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("channelService")
public class ChannelServiceImpl implements ChannelService{

    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
    * <pre>
    * 1. MethodName : selectChannelCodeList
    * 2. ClassName  : ChannelServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션관리 > 채널관리 채널 코드 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 01.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectChannelCodeList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("Channel.selectSubCodeList",commandMap);
    }
    
    
    /**
    * <pre>
    * 1. MethodName : selectChannelList
    * 2. ClassName  : ChannelServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션관리 > 채널관리 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 01.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectChannelList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("Channel.selectChannelList", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectChannelMst
     * 2. ClassName  : ChannelServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 대표체널상세정보 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 01.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public Map<String, Object> selectChannelMst (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.select("Channel.selectChannelMst", commandMap);
     }
    
    /**
    * <pre>
    * 1. MethodName : selectChannelInfo
    * 2. ClassName  : ChannelServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션관리 > 채널정보수정팝업 조회 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 01.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectChannelInfo (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.select("Channel.selectChannelInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertChannelMst
    * 2. ClassName  : ChannelServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션관리 > 대표채널 등록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 01.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int insertChannelMst (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("CHN_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("CHN_MST_REG_ID", admin.getADM_MST_ID());
        
        // 배너관리 등록
        result = defaultDAO.insert("Channel.insertChannelMst", commandMap);
        
        return result;
        
    }
    
    /**
     * <pre>
     * 1. MethodName : insertChannel
     * 2. ClassName  : ChannelServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션관리 > 하위채널 등록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 01.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings({ "rawtypes", "unchecked" })
     public int insertChannel (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
     {
         int result = 0;
         
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         commandMap.put("CHN_DTL_REG_IP", request.getRemoteAddr());
         commandMap.put("CHN_DTL_REG_ID", admin.getADM_MST_ID());
         
         // 배너관리 등록
         result = defaultDAO.insert("Channel.insertChannel", commandMap);
         
         return result;
         
     }
    
    /**
    * <pre>
    * 1. MethodName : updateChannel
    * 2. ClassName  : ChannelServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션관리 > 하위채널 수정 
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
    public int updateChannel (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
    	int result;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("CHN_DTL_UPD_IP", request.getRemoteAddr());
        commandMap.put("CHN_DTL_UPD_ID", admin.getADM_MST_ID());
        
        result = defaultDAO.update("Channel.updateChannel", commandMap);
        return result;
 
    }
    
    
   
}
