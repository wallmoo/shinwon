package com.market.mall.model;

import java.util.HashMap;
import java.util.Map;


/**
 * @PackageName: com.market.mall.model
 * @FileName : Business.java
 * @Date : 2016. 2. 4.
 * @프로그램 설명 : 사용자 정보를 저장하고 반환하는 DAO CLASS
 * @author : DEV_LEEKWANGWOON
 */
public class Business {
    
    static public enum ROLEBUSINESS{
    	business,
        guest
    }

    ROLEBUSINESS ROLE_BUSINESS = ROLEBUSINESS.guest;
    
    static public Map<ROLEBUSINESS, Integer> levels = new HashMap<ROLEBUSINESS, Integer>();

    static{
        levels.put(ROLEBUSINESS.business, 30);
        levels.put(ROLEBUSINESS.guest, 0);
    }

    int loginStateCode = Code.LOGIN_FAIL;  // 로그인 상태 코드
    
    String saveId = ""; // 아이디저장 유무
    
    /*******************회원 정보********************/
    String VDR_LGN_IDX 					= "";	// 계정정보 IDX
	String VDR_LGN_BUSINESSID			= "";	// 사업자번호(ID)
	String VDR_LGN_PW					= "";	// 로그인 비밀번호
	String VDR_LGN_CEO_NM				= "";	// 대표자명
	String VDR_LGN_NM					= "";	// 업체명
	String VDR_LGN_BUSI1				= "";	// 사업자번호1
	String VDR_LGN_BUSI2				= "";	// 사업자번호2
	String VDR_LGN_BUSI3				= "";	// 사업자번호3
	
	public String getVDR_LGN_IDX() {
		return VDR_LGN_IDX;
	}

	public void setVDR_LGN_IDX(String vDR_LGN_IDX) {
		VDR_LGN_IDX = vDR_LGN_IDX;
	}

	public ROLEBUSINESS getROLE_BUSINESS() {
		return ROLE_BUSINESS;
	}

	public void setROLE_BUSINESS(ROLEBUSINESS ROLE_BUSINESS) {
		this.ROLE_BUSINESS = ROLE_BUSINESS;
	}

	public int getLoginStateCode() {
        return loginStateCode;
    }

    public void setLoginStateCode(int loginStateCode) {
        this.loginStateCode = loginStateCode;
    }

    public String getSaveId() {
        return saveId;
    }

    public void setSaveId(String saveId) {
        this.saveId = saveId;
    }
    
	public static Map<ROLEBUSINESS, Integer> getLevels() {
		return levels;
	}

	public static void setLevels(Map<ROLEBUSINESS, Integer> levels) {
		Business.levels = levels;
	}

	public String getVDR_LGN_BUSINESSID() {
		return VDR_LGN_BUSINESSID;
	}

	public void setVDR_LGN_BUSINESSID(String vDR_LGN_BUSINESSID) {
		VDR_LGN_BUSINESSID = vDR_LGN_BUSINESSID;
	}
	
	public String getVDR_LGN_PW() {
		return VDR_LGN_PW;
	}

	public void setVDR_LGN_PW(String vDR_LGN_PW) {
		VDR_LGN_PW = vDR_LGN_PW;
	}

	public String getVDR_LGN_CEO_NM() {
		return VDR_LGN_CEO_NM;
	}

	public void setVDR_LGN_CEO_NM(String vDR_LGN_CEO_NM) {
		VDR_LGN_CEO_NM = vDR_LGN_CEO_NM;
	}

	public String getVDR_LGN_NM() {
		return VDR_LGN_NM;
	}

	public void setVDR_LGN_NM(String vDR_LGN_NM) {
		VDR_LGN_NM = vDR_LGN_NM;
	}
	
	public String getVDR_LGN_BUSI1() {
		return VDR_LGN_BUSI1;
	}

	public void setVDR_LGN_BUSI1(String VDR_LGN_BUSI1) {
		this.VDR_LGN_BUSI1 = VDR_LGN_BUSI1;
	}

	public String getVDR_LGN_BUSI2() {
		return VDR_LGN_BUSI2;
	}

	public void setVDR_LGN_BUSI2(String VDR_LGN_BUSI2) {
		this.VDR_LGN_BUSI2 = VDR_LGN_BUSI2;
	}

	public String getVDR_LGN_BUSI3() {
		return VDR_LGN_BUSI3;
	}

	public void setVDR_LGN_BUSI3(String VDR_LGN_BUSI3) {
		this.VDR_LGN_BUSI3 = VDR_LGN_BUSI3;
	}

	@Override
	public String toString() {
		return "BUSINESS [loginStateCode=" + loginStateCode + ", ROLE_BUSINESS="
				+ ROLE_BUSINESS + ", saveId=" + saveId
				+ ", VDR_LGN_IDX=" + VDR_LGN_IDX
				+ ", VDR_LGN_BUSINESSID=" + VDR_LGN_BUSINESSID 
				+ ", VDR_LGN_CEO_NM=" + VDR_LGN_CEO_NM
				+ ", VDR_LGN_NM=" + VDR_LGN_NM
				+ "]";
	}
	
}
