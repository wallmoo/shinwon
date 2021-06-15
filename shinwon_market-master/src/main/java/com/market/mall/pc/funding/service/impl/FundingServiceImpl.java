package com.market.mall.pc.funding.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.funding.service.FundingService;


@Service("pcFundingService")
public class FundingServiceImpl implements FundingService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	   

	
}
