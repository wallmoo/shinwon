package com.market.util;

import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;

public class TestLoginSession {

	private static User loginSession;
	
	public static User getTestSession() {
		if(loginSession==null) {
			loginSession = new User();
			loginSession.setROLE_USER(ROLEUSER.user);
            /************************회원정보************************/
			//[loginStateCode=80, ROLE_USER=user, saveId=, autoLoginYn=, MEM_MST_MEM_ID=sosoworld2, MEM_MST_WEB_PWD=, MEM_MST_MEM_NM=김소영, RST_YN=, MEM_MST_MEM_GBN=682, VST_PASS_YN=, LOGIN_PIT_YN=, ORD_MST_CD=, ORD_MST_ORD_NM=, MEM_SNS_ID=, MEM_MST_MAIL=, MEM_MST_HP=, MEM_MST_MEM_PW_CHG_DT=20200403123613]
            loginSession.setLoginStateCode(80);
			loginSession.setMEM_MST_MEM_ID				("pure0311");
            loginSession.setMEM_MST_MEM_NM				("김지현");
            loginSession.setMEM_MST_HP			        ("0101234567");  // SNS 계정 로그인에서 사용
            loginSession.setMEM_MST_MAIL		        ("weggles@epasscni.com");  // SNS 계정 로그인에서 사용
            loginSession.setMEM_MST_MEM_GBN				("682");
            loginSession.setMEM_MST_MEM_PW_CHG_DT		("20200403123613");
		}
		return loginSession;
	}
	
	
	
}
