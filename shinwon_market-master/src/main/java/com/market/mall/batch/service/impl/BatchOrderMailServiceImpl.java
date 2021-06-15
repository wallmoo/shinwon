package com.market.mall.batch.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.batch.service.BatchOrderMailService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.batch.service.impl
 * @FileName : BatchMailServiceImpl.java
 * @Date : 2016. 3. 14.
 * @프로그램 설명 : 메일발송용 class
 * @author DEV_KANGHYUNKYU
 */
@Service("batchOrderMailService")
public class BatchOrderMailServiceImpl implements BatchOrderMailService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : setOrderState
	* 2. ClassName  : BatchMailServiceImpl.java
	* 3. Comment    : 주문상태값 셋팅
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 3. 14.
	* </pre>
	*
	* @param commandMap
	*/
	public void setOrderState(Map<String, Object> commandMap){
    	
    	commandMap.put("OST_ORDER", Code.OST_ORDER);
		commandMap.put("OST_PAY_READY", Code.OST_PAY_READY);
		commandMap.put("OST_PAY", Code.OST_PAY);
		commandMap.put("OST_CANCEL_BEFORE_DEPOSIT", Code.OST_CANCEL_BEFORE_DEPOSIT);
		commandMap.put("OST_CANCEL", Code.OST_CANCEL);
		commandMap.put("OST_CANCEL_END", Code.OST_CANCEL_END);
		commandMap.put("OST_SEND_READY", Code.OST_SEND_READY);
		commandMap.put("OST_SEND", Code.OST_SEND);
		commandMap.put("OST_SEND_END", Code.OST_SEND_END);
		commandMap.put("OST_BACK", Code.OST_BACK);
		commandMap.put("OST_BACK_END", Code.OST_BACK_END);
		commandMap.put("OST_SWAP", Code.OST_SWAP);
		commandMap.put("OST_SWAP_READY", Code.OST_SWAP_READY);
		commandMap.put("OST_SWAP_END", Code.OST_SWAP_END);
		commandMap.put("OST_SWAP_CANCEL", Code.OST_SWAP_CANCEL);
		commandMap.put("OST_FIX", Code.OST_FIX);
		commandMap.put("OST_REFUND", Code.OST_REFUND);
		commandMap.put("OST_REFUND_END", Code.OST_REFUND_END);
	    commandMap.put("OST_SWAP_COLLECT_CALL", Code.OST_SWAP_COLLECT_CALL);
	    commandMap.put("OST_SWAP_COLLECT_END", Code.OST_SWAP_COLLECT_END);
	    commandMap.put("OST_BACK_COLLECT_CALL", Code.OST_BACK_COLLECT_CALL);
	    commandMap.put("OST_BACK_COLLECT_END", Code.OST_BACK_COLLECT_END);
		commandMap.put("OST_SWAP_READY_CANCEL", Code.OST_SWAP_READY_CANCEL);
		commandMap.put("OST_SWAP_TARGET_COLLECT_END", Code.OST_SWAP_TARGET_COLLECT_END);
		commandMap.put("OST_BACK_APPROVED", Code.OST_BACK_APPROVED);
		commandMap.put("OST_BACK_ARR", Code.OST_BACK_ARR);//개별 반품처리 위한 반품관련 주문상태값 리스트
		commandMap.put("OST_SWAP_IGNORE_ARR", Code.OST_SWAP_IGNORE_ARR);//계산시에는 없는 상품으로 쳐야할 주문상태값 리스트
		
		//commandMap.put("OST_SHOPPING_EXCLUDE_ARR", Code.OST_SHOPPING_EXCLUDE_ARR);//마이페이지 주문/배송 조회시 제외할 주문상태값 리스트
		commandMap.put("OST_CANCEL_ARR", Code.OST_CANCEL_ARR);//마이페이지 취소 조회시 주문상태값 리스트
		commandMap.put("OST_SWAP_ARR", Code.OST_SWAP_ARR);//마이페이지 교환 조회시 주문상태값 리스트
		commandMap.put("OST_BACK_ARR", Code.OST_BACK_ARR);//마이페이지 반품 조회시 주문상태값 리스트
		commandMap.put("OST_REFUND_ARR", Code.OST_REFUND_ARR);//마이페이지 반품 조회시 주문상태값 리스트
    }
	
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderProductList(Map<String, Object> commandMap) throws Exception 
    {
    	//주문상태 
    	this.setOrderState(commandMap);
		return defaultDAO.selectList("BatchOrderMail.selectOrderProductList",commandMap);
    }
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCartOptionDetailList(Map<String,Object> commandMap) throws Exception{
		return this.defaultDAO.selectList("BatchOrderMail.selectCartOptionDetailList", commandMap);
	}
	
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderSubPrdList(Map<String, Object> commandMap) throws Exception{
    	return defaultDAO.selectList("BatchOrderMail.selectOrderSubPrdList", commandMap);
    }
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRequestedGiftList(Map<String, Object> commandMap) throws Exception{
		return defaultDAO.selectList("BatchOrderMail.selectRequestedGiftList", commandMap);
	}
	
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderDeliveryInfo(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.select("BatchOrderMail.selectOrderDeliveryInfo",commandMap);
    }
	
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderPayInfo(Map<String, Object> commandMap) throws Exception 
    {
    	//주문상태 
    	this.setOrderState(commandMap);
		return defaultDAO.select("BatchOrderMail.selectOrderPayInfo",commandMap);
    }
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderCashbagInfo(Map<String, Object> commandMap) throws Exception{
		return defaultDAO. select("BatchOrderMail.selectOrderCashbagInfo", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberCashbagInfo(Map<String,Object> commandMap) throws Exception{
		return defaultDAO.select("BatchOrderMail.selectMemberCashbagInfo", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderGetItNowShopInfo(Map<String,Object> commandMap) throws Exception{
		//지점명 셋팅을 위한 파라미터
		commandMap.put("COMMON_INFOSITE_BRANCH_GB_PRICEKING", Code.COMMON_INFOSITE_BRANCH_GB_PRICEKING);
		commandMap.put("COMMON_INFOSITE_BRANCH_GB_COOK", Code.COMMON_INFOSITE_BRANCH_GB_COOK);
		return this.defaultDAO.select("BatchOrderMail.selectOrderGetItNowShopInfo", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOrdPrdDlvTypeInfo(Map<String,Object> commandMap) throws Exception{
		return this.defaultDAO.select("BatchOrderMail.selectOrdPrdDlvTypeInfo", commandMap);
	}
	
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderInfo(Map<String, Object> commandMap) throws Exception 
    {
    	// 주문 정보
    	return defaultDAO.select("BatchOrderMail.selectOrderInfo",commandMap);
    }
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrdCancelSwapBackInfo(Map<String, Object> commandMap) throws Exception{
    	//주문상태 
    	this.setOrderState(commandMap);
    	return this.defaultDAO.selectList("BatchOrderMail.selectOrdCancelSwapBackInfo", commandMap);
    }
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectUserInfo(Map<String,Object> commandMap) throws Exception{
		return this.defaultDAO.select("BatchOrderMail.selectUserInfo", commandMap);
	}
}
