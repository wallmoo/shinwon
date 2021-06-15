package com.market.mall.pc.store.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.store.service.StoreService;


@Service("pcStoreService")
public class StoreServiceImpl implements StoreService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	   

	
}
