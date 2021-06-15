package com.market.mall.am.product.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.product.service.BrandPointService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;


@Service("brandPointService")
public class BrandPointServiceImpl implements BrandPointService{
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public int insertBrandPoint (HttpServletRequest request, Map<String,Object> commandMap) throws Exception {
	    Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        int result = 0;
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        String [] arrBND_MST_IDX = (String[]) commandMap.get("arrBND_MST_IDX");
        
        String brandPointList = StringUtil.getString(commandMap.get("brandPointList"));
        
        List<Map<String,Object>> brandPointDetailList = mapper.readValue(brandPointList,typeRef);
        
        //defaultDAO.delete("BrandPoint.deleteBrandGroupPoint", commandMap);
        if(!brandPointList.equals("") && brandPointList != null){
   
            for(int index=0; index < brandPointDetailList.size(); index ++){
                
                Map<String,Object> paramMap = new HashMap<String,Object>();
                
                paramMap.put("BND_PIT_REG_IP", request.getRemoteAddr());
                paramMap.put("BND_PIT_REG_ID", admin.getADM_MST_ID());

                
                String bndPitType = StringUtil.getString(brandPointDetailList.get(index).get("BND_PIT_TYPE"),"");
                String bndMstIdx  = StringUtil.getString(brandPointDetailList.get(index).get("BND_MST_IDX"),"");
                String bndPitIdx  = StringUtil.getString(brandPointDetailList.get(index).get("BND_PIT_IDX"),"0");
                String bndPitMinRate  = StringUtil.getString(brandPointDetailList.get(index).get("BND_PIT_MIN_RATE"),"0");
                String bndPitMaxRate  = StringUtil.getString(brandPointDetailList.get(index).get("BND_PIT_MAX_RATE"),"0");
                String bndPitPit      = StringUtil.getString(brandPointDetailList.get(index).get("BND_PIT_PIT"),"0");
                String bndMstBrandType = StringUtil.getString(brandPointDetailList.get(index).get("BND_MST_BRAND_TYPE"),"0");                
                
                
                
                
                
                if ( "NEW".equals(bndPitType) ) {
                	//신규 등록 처리
                    paramMap.put("BND_MST_IDX", bndMstIdx);
                    paramMap.put("BND_PIT_MIN_RATE", bndPitMinRate);
                    paramMap.put("BND_PIT_MAX_RATE", bndPitMaxRate);
                    paramMap.put("BND_PIT_PIT", bndPitPit);
                    paramMap.put("BND_MST_BRAND_TYPE", bndMstBrandType);
                    paramMap.put("BND_PIT_DEL_YN", "N");                    
                    paramMap.put("BND_PIT_REG_IP", request.getRemoteAddr());
                    paramMap.put("BND_PIT_REG_ID", admin.getADM_MST_ID());                    
                    
                    result = result +  defaultDAO.insert("BrandPoint.insertBrandPoint", paramMap);
                	
                }else if ( "UPD".equals(bndPitType) ) {
                	//수정 처리
                    paramMap.put("BND_MST_IDX", bndMstIdx);
                    paramMap.put("BND_PIT_IDX", bndPitIdx);                    
                    paramMap.put("BND_PIT_MIN_RATE", bndPitMinRate);
                    paramMap.put("BND_PIT_MAX_RATE", bndPitMaxRate);
                    paramMap.put("BND_PIT_PIT", bndPitPit);
                    paramMap.put("BND_MST_BRAND_TYPE", bndMstBrandType);
                    paramMap.put("BND_PIT_UPD_IP", request.getRemoteAddr());
                    paramMap.put("BND_PIT_UPD_ID", admin.getADM_MST_ID());
                    result = result +  defaultDAO.update("BrandPoint.updateBrandPoint", paramMap); 	
                    
                }else if ( "DEL".equals(bndPitType) ) {
                	//삭제 처리 ( 논리적 삭제 )
                    paramMap.put("BND_MST_IDX", bndMstIdx);
                    paramMap.put("BND_PIT_IDX", bndPitIdx);
                    paramMap.put("BND_PIT_DEL_YN", "Y");
                    paramMap.put("BND_MST_BRAND_TYPE", bndMstBrandType);
                    paramMap.put("BND_PIT_UPD_IP", request.getRemoteAddr());
                    paramMap.put("BND_PIT_UPD_ID", admin.getADM_MST_ID());
                    result = result +  defaultDAO.update("BrandPoint.deleteBrandPointupd", paramMap); 	
                	
                }
                
                /*

                BND_MST_BRAND_TYPE, 
                BND_PIT_DEL_YN
                paramMap.put("BND_MST_IDX", bndMstIdx);
                paramMap.put("BND_PIT_MIN_RATE", minRate);
                paramMap.put("BND_PIT_MIN_RATE", minRate);
                paramMap.put("BND_PIT_MIN_RATE", minRate);
                paramMap.put("BND_PIT_MIN_RATE", minRate);
                paramMap.put("BND_PIT_MIN_RATE", minRate);                
                
                paramMap.put("BND_PIT_MIN_RATE", minRate);
                paramMap.put("BND_PIT_MAX_RATE", maxRate);
                paramMap.put("BND_PIT_PIT", pointVal);
                paramMap.put("BND_PIT_DEL_YN", delYN);
                
                if(!idx.equals("")){
                    paramMap.put("BND_MST_IDX", idx);
                    paramMap.put("BND_MST_BRAND_TYPE", "I");
                }
                else{
                    //타사 입점사일 경우 모든 브랜드 할인/적립률 설정
                    defaultDAO.delete("BrandPoint.deleteBrandPoint", paramMap);
                    paramMap.put("BND_MST_IDX", idx);
                    paramMap.put("BND_MST_BRAND_TYPE", "O");
                }
                //통합포인트 적립률 목록 등록
                result = defaultDAO.insert("BrandPoint.insertBrandPoint", paramMap);
                */
            }            
        }

	    return result;
	}
	
