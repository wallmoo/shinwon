package com.market.mall.mobile.event.service.impl;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.mobile.event.service.PlanService;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.pc.event.service.impl
 * @FileName : PlanServiceImpl.java
 * @Date : 2014. 7. 29.
 * @프로그램 설명 : 프론트 > 기획전을 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("mobilePlanService")
public class PlanServiceImpl implements PlanService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	//PC
	private static final int EVENT_PROSPECS_BANNER_CODE = 304; // 이벤트 프로스팩스 배너 코드
	private static final int EVENT_SKECHERS_BANNER_CODE = 305; // 이벤트 스케쳐스 배너 코드
	private static final int EVENT_MONT_BELL_BANNER_CODE = 306; // 이벤트 몽벨 배너 코드
	private static final int EVENT_JACK_WOLFSKIN_BANNER_CODE = 307; // 이벤트 잭울프스킨 배너 코드
	private static final int EVENT_BICLO_BANNER_CODE = 308; // 이벤트 바이클로 배너 코드
	
	//MOBILE
	private static final int MOBILE_EVENT_PROSPECS_BANNER_CODE = 552; // 이벤트 프로스팩스 배너 코드
	private static final int MOBILE_EVENT_SKECHERS_BANNER_CODE = 553; // 이벤트 스케쳐스 배너 코드
	private static final int MOBILE_EVENT_MONT_BELL_BANNER_CODE = 554; // 이벤트 몽벨 배너 코드
	private static final int MOBILE_EVENT_JACK_WOLFSKIN_BANNER_CODE = 555; // 이벤트 잭울프스킨 배너 코드
	private static final int MOBILE_EVENT_BICLO_BANNER_CODE = 556; // 이벤트 바이클로 배너 코드

	/**
	* <pre>
	* 1. MethodName : selectPlanBrandList
	* 2. ClassName  : PlanServiceImpl.java
	* 3. Comment    : 브랜드 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPlanBrandList(Map<String, Object> commandMap) throws Exception {
	    List<Map<String, Object>> brandList =  defaultDAO.selectList("PcPlan.selectPlanBrandList", commandMap);
	    
	    //모바일 여부
	  	String mobileYn = StringUtil.getString(commandMap.get("mobileYn"),"N");
	  		
	    if(brandList != null){
	    	for(int i=0; i<brandList.size(); i++){
	    		Map<String, Object> brandCdMap = getBannerImgAddr((String) brandList.get(i).get("BRAND_CD"), mobileYn);
	    		brandList.get(i).put("BRAND_BANNER_IMG", brandCdMap.get("brandImg"));
	    	}
	    }
		
		return brandList;
	}

	/**
	* <pre>
	* 1. MethodName : selectPlanListCount
	* 2. ClassName  : PlanServiceImpl.java
	* 3. Comment    : 기획전 개수
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectPlanListCount(Map<String, Object> commandMap)	throws Exception {
		return defaultDAO.selectCount("PcPlan.selectPlanListCount", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : selectPlanList
	* 2. ClassName  : PlanServiceImpl.java
	* 3. Comment    : 기획전 목록
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPlanList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("PcPlan.selectPlanList", commandMap);
	}
	
	public List<Map<String, Object>> selectPlanTopList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PcPlan.selectPlanTopList", commandMap);
    }
	
	/**
	* <pre>
	* 1. MethodName : selectOtherPlanList
	* 2. ClassName  : PlanServiceImpl.java
	* 3. Comment    : 해당 브랜드 다른 기획전 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 30.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOtherPlanList(Map<String, Object> commandMap) throws Exception{
		return defaultDAO.selectList("PcPlan.selectOtherPlanList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectPlanInfo
	* 2. ClassName  : PlanServiceImpl.java
	* 3. Comment    : 기획전 상세 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 30.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPlanInfo (Map<String, Object> commandMap) throws Exception{
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		// 기본정보
		returnMap.put("planInfo",defaultDAO.select("PcPlan.selectPlanInfo", commandMap));
		
		// 상품구성 그룹 목록
        returnMap.put("detailGroupList", defaultDAO.selectList("PcPlan.selectPlanDetailGroupList", commandMap));
        
    	commandMap.put("PRD_MST_SEL_STATE",Code.PRODUCT_SELL_STATE_STOP);
        // 상품구성 그룹의 상품 목록
        returnMap.put("detailList", defaultDAO.selectList("PcPlan.selectPlanDetailList", commandMap));
		
		return returnMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectPlanBannerList
	* 2. ClassName  : PlanServiceImpl.java
	* 3. Comment    : 기획전 배너 리스트 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 30.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPlanBannerList (Map<String, Object> commandMap) throws Exception{
		//String PLN_MST_BRAND_CD = StringUtil.getString(commandMap.get("PLN_MST_BRAND_CD"),"");
		
		//모바일 여부
		String mobileYn = StringUtil.getString(commandMap.get("mobileYn"),"N");
		
		//이벤트 브랜드별 배너 코드 가져오기
		//Map<String, Object> returnMap = getBannerImgAddr(PLN_MST_BRAND_CD, mobileYn);
		//commandMap.put("CMN_COM_IDX", returnMap.get("brandBannerCode")); //브랜드 코드
		
		return defaultDAO.selectList("PcPlan.selectPlanBannerList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectPlanProductListCount
	* 2. ClassName  : PlanServiceImpl.java
	* 3. Comment    : 기획전 상세 상품 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 30.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectPlanProductListCount (Map<String, Object> commandMap) throws Exception{
		return defaultDAO.selectCount("PcPlan.selectPlanProductListCount", commandMap);
	}
	/**
	* <pre>
	* 1. MethodName : selectPlanProductList
	* 2. ClassName  : PlanServiceImpl.java
	* 3. Comment    : 기획전 상세 상품리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 30.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPlanProductList (Map<String, Object> commandMap) throws Exception{
		return defaultDAO.selectList("PcPlan.selectPlanProductList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectSubCategoryList
	* 2. ClassName  : PlanServiceImpl.java
	* 3. Comment    : 브랜드별 하위 카테고리 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 30.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSubCategoryList(Map<String, Object> commandMap) throws Exception{
		return defaultDAO.selectList("PcPlan.selectSubCategoryList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : getBannerImgAddr
	* 2. ClassName  : PlanServiceImpl.java
	* 3. Comment    : 브랜드별 이미지 가져오기 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 29.
	* </pre>
	*
	* @param brandCd
	* @return
	*/
	private Map<String, Object> getBannerImgAddr(String brandCd, String mobileYn){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String brandImg = "";
		int brandBannerCode = 0;
		
		if(mobileYn.equals("Y")){
			if(brandCd.equals("P")){
				brandImg = "/pc/img/custom/brand_04.png";
				brandBannerCode = MOBILE_EVENT_PROSPECS_BANNER_CODE;
			}else if(brandCd.equals("M")){
				brandImg = "/pc/img/custom/brand_02.png";
				brandBannerCode = MOBILE_EVENT_MONT_BELL_BANNER_CODE;
			}else if(brandCd.equals("J")){
				brandImg = "/pc/img/custom/brand_05.png";
				brandBannerCode = MOBILE_EVENT_JACK_WOLFSKIN_BANNER_CODE;
			}else if(brandCd.equals("S")){
				brandImg = "/pc/img/custom/brand_03.png";
				brandBannerCode = MOBILE_EVENT_SKECHERS_BANNER_CODE;
			}else if(brandCd.equals("B")){
				brandImg = "/pc/img/custom/brand_01.png";
				brandBannerCode = MOBILE_EVENT_BICLO_BANNER_CODE;
			}
		}else{
			if(brandCd.equals("P")){
				//brandImg = "/pc/img/second/ps_logo_225.png";
				brandImg = "/pc/img/custom/brand_04.png";
				brandBannerCode = EVENT_PROSPECS_BANNER_CODE;
			}else if(brandCd.equals("M")){
				//brandImg = "/pc/img/second/mb_logo_225.png";
				brandImg = "/pc/img/custom/brand_02.png";
				brandBannerCode = EVENT_MONT_BELL_BANNER_CODE;
			}else if(brandCd.equals("J")){
				//brandImg = "/pc/img/second/jw_logo_225.png";
				brandImg = "/pc/img/custom/brand_05.png";
				brandBannerCode = EVENT_JACK_WOLFSKIN_BANNER_CODE;
			}else if(brandCd.equals("S")){
				//brandImg = "/pc/img/second/sk_logo_225.png";
				brandImg = "/pc/img/custom/brand_03.png";
				brandBannerCode = EVENT_SKECHERS_BANNER_CODE;
			}else if(brandCd.equals("B")){
				//brandImg = "/pc/img/second/bi_logo_225.png";
				brandImg = "/pc/img/custom/brand_01.png";
				brandBannerCode = EVENT_BICLO_BANNER_CODE;
			}
		}
		
		returnMap.put("brandImg", brandImg);
		returnMap.put("brandBannerCode", brandBannerCode);
		
		return returnMap;
	}

	/**
	* <pre>
	* 1. MethodName : selectEventProductCategoryList
	* 2. ClassName  : PlanServiceImpl.java
	* 3. Comment    : 브랜드별 하위 카테고리 (모바일용)
	* 4. 작성자       : 이미정
	* 5. 작성일       : 2014. 12. 16.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEventProductCategoryList(Map<String, Object> commandMap) throws Exception{
		return defaultDAO.selectList("PcPlan.selectEventProductCategoryList", commandMap);
	}
}
