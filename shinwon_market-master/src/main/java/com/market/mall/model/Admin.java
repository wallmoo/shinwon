package com.market.mall.model;

import java.util.HashMap;
import java.util.Map;

public class Admin {

    static public enum ROLEADMIN{
        administrator,
        guest
    }

    ROLEADMIN roleAdmin = ROLEADMIN.guest;

    static public Map<ROLEADMIN, Integer> levels = new HashMap<ROLEADMIN, Integer>();

    static{
        levels.put(ROLEADMIN.administrator, 99);
        levels.put(ROLEADMIN.guest, 0);
    }
    
    // 로그인 상태 코드
    int loginStateCode = Code.LOGIN_FAIL;
    // 요청 URL
    String requestUrl = "";
    
    // 관리자 아이디
    String ADM_MST_ID = "";
    // 관리자 이름
    String ADM_MST_NM = "";
    // 관리자 비밀번호
    String ADM_MST_PWD = "";
    // 관리자 핸드폰 번호 앞자리
    int ADM_MST_HP1 = 0;
    // 관리자 핸드폰 번호 중간자리
    int ADM_MST_HP2 = 0;
    // 관리자 핸드폰 번호 끝자리
    String ADM_MST_HP3 = "";
    // 관리자 전화번호 앞자리
    int ADM_MST_TEL1 = 0;
    // 관리자 전화번호 중간자리
    int ADM_MST_TEL2 = 0;
    // 관리자 전화번호 끝자리
    String ADM_MST_TEL3 = "";
    // 관리자 이메일 아이디
    String ADM_MST_EMAIL_ID = "";
    // 관리자 이메일 도메인
    String ADM_MST_EMAIL_DOMAIN = "";
    // 관리자 권한 IDX
    int AUT_MST_IDX = 0;
    // 관리자 로그인 성공 여부
    String ADM_MST_LOGIN_YN = "";
    // 로그인 아이디 저장 유무
    String saveId = "";
	// 초기 메뉴
    //String BASIC_MENU = "" ;
    // 관리자 입점_업체 IDX
    int ADM_MST_SUB_IDX = 0; 
    // 관리자 사번
    String ADM_MST_ERP_NO = "";      		
    
    public ROLEADMIN getRoleAdmin() {
        return roleAdmin;
    }

    public void setRoleAdmin(ROLEADMIN roleAdmin) {
        this.roleAdmin = roleAdmin;
    }
    
    public int getLoginStateCode() {
        return loginStateCode;
    }

    public void setLoginStateCode(int loginStateCode) {
        this.loginStateCode = loginStateCode;
    }

    public String getRequestUrl() {
        return requestUrl;
    }

    public void setRequestUrl(String requestUrl) {
        this.requestUrl = requestUrl;
    }

    public String getADM_MST_ID() {
        return ADM_MST_ID;
    }

    public void setADM_MST_ID(String aDM_MST_ID) {
        ADM_MST_ID = aDM_MST_ID;
    }

    public String getADM_MST_NM() {
        return ADM_MST_NM;
    }

    public void setADM_MST_NM(String aDM_MST_NM) {
        ADM_MST_NM = aDM_MST_NM;
    }

    public String getADM_MST_PWD() {
        return ADM_MST_PWD;
    }

    public void setADM_MST_PWD(String aDM_MST_PWD) {
        ADM_MST_PWD = aDM_MST_PWD;
    }

    public int getADM_MST_HP1() {
        return ADM_MST_HP1;
    }

    public void setADM_MST_HP1(int aDM_MST_HP1) {
        ADM_MST_HP1 = aDM_MST_HP1;
    }

    public int getADM_MST_HP2() {
        return ADM_MST_HP2;
    }

    public void setADM_MST_HP2(int aDM_MST_HP2) {
        ADM_MST_HP2 = aDM_MST_HP2;
    }

    public String getADM_MST_HP3() {
        return ADM_MST_HP3;
    }

    public void setADM_MST_HP3(String aDM_MST_HP3) {
        ADM_MST_HP3 = aDM_MST_HP3;
    }

    public int getADM_MST_TEL1() {
        return ADM_MST_TEL1;
    }

    public void setADM_MST_TEL1(int aDM_MST_TEL1) {
        ADM_MST_TEL1 = aDM_MST_TEL1;
    }

    public int getADM_MST_TEL2() {
        return ADM_MST_TEL2;
    }

    public void setADM_MST_TEL2(int aDM_MST_TEL2) {
        ADM_MST_TEL2 = aDM_MST_TEL2;
    }

    public String getADM_MST_TEL3() {
        return ADM_MST_TEL3;
    }

    public void setADM_MST_TEL3(String aDM_MST_TEL3) {
        ADM_MST_TEL3 = aDM_MST_TEL3;
    }

    public String getADM_MST_EMAIL_ID() {
        return ADM_MST_EMAIL_ID;
    }

    public void setADM_MST_EMAIL_ID(String aDM_MST_EMAIL_ID) {
        ADM_MST_EMAIL_ID = aDM_MST_EMAIL_ID;
    }

    public String getADM_MST_EMAIL_DOMAIN() {
        return ADM_MST_EMAIL_DOMAIN;
    }

    public void setADM_MST_EMAIL_DOMAIN(String aDM_MST_EMAIL_DOMAIN) {
        ADM_MST_EMAIL_DOMAIN = aDM_MST_EMAIL_DOMAIN;
    }

    public int getAUT_MST_IDX() {
        return AUT_MST_IDX;
    }

    public void setAUT_MST_IDX(int aUT_MST_IDX) {
        AUT_MST_IDX = aUT_MST_IDX;
    }

    public String getADM_MST_LOGIN_YN() {
        return ADM_MST_LOGIN_YN;
    }

    public void setADM_MST_LOGIN_YN(String aDM_MST_LOGIN_YN) {
        ADM_MST_LOGIN_YN = aDM_MST_LOGIN_YN;
    }

    public String getSaveId() {
        return saveId;
    }

    public void setSaveId(String saveId) {
        this.saveId = saveId;
    }

	public int getADM_MST_SUB_IDX() {
		return ADM_MST_SUB_IDX;
	}

	public void setADM_MST_SUB_IDX(int aDM_MST_SUB_IDX) {
		ADM_MST_SUB_IDX = aDM_MST_SUB_IDX;
	}

	public String getADM_MST_ERP_NO() {
		return ADM_MST_ERP_NO;
	}

	public void setADM_MST_ERP_NO(String aDM_MST_ERP_NO) {
		ADM_MST_ERP_NO = aDM_MST_ERP_NO;
	}

}
