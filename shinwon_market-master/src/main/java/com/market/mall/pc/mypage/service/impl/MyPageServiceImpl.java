package com.market.mall.pc.mypage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.common.exception.AccreditationException;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.DbCryptoUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyShoppingService;
import com.market.util.StringUtils;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.mypage.service.impl
 * @FileName : MyPageServiceImpl.java
 * @Date : 2014. 7. 8.
 * @프로그램 설명 : 프론트 > 마이페이지를 처리하는 Service Implement Class
 * @author LJH
 */
@Service("pcMyPageService")
public class MyPageServiceImpl implements MyPageService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name="pcMyShoppingService") 
    private MyShoppingService myShoppingService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    
    /**
     * <pre>
     * 1. MethodName : selectMyPageSummary
     * 2. ClassName  : MyPageServiceImpl.java
     * 3. Comment    : 프론트 > 마이페이지 요약정보 
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 9. 1.
     * </pre>
     *
     * @param request   
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectMyPageSummary(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	if(!"".equals(StringUtil.getString(SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"),""))){
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("IGNO_ORD_PRD_ORD_STATE", Code.OST_SWAP_IGNORE_ARR);	 // 교환관련 주문상태
    		commandMap.put("ORD_PRD_ORD_STATE", Code.OST_FIX);	                 // 구매확정
    		commandMap.put("MEM_MST_MEM_GBN", Code.COMMON_PRI_MEMBER_GRADE);	 // 개인회원
            
        	resultMap = defaultDAO.select("PcMyPage.selectMyPageSummary",commandMap);
    	}
    	
    	return resultMap;
    }
    
    public Map<String, Object> selectMyPageTotCnt(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	if(!"".equals(StringUtil.getString(SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"),""))){
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("IGNO_ORD_PRD_ORD_STATE", Code.OST_SWAP_IGNORE_ARR);	 // 교환관련 주문상태
    		commandMap.put("ORD_PRD_ORD_STATE", Code.OST_FIX);	                 // 구매확정
    		commandMap.put("MEM_MST_MEM_GBN", Code.COMMON_PRI_MEMBER_GRADE);	 // 개인회원
            
        	resultMap = defaultDAO.select("PcMyPage.selectMyPageTotCnt",commandMap);
    	}   	
    	return resultMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectMyPageOrderListCount
    * 2. ClassName  : MyPageServiceImpl.java
    * 3. Comment    : 프론트 > 마이페이지 > 메인 (주문내역 개수) 
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMyPageOrderListCount(Map<String, Object> commandMap) throws Exception 
    {
    	this.myShoppingService.setOrderState(commandMap);
        return defaultDAO.selectCount("PcMyPage.selectMyPageOrderListCount",commandMap);
    }

    public int restockNotificationListCount(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectCount("PcMyShopping.restockNotificationListCount",commandMap);
    }    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPageOrderList
     * 2. ClassName		: MyPageServiceImpl.java
     * 3. Commnet		: 프론트 > 마이페이지 > 메인 (주문내역)
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 14. 오후 1:52:54
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMyPageOrderList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcMyPage.selectMyPageOrderList",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPageCancelBackCount
     * 2. ClassName		: MyPageServiceImpl.java
     * 3. Commnet		: 프론트 > 마이페이지 > 메인 (취소/반품/교환 현황)
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 14. 오후 5:01:02
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectMyPageCancelBackCount(Map<String, Object> commandMap) throws Exception 
    {
        commandMap.put("OST_CANCEL", Code.OST_CANCEL);
        commandMap.put("OST_BACK", Code.OST_BACK);
        commandMap.put("OST_SWAP", Code.OST_SWAP);

        return defaultDAO.select("PcMyPage.selectMyPageCancelBackCount",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPageMyInfo
     * 2. ClassName		: MyPageServiceImpl.java
     * 3. Commnet		: 프론트 > 마이페이지 > 메인 (나의 정보)
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 14. 오후 5:32:20
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectMyPageMyInfo(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.select("PcMyPage.selectMyPageMyInfo",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPageInquiryList
     * 2. ClassName		: MyPageServiceImpl.java
     * 3. Commnet		: 프론트 > 마이페이지 > 메인 (나의 문의내역)
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 14. 오후 3:14:02
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMyPageInquiryList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcMyPage.selectMyPageInquiryList",commandMap);
    }

    
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMyPageLikList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcMyPage.selectMyPageLikList",commandMap);
    }

    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMyPageOotdList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcMyPage.selectMyPageOotdList",commandMap);
    }
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> restockNotificationList(Map<String, Object> commandMap) throws Exception  
    {
        return defaultDAO.selectList("PcMyShopping.restockNotificationList",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPageCartList
     * 2. ClassName		: MyPageServiceImpl.java
     * 3. Commnet		: 프론트 > 마이페이지 > 메인 (장바구니)
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 14. 오후 4:32:52
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMyPageCartList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcMyPage.selectMyPageCartList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectProductInquiryList
    * 2. ClassName : MyPageServiceImpl.java
    * 3. Comment : 프론트 > 마이페이지 > 메인 (상품Q&A)
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 5. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProductInquiryList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcMyPage.selectProductInquiryList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectMyPageOrderInfo
    * 2. ClassName  : MyPageServiceImpl.java
    * 3. Comment    : 프론트 > 마이페이지 > 메인 (배송현황)
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectMyPageOrderInfo (Map<String, Object> commandMap) throws Exception
    {
    	this.myShoppingService.setOrderState(commandMap);
    	return defaultDAO.select("PcMyPage.selectMyPageOrderInfo",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectKingerCount
    * 2. ClassName  : MyPageServiceImpl.java
    * 3. Comment    : 프론트 > 마이페이지 > 메인(킹저 여부)
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectKingerCount (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.selectCount("PcMyPage.selectKingerCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectkingerProductCommentList
    * 2. ClassName  : MyPageServiceImpl.java
    * 3. Comment    : 프론트 > 마이페이지 > 메인(킹저의 상품후기 갯수 및 IDX)
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectkingerProductCommentList (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.selectList("PcMyPage.selectkingerProductCommentList", commandMap);
    }
    
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMyFitAllCatList (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.selectList("PcMyPage.selectMyFitAllCatList", commandMap);
    }
   
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMyFitInfoList (Map<String,Object> commandMap) throws Exception
    {
    	//0626 키/몸무게 추가
    	Map<String,Object> existWeightHeight = defaultDAO.select("PcMyPage.selectMyFitInfoWeightHeight", commandMap);
    	
    	if(existWeightHeight.isEmpty()) {
    		
    		defaultDAO.selectList("PcMyPage.insertMyFitInfo", commandMap);
    	}
    	
    	return defaultDAO.selectList("PcMyPage.selectMyFitInfoList", commandMap);
    }

	public void insertMyFitInfo (@SuppressWarnings("rawtypes") List<HashMap> commandMap) throws Exception
    {
    	for(int i = 0 ; i < commandMap.size(); i++) {
    		int exist = defaultDAO.selectCount("PcMyPage.selectMyFitExist", commandMap.get(i));
    		if(exist == 0) {
    			defaultDAO.selectList("PcMyPage.insertMyFitInfo", commandMap.get(i));
    		} else {
    			defaultDAO.selectList("PcMyPage.updateMyFitInfo", commandMap.get(i));
    		}
    	}
    }

	@Override
	public Map<String, Object> selectMyRefundAccount(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	if(!"".equals(StringUtil.getString(SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"),""))){
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        	resultMap = defaultDAO.select("PcMyPage.selectMyRefundAccount",commandMap);
    	}
    	return resultMap;
	}
	
	@Override
    public int updateUserPhoneNumber(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
    	String[] MEM_MST_HP = StringUtils.getSplitedPhoneNumber(StringUtil.getString(commandMap.get("MEM_MST_HP")));
    	commandMap.put("MEM_MST_HP1", StringUtil.getString(MEM_MST_HP[0]));
    	commandMap.put("MEM_MST_HP2", StringUtil.getString(MEM_MST_HP[1]));
    	commandMap.put("MEM_MST_HP3", StringUtil.getString(MEM_MST_HP[2]));
    	return defaultDAO.update("PcMyPage.updateUserPhoneNumber", commandMap);
    }

	@Override
	public List<Map<String, Object>> selectReplyList(Map<String, Object> commandMap) throws Exception {
     
        commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        
        
        return  defaultDAO.selectList("PcMyPage.selectReplyList",commandMap);
		
	}

	@Override
	public int selectMyReplyListCount(Map<String, Object> commandMap) {
		
		return defaultDAO.selectCount("PcMyPage.selectMyReplyListCount",commandMap);
	}
}