	/*

	public int insertBrandPoint (HttpServletRequest request, Map<String,Object> commandMap) throws Exception {
	    Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        int result = 0;
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        String [] arrBND_MST_IDX = (String[]) commandMap.get("arrBND_MST_IDX");
        
        String brandPointList = StringUtil.getString(commandMap.get("brandPointList"));
        
        List<Map<String,Object>> brandPointDetailList = mapper.readValue(brandPointList,typeRef);
        
        defaultDAO.delete("BrandPoint.deleteBrandGroupPoint", commandMap);
        if(!brandPointList.equals("") && brandPointList != null){
   
            for(int index=0; index < brandPointDetailList.size(); index ++){
                
                Map<String,Object> paramMap = new HashMap<String,Object>();
                
                paramMap.put("BND_PIT_REG_IP", request.getRemoteAddr());
                paramMap.put("BND_PIT_REG_ID", admin.getADM_MST_ID());
                
                String idx = StringUtil.getString(brandPointDetailList.get(index).get("BND_MST_IDX"),"");
                String minRate = StringUtil.getString(brandPointDetailList.get(index).get("BND_PIT_MIN_RATE"),"");
                String maxRate = StringUtil.getString(brandPointDetailList.get(index).get("BND_PIT_MAX_RATE"),"");
                String pointVal = StringUtil.getString(brandPointDetailList.get(index).get("BND_PIT_PIT"),"");
                String delYN = StringUtil.getString(brandPointDetailList.get(index).get("BND_PIT_DEL_YN"),"N");
                //String brandType = StringUtil.getString(brandPointDetailList.get(index).get("BND_MST_BRAND_TYPE"));
                
                paramMap.put("BND_PIT_MIN_RATE", minRate);
                paramMap.put("BND_PIT_MAX_RATE", maxRate);
                paramMap.put("BND_PIT_PIT", pointVal);
                paramMap.put("BND_PIT_DEL_YN", delYN);
                
                if(!idx.equals("")){
                    paramMap.put("BND_MST_IDX", idx);
                    paramMap.put("BND_MST_BRAND_TYPE", "I");
                }
                else{
                    //타사 입점사일 경우 모든 브랜드 할인/적립률 설정
                    defaultDAO.delete("BrandPoint.deleteBrandPoint", paramMap);
                    paramMap.put("BND_MST_IDX", idx);
                    paramMap.put("BND_MST_BRAND_TYPE", "O");
                }
                //통합포인트 적립률 목록 등록
                result = defaultDAO.insert("BrandPoint.insertBrandPoint", paramMap);
            }            
        }

	    return result;
	}
	 */
	
    //자사 브랜드 리스트
	public List<Map<String, Object>> selectBrandList (Map<String,Object> commandMap) throws Exception {
	    return defaultDAO.selectList("BrandPoint.selectBrandList", commandMap);
	}
	
	public List<Map<String, Object>> selectBrandPointList (HttpServletRequest request, Map<String,Object> commandMap) throws Exception {
	    return defaultDAO.selectList("BrandPoint.selectBrandPointList", commandMap);
	}
	
	public List<Map<String, Object>> selectOtherBrandPointList (Map<String,Object> commandMap) throws Exception {
	    return defaultDAO.selectList("BrandPoint.selectOtherBrandPointList", commandMap);
   }
}
