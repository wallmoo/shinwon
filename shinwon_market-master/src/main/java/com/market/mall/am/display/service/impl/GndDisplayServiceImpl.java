package com.market.mall.am.display.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.am.display.service.GnbDisplayService;
import com.market.mall.dao.CommonDefaultDAO;

@Service("gnbDisplayService")
public class GndDisplayServiceImpl implements GnbDisplayService {

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectGnbDisplayList(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("GnbDisplay.selectGnbDisplayList",commandMap);
    }

	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSubGnbDisplayList(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("GnbDisplay.selectSubGnbDisplayList",commandMap);
    }
	
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectGnbDisplayView(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.select("GnbDisplay.selectGnbDisplayInfo",commandMap);
    }

    public int insertGnbDisplay(Map<String, Object> commandMap) throws Exception{
        int result = 0;
        
        result = defaultDAO.insert("GnbDisplay.insertGnbDisplay",commandMap);

        return result;
    }

    public int updateGnbDisplay(Map<String, Object> commandMap) throws Exception{
    	int result = 0;
        //하위 카테고리 정렬 수정
        String [] DSP_GNB_IDXs = (String[]) commandMap.get("DSP_GNB_IDXs");

        if (DSP_GNB_IDXs != null){
            int cnt = DSP_GNB_IDXs.length;
            if (cnt > 0){
                for(int i=0;i<cnt;i++){
                	Map<String, Object> paramMap = new HashMap<String, Object>();
                	paramMap.put("DSP_GNB_IDX", DSP_GNB_IDXs[i]);
                	paramMap.put("DSP_GNB_SORT", (i+1));
                	paramMap.put("DSP_GNB_UPD_IP", commandMap.get("DSP_GNB_UPD_IP"));
                	paramMap.put("DSP_GNB_UPD_ID", commandMap.get("DSP_GNB_UPD_ID"));
                    result = defaultDAO.update("GnbDisplay.updateGnbDisplaySort", paramMap);
                }
            }
        }else {
        	if(commandMap.get("DSP_GNB_IDX") == null) {
        		return result;
        	}
        	Map<String, Object> paramMap = new HashMap<String, Object>();
        	paramMap.put("DSP_GNB_IDX", commandMap.get("DSP_GNB_IDX"));
        	paramMap.put("DSP_GNB_NM", commandMap.get("DSP_GNB_NM"));
        	paramMap.put("DSP_GNB_UPD_IP", commandMap.get("DSP_GNB_UPD_IP"));
        	paramMap.put("DSP_GNB_UPD_ID", commandMap.get("DSP_GNB_UPD_ID"));
        	paramMap.put("DSP_GNB_DSP_YN", commandMap.get("DSP_GNB_DSP_YN"));
            result = defaultDAO.update("GnbDisplay.updateGnbDisplay", paramMap);
        }
        
        return result;
    }
    
    public int deleteGnbDisplay(Map<String, Object> commandMap) throws Exception{
        int result = 0;

        //카테고리 설정값 수정; result는 0 일 수도 있음
        result = defaultDAO.update("GnbDisplay.deleteGnbDisplay",commandMap);
        
        if(result > 0){
        	defaultDAO.update("GnbDisplay.deleteGnbSpecAll",commandMap); // 카테고리에 속한 스펙 삭제
        }

        return result;
    }
    
    public int insertGnbSpec(Map<String, Object> commandMap) throws Exception{
        int result = 0;
        result = defaultDAO.insert("GnbDisplay.insertGnbSpec",commandMap);
        return result;
    }
    
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSpecGnbList(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("GnbDisplay.selectSpecGnbList",commandMap);
    }
	
    public int deleteGnbSpec(Map<String, Object> commandMap) throws Exception{
        int result = 0;

        //카테고리 설정값 수정; result는 0 일 수도 있음
        result = defaultDAO.update("GnbDisplay.deleteGnbSpec",commandMap);

        return result;
    }
    
    public int selectGnbSpecCount(Map<String, Object> commandMap) throws Exception{
        int result = 0;

        //카테고리 설정값 수정; result는 0 일 수도 있음
        result = defaultDAO.selectCount("GnbDisplay.selectGnbSpecCount",commandMap);

        return result;
    }
}
