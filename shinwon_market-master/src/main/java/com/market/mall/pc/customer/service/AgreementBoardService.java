package com.market.mall.pc.customer.service;

import java.util.List;
import java.util.Map;

public interface AgreementBoardService {

	/**
	* <pre>
	* 1. MethodName : selectAgreementInfo
	* 2. ClassName  : AgreementBoardService.java
	* 3. Comment    : 프론트 이용약관 상세
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectAgreementInfo (Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectAgreementInfoByMemberId(Map<String, Object> commandMap) throws Exception;
}
