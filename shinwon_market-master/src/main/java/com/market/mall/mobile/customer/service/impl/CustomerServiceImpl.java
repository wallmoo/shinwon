package com.market.mall.mobile.customer.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.mobile.customer.service.CustomerService;

/**
 * @PackageName: com.market.mall.pc.customer.service.impl
 * @FileName : CustomerServiceImpl.java
 * @Date : 2014. 7. 21.
 * @프로그램 설명 : 프론트 > 고객센터 메인을 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("mobileCustomerService")
public class CustomerServiceImpl implements CustomerService {
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	private static final int CUSTOMER_CENTER_BANNER_CODE = 352; // 고객센터 배너 코드

	public Map<String, Object> selectCustomerMain(Map<String, Object> commandMap) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		//모바일 여부
		String isMobileYn = StringUtil.getString(commandMap.get("isMobileYn"),"Y");
		
		commandMap.put("startNum", 1);
        commandMap.put("endNum", 3);
		
		//공지사항 목록
		returnMap.put("noticeList", defaultDAO.selectList("PcCustomer.selectNoticeEventBoardList", commandMap));
		// 당첨자 발표
		returnMap.put("eveWinList", defaultDAO.selectList("PcCustomer.selectMobileEventWinList", commandMap));
		
		commandMap.put("startNum", 1);
        commandMap.put("endNum", 1000);
		
		// faq 코드 목록
		returnMap.put("faqCodeList", defaultDAO.selectList("CommonCodeManager.selectCommonCodeManagerList", commandMap));
		
		return returnMap;
	}

}
