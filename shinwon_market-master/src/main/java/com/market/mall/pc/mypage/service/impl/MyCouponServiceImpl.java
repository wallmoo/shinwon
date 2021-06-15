package com.market.mall.pc.mypage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.epasscni.common.exception.AccreditationException;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.DbCryptoUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.pc.mypage.service.MyCouponService;

import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * 
 * @PackageName: com.market.mall.pc.mypage.service.impl
 * @FileName : MyCouponServiceImpl.java
 * @Date : 2014. 7. 10.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 쿠폰함을 처리하는 Service Implement Class
 * @author LJH
 */
@Service("pcMyCouponService")
public class MyCouponServiceImpl implements MyCouponService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name ="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    
    /**
    * <pre>
    * 1. MethodName : selectProductCouponList
    * 2. ClassName : MyCouponServiceImpl.java
    * 3. Comment : 상품에 1:1 걸려있는 쿠폰
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 21.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductCouponList(HttpServletRequest request,Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcMyCoupon.selectProductCouponList",commandMap);
    }
    
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectCouponUsedListCount
     * 2. ClassName		: MyCouponServiceImpl.java
     * 3. Comment    	: 프론트 > 마이페이지 > 마이쇼핑 > 쿠폰사용내역 갯수
	 * 4. 작성자			: 이원중
	 * 5. 작성일			: 2020.06.19 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCouponListCount(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectCount("PcMyCoupon.selectCouponListCount",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectCouponUsedList
     * 2. ClassName		: MyCouponServiceImpl.java
     * 3. Comment    	: 프론트 > 마이페이지 > 마이쇼핑 > 쿠폰사용내역 목록 
	 * 4. 작성자			: 이원중
	 * 5. 작성일			: 2020.06.19 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCouponList(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("PcMyCoupon.selectCouponList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCouponUsableTotalCount
    * 2. ClassName : MyCouponServiceImpl.java
    * 3. Comment : 등급쿠폰 , 특별쿠폰 갯수
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 6.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectCouponUsableTotalCount(HttpServletRequest request,Map<String, Object> commandMap) throws Exception {
    	
    	return this.defaultDAO.select("PcMyCoupon.selectCouponUsableTotalCount", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectShpCouponCount
    * 2. ClassName : MyCouponServiceImpl.java
    * 3. Comment : 제휴카드 등록여부
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 6.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectShpCouponInfo(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.select("PcMyCoupon.selectShpCouponInfo",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertShpCoupon
    * 2. ClassName : MyCouponServiceImpl.java
    * 3. Comment : 제휴쿠폰 등록
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 6.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertShpCoupon(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.insert("PcMyCoupon.insertShpCoupon",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertDwnCoupon
    * 2. ClassName : MyCouponServiceImpl.java
    * 3. Comment : 다운로드 쿠폰 발급
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 21.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
	public Map<String, Object> insertDwnCoupon(Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        
        String [] arrCPN_MST_IDXs = (String[]) commandMap.get("arrCPN_MST_IDX");
        
    	int shpCpnCnt = 0;
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	String returnState = "N";
    	int returnCouCnt = 0;

    	for(String CPN_MST_IDX : arrCPN_MST_IDXs){
        	commandMap.put("CPN_MST_IDX", CPN_MST_IDX);
        	//발급 된 쿠폰인지 확인
        	shpCpnCnt = defaultDAO.selectCount("PcMyCoupon.selectRegisteredCouponCount",commandMap);
        	if(shpCpnCnt > 0){
        		returnState = "Y";
        		returnCouCnt ++;
        	}else{
        		result = defaultDAO.insert("PcMyCoupon.insertDwnCoupon",commandMap);
        	}
        	System.out.println("returnState========================"+returnState);
        }
    	
        resultMap.put("totCnt",arrCPN_MST_IDXs.length);
        resultMap.put("returnState", returnState);
        resultMap.put("returnCouCnt", returnCouCnt);
        resultMap.put("result", result);
    	return resultMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCouponProductCount
    * 2. ClassName : MyCouponServiceImpl.java
    * 3. Comment : 적용상품 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCouponProductCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("PcMyCoupon.selectCouponProductCount",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCouponProductList
    * 2. ClassName : MyCouponServiceImpl.java
    * 3. Comment : 쿠폰 적용상품 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCouponProductList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcMyCoupon.selectCouponProductList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCouponBrandCount
    * 2. ClassName : MyCouponServiceImpl.java
    * 3. Comment : 쿠폰 적용 브랜드 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCouponBrandCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("PcMyCoupon.selectCouponBrandCount",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCouponBrandList
    * 2. ClassName : MyCouponServiceImpl.java
    * 3. Comment : 쿠폰 적용 브랜드 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCouponBrandList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcMyCoupon.selectCouponBrandList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCouponPlanCount
    * 2. ClassName : MyCouponServiceImpl.java
    * 3. Comment : 쿠폰 적용 기획전 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCouponPlanCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("PcMyCoupon.selectCouponPlanCount",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCouponPlanList
    * 2. ClassName : MyCouponServiceImpl.java
    * 3. Comment : 쿠폰 적용 기획전 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCouponPlanList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcMyCoupon.selectCouponPlanList",commandMap);
    }
    
    
    public Map<String, Object> selectProductDetailCoupon(Map<String, Object> commandMap) throws Exception{
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        List<Map<String, Object>> couponList = defaultDAO.selectList("PcMyCoupon.selectProductDetailCoupon", commandMap);
        if(couponList.isEmpty() || couponList.size()==0){
            return returnMap;
        }
        
        int min = StringUtil.getInt(couponList.get(0).get("RESULT_CPN_PRICE"));
        int idx = 0;
        for(int index=0; index < couponList.size(); index++){
            int salePrice = StringUtil.getInt(couponList.get(index).get("RESULT_CPN_PRICE"));
            if(min > salePrice){
                min = salePrice;
                idx = index;
            }
        }
        returnMap.put("couponInfo", couponList.get(idx));
        
        return returnMap;
    }

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, String> registPaperCoupon(HttpServletRequest request, Map<String, Object> commandMap) {
		commandMap.put("CPN_PTN_SHP_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
   	 	commandMap.put("CPN_PTN_SHP_REG_IP", request.getRemoteAddr());
   	 
   	 	String CPN_MEM_ISU_CNL = Code.CPN_MEM_ISU_CNL_PC;
   	 	String browser = request.getHeader("User-Agent");
		if (browser.indexOf("Android") > 0 || browser.indexOf("iPhone") > 0) { 
			CPN_MEM_ISU_CNL = Code.CPN_MEM_ISU_CNL_APP;
		}
		commandMap.put("CPN_MEM_ISU_CNL", CPN_MEM_ISU_CNL);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		Map<String, Object> chkMap;
		try {
			chkMap = defaultDAO.select("Ecoupon.checkOfflineCoupon",commandMap);
			if("".equals(StringUtil.getString(chkMap.get("CPN_PTN_SHP_USE_YN"), ""))) {
				resultMap.put("msg", "쿠폰 번호를 확인해주세요.");
			}else if(chkMap.get("CPN_PTN_SHP_USE_YN").equals("Y")) {
				resultMap.put("msg", "이미 등록된 쿠폰 번호입니다.");
			}else {
				defaultDAO.update("Ecoupon.registOfflineCoupon",commandMap);
				resultMap.put("result", "success");
				resultMap.put("msg", "쿠폰이 등록되었습니다.");
				return resultMap;
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			resultMap.put("msg", "오류가 발생했습니다.");
		}
		
		resultMap.put("result", "fail");
		return resultMap;
	}
	
	/**
	 * <pre>
     * 1. MethodName : selectCouponPlanList
     * 2. ClassName : MyCouponService.java
     * 3. Comment : 프론트 > 주문 > 주문서 > 쿠폰사용 초기화 
     * 4. 작성일 : 2020. 6. 27.
     * </pre>
	 * 
	 * @param commandMap
	 * @throws Exception
	 */
	public void updateCpnReset(Map<String, Object> commandMap)throws Exception {
		defaultDAO.update("PcMyCoupon.updateCpnReset",commandMap);
	}
	
	/**
	 * 
	 * <pre>
     * 1. MethodName : selectCouponPlanList
     * 2. ClassName : MyCouponService.java
     * 3. Comment : 프론트 > 주문 > 상품쿠폰 팝업 > 쿠폰리스트 조회 
     * 4. 작성일 : 2020. 6. 26.
     * </pre> 
	 * 
	 * @param selectCpnMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String ,Object>> selectProdCpnProcAjax(Map<String ,Object> selectCpnMap) throws Exception {
		return defaultDAO.selectList("PcMyCoupon.selectProdCpnProcAjax",selectCpnMap); 
	}
	
	/**
	 *  <pre>
     * 1. MethodName : selectCouponPlanList
     * 2. ClassName : MyCouponService.java
     * 3. Comment : 프론트 > 주문 > 상품쿠폰 팝업 > 주문서에서 쿠폰사용 UPDATE 
     * 4. 작성일 : 2020. 6. 27.
     * </pre>
     * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public boolean cpnUseUpdateProc(Map<String, Object> commandMap) throws Exception {
		boolean check = false;
		int updateVal = defaultDAO.update("PcMyCoupon.cpnUseUpdateProc",commandMap);
		if(updateVal>0) {
			check = true;
		}
		return check;
	}
	

}
