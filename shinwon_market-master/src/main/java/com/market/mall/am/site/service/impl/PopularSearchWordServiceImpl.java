package com.market.mall.am.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.site.service.PopularSearchWordService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;


/**
 * @PackageName: com.market.mall.am.site.service.impl
 * @FileName : PopularSearchWordServiceImpl.java
 * @Date : 2016. 8. 21.
 * @프로그램 설명 : 관리자 > 사이트관리 > 인기 검색어 관리를 처리하는 Service Implement Class
 * @author DEV_LEESANGWOOK
 */
@Service("popularSearchWordService")
public class PopularSearchWordServiceImpl implements PopularSearchWordService {
    
    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;
 
    /**
     * <pre>
     * 1. MethodName : selectPopularSearchWordListCount
     * 2. ClassName  : PopularSearchWordServiceImpl.java
     * 3. Comment    : 관리자 > 사이트관리 > 인기 검색어 개수
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPopularSearchWordListCount(Map<String,Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("PopularSearchWord.selectPopularSearchWordListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : insertPopularSearchWord
     * 2. ClassName  : PopularSearchWordServiceImpl.java
     * 3. Comment    : 관리자 > 사이트관리 > 인기검색어 등록
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 21.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertPopularSearchWord(HttpServletRequest request, Map<String,Object> commandMap) throws Exception
    {
        int result = 0;
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("PPL_WRD_REG_IP", request.getRemoteAddr()); //등록 IP
        commandMap.put("PPL_WRD_REG_ID", admin.getADM_MST_ID()); //등록 관리자 ID
        
        commandMap.put("PPL_WRD_HIS_REG_IP", request.getRemoteAddr()); //등록이력 -  IP
        commandMap.put("PPL_WRD_HIS_REG_ID", admin.getADM_MST_ID()); //등록이력 - 관리자ID
        
        String[] pplWordSorts = request.getParameterValues("PPL_WRD_SORT"); //인기검색어 순위
        String[] pplWordTexts = request.getParameterValues("PPL_WRD_TEXT"); //검색어 text
        
        for(int i=0; i< pplWordSorts.length; i++)
        {
            
            String pplWordIconHot = StringUtil.getString(commandMap.get("PPL_WRD_ICON_HOT_"+i),"");
            String pplWordIconNew = StringUtil.getString(commandMap.get("PPL_WRD_ICON_NEW_"+i),"");
            String pplWordUseYn = StringUtil.getString(commandMap.get("PPL_WRD_USE_YN_"+i), ""); //사용유무 (Yes , No 구분) 라디오버튼
            if(pplWordIconHot.equals("on")){
                pplWordIconHot = "Y";
            }
            
            if(pplWordIconNew.equals("on")){
                pplWordIconNew = "Y";
            }
            
            if(pplWordSorts[i] != "")
            {
                commandMap.put("PPL_WRD_SORT", pplWordSorts[i]);
                commandMap.put("PPL_WRD_TEXT", pplWordTexts[i]);
                commandMap.put("PPL_WRD_ICON_HOT", pplWordIconHot);
                commandMap.put("PPL_WRD_ICON_NEW", pplWordIconNew);
                commandMap.put("PPL_WRD_USE_YN", pplWordUseYn);
                
                result = defaultDAO.insert("PopularSearchWord.insertPopularSearchWord", commandMap); //인기검색어 등록
            }
        }
        
        if(result>0){
            for(int i=0; i< pplWordSorts.length; i++)
            {
                String pplWordIconHot = StringUtil.getString(commandMap.get("PPL_WRD_ICON_HOT_"+i),"");
                String pplWordIconNew = StringUtil.getString(commandMap.get("PPL_WRD_ICON_NEW_"+i),"");
                String pplWordUseYn = StringUtil.getString(commandMap.get("PPL_WRD_USE_YN_"+i), ""); //사용유무 (Yes , No 구분) 라디오버튼
                if(pplWordIconHot.equals("on")){
                    pplWordIconHot = "Y";
                }
                
                if(pplWordIconNew.equals("on")){
                    pplWordIconNew = "Y";
                }
                
                if(pplWordSorts[i] != "")
                {
                    commandMap.put("PPL_WRD_HIS_SORT", pplWordSorts[i]);
                    commandMap.put("PPL_WRD_HIS_TEXT", pplWordTexts[i]);
                    commandMap.put("PPL_WRD_HIS_ICON_HOT", pplWordIconHot);
                    commandMap.put("PPL_WRD_HIS_ICON_NEW", pplWordIconNew);
                    commandMap.put("PPL_WRD_HIS_USE_YN", pplWordUseYn);
                    
                    defaultDAO.insert("PopularSearchWord.insertPopularSearchWordHis", commandMap); //인기검색어 이력 등록
                }
            }
        }
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : updatePopularSearchWord
     * 2. ClassName  : PopularSearchWordServiceImpl.java
     * 3. Comment    : 관리자 > 사이트관리 > 인기검색어 수정 , 인기검색어 등록 이력
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 21.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePopularSearchWord(HttpServletRequest request, Map<String,Object> commandMap) throws Exception
    {
        int result = 0;
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("PPL_WRD_UPD_IP", request.getRemoteAddr());
        commandMap.put("PPL_WRD_UPD_ID", admin.getADM_MST_ID());
        
        commandMap.put("PPL_WRD_HIS_REG_IP", request.getRemoteAddr());
        commandMap.put("PPL_WRD_HIS_REG_ID", admin.getADM_MST_ID());
        
        String[] pplWordSorts = request.getParameterValues("PPL_WRD_SORT");
        String[] pplWordTexts = request.getParameterValues("PPL_WRD_TEXT");
        String[] pplWordIdxs = request.getParameterValues("PPL_WRD_IDX");
        String[] pplWordHitCnt = request.getParameterValues("PPL_WRD_HIT_CNT");
            
        for(int i=0; i< pplWordIdxs.length; i++)
        {
            String pplWordIconHot = StringUtil.getString(commandMap.get("PPL_WRD_ICON_HOT_"+i),"");
            String pplWordIconNew = StringUtil.getString(commandMap.get("PPL_WRD_ICON_NEW_"+i),"");
            String pplWordUseYn = StringUtil.getString(commandMap.get("PPL_WRD_USE_YN_"+i), "");
            
            if(pplWordIconHot.equals("on")){
                pplWordIconHot = "Y";
            }
            
            if(pplWordIconNew.equals("on")){
                pplWordIconNew = "Y";
            }
            
            if(pplWordIdxs[i] != "")
            {
                commandMap.put("PPL_WRD_SORT", pplWordSorts[i]);
                commandMap.put("PPL_WRD_IDX", pplWordIdxs[i]);
                commandMap.put("PPL_WRD_TEXT", pplWordTexts[i]);
                commandMap.put("PPL_WRD_ICON_HOT", pplWordIconHot);
                commandMap.put("PPL_WRD_ICON_NEW", pplWordIconNew);
                commandMap.put("PPL_WRD_USE_YN", pplWordUseYn);
                result = defaultDAO.update("PopularSearchWord.updatePopularSearchWord", commandMap); //검색어 수정
            }
        }
        
        if(result >0){
            for(int i=0; i< pplWordIdxs.length; i++)
            {
                
                String pplWordIconHot = StringUtil.getString(commandMap.get("PPL_WRD_ICON_HOT_"+i),"");
                String pplWordIconNew = StringUtil.getString(commandMap.get("PPL_WRD_ICON_NEW_"+i), "");
                String pplWordUseYn = StringUtil.getString(commandMap.get("PPL_WRD_USE_YN_"+i), "");
                if(pplWordIconHot.equals("on")){
                    pplWordIconHot = "Y";
                }
                
                if(pplWordIconNew.equals("on")){
                    pplWordIconNew = "Y";
                }
                
                if(pplWordIdxs[i] != "")
                {
                    commandMap.put("PPL_WRD_HIS_SORT", pplWordSorts[i]);
                    commandMap.put("PPL_WRD_HIS_IDX", pplWordIdxs[i]);
                    commandMap.put("PPL_WRD_HIS_TEXT", pplWordTexts[i]);
                    commandMap.put("PPL_WRD_HIS_HIT_CNT",pplWordHitCnt[i] );
                    commandMap.put("PPL_WRD_HIS_ICON_HOT", pplWordIconHot);
                    commandMap.put("PPL_WRD_HIS_ICON_NEW", pplWordIconNew);
                    commandMap.put("PPL_WRD_HIS_USE_YN", pplWordUseYn);
                    
                   
                    defaultDAO.insert("PopularSearchWord.insertPopularSearchWordHis", commandMap); //검색어 이력 등록
                }
            }
        }
        return result;
    }

    /**
     * <pre>
     * 1. MethodName : selectPopularSearchWordList
     * 2. ClassName  : PopularSearchWordServiceImpl.java
     * 3. Comment    : 관리자 >   사이트관리 > 인기검색어 목록보기
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String,Object>> selectPopularSearchWordList(Map<String,Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("PopularSearchWord.selectPopularSearchWordList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectPcPopSearcWordList
     * 2. ClassName  : PopularSearchWordServiceImpl.java
     * 3. Comment    : 프론트(top) > 검색 > 인기검색어 목록 
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 23.
     * </pre>
     *
     * @param request
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String,Object>> selectPcPopSearcWordList(HttpServletRequest request) throws Exception
    {
        return defaultDAO.selectList("PopularSearchWord.selectPcPopSearcWordList", request);
    }
    
    /**
     * <pre>
     * 1. MethodName : updatePopularSearchWordHit
     * 2. ClassName  : PopularSearchWordServiceImpl.java
     * 3. Comment    :  프론트(top) > 검색 > 인기검색어 목록에서 하나 선택 > 조회수 증가
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 23.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePopularSearchWordHit(HttpServletRequest request, Map<String,Object> commandMap) throws Exception
    {
        int result = 0;
        result = defaultDAO.update("PopularSearchWord.updatePopularSearchWordHit", commandMap);
       
        return result;
    }
  
    /**
     * <pre>
     * 1. MethodName : selectPopSearchWordInfo
     * 2. ClassName  : PopularSearchWordServiceImpl.java
     * 3. Comment    : 프론트(top) > 검색 > 인기검색어 목록에서 하나 선택 > 해당 검색어 조회
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectPopSearchWordInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> popInfo = defaultDAO.select("PopularSearchWord.selectPopSearchWordInfo", commandMap);
        return popInfo;
    }
}
