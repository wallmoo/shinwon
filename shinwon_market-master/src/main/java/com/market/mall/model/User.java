package com.market.mall.model;

import java.util.HashMap;
import java.util.Map;

/**
 * @PackageName: com.market.mall.model
 * @FileName : User.java
 * @Date : 2014. 4. 22.
 * @프로그램 설명 : 사용자 정보를 저장하고 반환하는 DAO CLASS
 * @author jangsin
 */
public class User extends Code {
    
    static public enum ROLEUSER{
        user,
        sns,
        order_guest,
        guest
    }

    static public Map<ROLEUSER, Integer> levels = new HashMap<ROLEUSER, Integer>();

    static{
        levels.put(ROLEUSER.user, 30);
        levels.put(ROLEUSER.sns, 20); 
        levels.put(ROLEUSER.order_guest, 10);
        levels.put(ROLEUSER.guest, 0);
    }

    int loginStateCode = Code.LOGIN_FAIL;  // 로그인 상태 코드
    
    ROLEUSER ROLE_USER = ROLEUSER.guest;   // 회원 비회원 구분
    
    String saveId = ""; // 아이디저장 유무
    String autoLoginYn = "";	// 자동로그인 유무
    
    /*******************회원 정보********************/
	String MEM_MST_MEM_ID				= "";	// 웹ID
	String MEM_MST_WEB_PWD				= "";	// 웹PW
	String MEM_MST_MEM_NM				= "";	// 회원명
	String RST_YN 						= "";	// 휴면여부
	String MEM_MST_MEM_GBN				= "";	// 회원구분
	String VST_PASS_YN					= "";	// 전환 페이지 이동 여부(온라인회원,간편회원만 해당 / 마지막방문일 + 15일 여부 체크)
	String LOGIN_PIT_YN					= "";	// 로그인 시 포인트 지급 여부(하루에 한번)
	String MEM_MST_MEM_GRD				= "";	// 회원등급
    
	/*******************비회원 정보*******************/
    String ORD_MST_CD 					= "";   // 비회원 주문번호
    String ORD_MST_ORD_NM 			    = "";   // 비회원 이름
    
    /*****************SNS간편회원 정보****************/
    String MEM_SNS_ID                   = "";   // SNS 아이디(고유 KEY)
    String MEM_MST_MAIL                 = "";   // SNS 이메일
    String MEM_MST_HP                   = "";   // SNS 핸드폰번호ex) 01012345678
    
    String MEM_MST_NCK_NM				= "";
    String MEM_MST_STY_JOB				= "";
    String MEM_MST_STY_HEIGHT			= "";
    String MEM_MST_STY_WEIGHT			= "";
    String MEM_MST_PRF_IMG				= "";
    public String getMEM_MST_NCK_NM() {
		return MEM_MST_NCK_NM;
	}

	public void setMEM_MST_NCK_NM(String mEM_MST_NCK_NM) {
		MEM_MST_NCK_NM = mEM_MST_NCK_NM;
	}

	public String getMEM_MST_STY_JOB() {
		return MEM_MST_STY_JOB;
	}

	public void setMEM_MST_STY_JOB(String mEM_MST_STY_JOB) {
		MEM_MST_STY_JOB = mEM_MST_STY_JOB;
	}

	public String getMEM_MST_STY_HEIGHT() {
		return MEM_MST_STY_HEIGHT;
	}

	public void setMEM_MST_STY_HEIGHT(String mEM_MST_STY_HEIGHT) {
		MEM_MST_STY_HEIGHT = mEM_MST_STY_HEIGHT;
	}

	public String getMEM_MST_STY_WEIGHT() {
		return MEM_MST_STY_WEIGHT;
	}

	public void setMEM_MST_STY_WEIGHT(String mEM_MST_STY_WEIGHT) {
		MEM_MST_STY_WEIGHT = mEM_MST_STY_WEIGHT;
	}

	public String getMEM_MST_PRF_IMG() {
		return MEM_MST_PRF_IMG;
	}

	public void setMEM_MST_PRF_IMG(String mEM_MST_PRF_IMG) {
		MEM_MST_PRF_IMG = mEM_MST_PRF_IMG;
	}

	public String getMEM_MST_MEM_PW_CHG_DT() {
		return MEM_MST_MEM_PW_CHG_DT;
	}

	public void setMEM_MST_MEM_PW_CHG_DT(String mEM_MST_MEM_PW_CHG_DT) {
		MEM_MST_MEM_PW_CHG_DT = mEM_MST_MEM_PW_CHG_DT;
	}


	String MEM_MST_MEM_PW_CHG_DT		= "";
    
    
  
    public int getLoginStateCode() {
        return loginStateCode;
    }

    public void setLoginStateCode(int loginStateCode) {
        this.loginStateCode = loginStateCode;
    }

    public ROLEUSER getROLE_USER() {
        return ROLE_USER;
    }

    public void setROLE_USER(ROLEUSER rOLE_USER) {
        ROLE_USER = rOLE_USER;
    }
    
    public String getSaveId() {
        return saveId;
    }

