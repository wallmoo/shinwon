/**
 * @(#) SeedTest.java
 * Copyright 2010-2010 by  C&T Inc.
 *
 *
 * @SEC_TEST
 * @author  
 * @MAKE 2010. 11. 22.
 * @EDIT 
 */
package com.market.mall.ocb;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.market.mall.ocb.engine.Seed;

import egovframework.rte.fdl.property.EgovPropertyService;

/*
 * SeedTest
 */
@Controller
public class SeedMain
{
	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
	
	public String seedEncryptECB(String seedContent, String encodeKey){
		
		String _mode = Seed.MODE_ECB;			  //Seed.MODE_CBC;//Seed.MODE_CFB;//Seed.MODE_OFB
		String _pad = Seed.PAD_X923;			  //Seed.PAD_PKCS;//Seed.PAD_NO(사용하지 말것)
		System.out.println("_key====================================");
		System.out.println("_key: "+ encodeKey);
		String _key = encodeKey;	      //key 값은 반드시 16자리
		
		SeedCrypt encrypter = new SeedCrypt();	//암호화용
		SeedCrypt decrypter = new SeedCrypt();	//복호화용
		
		//ECB 모드가 아닌 경우는 iv 파라미터 값 필수
		encrypter.init(encrypter.ENCRYPT_MODE, _mode, _pad, _key.getBytes());
		String encStr = encrypter.encrypt(seedContent);
			
		System.out.println("Enc Data = " + encStr);
		
		decrypter.init(encrypter.DECRYPT_MODE, _mode, _pad, _key.getBytes());
		String decStr = decrypter.decrypt(encStr);
		
		System.out.println("Dec Data = " + decStr.trim());
		
		return encStr;
	}
	
	public String seedDecryptECB(String seedContent, String encodeKey){
		
		String _mode = Seed.MODE_ECB;			  //Seed.MODE_CBC;//Seed.MODE_CFB;//Seed.MODE_OFB
		String _pad = Seed.PAD_X923;			  //Seed.PAD_PKCS;//Seed.PAD_NO(사용하지 말것)
//		String _key = "1234567890123456";	      //key 값은 반드시 16자리(개발)
		String _key = encodeKey;         //key 값은 반드시 16자리(운영)
		
		SeedCrypt encrypter = new SeedCrypt();	//암호화용
		SeedCrypt decrypter = new SeedCrypt();	//복호화용
		
		decrypter.init(encrypter.DECRYPT_MODE, _mode, _pad, _key.getBytes());
		String decStr = decrypter.decrypt(seedContent);
		
		System.out.println("Dec Data = " + decStr);
		System.out.println("Dec Data = " + decStr.trim());
		
		return decStr;
	}
	
	
}
