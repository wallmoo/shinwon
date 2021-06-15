package com.market.mall.orderErpApi.erpApi.com.market.mall.pc.brand.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.pc.cart.service
 * @FileName : BrandService.java
 * @Date : 2020.06.26
 * @프로그램 설명 : 주문 ERP INTERFACE 업무를 처리하는 Service Interface
 * @author 정경수
 */

public interface OrderErpApiService {
	public Map<String, Object> orderErpApiTrans(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectOrderErpInfo(Map<String, Object> commandMap) throws Exception;
	
	//2020.07.02 ERP 전송데이터 SELECT
	public List<Map<String, Object>> selectGetOrdData(Map<String, Object> selectMap) throws Exception;
}
