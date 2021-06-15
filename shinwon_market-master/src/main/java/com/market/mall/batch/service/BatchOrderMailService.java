package com.market.mall.batch.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.batch.service
 * @FileName : BatchMailService.java
 * @Date : 2016. 3. 14.
 * @프로그램 설명 : 메일 발송용 Class
 * @author DEV_KANGHYUNKYU
 */
public interface BatchOrderMailService {
	
    public List<Map<String, Object>> selectOrderProductList(Map<String, Object> commandMap) throws Exception ;
	
	public List<Map<String, Object>> selectCartOptionDetailList(Map<String,Object> commandMap) throws Exception;
	
    public List<Map<String, Object>> selectOrderSubPrdList(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectRequestedGiftList(Map<String, Object> commandMap) throws Exception;
	
    public Map<String, Object> selectOrderDeliveryInfo(Map<String, Object> commandMap) throws Exception ;
	
    public Map<String, Object> selectOrderPayInfo(Map<String, Object> commandMap) throws Exception ;
	
	public Map<String, Object> selectOrderCashbagInfo(Map<String, Object> commandMap) throws Exception;

	public Map<String, Object> selectMemberCashbagInfo(Map<String,Object> commandMap) throws Exception;
	
	public Map<String, Object> selectOrderGetItNowShopInfo(Map<String,Object> commandMap) throws Exception;
	
	public Map<String, Object> selectOrdPrdDlvTypeInfo(Map<String,Object> commandMap) throws Exception;
	
	public Map<String, Object> selectOrderInfo(Map<String,Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectOrdCancelSwapBackInfo(Map<String, Object> commandMap) throws Exception;
	
	public Map<String, Object> selectUserInfo(Map<String, Object> commandMap) throws Exception;
}