    public void setSaveId(String saveId) {
        this.saveId = saveId;
    }
    
	public String getAutoLoginYn() {
		return autoLoginYn;
	}

	public void setAutoLoginYn(String autoLoginYn) {
		this.autoLoginYn = autoLoginYn;
	}

	public static Map<ROLEUSER, Integer> getLevels() {
		return levels;
	}

	public static void setLevels(Map<ROLEUSER, Integer> levels) {
		User.levels = levels;
	}

	public String getMEM_MST_MEM_ID() {
		return MEM_MST_MEM_ID;
	}

	public void setMEM_MST_MEM_ID(String mEM_MST_MEM_ID) {
		MEM_MST_MEM_ID = mEM_MST_MEM_ID;
	}
	
	public String getMEM_MST_WEB_PWD() {
		return MEM_MST_WEB_PWD;
	}

	public void setMEM_MST_WEB_PWD(String mEM_MST_WEB_PWD) {
		MEM_MST_WEB_PWD = mEM_MST_WEB_PWD;
	}

	public String getMEM_MST_MEM_NM() {
		return MEM_MST_MEM_NM;
	}

	public void setMEM_MST_MEM_NM(String mEM_MST_MEM_NM) {
		MEM_MST_MEM_NM = mEM_MST_MEM_NM;
	}
	
	public String getRST_YN() {
		return RST_YN;
	}

	public void setRST_YN(String rST_YN) {
		RST_YN = rST_YN;
	}
	
	public String getMEM_MST_MEM_GBN() {
		return MEM_MST_MEM_GBN;
	}

	public void setMEM_MST_MEM_GBN(String mEM_MST_MEM_GBN) {
		MEM_MST_MEM_GBN = mEM_MST_MEM_GBN;
	}

	public String getMEM_MST_MEM_GRD() {
		return MEM_MST_MEM_GRD;
	}

	public void setMEM_MST_MEM_GRD(String mEM_MST_MEM_GRD) {
		MEM_MST_MEM_GRD = mEM_MST_MEM_GRD;
	}

	public String getVST_PASS_YN() {
		return VST_PASS_YN;
	}

	public void setVST_PASS_YN(String vST_PASS_YN) {
		VST_PASS_YN = vST_PASS_YN;
	}
	
	public String getLOGIN_PIT_YN() {
		return LOGIN_PIT_YN;
	}

	public void setLOGIN_PIT_YN(String lOGIN_PIT_YN) {
		LOGIN_PIT_YN = lOGIN_PIT_YN;
	}

	public String getORD_MST_CD() {
		return ORD_MST_CD;
	}

	public void setORD_MST_CD(String oRD_MST_CD) {
		ORD_MST_CD = oRD_MST_CD;
	}

	public String getORD_MST_ORD_NM() {
		return ORD_MST_ORD_NM;
	}

	public void setORD_MST_ORD_NM(String oRD_MST_ORD_NM) {
		ORD_MST_ORD_NM = oRD_MST_ORD_NM;
	}
	
    public String getMEM_SNS_ID() {
        return MEM_SNS_ID;
    }

    public void setMEM_SNS_ID(String mEM_SNS_ID) {
        MEM_SNS_ID = mEM_SNS_ID;
    }

    public String getMEM_MST_MAIL() {
        return MEM_MST_MAIL;
    }

    public void setMEM_MST_MAIL(String mEM_MST_MAIL) {
        MEM_MST_MAIL = mEM_MST_MAIL;
    }

    public String getMEM_MST_HP() {
        return MEM_MST_HP;
    }

    public void setMEM_MST_HP(String mEM_MST_HP) {
        MEM_MST_HP = mEM_MST_HP;
    }

    
	@Override
	public String toString() {
		return "User [loginStateCode=" + loginStateCode + ", ROLE_USER="
				+ ROLE_USER + ", saveId=" + saveId 
				+ ", autoLoginYn=" + autoLoginYn
				+ ", MEM_MST_MEM_ID=" + MEM_MST_MEM_ID 
				+ ", MEM_MST_WEB_PWD=" + MEM_MST_WEB_PWD
				+ ", MEM_MST_MEM_NM=" + MEM_MST_MEM_NM
				+ ", RST_YN=" + RST_YN
				+ ", MEM_MST_MEM_GBN=" + MEM_MST_MEM_GBN
				+ ", VST_PASS_YN=" + VST_PASS_YN
				+ ", LOGIN_PIT_YN=" + LOGIN_PIT_YN
				+ ", ORD_MST_CD=" + ORD_MST_CD 
				+ ", ORD_MST_ORD_NM="	+ ORD_MST_ORD_NM 
				+ ", MEM_SNS_ID="	+ MEM_SNS_ID 
				+ ", MEM_MST_MAIL="	+ MEM_MST_MAIL 
				+ ", MEM_MST_HP="	+ MEM_MST_HP 
				+ ", MEM_MST_MEM_PW_CHG_DT="	+ MEM_MST_MEM_PW_CHG_DT 
				+ "]";  
	}
	
}
