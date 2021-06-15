package com.market.mall.pc.reviewer.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.reviewer.service.ReviewerService;


@Service("pcReviewerService")
public class ReviewerServiceImpl implements ReviewerService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	   

	
}
