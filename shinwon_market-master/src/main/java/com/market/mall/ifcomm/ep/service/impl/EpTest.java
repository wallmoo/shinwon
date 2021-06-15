package com.market.mall.ifcomm.ep.service.impl;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.market.mall.ifcomm.ep.service.DaumEPService;
import com.market.mall.ifcomm.ep.service.EPService;

public class EpTest {
	private ClassPathXmlApplicationContext applicationContext;
	

	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext(
				"classpath:egovframework/spring/context-*.xml");
	}
	

	@Test
	public void testDaumQuery() {
		DaumEPService EpService = (DaumEPService) applicationContext
				.getBean("daumEPService");
		
		EpService.makeDaumAllProductEP();

		//fail("Not yet implemented");
	}
}
