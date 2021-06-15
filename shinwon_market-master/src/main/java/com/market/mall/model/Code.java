package com.market.mall.model;

/**
 * @FileName      : Code.java
 * @Date        : 2013. 7. 26.
 * @프로그램 설명     :
 */
public class Code {
    
	/**
     *  고객센터 전화번호
     */
    static public final String CALL_CENTER_TEL = ""; // 고객센터 전화번호
    
    /**
     * EDI 연동
     */
    static public final String EDI_DEFAULT_NAME = ""; 	// 이름
    static public final String EDI_DEFAULT_TEL = ""; // 전화번호
        
    static public final String EDI_DEFAULT_SGS_ADDR = "";  		 // 주소
    static public final String EDI_DEFAULT_SGS_DETAIL_ADDR = "";  // 상세주소
    static public final String EDI_DEFAULT_SGS_ZIPCODE = ""; 									 // 우편번호

    static public final String EDI_DEFAULT_SYS_ADDR = "";    	// SYS 주소
    static public final String EDI_DEFAULT_SYS_DETAIL_ADDR = "";    // 상세주소
    static public final String EDI_DEFAULT_SYS_ZIPCODE = ""; 								// 우편번호
    
    static public final String EDI_CUST_ID_SGS = "";	// EDI 계정
    static public final String EDI_CUST_ID_SYS = "";	// EDI SYS 계정
    static public final String EDI_DELIVERY_IDX = "";			// EDI 업체 IDX
    
    
    /**
     * 이메일 관련 세팅 
     */
    static public final String EMAIL_SENDER_EMAIL = "";	// 발신자 이메일
    static public final String EMAIL_SENDER_NAME  = "";			// 발신자 이름
    static public final String EMAIL_RETURN_EMAIL = "";	// 리턴 이메일
    
    
    /**
     *  로그인
     */
    static public final int LOGIN_ID_INVALID = 10;// 로그인 아이디 필요
    static public final int LOGIN_PW_INVALID = 20;// 로그인 비밀번호 필요
    static public final int LOGIN_ID_NULL = 30; // 아이디가 존재하지 않음
    static public final int LOGIN_PW_INCORRECT = 40; // 비밀번호와 로그인 비밀번호가 일치하지 않음
    static public final int LOGIN_STOP_LOGIN = 60; // 계정이 중지됨
    static public final int LOGIN_FAIL = 80; // 로그인 실패
    static public final int LOGIN_SUCCESS = 90; // 로그인 성공
    static public final int LOGIN_NON_MEM_SUCCESS = 100; // 비회원 로그인 성공
    static public final int LOGIN_SITE_NOT_ACCESS = 110; // 접속 권한이 없음
    static public final int LOGIN_ORD_CODE_INVALID = 120; // 비회원 로그인 주문번호 필요
    static public final int LOGIN_NON_MEM_NM_INVALID = 130; // 비회원 로그인 주문자명 필요
    static public final int LOGIN_ORD_CODE_NULL = 170; // 비회원 로그인 일치하는 주문정보가 없음
    static public final int LOGIN_NON_MEM_NM_INCORRECT = 180; // 비회원 로그인 주문자명이 일치하지 않음
    static public final int LOGIN_PASS_EFFECTIVE_TIME = 190; // 유효시간이 지남
    static public final int LOGIN_SNS_ID_INVALID = 210; // SNS 고유 아이디 필요
    static public final int LOGIN_SNS_SUCCESS = 220; // SNS으로 간편로그인 성공

    /**
     *  공통코드
     */
    static public final int ONE_TO_ONE_INQUIRY_TYPE_CODE = 105; // 1:1 문의 문의 유형 코드
    
    static public final int VENDOR_INQUIRY_TYPE_CODE = 3789; // 입점사 문의 유형 코드
    static public final int VENDOR_INQUIRY_TYPE_ORDER = 3792; // 입점사 문의 유형 > 주문/결제 유형
    
    static public final int MEM_ADV_TYPE_CODE = 2237 ; // 고객상담 구분  코드
    static public final int MEM_ADV_CS_STR_CODE = 2241 ; // 고객상담 판매처  코드
    static public final int MEM_ADV_CS_ITM_CODE = 2244 ; // 고객상담 품목  코드
    static public final int FAQ_INQUIRY_TYPE_CODE = 3156; // FAQ 문의 유형
    static public final int FAQ_INFOSITE_TYPE_CODE = 1947; // FAQ 문의 유형-오프라인직영점
    static public final int SHOPPING_GUIDE_INQUIRY_TYPE_CODE = 90;				// 쇼핑가이드유형코드
    
    static public final int COMMON_PRODUCT_SEASON_CD = 109;					// 상품게절코드
    static public final int COMMON_POPUP_VIEW_LOCATION = 77;				// 팝업 대상 화면 코드
    static public final int COMMON_INTEREST_CATEGORY = 122;					// 관심카테고리(회원가입시)
    static public final int COMMON_QNA_PRODUCT = 106;				// 상품 Q&A코드
    static public final int COMMON_CARD_EVENT_CODE = 532;	// 카드이벤트 안내 유형코드
    

    static public final int AGREEMENT_TYPE_CODE = 166; // 고객이용약관
    static public final int AGREEMENT_CUSTOMER_CENTER1 = 182; // [고객센터] 이용약관
    static public final int AGREEMENT_CUSTOMER_CENTER4 = 380; // [고객센터] 개인정보취급방침
    static public final int AGREEMENT_MOBILE_CUSTOMER_CENTER1 = 541; // [모바일 고객센터] 이용약관
    static public final int AGREEMENT_MOBILE_CUSTOMER_CENTER2 = 542; // [모바일 고객센터] 개인정보취급방침
    
    static public final int AGREEMENT_BOARD_TYPE_CODE = 2941; // 이용약관
    static public final int AGREEMENT_JOINSUS = 2946;
    static public final int AGREEMENT_OFFLINE_JOINSUS = 3707;
    public final static int SHOPPING_GUIDE_MEMBER_BENEFIT_IDX = 6;	// 쇼핑가이드 > 회원혜택
    
    //static public final int ORDER_CANCEL_RETURN_REASON = 200; // 주문취소/반품 사유
    
    public static final int PRODUCT_DELEVERY_FEE = 3629; //배송비
    
    public static final int COMMON_GENDER = 145; //성별
    public static final int COMMON_GENDER_MAN = 363; //남성
    public static final int COMMON_GENDER_WOMAN = 364; //여성
    public static final int COMMON_GENDER_UNISEX = 3633; //유니섹스
    
    
    public static final int VENDOR_APPROVAL_HOLD_OFF = 3638; // 입점업체 보류 사유
    
    /**
     * 상품 유형
     */
    public static final String PRODUCT_TYPE_GENERAL = "G"; // 상품유형 일반
    public static final String PRODUCT_TYPE_BUNDLE = "B";  // 상품유형 묶음
    public static final String PRODUCT_TYPE_SET = "S";     // 상품유형 세트
    
    
    /**
     * 회원 인증 방식 - 핸드폰인증(H), 아이핀인증(I)
     */
    final  public static String MEMBER_AUTH_HP = "H";         //핸드폰인증
    final  public static String MEMBER_AUTH_IPIN = "I";       //아이핀인증

    /**
     * 쇼핑채널 - PC(1), MOBILE(2), PC+MOBILE()
     */
    final  public static String CHANNEL_TYPE_CD_PC = "1";             //PC(1)
    final  public static String CHANNEL_TYPE_CD_MOBILE = "2";         //MOBILE(2)
    final  public static String CHANNEL_TYPE_CD_PCMOBILE = "3";       //PC+MOBILE(3)
    
    /**
     * 이벤트/기획전 채널 - PC(371), MOBILE(372), PC+MOBILE(373)
     */
    final  public static String EVENT_PLAN_CHANNEL_CD_PC = "371";             //PC(7)
    final  public static String EVENT_PLAN_CHANNEL_CD_MOBILE = "372";         //MOBILE(8)
	final  public static String EVENT_PLAN_CHANNEL_CD_PCMOBILE = "373";       //PC+MOBILE()
	
    /**
     * 홍보문구 적용 위치
     */
    final  public static String SELLING_POINT_FRONT = "F";  //상품명 앞
    final  public static String SELLING_POINT_BACK = "B";   //상품명 뒤 

    /**
     * 홍보문구, 아이콘 적용상품 범위
     */
    final  public static String SCOPE_PRODUCT = "P";        //상품
    final  public static String SCOPE_CATEGORY = "C";       //카테고리

    /**
     * 고객문의 타입 - 1:1문의(I), 상품문의(Q)
     */
    final  public static String INQUIRY_TYPE_ONE_TO_ONE = "I";       //1:1문의
    final  public static String INQUIRY_TYPE_PRODUCT = "Q";   //상품    
    final  public static String INQUIRY_TYPE_SELLER = "S";   //셀러   
    
    /**
     * 카테고리 타입 - PC(P), MOBILE(M)
     */
    final  public static String CATEGORY_TYPE_PC = "P";       //PC
    final  public static String CATEGORY_TYPE_MOBILE = "M";   //MOBILE
    
    /**
     * 스펙 타입 - PC(P), MOBILE(M)
     */
    final  public static String SPEC_TYPE_PC = "P";       //PC
    final  public static String SPEC_TYPE_MOBILE = "M";   //MOBILE
    
    /**
     * 품목 타입 - PC(P), MOBILE(M)
     */
    final  public static String ITEM_TYPE_PC = "P";       //PC
    final  public static String ITEM_TYPE_MOBILE = "M";   //MOBILE
    
    /**
     * 사용자환경 - PC(P), MOBILE(M)
     */
    final  public static String USER_ENV_TYPE_PC = "P";       //PC
    final  public static String USER_ENV_TYPE_MOBILE = "M";   //MOBILE    
    
    /**
     * 화면 표시 메세지
     */
    final  public static String COMMON_MESSAGE_SEARCH_RESULT_NONE_ = "조회된 데이터가 없습니다.";
    final  public static String COMMON_MESSAGE_DO_SEARCH_ = "검색 조건 입력 후 검색버튼을 눌러주세요.";
    
    /**
     * 희망 태그 검색 타입
     */
    final  public static String WSH_TAG_SEARCH_TYPE_ALL= "S_ALL";
    final  public static String WSH_TAG_SEARCH_TYPE_TITLE = "S_TITLE";
    final  public static String WSH_TAG_SEARCH_TYPE_ID = "S_ID";
    final  public static String WSH_TAG_SEARCH_TYPE_NAME = "S_NAME";
    
    
    public final static String BND_MST_BRAND_TYPE_I = "I"; //자사
    public final static String BND_MST_BRAND_TYPE_O = "O"; //타사 
    
   /**
    * front 사용 공통변수
    */
    public final static int CATEGORY_EVENT_TOP_IDX = 6;
    public final static int CATEGORY_BRAND_TOP_IDX = 10;
    public final static int CATEGORY_OUTLET_TOP_IDX = 9;
    public final static int CATEGORY_LOOKBOOK_TOP_IDX = 325;
    
    /** PG타입 */
    final  public static String PG_TYPE_LG = "LG";
    final  public static String PG_TYPE_KICC = "KICC";
    
    /** 주문상태 */
    final  public static int OST = 400;
    /** 주문접수 */
    final  public static int OST_ORDER = 401;
    /** 주문취소(입금전 취소인 경우 해당 상태가 최종) */
    final  public static int OST_CANCEL_BEFORE_DEPOSIT = 2035;
    /** 취소접수 */
    final  public static int OST_CANCEL = 402;    
    /** 취소완료 */
    final  public static int OST_CANCEL_END = 403;    
    /** 입금대기(결제대기) */
    final  public static int OST_PAY_READY = 404; 
    /** 결제완료 */
    final  public static int OST_PAY = 405; 
    /** 배송준비중 */
    final  public static int OST_SEND_READY = 406;                 
    /** 배송중 */
    final  public static int OST_SEND = 407;                   
    /** 배송완료 */
    final  public static int OST_SEND_END = 408; 
    /** 배송보류(2020.06.21 추가) */
    final  public static int OST_SEND_HOLD = 3022; 
    /** 매장수령(2020.06.15 추가) */
    final  public static int OST_STORE_PICKUP = 3024; 
    /** 구매확정 */
    final  public static int OST_FIX = 409;
    /** 부분취소 */
    final  public static int OST_EACH_CANCEL = 2960;
        
    /** 반품접수 */
    final  public static int OST_BACK = 431;    
    /** 반품대기중 */
    final  public static int OST_BACK_APPROVED = 1783;
    /** 반품회수지시(미사용 처리) */
    final  public static int OST_BACK_COLLECT_CALL = 1667;
    /** 반품회수완료(반품승인) */
    final  public static int OST_BACK_COLLECT_END = 1668;
    /** 반품완료 */
    final  public static int OST_BACK_END = 433;          
    /** 환불접수 */
    final  public static int OST_REFUND= 1784;
    /** 환불완료 */
    final  public static int OST_REFUND_END = 434;
    /** 반품불가 */
    final  public static int OST_BACK_CANCEL = 435;
    /** 반품취소(2020.06.15 추가) */
    final  public static int OST_BACK_CLIENT_CANCEL = 3028;
    /** 반품회수불가 */
    /*final  public static int OST_BACK_COLLECT_DENY = 1669;*/

    /** 교환접수(기존상품) */
    final  public static int OST_SWAP = 421;          
    /** 교환접수승인(기존상품)(미사용) */
    final  public static int OST_SWAP_APPROVED = 1782;
    /** 교환회수지시(기존상품) */
    final  public static int OST_SWAP_COLLECT_CALL = 1664;
    /** 교환회수완료(기존상품)(erp취소요청) */
    final  public static int OST_SWAP_COLLECT_END = 1665;
    /** 교환접수취소(기존상품-고객이 취소) */
    final  public static int OST_SWAP_CLIENT_CANCEL = 3828;
    /** 교환배송중(기존상품) */
    final  public static int OST_SWAP_SEND = 3026;  
    /** 교환완료(기존상품) */
    final  public static int OST_SWAP_END = 423;   
    /** 교환불가(기존상품) */
    final  public static int OST_SWAP_CANCEL = 424;
    
    /** 교환대기중(신규상품) */
    final  public static int OST_SWAP_READY = 1670;
    /** 교환취소(신규상품) */
    final  public static int OST_SWAP_READY_CANCEL = 1672;
    /** 교환상품준비중(교환타겟상품회수완료) - 신규상품 */
    final  public static int OST_SWAP_TARGET_COLLECT_END = 1671;
    /** 교환완료(신규상품) */
    final  public static int OST_SWAP_SEND_END = 3832; 
    /** 교환완료(교환지시) */
    /*final  public static int OST_SWAP_ORDER = 1673;*/  
    /** 교환회수불가 */
    /*final  public static int OST_SWAP_COLLECT_DENY = 1666;*/
    
    /** 클린킹 관련 주문 상태 */
    /** 예약상담신청 */
    final  public static int OST_CLEANKING_REQUEST = 2783;
    /** 예약상담취소 */
    final  public static int OST_CLEANKING_CANCEL = 2784;
    /** 예약상담확정 */
    final  public static int OST_CLEANKING_CONFIRM = 2785;
    /** 클린킹 주문상태 */
    final  public static int [] OST_CLEANKING_ARR = { OST_CLEANKING_REQUEST, OST_CLEANKING_CANCEL, OST_CLEANKING_CONFIRM};
    
    /** 배송관리 주문상태 */
    final  public static int [] OST_SEND_ARR = { OST_SEND_READY, OST_SEND, OST_SEND_END };
    /** 취소관리 주문상태 */
    final  public static int [] OST_CANCEL_ARR = { OST_CANCEL_BEFORE_DEPOSIT, OST_CANCEL, OST_CANCEL_END };
    /** 교환관리 주문상태 */
    final  public static int [] OST_SWAP_ARR = { OST_SWAP, OST_SWAP_APPROVED, OST_SWAP_READY, OST_SWAP_END, OST_SWAP_COLLECT_CALL, OST_SWAP_COLLECT_END };
    /** 반품관리 주문상태(2020.06.15 수정) */
    final  public static int [] OST_BACK_ARR = { OST_BACK, OST_BACK_APPROVED, OST_BACK_COLLECT_END, OST_BACK_END, OST_BACK_CANCEL, OST_BACK_CLIENT_CANCEL};
    /** 환불관리 주문상태 */
    final  public static int [] OST_REFUND_ARR = { OST_REFUND, OST_REFUND_END};
    
    /** 교환관련 주문상태(교환완료/교환대기중/교환취소 는 중복되므로 없는 상품으로 쳐야한다. (2020.06.15 신규상품 교환완료 추가)) */
    final  public static int [] OST_SWAP_IGNORE_ARR = { OST_SWAP_END, OST_SWAP_READY, OST_SWAP_READY_CANCEL, OST_SWAP_SEND_END};
    
    /** 주문취소 가능 주문상태 */
    final  public static int [] OST_CANCEL_POSSIBLE_ARR = { OST_PAY_READY, OST_PAY, OST_SEND_READY, OST_SEND_HOLD };
    /** 교환접수 가능 주문상태 */
    final  public static int [] OST_SWAP_POSSIBLE_ARR = { OST_SEND_END, OST_FIX, OST_STORE_PICKUP, OST_SEND_READY };
    /** 반품접수 가능 주문상태(2020.06.15 수정) */
    final  public static int [] OST_BACK_POSSIBLE_ARR = { OST_SEND_END, OST_FIX, OST_STORE_PICKUP, OST_SWAP_END, OST_SWAP_READY_CANCEL, OST_SWAP_CANCEL, OST_BACK_CANCEL, OST_BACK_CLIENT_CANCEL };
    /** 반품완료 가능 주문상태(2020.06.15 수정) */
    final  public static int [] OST_BACK_END_POSSIBLE_ARR = { OST_BACK_COLLECT_END };
    
    /** 마이페이지 주문/배송 조회시 제외할 주문상태 */
    final  public static int [] OST_SHOPPING_EXCLUDE_ARR = { OST_CANCEL_END, OST_BACK_END, OST_REFUND, OST_REFUND_END };
    
    /** 반품택배비 지불방법 구분: 판매자책임 */
    final public static String DLV_ADD_CAG_GBN_SELLER = "E"; 
    /** 반품택배비 지불방법 구분: 쿠폰사용 */
    final public static String DLV_ADD_CAG_GBN_COUPON = "F"; 
    /** 반품택배비 지불방법 구분: 신용카드 */
    final public static String DLV_ADD_CAG_GBN_CARD = "G"; 
    /** 반품택배비 지불방법 구분: 무통장입금 */
    final public static String DLV_ADD_CAG_GBN_MUTONGJANG = "H"; 
    /** 반품택배비 지불방법 구분: 실시간계좌이체 */
    final public static String DLV_ADD_CAG_GBN_TRANSFER = "I"; 
    /** 반품택배비 지불방법 구분: 휴대폰결제 */
    final public static String DLV_ADD_CAG_GBN_PHONE = "J"; 
    /** 반품택배비 지불방법 구분: 간편결제 */
    final public static String DLV_ADD_CAG_GBN_SIMPLE = "K"; 
    
    /** PG 연동(테스트) */
    final public static String PG_CONFIG_PATH = "C:/project/marketPlant/workspace/marketA/src/main/webapp/WEB-INF/config/lgdacom"; //LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치
    //final public static String PG_CONFIG_PATH = "/home/www/was/alpha/WEB-INF/config/lgdacom"; //LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치
//    final public static String PG_CONFIG_PATH = "/app/alpha/was/alphaAdmin/WEB-INF/config/lgdacom"; //LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치
    final public static String PG_CST_PLATFORM = "test"; // LG유플러스 결제서비스 선택(test:테스트, service:서비스)
    final public static String PG_CST_MID = "alphamall1"; // LG유플러스로 부터 발급받으신 상점아이디
    final public static String PG_LGD_MERTKEY = "542ce602bd29268e935004e8250b90c4"; // 상점MertKey
    final public static String PG_LGD_CUSTOM_SKIN = "red"; // 상점정의 결제창 스킨(red, purple, yellow)
    final public static String PG_LGD_WINDOW_VER = "2.5"; // 결제창 버전정보
    final public static String PG_LGD_ENCODING = "UTF-8"; // 결제창 호출문자 인코딩
    final public static String PG_LGD_ENCODING_NOTEURL = "UTF-8"; // 결과수신페이지 호출문자 인코딩(무통장입금 통보)
    final public static String PG_LGD_ENCODING_RETURNURL = "UTF-8"; // 결과수신페이지 호출문자 인코딩(결제결과 페이지)
    final public static String PG_LGD_CUSTOM_SWITCHINGTYPE = "IFRAME"; // 신용카드 카드사 인증 페이지 연동방식
    final public static String PG_CST_WINDOW_TYPE = "iframe";// 수정불가
    
    final public static String PG_LGD_CASNOTEURL_FRONT = "/pc/cart/paymentNoteRes.do"; // 가상계좌(무통장) 인증, 처리 결과 수신페이지
    final public static String PG_LGD_RETURNURL_FRONT = "/pc/cart/paymentReqReturnPopup.do"; // 인증결과 수신페이지
    
    // PG ESCROW 연동
    final public static String PG_ESCROW_URL = "http://pgweb.uplus.co.kr:7085/pg/wmp/mertadmin/jsp/escrow/rcvdlvinfo.jsp";
    final public static String PG_ESCROW_DLY_TYPE = "01"; // 에스크로 배송결과 등록 구분값 (수령정보 등록)
    
    
    /** PG 팝업 스크립트 URL */
    final public static String PG_PAY_POPUP_LINK = "https://xpay.uplus.co.kr/xpay/js/xpay_crossplatform.js";
    
    /** PG 현금영수증, 카드전표 스크립트 URL (테스트) */
    final public static String PG_RECEIPT_LINK = "http://pgweb.dacom.net:7085/WEB_SERVER/js/receipt_link.js";
    /** PG 현금영수증, 카드전표 스크립트 URL (서비스) */
//    final public static String PG_RECEIPT_LINK = "https://pgweb.dacom.net/WEB_SERVER/js/receipt_link.js";
    
    /** kicc 결제방법 */
    final  public static int PAY_TYPE = 450;  
    /** 신용카드 */
    final  public static int PAY_CARD = 451;   
    /** 계좌이체 - 실시간계좌이체(PG) */
    final  public static int PAY_ACCOUNT = 452;   
    /** 무통장입금 - 가상계좌 */
    final  public static int PAY_DEPOSIT = 453;   
    /** 에스크로 */
    final  public static int PAY_ESCROW = 1792;
    /** 휴대폰 소액결제 */
    final  public static int PAY_HP = 454;   
    /** 포인트 */
    final  public static int PAY_MILEAGE = 455;   
    /** 카카오페이 */
    final  public static int PAY_KAKAOPAY = 1152;
    /** 페이나우 */
    final  public static int PAY_PAYNOW = 1781;
    /** 클린킹 */
    final  public static int PAY_CLEANKING = 2789;
    /** 해외카드 */
    final  public static int PAY_FOREIGN_CARD = 2790;
    
    /** LGU+ 결제방법 */
    final public static String PG_PAY_METHOD_CARD = "SC0010"; // PG 결제타입 (신용카드)
    
    final public static String PG_PAY_METHOD_ACCOUNT = "SC0030"; // PG 결제타입 (계좌이체)
    
    final public static String PG_PAY_METHOD_VIRTUAL = "SC0040"; // PG 결제타입 (무통장입금)
    
    final public static String PG_PAY_METHOD_PAYNOW = "SC0010-SC0030"; // PG 결제타입 (패이나우)
    
    /** 2020.06.25 카드값 정보가 일치하지 않아서 코드값으로 대체 */
    /*
    final public static String PG_PAY_SAMSUNGCARD = "51";
    final public static String PG_PAY_LOTTECARD = "71";
    final public static String PG_PAY_SHINHANCARD = "41";
    final public static String PG_PAY_HANACARD = "21"; // 하나SK 및 외환은행카드    
    */

    /** 처리자구분 - 회원 */
    final  public static int OPERATOR_TYPE_USER = 1;  
    /** 처리자구분 - 관리자 */
    final  public static int OPERATOR_TYPE_ADMIN = 2;  
    /** 처리자구분 - 물류 */
    final  public static int OPERATOR_TYPE_LOGIS = 3;
    /** 처리자구분 - 택배사 */
    final  public static int OPERATOR_TYPE_PARCEL = 4;
    /** 처리자구분 - 매장 */
    final  public static int OPERATOR_TYPE_SHOP = 5;
    /** 처리자구분 - PG입금통보 */
    final  public static int OPERATOR_TYPE_PG = 6;
    /** 처리자구분 - 주문전표 생성 */
    final  public static int OPERATOR_TYPE_ORDER_VOCHNO = 7;
    /** 처리자구분 - 취소전표 생성 */
    final  public static int OPERATOR_TYPE_CANCEL_VOCHNO = 8;
    /** 처리자구분 - 자동 */
    final  public static int OPERATOR_TYPE_BATCH = 9;
    
    
    // 상품 일괄등록 - 배치 아님 (로그를 LT_BCH_MST에 남기기 위한 내용임) 
    public static final String BATCH_CODE_PRODUCT_EXCEL_UPLOAD = "20";
    public static final String BATCH_NAME_PRODUCT_EXCEL_UPLOAD = "[관리]상품 엑셀 일괄등록";
    
    public static final int PRODUCT_TITLE_LENGTH_MAX = 20;
    
    //json 캐싱 여부
    public static final boolean _JSON_CACHE_ = true;
    public static final boolean _JSON_CACHE_PRODUCT_LIST_ = false;
    
    public static final String _NO_IMAGE_PC_LIST_ = "/pc/img/second/NoImage_250.jpg";
    public static final String _NO_IMAGE_PC_DETAIL_ = "/pc/img/second/NoImage_500.jpg";
    
    public static final String _NO_IMAGE_MB_LIST_ = "/pc/img/second/NoImage_250.jpg";
    public static final String _NO_IMAGE_MB_DETAIL_ = "/pc/img/second/NoImage_500.jpg";
    
    //자동취소
    public static final String EXPIRED_DEPOSIT_ORDER_CANCEL_CODE = "622"; //무통장 입금일 만료 자동취소 사유 공통코드
    
    public final static int SCM_ADMINISTRATOR_IDX = 30;		// 입점업체 관리자 IDX
    
    /** ############################### MarketPlant 공통코드 추가 시작 ################################### */
    
    /**
     *  공통코드 시작
     */
    
    public static final int COMMON_MEMBER_TYPE = 79;	// 회원구분코드(개인회원 , 기업회원 , 간편회원, SNS회원)
    public static final int MEMBER_TYPE_BASIC = 682;	// 일반회원
    public static final int MEMBER_TYPE_COMPANY = 683;	// 기업회원
    public static final int MEMBER_TYPE_SIMPLE = 1961;	// 이메일 간편회원
    public static final int MEMBER_TYPE_SNS = 2952;	    // SNS 회원
    public static final int SNS_MEMBER_NAVER_GRADE = 2953;  // SNS 회원 - NAVER
    public static final int SNS_MEMBER_KAKAOTALK_GRADE = 2954;  // SNS 회원 - KAKAOTALK
    public static final int SNS_MEMBER_FACEBOOK_GRADE = 2955;  // SNS 회원 - FACEBOOK
      
    public static final int COMMON_PRI_MEMBER_GRADE = 3618;	// 개인회원등급코드 (RED, SILVER, GOLD, VIP, PLATINUM)
    
    public static final int PRI_MEMBER_BRONZE_GRADE = 3619;	// 개인회원등급 - BRONZE
    public static final int PRI_MEMBER_SILVER_GRADE = 3620;	// 개인회원등급 - SILVER
    public static final int PRI_MEMBER_GOLD_GRADE = 3621;	// 개인회원등급 - GOLD
    public static final int PRI_MEMBER_VIP_GRADE = 3622;	// 개인회원등급 - VIP
    public static final int PRI_MEMBER_PLATINUM_GRADE = 3623;	// 개인회원등급 - PLATINUM
    public static final int PRI_MEMBER_KING_GRADE = 3624;	// 개인회원등급 - KING
    
    public static final int COMMON_COMP_MEMBER_GRADE = 683;	// 기업회원등급코드 (1등급 , 2등급)
    public static final int COMP_MEMBER_BASIC_GRADE = 1839; // 기업회원등급 - 2등급
    public static final int COMMON_AGREE_TYPE = 2003;	// 약관동의
    
    public static final int MEMBER_SEC_REASON = 1843;	// 회원탈퇴사유 (서비스 불만족, 배송 지연, 사이트 속도 느림, 상품 품질 저하, 이용 빈도 저조, 직권 탈퇴, 기타)
    public static final int SEC_REASON_AUTH = 1946;		// 회원탈퇴사유 중 직권탈퇴
    public static final int SEC_REASON_ETC = 1849;		// 회원탈퇴사유 중 기타
    
    public static final String SMS_TERMS_AGREE = "0001";	// SMS 수신   
    public static final String TM_TERMS_AGREE = "0002";	// TM 수신
    public static final String DM_TERMS_AGREE = "0003";	// DM 수신
    public static final String MAIL_TERMS_AGREE = "0004";	// MAIL 수신
    public static final String SK_TERMS_AGREE = "0005";	// SK플래닛 수신
    public static final String SC_TERMS_AGREE = "0006";	// 삼성카드 수신
    public static final String SE_TERMS_AGREE = "0007";	// 삼성전자 수신
    public static final String LG_TERMS_AGREE = "0008";	// LG전자 수신
    
    final  public static String [] TERMS_AGREE_ARR = { SMS_TERMS_AGREE, TM_TERMS_AGREE, DM_TERMS_AGREE, MAIL_TERMS_AGREE, SK_TERMS_AGREE, SC_TERMS_AGREE, SE_TERMS_AGREE, LG_TERMS_AGREE };
    
    public static final int ESTIMATE_MANAGEMENT_TYPE =  1814;		// 견적구분코드
    public static final int ESTIMATE_QUESTION_TYPE =  1924;			// 견적문의코드
    public static final int PRODUCT_NOTIFICATION_INFO_TYPE =  1821;		// 상품고시 자동입력 코드
    
    public static final int COMMON_NOTICE_TYPE =  140;				// 공지사항구분코드
    
    public static final int COMMON_NOTICE_GB_MALL =  1922;				// 공지사항유형_몰
    public static final int COMMON_NOTICE_GB_COMP =  1923;				// 공지사항유형_입점업체
    public static final int COMMON_INFOSITE_CONSULT_GB =  1972;				// 오프라인직영점관리_상담유형
    
    public static final int COMMON_INFOSITE_BRANCH_GB =  1979;				// 오프라인직영점관리_지점구분
    public static final int COMMON_INFOSITE_BRANCH_GB_PRICEKING =  1981;				// 오프라인직영점관리_지점구분-프라이스킹
    public static final int COMMON_INFOSITE_BRANCH_GB_COOK =  1982;				// 오프라인직영점관리_지점구분-쿡앤킹
    
    public static final int COMMON_INFOSITE_AREA_GB =  2394;				// 오프라인직영점관리_지역구분
    public static final int COMMON_INFO_NOTICE_TYPE =  2025;				// 오프라인직영점공지사항구분코드
    public static final int COMMON_EMAGAZINE_CATEGORY =  2012;				//이매거진관리 카테고리
    public static final int EMAGAZINE_CATEGORY_LIFE =  2014;				//이매거진관리 카테고리 - 라이프가이드
    public static final int EMAGAZINE_CATEGORY_BUY =  2015;					//이매거진관리 카테고리 - 구매가이드
    public static final int EMAGAZINE_CATEGORY_PRODUCT_REVIEW =  2016;		//이매거진관리 카테고리 - 상품리뷰
    public static final int EMAGAZINE_CATEGORY_PRODUCT_NEWS =  2017;		//이매거진관리 카테고리 - 상품뉴스
    public static final int EMAGAZINE_CATEGORY_STUFF =  2018;				//이매거진관리 카테고리 - STUFF
    public static final int EMAGAZINE_CATEGORY_THEME =  2279;				//이매거진관리 카테고리 - 테마가이드
    public static final int COMMON_EMAGAZINE_TYPE =  2013;				// 이매거진관리 분류
    public static final int COMMON_EMAGAZINE_THEME_CATEGORY =  2250;	//이매거진관리 테마가이드 카테고리
    public static final int COMMON_ANAC_CATEGORY =  2036;				//아낙 브랜드전시 카테고리
    public static final int COMMON_CASA_CATEGORY =  2074;				//까사부가티 브랜드전시 카테고리
    
    public static final int COMMON_CASA_DSN =  2044;				//까사부가티 브랜드전시 디자인 
    public static final int COMMON_CASA_CLR =  2053;				//까사부가티 브랜드전시 상품색상 
    public static final int COMMON_CASA_MTR =  2063;				//까사부가티 브랜드전시 마감재 
    
    public static final int COMMON_AD_WCH =  2081;				//광고관리 광고위치
    
    public static final int COMMON_EVENT_TYPE_GROUP = 3172;	// 이벤트유형코드
    public static final int EVENT_MASTER_TYPE_NORMAL = 2929; // 일반형
    public static final int EVENT_MASTER_TYPE_ENTER = 708; // 응모형
    public static final int EVENT_MASTER_TYPE_REPLY = 710; // 덧글형
    public static final int EVENT_MASTER_TYPE_BOARD = 712; // 게시판형
    public static final int EVENT_MASTER_TYPE_AUCTION = 711; // 경매형
    public static final int EVENT_MASTER_TYPE_SURVEY = 713; // 설문형
    public static final int EVENT_MASTER_TYPE_IMAGE = 1842; // 이미지형
    
    public static final int EVENT_MASTER_TYPE_GUIDE = 3173; // 안내
    public static final int EVENT_MASTER_TYPE_LUCKYDRAW = 3174; // 럭키드로우
    public static final int EVENT_MASTER_TYPE_RANDOM = 3175; //랜덤쿠폰
    public static final int EVENT_MASTER_TYPE_ROULETTE = 3176; //룰렛
    public static final int EVENT_MASTER_TYPE_QUIZ = 3177; //퀴즈
    public static final int EVENT_MASTER_TYPE_ATTENDANCE = 3178; //츨석체크
    public static final int EVENT_MASTER_TYPE_GROUPBUY = 3179; //공동구매
    public static final int EVENT_MASTER_TYPE_VOTE = 3180; //투표
    
    public static final int COMMON_CARD_EVENT_TYPE =  2030;				// 카드행사종류
    
    public static final int CARD_EVENT_TYPE_CHARGE =  2031;				// 청구할인
    public static final int CARD_EVENT_TYPE_POINT_DC =  2032;				// 포인트선할인
    public static final int CARD_EVENT_TYPE_POINT_SAVE =  2033;				// 카드포인트적립
    public static final int CARD_EVENT_TYPE_CASHBAG =  2034;				// 현금캐시백
    
    public static final int COMMON_CARD_DIV_TYPE =  2084;				// 카드행사종류
    
    public static final int CARD_DIV_TYPE_FREE_INTEREST =  2085;				// 무이자
    public static final int CARD_DIV_TYPE_PART_INTEREST =  2086;				// 부분 무이자
    public static final int CARD_DIV_TYPE_SPECIAL_INTEREST =  2087;				// 특별 무이자
    public static final int CARD_DIV_TYPE_NORMAL_INTEREST =  2088;				// 유이자
    
    final  public static int COMMON_PRODUCT_ACTIVITY  = 720;					// 상품 ACTIVITY
    final  public static int COMMON_REP_PRODUCT_COLOR = 727;					// 대표 상품 색상(상품 옵션 색상에 대한 대표값)
    final  public static int COMMON_PRODUCT_COLOR     = 950;					// 상품 색상(상품 옵션 색 , ETC3으로 대표 상품 색상 검색)
    final  public static int COMMON_PRODUCT_SIZE    = 2996;                    // 상품 사이즈
    
    final  public static int COMMON_PRODUCT_SEASON    = 3005;                  // 시즌 (전체, F/W, S/S)
    public static final int COMMON_PRODUCT_SEASON_FW = 3007;
    public static final int COMMON_PRODUCT_SEASON_SS = 3008;
    
    public static final int COMMON_STYLE_INSIDE_GROUP = 927;	// STYLE INSIDE 유형 코드    
    public static final int STYLE_INSIDE_MAGAZINE = 929; // MAGAZINE
    public static final int STYLE_INSIDE_TV_CF = 930; // TV/CF
    public static final int STYLE_INSIDE_GALLERY = 1194;	// GALLERY
    
    public static final int COMMON_BRAND_STORY_GROUP = 931;		// BRAND STORY 유형코드
    public static final int BRAND_STORY_COMPANY_INTRODUCE = 932;	// COMPANY INTRODUCE
    public static final int BRAND_STORY_HISTORY = 933;	// HISTORY
    public static final int BRAND_STORY_NEWS = 934;	// NEWS
    
    static public final int COMMON_SHOPPING_GUIDE_PRODUCT_TECHINFO = 96;	// 쇼핑가이드유형코드 상품 기술정보
    static public final int COMMON_SHOPPING_GUIDE_EQUIPMENT_KEEP = 1195;	// 쇼핑가이드유형코드 장비유지팁
    static public final int COMMON_SHOPPING_GUIDE_USE_MENUAL = 1196;	// 쇼핑가이드유형코드 사용메뉴얼
    
    static public final int COMMON_POINT_TYPE = 1869;	//포인트유형
    static public final int EACH_CANCEL_POINT_TYPE = 2961;   //부분취소 포인트 적립 코드
    static public final int PRD_BUY_POINT_TYPE = 2962;   //상품구매 포인트 차감 코드
    
    static public final int TEL_CODE = 21; // 국번 코드
    static public final int HP_CODE = 41; // 핸드폰 앞자리 코드
    static public final int EMAIL_DOMAIN_CODE = 51; // 이메일 도메인 코드
    static public final int SNS_TYPE_CODE = 2937; // SNS 구분 코드
    static public final int BUSINESS_CODE = 2340; // 사업자구분 코드
    static public final int HOPESALE_TYPE = 2371; // 판매희망채널
    static public final int NOWDISTRIBUTION_TYPE = 2375; // 현재유통방법
    static public final int STANDINGPOINT_CODE = 2386; // 입점신청 상태
    
    public static final int PICKUP_DLV_CPN_IDX = 22;	// 매장 방문 수령
    
    //휴면회원 처리
    public static final int MEMBER_BREAK_DOWN = 2101;	// 휴면회원 처리
    
    //주문 상담 유형
    public static final int ORDER_CS_TYPE_IDX = 1689;
    
    /**
     * 상품 판매상태 - 판매중(I), 판매대기(R), 일시품절(T), 판매중지(S)
     * BK-Mall 개선 2015.04.10 -> 판매중(I), 미판매(S), 품절상품(T), 일부품절(O)  
     */
    final  public static String PRODUCT_SELL_STATE_ING        = "I";  //판매중(I)
    final  public static String PRODUCT_SELL_STATE_READY      = "R";  //판매대기(R) -> 등록대기 -> 사용안함!
    final  public static String PRODUCT_SELL_STATE_TEMPOUT    = "T";  //일시품절(T) -> 품절상품
    final  public static String PRODUCT_SELL_STATE_STOP       = "S";  //판매중지(S) -> 미판매
    final  public static String PRODUCT_SELL_STATE_OP_TEMPOUT = "O";  //일부품절(O) ; 옵션상품중 일부가 품절 (화면 표시용)
    
    /**
     * 상품항목 - 대분류
     */
    public static final int PRODUCT_GUBUN = 3224; // 상품항목
    
    /**
     * 상품항목 - 중분류
     */
    public static final int PRODUCT_GUBUN_TOP = 3225; //상의
    public static final int PRODUCT_GUBUN_BOTTOM = 3226; //하의
    public static final int PRODUCT_GUBUN_ONEPIECE = 3227; //원피스
    public static final int PRODUCT_GUBUN_OUTER = 3228; //아우터
    public static final int PRODUCT_GUBUN_SHOES = 3229; //신발
    
    /**
     * 마이핏 입력정보
     */
    public static final int MYFIT_INPUT_INFO = 3288; //마이핏 입력정보
    /**
     * 상품 아이콘
     */
    final  public static String PRODUCT_ICON_BEST   = "1";    //NEW(1)
    /*final  public static String PRODUCT_ICON_NEW    = "2";*/    //BEST(2)
    final  public static String PRODUCT_ICON_LIMITED  = "3";    //한정수량(3)
    final  public static String PRODUCT_ICON_BOX = "4";    //박스개봉(4)
    final  public static String PRODUCT_ICON_REAPER = "5";    //리퍼상품(5)
    
    final  public static String PRODUCT_ICON_BEST_NM    = "BEST";   //BEST(2)
    /*final  public static String PRODUCT_ICON_NEW_NM   = "NEW";      *///NEW(1)
    final  public static String PRODUCT_ICON_LIMITED_NM  = "한정수량";     //한정수량(3)
    final  public static String PRODUCT_ICON_BOX_NM = "박스개봉"; //박스개봉(4)
    final  public static String PRODUCT_ICON_REAPER_NM = "리퍼상품"; //리퍼상품(5)
    
    // 화면 표시를 쉽게 하기 위해 추가.
    final  public static String [] PRODUCT_ICON_NM = { PRODUCT_ICON_BEST_NM, PRODUCT_ICON_LIMITED_NM, PRODUCT_ICON_BOX_NM , PRODUCT_ICON_REAPER_NM };
    
    /**
     * 상품관리 > 안내문구관리 : 안내문구 분류
     * 안내문구 분류 변경 2015.04.13
     * 고시정보,사이즈가이드,세탁&취급안내,배송/교환/반품,품질보증/AS안내
     */
    final  public static String PRODUCT_GUIDE_SHIPPING 	= "1";    //배송/반품/교환(1)
    final  public static String PRODUCT_GUIDE_AS 		= "2";    //품지보증/AS안내(2)
    final  public static String PRODUCT_GUIDE_INFO 		= "3";    //고시정보(3)
    final  public static String PRODUCT_GUIDE_SIZE 		= "4";    //사이즈가이드(4)    
    final  public static String PRODUCT_GUIDE_WASH   	= "5";    //세탁&취급안내(5)
    
    final  public static String PRODUCT_GUIDE_SHIPPING_NM 	= "배송/반품/교환";     //배송/반품/교환(1)
    final  public static String PRODUCT_GUIDE_AS_NM 		= "품질보증/AS안내";    //품지보증/AS안내(2)
    final  public static String PRODUCT_GUIDE_INFO_NM 		= "고시정보";           //고시정보(3)
    final  public static String PRODUCT_GUIDE_SIZE_NM 		= "사이즈가이드";       //사이즈가이드(4)    
    final  public static String PRODUCT_GUIDE_WASH_NM   	= "세탁&취급안내";      //세탁&취급안내(5)
    
    // 리스트 표시를 쉽게 하기 위해. 1:배송/반품/교환, 2:품질보증/AS안내, 3:고시정보, 4:사이즈가이드, 5:세탁&취급안내
    final  public static String [] PRODUCT_GUIDE_NM = { "", PRODUCT_GUIDE_SHIPPING_NM, PRODUCT_GUIDE_AS_NM, PRODUCT_GUIDE_INFO_NM, PRODUCT_GUIDE_SIZE_NM, PRODUCT_GUIDE_WASH_NM};
    
    /** 관리자 화면 썸네일 사이즈	*/
    public static final int PRODUCT_THUMBNAIL_IMAGE_WIDTH = 84;
    
    /** 프론트 썸네일 사이즈	
     * PC - 84, 125, 180, 250, 320, 450, 500
     * moblie - 84, 125, 180 , 250, 320, 450, 500
     */
    public static final int THUMBNAIL_SIZE_PC_PRODUCT_LIST = 250;
    public static final int THUMBNAIL_SIZE_PC_CHANNEL_ON_PRODUCT = 270;
    public static final int THUMBNAIL_SIZE_PC_PRODUCT_LIST_LARGE = 320;
    public static final int THUMBNAIL_SIZE_PC_PRODUCT_LIST_MIDDLE = 180;
    public static final int THUMBNAIL_SIZE_PC_PRODUCT_LIST_SMALL = 125;
    public static final int THUMBNAIL_SIZE_PC_PRODUCT_LIST_SHORT = 84;
    
    public static final int THUMBNAIL_SIZE_PC_PRODUCT_ITEM_BIG = 500;
    public static final int THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE = 450;
    public static final int THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL = 84;
    
    public static final int THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST = 250;
    public static final int THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_LARGE = 320;
    public static final int THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_MIDDLE = 180;
    public static final int THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_SMALL = 125;
    public static final int THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_SHORT = 84;
    
    public static final int THUMBNAIL_SIZE_MOBILE_PRODUCT_ITEM_BIG = 500;
    public static final int THUMBNAIL_SIZE_MOBILE_PRODUCT_ITEM_LARGE = 450;
    public static final int THUMBNAIL_SIZE_MOBILE_PRODUCT_ITEM_SMALL = 84;
    
    /**
     * 전시배너/상품영역 코드
     */
    public static final int COMMON_BANNER_DISPLAY_PC = 147;
    
    public static final int COMMON_THEME_BANNER = 2349;
    
    public static final int COMMON_THEME_PRODUCT = 3708;
    
    public static final int COMMON_THEME_PRODUCT_TIME_POPUP = 3714; // 타임특가플로팅팝업
    
    public static final int COMMON_BANNER_DISPLAY_MOBILE = 179;          //전시배너영역 (Mobile)
    
    public static final int COMMON_PRODUCT_DISPLAY_PC = 183;         //전시상품영역 pc
    
    public static final int COMMON_PRODUCT_DISPLAY_MOBILE = 194;         //전시상품영역 mobile
    
    public static final int COMMON_PRODUCT_DISPLAY_BRAND = 2338;         //상품상세 브랜드 공지
    
    public static final int COMMON_PRODUCT_DISPLAY_MD = 2339;         //상품상세 MD드 공지
    
    public static final int COMMON_DISPLAY_TAG = 3717;         //전시태마관리
    
    /**
     * 공통코드 > 셀러룸 전시배너관리_A 
     */
    public static final int COMMON_SELLER_ROOM_DISPLAY_BANNER = 3605; //셀러룸 전시배너관리_A
    
    /**
     * 공통코드 > 셀러룸 전시상품관리_A 
     */
    public static final int COMMON_SELLER_ROOM_DISPLAY_PRODUCT = 3805; //셀러룸 전시상품관리_A    
    
    
    /**
     * 공통코드 > 셀러룸 전시배너관리_A > 셀러룸 A 메인
     */
    public static final int COMMON_SELLER_ROOM_DISPLAY_MAIN = 3606; //셀러룸 A 메인
    public static final int COMMON_SELLER_ROOM_DISPLAY_TOP_BANNER = 3611; //셀러룸 A 메인 > 상단배너
    public static final int COMMON_SELLER_ROOM_DISPLAY_PLAN = 3612; //셀러룸 A 메인 > 기획전
    public static final int COMMON_SELLER_ROOM_DISPLAY_SELLER_PICK = 3613; //셀러룸 A 메인 > 셀러픽
    public static final int COMMON_SELLER_ROOM_DISPLAY_BY_TREND = 3614; //셀러룸 A 메인 > #by trend
    public static final int COMMON_SELLER_ROOM_DISPLAY_BANNER_BANNER = 3615; //셀러룸 A > 띠배너
    
    /**
     * 공통코드 > 셀러룸 전시배너관리_A > 셀러픽A
     */
    public static final int COMMON_SELLER_ROOM_DISPLAY_SELLERPICK = 3607; //셀러픽 A
    public static final int COMMON_SELLER_ROOM_DISPLAY_SELLERPICK_TOP_BANNER = 3616; //셀러픽 A > 상단배너
    
    /**
     * 공통코드 > 셀러룸 전시배너관리_A > 셀러룸정보A
     */
    public static final int COMMON_SELLER_ROOM_DISPLAY_SELLERINFO = 3608; //셀러룸정보 A
    public static final int COMMON_SELLER_ROOM_DISPLAY_SELLERINFO_TOP_BANNER = 3617; //셀러룸정보 A > 상단배너


    /**
     * 공통코드 > 셀러룸 전시상품관리_A > 셀러룸정보A
     */
    public static final int COMMON_SELLER_ROOM_PRODUCT_MAIN  = 3806; //셀러룸 메인
    public static final int COMMON_SELLER_ROOM_PRODUCT_BYTAG = 3807; //#by tag 상품
    public static final int COMMON_SELLER_ROOM_PRODUCT_NEW = 3808; //신상품 TAB
    public static final int COMMON_SELLER_ROOM_PRODUCT_WEEKBEST = 3809; //주간 베스트 TAB    
    public static final int COMMON_SELLER_ROOM_PRODUCT_MAIN_UP  = 3805; //셀러룸 메인
    
    
    /**
     * 공통태그 > 셀러룸 전시태그관리
     */
    public static final int SELLER_ROOM_TAG_DISPLAY = 3802; // 셀러룸 전시태그
    public static final int SELLER_ROOM_MAIN_TAG_DISPLAY = 3803; // 셀러룸 메인
    public static final int SELLER_ROOM_BY_TAG_DISPLAY = 3804; // #by tag
    
    /**
     * 공통태그 > 전시태그관리 
     */
    public static final int TAG_DISPLAY_TAG_COMMON = 3718; // 공통태그
    public static final int TAG_DISPLAY_TAG_JOIN = 3720; // 회원가입
    public static final int TAG_DISPLAY_TAG_OOTD_FEED = 3721; // OOTD 피드선택
    public static final int TAG_DISPLAY_TAG_OOTD_REG = 3722; // OOTD 등록
    public static final int TAG_DISPLAY_TAG_OOTD_MAIN = 3723; // OOTD 메인
    public static final int TAG_DISPLAY_TAG_STORE_MAIN = 3724; // STORE 메인
    
    public static final int TAG_DISPLAY_TAG_PC = 3719; // PC
    
    /**
     * 전시태그
     */
    public static final int TAG_DISPLAY_WOMEN_PC = 3726;
    public static final int TAG_DISPLAY_MEN_PC = 3727;
    public static final int TAG_DISPLAY_LIFE_PC = 3728;
    public static final int TAG_DISPLAY_BEAUTY_PC = 3729;
    
    /**
     * 카테고리 코드
     */
    
    public static final int CATEGORY_WOMEN_CD = 3389;
    public static final int CATEGORY_MEN_CD = 3396;
    public static final int CATEGORY_LIFE_CD = 3407;
    public static final int CATEGORY_BEAUTY_CD = 3454;
    
    /** front 상품 정렬 순서 */
    public static final String [] _PRODUCT_LIST_ORDER_ = { "", 
		"ORD ASC, PRD_MST_REG_DT DESC, PRD_MST_CD ASC", 
		"PRD_MST_REG_DT DESC, PRD_MST_CD ASC",
		"PRICE_MEMBER_GROUP_MALL DESC, PRD_MST_REG_DT DESC, PRD_MST_CD ASC",
    	"PRICE_MEMBER_GROUP_MALL ASC, PRD_MST_REG_DT DESC, PRD_MST_CD ASC", 
		"REP_POINT DESC, PRD_MST_REG_DT DESC, PRD_MST_CD ASC", 
    	"FLAT_PRICE_YN DESC, PROD_PERAMT1 DESC",
    	"PRD_MST_CD ASC"
    };
    
    // popup 호출 영역 
    public static final int POPUP_LOCATION_CODE_MAINPAGE = 78;  // 메인 
    public static final int POPUP_LOCATION_CODE_PRODUCTLIST = 119;	//상품카테고리목록
    
    /****************************************************************************************
	* 	배치작업 관련 정의 
	* _INFO : 데이터 수집
	* _SEND : 데이터 전송  
	*****************************************************************************************/
	public static final String BATCH_USER_SCHEDULED = "SYSTEM-BATCH";
	public static final String BATCH_RESULT_END = "E";
	public static final String BATCH_RESULT_FAIL = "F";
	public static final String BATCH_RESULT_START = "S";

	/** [ERP] 제품정보 */	
    public static final String BATCH_CODE_DELETE_CI = "02";
    public static final String BATCH_NAME_DELETE_CI = "[관리] 탈퇴회원 CI값 삭제";
    
    public static final String BATCH_CODE_BLACK_STATE = "03";
    public static final String BATCH_NAME_BLACK_STATE = "[관리] 블랙리스트 기한종료 상태값변경";
    
    public static final String BATCH_CODE_REST_CHANGE = "04";
    public static final String BATCH_NAME_REST_CHANGE = "[관리] 휴면회원 전환";      
    
	/** [관리] 가상계좌 주문 취소			*/
    public static final String BATCH_CODE_CANCEL_ORDER = "09";
    public static final String BATCH_NAME_CANCEL_ORDER = "[관리] 가상계좌 주문 취소";
    
	/** [관리] 장바구니 삭제	*/
    public static final String BATCH_CODE_DELETE_CART_PRODUCT = "10";
    public static final String BATCH_NAME_DELETE_CART_PRODUCT = "[관리] 장바구니 삭제"; 

    /** [관리] 자동 배송완료 처리		*/
    public static final String BATCH_CODE_DELIVERY_COMPLETED = "11";
    public static final String BATCH_NAME_DELIVERY_COMPLETED = "[관리] 자동 배송완료 처리"; 

	/** [관리] 주문 임시테이블 삭제	*/
    public static final String BATCH_CODE_DELETE_ORDER_TEMP = "17";
    public static final String BATCH_NAME_DELETE_ORDER_TEMP = "[관리] 주문 임시 테이블 삭제";     
    
    public static final String BATCH_CODE_WEATHER_API = "18";
    public static final String BATCH_NAME_WEATHER_API = "[관리] 날씨정보가져오기";
    
	/** [관리] 상품 판매갯수 업데이트 */
    public static final String BATCH_CODE_UPDATE_ORDER_COUNT = "19";
    public static final String BATCH_NAME_UPDATE_ORDER_COUNT = "[관리] 상품 판매갯수 업데이트";
    
	/** [관리] 상품 판매갯수 업데이트 */
    public static final String BATCH_CODE_UPDATE_BEST_ICON = "20";
    public static final String BATCH_NAME_UPDATE_BEST_ICON = "[관리] 상품 베스트 아이콘 업데이트";
    
    /** [관리] 기획전 전시종료시 상태 업데이트 */
    public static final String BATCH_CODE_UPDATE_SPECIAL_DISPLAY = "21";
    public static final String BATCH_NAME_UPDATE_SPECIAL_DISPLAY = "[관리] 기획전 전시상태 업데이트";
    
    /** [관리] 주문 배송완료 후 구매확정 상태 업데이트 */
    public static final String BATCH_CODE_UPDATE_ORDER_STATE = "22";
    public static final String BATCH_NAME_UPDATE_ORDER_STATE = "[관리] 배송완료 후 구매확정 업데이트";
    
    /** [관리] 거래처 정보 갱신 */
    public static final String BATCH_CODE_VENDOR_INFO = "23";
    public static final String BATCH_NAME_VENDOR_INFO = "[관리] 거래처 정보 갱신";
    
    /** [관리] 회원등급 갱신(월단위) */
    public static final String BATCH_CODE_MEMBER_MONTH_GRADE = "24";
    public static final String BATCH_NAME_MEMBER_MONTH_GRADE = "[관리] 회원등급(월단위) 갱신";
    
    /** [관리] 회원등급 갱신(년단위) */
    public static final String BATCH_CODE_MEMBER_YEAR_GRADE = "25";
    public static final String BATCH_NAME_MEMBER_YEAR_GRADE = "[관리] 회원등급(년단위) 갱신"; 
    
    /** [관리] ERP 기간계상품 마스터 */
    public static final String BATCH_CODE_ERP_PRODUCT = "26";
    public static final String BATCH_NAME_ERP_PRODUCT = "[관리] ERP 기간계상품 마스터";
    
    /** [관리] 결제후 주문취소 */
    public static final String BATCH_CODE_ORDER_CANCEL = "27";
    public static final String BATCH_NAME_ORDER_CANCEL = "[관리] 결제후 주문취소";
    
    /** [관리] ERP 기간계 코드별 오프라인 판매갯수(최근7일) */
    public static final String BATCH_CODE_ERP_BEST_PRODUCT = "28";
    public static final String BATCH_NAME_ERP_BEST_PRODUCT = "[관리] ERP 기간계코드별 판매갯수";
    
    /** [관리] Erp -> SM 탈퇴회원 전송 */
    public static final String BATCH_CODE_ERP_LEAVE_MEMBER = "29";
    public static final String BATCH_NAME_ERP_LEAVE_MEMBER = "[관리] Erp -> SM 탈퇴회원 전송";
    
    /** [관리] Erp 소멸예정 마일리지 */
    public static final String BATCH_CODE_EXTINCTION_MILEAGE = "30";
    public static final String BATCH_NAME_EXTINCTION_MILEAGE = "[관리] Erp 소멸예정 마일리지";
    
    /** [관리] Erp 소멸예정 마일리지 */
    public static final String BATCH_CODE_ERP_EMP = "32";
    public static final String BATCH_NAME_ERP_EMP = "[관리] Erp 인사정보";
    
    /** [관리] 생일 이메일 및 쿠폰발행 */
    public static final String BATCH_CODE_BIRTH_MEMBER = "33";
    public static final String BATCH_NAME_BIRTH_MEMBER = "[관리] 회원 생일 쿠폰발행 처리";
    
    /** [관리] 첫구매  이메일 및 쿠폰발행 */
    public static final String BATCH_CODE_FIRST_ORDER_COUPON = "34";
    public static final String BATCH_NAME_FIRST_ORDER_COUPON = "[관리] 첫구매 쿠폰발행 처리";   
    
    /** [관리] EDI 배송결과(집하처리) 상태 업데이트 */
    public static final String BATCH_CODE_UPDATE_EDI_DELIVERING_STATE = "35";
    public static final String BATCH_NAME_UPDATE_EDI_DELIVERING_STATE = "[관리] EDI 배송결과(집하처리) 업데이트";
    
    /** [관리] EDI 배송결과(배송완료) 상태 업데이트 */
    public static final String BATCH_CODE_UPDATE_EDI_DELIVERED_STATE = "36";
    public static final String BATCH_NAME_UPDATE_EDI_DELIVERED_STATE = "[관리] EDI 배송결과(배송완료) 업데이트";
    
    /** [관리] EDI 회수(집하처리) 상태 업데이트 */
    public static final String BATCH_CODE_UPDATE_EDI_DELIVERING_WITHDRAW_STATE = "37";
    public static final String BATCH_NAME_UPDATE_EDI_DELIVERING_WITHDRAW_STATE = "[관리] EDI 회수(집하처리) 업데이트";    
    
    /** [관리] EDI 회수(배송완료) 상태 업데이트 */
    public static final String BATCH_CODE_UPDATE_EDI_DELIVERED_WITHDRAW_STATE = "38";
    public static final String BATCH_NAME_UPDATE_EDI_DELIVERED_WITHDRAW_STATE = "[관리] EDI 회수(배송완료) 업데이트";
    
    /** [관리] EDI 회수(배송완료) 상태 업데이트 */
    public static final String BATCH_CODE_UPDATE_EDI_DELIVERED_RETURN_STATE = "39";
    public static final String BATCH_NAME_UPDATE_EDI_DELIVERED_RETURN_STATE = "[관리] EDI 반품(배송완료) 업데이트";        
    
    
    /** [관리] ERP 출고일 -> SM 배송중 변경 */
    public static final String BATCH_CODE_UPDATE_ORDER_DELIVERING_STATE = "40";
    public static final String BATCH_NAME_UPDATE_ORDER_DELIVERING_STATE = "[관리] ERP 출고일 -> SM 배송중 변경";
    
    /** [관리] ERP 인수일 -> SM 배송완료 변경 */
    public static final String BATCH_CODE_UPDATE_ORDER_DELIVERED_STATE = "41";
    public static final String BATCH_NAME_UPDATE_ORDER_DELIVERED_STATE = "[관리] ERP 인수일 -> SM 배송완료 변경";
    
    /** [관리] 교환회수완료 -> 교환완료 변경 */
    public static final String BATCH_CODE_UPDATE_ORDER_SWAP_END_STATE = "42";
    public static final String BATCH_NAME_UPDATE_ORDER_SWAP_END_STATE = "[관리] 교환회수완료 -> 교환완료 변경";
    
    /** [관리] 입점업체 주문 -> 주문확정 */
    public static final String BATCH_CODE_UPDATE_ORDER_CONFIRM = "43";
    public static final String BATCH_NAME_UPDATE_ORDER_CONFIRM = "[관리] 입점업체 주문 -> 주문확정";
    
    /** [관리] 입금대기 주문 입금요청 */
    public static final String BATCH_CODE_ORDER_DEPOSIT_ALARM = "44";
    public static final String BATCH_NAME_ORDER_DEPOSIT_ALARM = "[관리] 입금대기 주문 입금요청";
    
    /** [관리] 배송완료 주문 구매확정 요청 */
    public static final String BATCH_CODE_ORDER_CONFIRM_ALARM = "45";
    public static final String BATCH_NAME_ORDER_CONFIRM_ALARM = "[관리] 배송완료 주문 구매확정 요청";
    
    /** [관리] 반품회수완료 -> 반품완료(부분반품) 변경 */
    public static final String BATCH_CODE_UPDATE_ORDER_BACK_END_STATE = "47";
    public static final String BATCH_NAME_UPDATE_ORDER_BACK_END_STATE = "[관리] 반품회수완료 -> 부분반품완료";
    
    /** [관리] 배송전 주문취소 */
    public static final String BATCH_CODE_ORDER_CANCEL_BEFORE_DELIVERING = "48";
    public static final String BATCH_NAME_ORDER_CANCEL_BEFORE_DELIVERING = "[관리] 배송전 주문취소";
    
    /** [관리] 겟잇나우 기간만료 주문취소 */
    public static final String BATCH_CODE_ORDER_GETITNOW_EXPIRATION_CANCEL= "49";
    public static final String BATCH_NAME_ORDER_GETITNOW_EXPIRATION_CANCEL = "[관리] 겟잇나우기간만료취소";
    
    /** [관리] 겟잇나우 ERP 주문취소 */
    public static final String BATCH_CODE_ORDER_GETITNOW_ERP_CANCEL= "50";
    public static final String BATCH_NAME_ORDER_GETITNOW_ERP_CANCEL = "[관리] 겟잇나우ERP취소";
    
    /** [관리] (겟잇나우) ERP 상품준비 -> SM 배송중 변경 */
    public static final String BATCH_CODE_UPDATE_GETITNOW_ORDER_DELIVERING_STATE = "51";
    public static final String BATCH_NAME_UPDATE_GETITNOW_ORDER_DELIVERING_STATE = "[관리] 겟잇나우 배송중 처리";

    /** [관리] (겟잇나우) ERP 배송완료 -> SM 배송완료 변경 */
    public static final String BATCH_CODE_UPDATE_GETITNOW_ORDER_DELIVERED_STATE = "52";
    public static final String BATCH_NAME_UPDATE_GETITNOW_ORDER_DELIVERED_STATE = "[관리] 겟잇나우 배송완료 처리";
    
    /** [관리] 다음 EP 데이터 전체 */
    public static final String BATCH_CODE_EP_ALL_DAUM = "53";
    public static final String BATCH_NAME_EP_ALL_DAUM = "[관리] 다음 EP 데이터 전체분 생성";
    
    /** [관리] 다음 EP 데이터 변경분 */
    public static final String BATCH_CODE_EP_BRIEF_DAUM = "54";
    public static final String BATCH_NAME_EP_BRIEF_DAUM = "[관리] 다음 EP 데이터 변경분 생성";
    
    /** [관리] 다나와 EP 데이터 전체 */
    public static final String BATCH_CODE_EP_ALL_DANAWA = "55";
    public static final String BATCH_NAME_EP_ALL_DANAWA = "[관리] 다나와 EP 데이터 전체분 생성";
    
    /** [관리] 다나와 EP 데이터 변경분 */
    public static final String BATCH_CODE_EP_BRIEF_DANAWA = "56";
    public static final String BATCH_NAME_EP_BRIEF_DANAWA = "[관리] 다나와 EP 데이터 변경분 생성";
    
    /** [관리] 네이버 EP 데이터 전체 */
    public static final String BATCH_CODE_EP_ALL_NAVER = "57";
    public static final String BATCH_NAME_EP_ALL_NAVER = "[관리] 네이버 EP 데이터 전체분 생성";
    
    /** [관리] 네이버 EP 데이터 변경분 */
    public static final String BATCH_CODE_EP_BRIEF_NAVER = "58";
    public static final String BATCH_NAME_EP_BRIEF_NAVER = "[관리] 네이버 EP 데이터 변경분 생성";
    
    /** [관리] 에누리 EP 데이터 전체 */
    public static final String BATCH_CODE_EP_ALL_ENURI = "59";
    public static final String BATCH_NAME_EP_ALL_ENURI = "[관리] 에누리 EP 데이터 전체분 생성";
    
    /** [관리] 에누리 EP 데이터 변경분 */
    public static final String BATCH_CODE_EP_BRIEF_ENURI = "60";
    public static final String BATCH_NAME_EP_BRIEF_ENURI = "[관리] 에누리 EP 데이터 변경분 생성";
    
    /** [관리] 3개월 지난 카드정보 삭제 */
    public static final String BATCH_CODE_DELETE_CARD_NO = "61";
    public static final String BATCH_NAME_DELETE_CARD_NO = "[관리] 3개월 지난 카드정보 삭제";
    
    /** [관리] 일일매출 sms 발송 */
    public static final String BATCH_CODE_DAILY_SMS = "62";
    public static final String BATCH_NAME_DAILY_SMS = "[관리] 일일매출 sms 발송";   
    
    public static final String BATCH_CODE_APP_PUSH = "63";
    public static final String BATCH_NAME_APP_PUSH = "[관리] APP 푸시알림";
    
    public static final String BATCH_CODE_MEMBER_AND_ORDER_SMS = "64";
    public static final String BATCH_NAME_MEMBER_AND_ORDER_SMS = "[관리] 회원 가입 인원수 매출 금액";
    
    public static final String BATCH_CODE_LAST_READ_COUNT_UPDATE = "65";
    public static final String BATCH_NAME_LAST_READ_COUNT_UPDATE = "지난주 조회 수 업데이트";
    
    /**
     *  공통코드 끝
     */
    
    // 로고 타입
    public static final int LOGO_TYPE = 2932;
    public static final int LOGO_TYPE_ADMIN_LOGIN = 2933;
    public static final int LOGO_TYPE_ADMIN = 2934;
    public static final int LOGO_TYPE_WEB = 2935;
    public static final int LOGO_TYPE_MOBILE = 2936;
    
    // 게시판 타입 - 일반(N), 이미지(I)
    public static final String BOARD_TYPE_NORMAL = "N";   //일반
    public static final String BOARD_TYPE_IMAGE = "I";   //이미지    
    
    // 게시판 관리(생성기) IDX
    public static final int CREATE_BOARD_IDX = 128;
    
    // 이미지 게시판 타입 - 썸네일(T), 일반(G)
    public static final String IMG_BOARD_TYPE_THUMB = "T";	//썸네일
    public static final String IMG_BOARD_TYPE_GENERAL = "G";	//일반
    
    // OOTD 타입 - 일반(O)
    public static final String IMG_OOTD_TYPE = "O";	
    
    // 기획전 상세 타입 - 이미지(I)
    public static final String PLAN_DETAIL_IMG_TYPE = "I";
    // 기획전 상세 타입 - 에디트(E)
    public static final String PLAN_DETAIL_EDIT_TYPE = "E"; 
    // 기획전 상세 타입 - 스크립트(S)
    public static final String PLAN_DETAIL_SCRIPT_TYPE = "S"; 
    
    // 문의 구분 - 1:1고객문의(I), 상품Q&A(Q)
    public static final String BOARD_INQ_TYPE_CUSTOMER = "I";	// 1:1고객문의
	public static final String BOARD_INQ_TYPE_PRODUCT = "Q";	// 상품Q&A	
	public static final String BOARD_INQ_TYPE_SELLER = "S";	// 상품Q&A		
        
    // 상품 분류 
    public final static int PRODUCT_GOOD_CLASS_NORMAL     = 1;  // 일반(신) 상품 
    public final static int PRODUCT_GOOD_CLASS_CARRYOVER  = 2;  // 이월 상품 - 일반상품 중 할인율이 10%이상인것 
    public final static int PRODUCT_GOOD_CLASS_SPECIAL    = 3;  // 특가상품 
    
    // 상품평(포인트 적립) - 상품후기작성 , 포토후기작성
    public final static int PRODUCT_COMMENT_BASIC_CODE = 1873;	// 상품후기작성
    public final static int PRODUCT_COMMENT_PHOTO_CODE = 1874;	// 포토후기작성
    
    // 로그인시 포인트 지급
    public final static int LOGIN_SUCCESS_POINT_CODE = 1875;	// 로그인
    
    //포인트 마일리지 전환
    public final static int POINT_CHANGE_MILEAGE = 2334;	// 마일리지전환
    
    // 상품 온라인 매장명 
    public final static String ONLINE_SHOP_NAME="온라인";
    public final static String ONLINE_SHOP_CODE="ONLINE";
    
    //1:1 고객문의 유형 - 주문/결제
    public final static int BOARD_INQ_TYPE_CUSTOMER_ORDER = 356;
    
    //상품 만족도 size, color 화면 표시용 array 
    final  public static String [] PRODUCT_REV_COLOR_NM = { "", "화면보다 밝다", "화면과 같다", "화면보다 어둡다"};
    final  public static String [] PRODUCT_REV_SIZE_NM = { "", "사이즈가 작다", "사이즈가 맞다", "사이즈가 크다"};
    
    /** 주문발주 대상 주문상태 */
    final  public static int [] THIRD_PART_ORDER = { OST_PAY, OST_SWAP_TARGET_COLLECT_END };
    final  public static int [] THIRD_PART_RETURN = { OST_SWAP_COLLECT_CALL, OST_BACK_END };  
    
    // 관리자 업무구분 
    public final static int WORK_DIVISION_CODE = 1697;
    
    // 슈퍼관리자 idx
    public final static int SUPER_ADMINISTRATOR_IDX = 1;
    
    // 입점업체 관리자 idx
    public final static int VENDOR_ADMINISTRATOR_IDX = 30;
    
    // 입점업체 매장 관리자 idx
    public final static int VENDOR_STORE_ADMINISTRATOR_IDX = 65;
    
    // MD 관리자 idx
    public final static int MD_ADMINISTRATOR_IDX = 26;
    
    // 마케팅 관리자 idx
    public final static int MKT_ADMINISTRATOR_IDX = 33;    
    
    // KICC 은행 코드
    public final static int KICC_BANK_CD = 1703;
    // KICC 신용카드
    public final static int  KICC_CARD_CD = 1741;
    
    // 배송구분
    public final static int DLV_TYPE = 1785;
    
	/* 배송 코드 추가 및 주석 변경(2020.06.26) */
    /** 일반택배 */
    public final static int DLV_TYPE_PARCEL_SGS = 1788; 		
    /** 매장픽업(겟잇나우)배송 */
    public final static int DLV_TYPE_GET_IT_NOW = 1790; 		
    /** 매장발송(입점업체배송) */
    public final static int DLV_TYPE_PARTNER = 1791; 			
    /** 매장발송요청 */
    public final static int DLV_TYPE_PARTNER_ASK = 3836;
    /** 매장발송거절 */
    public final static int DLV_TYPE_PARTNER_DENY = 3837;
    
    /** 매장발송 관련 코드 */
    public final static int[] DLV_TYPE_PARTNER_ARR = {DLV_TYPE_PARTNER, DLV_TYPE_PARTNER_ASK, DLV_TYPE_PARTNER_DENY};
    
    /* 이하 4개는 미사용(2020.06.26) */
    public final static int DLV_TYPE_WAREHOUSE = 1786; 			//물류배송(미사용)
    public final static int DLV_TYPE_MAKER = 1787; 				//메이커배송(미사용)
    public final static int DLV_TYPE_PARCEL_WAREHOUSE = 1789; 	//물류택배배송(미사용)
    public final static int DLV_TYPE_SERVICE = 2102; 			//무형상품배송(클린킹-미사용)
    
    // 지역코드
    public final static int AREA_CD = 1793;
    
    // 결제오류 구분
    public final static int ORDER_ERR_TYPE_PG = 1944;
    public final static int ORDER_ERR_TYPE_DB = 1945;
    
    // 겟잇나우 수령인
    public final static int GET_IT_NOW_RECEIVER_CD = 2089;
    
    // 장바구니 배송유형 (주석 수정 2020.06.27)
    /** 일반택배 */
    public final static int CART_DLV_GBN_NORMAL_CD = 2096; 		// 일반택배
    /** 매장픽업(기존 겟잇나우배송) */
    public final static int CART_DLV_GBN_GET_IT_NOW_CD = 2097; 	// 매장픽업(기존 겟잇나우배송)
    public final static int CART_DLV_GBN_SERVICE_CD = 2098; 	// 무형배송(클린킹)(미사용)
    public final static int CART_DLV_GBN_LONG_INS_CD = 2099; 	// 장기할부배송(미사용)
    
    // 채널관리 
    public final static int CHANNEL_PARTNERSHIP_CD = 1; //제휴채널
    public final static int CHANNEL_PRICE_COMPARE_CD = 2; //가격비교채널
    public final static int CHANNEL_STORE_CD = 3; //판매채널
    
    public final static int DLV_MESSAGE_CD = 2650; //배송메세지 
    
    
    /** ############################### MarketPlant 공통코드 추가 끝 ################################### */
    
    /** ############################### 자동발급쿠폰코드 추가 시작 ################################### */
    
    public final static String AUTO_COUPON_MEMBER_REGIST_5 = "ETLSPZ748";   // 회원가입쿠폰 5%
    
    public final static String AUTO_COUPON_FIRST_BUY = "ETLYDI749"; 		// 첫구매감사쿠폰 7%
    
    public final static String AUTO_COUPON_BIRTHDAY_RED 	 = "ETLHJI742"; // RED등급 생일쿠폰 10%
    public final static String AUTO_COUPON_BIRTHDAY_SILVER 	 = "ETLLPE743"; // SILVER등급 생일쿠폰 10%
    public final static String AUTO_COUPON_BIRTHDAY_GOLD 	 = "ETLFNI745"; // GOLD등급 생일쿠폰 10%
    public final static String AUTO_COUPON_BIRTHDAY_VIP 	 = "ETLIKH746"; // VIP등급 생일쿠폰 10%
    public final static String AUTO_COUPON_BIRTHDAY_PLATINUM = "ETLEHL747"; // PLATINUM등급 생일쿠폰 10%    
    
    public final static String AUTO_COUPON_MEMBER_GRADE_RED_5 	 	= "ETLGHV734"; 	// RED등급 쿠폰 5%    
    public final static String AUTO_COUPON_MEMBER_GRADE_SILVER_5    = "ETLSKY735"; 	// SILVER등급 쿠폰 5%    
    public final static String AUTO_COUPON_MEMBER_GRADE_GOLD_5      = "ETLYSM736"; 	// GOLD등급 쿠폰 5%    
    public final static String AUTO_COUPON_MEMBER_GRADE_VIP_5 		= "ETLWJG737";  // VIP등급 쿠폰 5%    
    public final static String AUTO_COUPON_MEMBER_GRADE_PLATINUM_5  = "ETLGLI738"; 	// PLATINUM등급 쿠폰 5%
    
    public final static String AUTO_COUPON_MEMBER_GRADE_GOLD_7 		= "ETLKCE739"; 	// GOLD등급 쿠폰 5%    
    public final static String AUTO_COUPON_MEMBER_GRADE_VIP_7 		= "ETLQDT740"; 	// VIP등급 쿠폰 5%    
    public final static String AUTO_COUPON_MEMBER_GRADE_PLATINUM_7  = "ETLVMJ744"; 	// PLATINUM등급 쿠폰 5% 
    
    public final static String AUTO_COUPON_FREE_DELIVERY_GOLD 		= "ETLANK750"; 	//무료배송쿠폰 GOLD
    public final static String AUTO_COUPON_FREE_DELIVERY_VIP  		= "ETLRSO751"; 	//무료배송쿠폰 VIP
    public final static String AUTO_COUPON_FREE_DELIVERY_PLATINUM 	= "ETLWBY752"; 	//무료배송쿠폰 PLATINUM
    
    /** ############################### 자동발급쿠폰코드 추가 끝 ##################################### */
    
    
    /**
     * 쿠폰종류 코드
     * */
    public final static int COUPON_TYPE = 3029;
    
    public final static int COUPON_GENERAL= 3030; 				//일반쿠폰
    public final static int COUPON_ANNIVERSARY = 3031; 			// 기념일 쿠폰 
    public final static int COUPON_FIRST_ORDER = 3032; 			// 첫구매 쿠폰
    public final static int COUPON_REORDER = 3033; 				// 재구매 쿠폰
    public final static int COUPON_GRADE = 3034; 				// 회원등급 쿠폰
    public final static int COUPON_REGIST = 3035; 				// 회원가입 쿠폰
    public final static int COUPON_DELIVERY= 3036; 				// 무료배송/교환/반품 쿠폰
    public final static int COUPON_PROMOTION = 3037; 			// 프로모션/페이퍼 쿠폰
    public final static int COUPON_TIME = 3038; 				// 타임쿠폰
    
    public final static String CPN_MST_GBN_GENERAL = "A";		//일반쿠폰
    public final static String CPN_MST_GBN_ANNIVERSARY = "B";	// 기념일 쿠폰 
    public final static String CPN_MST_GBN_FIRST_ORDER = "C";	// 첫구매 쿠폰
    public final static String CPN_MST_GBN_REORDER = "R";		// 재구매 쿠폰
    public final static String CPN_MST_GBN_GRADE = "D";			// 회원등급 쿠폰
    public final static String CPN_MST_GBN_REGIST = "E";		// 회원가입 쿠폰
    public final static String CPN_MST_GBN_DELIVERY = "F";		// 무료배송/교환/반품 쿠폰
    public final static String CPN_MST_GBN_PROMOTION = "P";		// 프로모션/페이퍼 쿠폰
    public final static String CPN_MST_GBN_TIME = "T";			// 타임쿠폰
    
    /** 프로모션 쿠폰 구분 */
    public final static String CPN_MST_PRM_GBN_PROMOTION = "A";			// 프로모션 쿠폰
    public final static String CPN_MST_PRM_GBN_PAPER = "B";			// 페이퍼 쿠폰
    
    /** 쿠폰 적용 회원 구분 */
    public final static String CPN_MST_MBR_GBN_INDIVIDUAL = "B";// 개별회원
    
    /** 쿠폰 발급방식 구분 */
    public final static String CPN_MST_ISU_GBN_AUTO = "A";		// 자동발급
    public final static String CPN_MST_ISU_GBN_MANUAL = "B";	// 운영자 수동 발급
    public final static String CPN_MST_ISU_GBN_DOWNLOAD = "C";	// 다운로드발급
    
    /** 쿠폰 발급채널 구분 */
    public final static String CPN_MEM_ISU_CNL_PC = "P";		// PC
    public final static String CPN_MEM_ISU_CNL_MOBILE_WEB = "M";// 모바일 웹
    public final static String CPN_MEM_ISU_CNL_APP = "A";		// 모바일 앱
    public final static String CPN_MEM_ISU_CNL_ADMIN = "S";		// 관리자 등록
    // 없을 시 자동발급
    
    /** 쿠폰 적용 상품 구분 */
    public final static String CPN_MST_TGT_GBN_PRD = "A"; 		// 개별상품
    public final static String CPN_MST_TGT_GBN_PRD_ALL = "B"; 	// 전체상품
    public final static String CPN_MST_TGT_GBN_BRD = "C"; 		// 브랜드
    public final static String CPN_MST_TGT_GBN_EVT = "D"; 		// 기획전
    
    /** 쿠폰 적용 제외 상품 구분 */
    public final static String CPN_MST_ETC_GBN_PRD = "A"; 		// 상품
    public final static String CPN_MST_ETC_GBN_BRD = "C"; 		// 브랜드
    public final static String CPN_MST_ETC_GBN_CATE = "B"; 		// 카테고리
    public final static String CPN_MST_ETC_GBN_PTN = "D"; 		// 협력업체
    
    
    /** ############################### 프론트 배너 코드 추가 시작 ################################### */
    final  public static int PC_PRODUCT_CATE_1 	= 1001;     //TV/음향기기
    final  public static int PC_PRODUCT_CATE_2 	= 1019;     //냉장고/김치냉장고
    final  public static int PC_PRODUCT_CATE_3 	= 1044;     //세탁기
    final  public static int PC_PRODUCT_CATE_4 	= 1073;     //주방가전/주방소형 
    final  public static int PC_PRODUCT_CATE_5 	= 1108;     //생활가전/생활소형
    final  public static int PC_PRODUCT_CATE_6 	= 1142;     //건강가전
    final  public static int PC_PRODUCT_CATE_7 	= 3013;     //계절가전
    final  public static int PC_PRODUCT_CATE_8 	= 3014;     //컴퓨터
    final  public static int PC_PRODUCT_CATE_9 	= 3015;     //디지털/자동차
    final  public static int PC_PRODUCT_CATE_10	= 3036;     //홈케어 서비스
    
    final  public static int MB_PRODUCT_CATE_1 	= 2001;     //TV/음향기기
    final  public static int MB_PRODUCT_CATE_2 	= 2019;     //냉장고/김치냉장고
    final  public static int MB_PRODUCT_CATE_3 	= 2044;     //세탁기
    final  public static int MB_PRODUCT_CATE_4 	= 2073;     //주방가전/주방소형 
    final  public static int MB_PRODUCT_CATE_5 	= 2108;     //생활가전/생활소형
    final  public static int MB_PRODUCT_CATE_6 	= 2142;     //건강가전
    final  public static int MB_PRODUCT_CATE_7 	= 3033;     //계절가전
    final  public static int MB_PRODUCT_CATE_8 	= 3034;     //컴퓨터
    final  public static int MB_PRODUCT_CATE_9 	= 3035;     //디지털/자동차
    final  public static int MB_PRODUCT_CATE_10	= 3048;     //홈케어 서비스
    
    final  public static int PC_PRODUCT_CATE_1_PMTION 	= 2676;     //TV/음향기기 - 프로모션 
    final  public static int PC_PRODUCT_CATE_2_PMTION 	= 2681;     //냉장고/김치냉장고 - 프로모션 
    final  public static int PC_PRODUCT_CATE_3_PMTION 	= 2685;     //세탁기 - 프로모션 
    final  public static int PC_PRODUCT_CATE_4_PMTION 	= 2689;     //주방가전/주방소형  - 프로모션 
    final  public static int PC_PRODUCT_CATE_5_PMTION 	= 2693;     //생활가전/생활소형 - 프로모션 
    final  public static int PC_PRODUCT_CATE_6_PMTION 	= 2697;     //건강가전 - 프로모션 
    final  public static int PC_PRODUCT_CATE_7_PMTION 	= 2701;     //계절가전 - 프로모션 
    final  public static int PC_PRODUCT_CATE_8_PMTION 	= 2705;     //컴퓨터 - 프로모션 
    final  public static int PC_PRODUCT_CATE_9_PMTION 	= 2709;     //디지털/자동차 - 프로모션 
    final  public static int PC_PRODUCT_CATE_10_PMTION 	= 2775;     //홈케어 서비스   - 프로모션
    
    final  public static int MB_PRODUCT_CATE_1_PMTION 	= 1503;     //TV/음향기기 - 프로모션 
    final  public static int MB_PRODUCT_CATE_2_PMTION 	= 2746;     //냉장고/김치냉장고 - 프로모션 
    final  public static int MB_PRODUCT_CATE_3_PMTION 	= 2747;     //세탁기 - 프로모션 
    final  public static int MB_PRODUCT_CATE_4_PMTION 	= 2748;     //주방가전/주방소형  - 프로모션 
    final  public static int MB_PRODUCT_CATE_5_PMTION 	= 2749;     //생활가전/생활소형 - 프로모션 
    final  public static int MB_PRODUCT_CATE_6_PMTION 	= 2750;     //건강가전 - 프로모션 
    final  public static int MB_PRODUCT_CATE_7_PMTION 	= 2751;     //계절가전 - 프로모션 
    final  public static int MB_PRODUCT_CATE_8_PMTION 	= 2752;     //컴퓨터 - 프로모션 
    final  public static int MB_PRODUCT_CATE_9_PMTION 	= 2753;     //디지털/자동차 - 프로모션
    final  public static int MB_PRODUCT_CATE_10_PMTION 	= 2779;     //홈케어 서비스 - 프로모션
    
    final  public static int PC_PRODUCT_CATE_1_HOT 	= 2678;     //TV/음향기기 - 핫이슈키워드  
    final  public static int PC_PRODUCT_CATE_2_HOT 	= 2682;     //냉장고/김치냉장고 - 핫이슈키워드  
    final  public static int PC_PRODUCT_CATE_3_HOT 	= 2686;     //세탁기 - 핫이슈키워드  
    final  public static int PC_PRODUCT_CATE_4_HOT 	= 2690;     //주방가전/주방소형  - 핫이슈키워드  
    final  public static int PC_PRODUCT_CATE_5_HOT 	= 2694;     //생활가전/생활소형 - 핫이슈키워드  
    final  public static int PC_PRODUCT_CATE_6_HOT 	= 2698;     //건강가전 - 핫이슈키워드  
    final  public static int PC_PRODUCT_CATE_7_HOT 	= 2702;     //계절가전 - 핫이슈키워드  
    final  public static int PC_PRODUCT_CATE_8_HOT 	= 2706;     //컴퓨터 - 핫이슈키워드  
    final  public static int PC_PRODUCT_CATE_9_HOT 	= 2710;     //디지털/자동차 - 핫이슈키워드
    final  public static int PC_PRODUCT_CATE_10_HOT = 2776;     //홈케어 서비스 - 핫이슈키워드  
    
    final  public static int PC_PRODUCT_CATE_1_LET 	= 2679;     //TV/음향기기 - 렛츠플레이  
    final  public static int PC_PRODUCT_CATE_2_LET 	= 2683;     //냉장고/김치냉장고 - 렛츠플레이  
    final  public static int PC_PRODUCT_CATE_3_LET 	= 2687;     //세탁기 - 렛츠플레이  
    final  public static int PC_PRODUCT_CATE_4_LET 	= 2691;     //주방가전/주방소형  - 렛츠플레이  
    final  public static int PC_PRODUCT_CATE_5_LET 	= 2695;     //생활가전/생활소형 - 렛츠플레이  
    final  public static int PC_PRODUCT_CATE_6_LET 	= 2699;     //건강가전 - 렛츠플레이  
    final  public static int PC_PRODUCT_CATE_7_LET 	= 2703;     //계절가전 - 렛츠플레이  
    final  public static int PC_PRODUCT_CATE_8_LET 	= 2707;     //컴퓨터 - 렛츠플레이  
    final  public static int PC_PRODUCT_CATE_9_LET 	= 2711;     //디지털/자동차 - 렛츠플레이
    final  public static int PC_PRODUCT_CATE_10_LET = 2777;     //홈케어 서비스 - 렛츠플레이
    
    final  public static int PC_PRODUCT_CATE_1_PLAN 	= 2680;     //TV/음향기기 - 기획전/이벤트   
    final  public static int PC_PRODUCT_CATE_2_PLAN 	= 2684;     //냉장고/김치냉장고 - 기획전/이벤트   
    final  public static int PC_PRODUCT_CATE_3_PLAN 	= 2688;     //세탁기 - 기획전/이벤트   
    final  public static int PC_PRODUCT_CATE_4_PLAN 	= 2692;     //주방가전/주방소형  - 기획전/이벤트   
    final  public static int PC_PRODUCT_CATE_5_PLAN 	= 2696;     //생활가전/생활소형 - 기획전/이벤트   
    final  public static int PC_PRODUCT_CATE_6_PLAN 	= 2700;     //건강가전 - 기획전/이벤트   
    final  public static int PC_PRODUCT_CATE_7_PLAN 	= 2704;     //계절가전 - 기획전/이벤트   
    final  public static int PC_PRODUCT_CATE_8_PLAN 	= 2708;     //컴퓨터 - 기획전/이벤트   
    final  public static int PC_PRODUCT_CATE_9_PLAN 	= 2712;     //디지털/자동차 - 기획전/이벤트
    final  public static int PC_PRODUCT_CATE_10_PLAN 	= 2778;     //디지털/자동차 - 기획전/이벤트 
    
    //PC 대카테고리 코드
    final  public static int [] PC_CATE_CODE_ARY = {PC_PRODUCT_CATE_1,PC_PRODUCT_CATE_2,PC_PRODUCT_CATE_3,PC_PRODUCT_CATE_4,PC_PRODUCT_CATE_5,PC_PRODUCT_CATE_6,PC_PRODUCT_CATE_7,PC_PRODUCT_CATE_8,PC_PRODUCT_CATE_9,PC_PRODUCT_CATE_10};	
    //MOBILE 대카테고리 코드
    final  public static int [] MB_CATE_CODE_ARY = {MB_PRODUCT_CATE_1,MB_PRODUCT_CATE_2,MB_PRODUCT_CATE_3,MB_PRODUCT_CATE_4,MB_PRODUCT_CATE_5,MB_PRODUCT_CATE_6,MB_PRODUCT_CATE_7,MB_PRODUCT_CATE_8,MB_PRODUCT_CATE_9,MB_PRODUCT_CATE_10};	
    
    //PC 대카테고리에 속한 프로모션 CMM_IDX
    final  public static int [] PC_PRD_LIST_TOP_PMTION_ARY = {PC_PRODUCT_CATE_1_PMTION,PC_PRODUCT_CATE_2_PMTION,PC_PRODUCT_CATE_3_PMTION,PC_PRODUCT_CATE_4_PMTION,PC_PRODUCT_CATE_5_PMTION,PC_PRODUCT_CATE_6_PMTION,PC_PRODUCT_CATE_7_PMTION,PC_PRODUCT_CATE_8_PMTION,PC_PRODUCT_CATE_9_PMTION,PC_PRODUCT_CATE_10_PMTION};
    //MOBILE 대카테고리에 속한 프로모션 CMM_IDX
    final  public static int [] MB_PRD_LIST_TOP_PMTION_ARY = {MB_PRODUCT_CATE_1_PMTION,MB_PRODUCT_CATE_2_PMTION,MB_PRODUCT_CATE_3_PMTION,MB_PRODUCT_CATE_4_PMTION,MB_PRODUCT_CATE_5_PMTION,MB_PRODUCT_CATE_6_PMTION,MB_PRODUCT_CATE_7_PMTION,MB_PRODUCT_CATE_8_PMTION,MB_PRODUCT_CATE_9_PMTION,MB_PRODUCT_CATE_10_PMTION};
    
    //PC 대카테고리에 속한 핫이슈키워드 CMM_IDX
    final  public static int [] PC_PRD_LIST_HOT_KEYWORLD_ARY = {PC_PRODUCT_CATE_1_HOT,PC_PRODUCT_CATE_2_HOT,PC_PRODUCT_CATE_3_HOT,PC_PRODUCT_CATE_4_HOT,PC_PRODUCT_CATE_5_HOT,PC_PRODUCT_CATE_6_HOT,PC_PRODUCT_CATE_7_HOT,PC_PRODUCT_CATE_8_HOT,PC_PRODUCT_CATE_9_HOT,PC_PRODUCT_CATE_10_HOT};
    //PC 대카테고리에 속한 렛츠플레이 CMM_IDX
    final  public static int [] PC_PRD_LIST_LET_PLAY_ARY = {PC_PRODUCT_CATE_1_LET,PC_PRODUCT_CATE_2_LET,PC_PRODUCT_CATE_3_LET,PC_PRODUCT_CATE_4_LET,PC_PRODUCT_CATE_5_LET,PC_PRODUCT_CATE_6_LET,PC_PRODUCT_CATE_7_LET,PC_PRODUCT_CATE_8_LET,PC_PRODUCT_CATE_9_LET,PC_PRODUCT_CATE_10_LET};
    //PC 대카테고리에 속한 기획전/이벤트 CMM_IDX
    final  public static int [] PC_PRD_LIST_PLAN_ARY = {PC_PRODUCT_CATE_1_PLAN,PC_PRODUCT_CATE_2_PLAN,PC_PRODUCT_CATE_3_PLAN,PC_PRODUCT_CATE_4_PLAN,PC_PRODUCT_CATE_5_PLAN,PC_PRODUCT_CATE_6_PLAN,PC_PRODUCT_CATE_7_PLAN,PC_PRODUCT_CATE_8_PLAN,PC_PRODUCT_CATE_9_PLAN,PC_PRODUCT_CATE_10_PLAN};
    
    
    public final static int PC_PRODUCT_DETAIL_BANNER_NOTICE = 1256; //상품상세 공지배너
    public final static int PC_PRODUCT_DETAIL_BANNER_BRAND_NOTICE = 2338; //상품상세 공지배너
    public final static int PC_PRODUCT_DETAIL_BANNER_MD_NOTICE = 2339; //상품상세 공지배너
    
    public final static int PC_MANIN_PROMOTION_BANNER = 1254; //메인 프로모션 베너
    public final static int PC_MANIN_PLAN_EVENT_BANNER = 2335; //메인 기획전/이벤트 베너
    
    public final static int PC_MAIN_PLAN_BANNER = 3217; //기획전 상단 배너
    public final static int PC_MAIN_CHANNEL_ON_BANNER = 3221; //채널온 상단 배너
    public final static int PC_MAIN_SELLER_PICK_BANNER = 3215; //셀러픽 상단 배너
    public final static int PC_MAIN_SPECIAL_BANNER = 3213; //셀러픽 상단 배너
    
    public final static int PC_MAIN_TOP_SELLER_BANNER_UP = 3219; //탑셀러 상단 배너
    public final static int PC_MAIN_TOP_SELLER_BANNER_DOWN =  3220;//탑셀러 하단 배너
    
    
    public final static int PC_MAIN_TOP_BRAND_BANNER = 3210; //상단 배너(상단브랜드)
    public final static int PC_MAIN_SHINWON_PICK_BRAND_BANNER = 3212; //상단 배너(신원픽)
    
    public final static int PC_MAIN_PRODUCT_BANNER = 3223; //상품전시배너
    
    public final static int MB_MANIN_PROMOTION_BANNER = 1582; //모바일 메인 프로모션 베너
    public final static int MB_MANIN_PLAN_EVENT_BANNER = 2743; //메인 기획전/이벤트 베너

    public final static int PC_MANIN_BEST_ITEM_MD1 = 2714; //메인 베스트아이템MD1
    public final static int PC_MANIN_BEST_ITEM_MD2 = 2715; //메인 베스트아이템MD2
    public final static int PC_MANIN_BEST_ITEM_MD3 = 2716; //메인 베스트아이템MD3
    public final static int PC_MANIN_BEST_ITEM_MD4 = 2717; //메인 베스트아이템MD4
    public final static int PC_MANIN_BEST_ITEM_MD5 = 2718; //메인 베스트아이템MD5
    public final static int PC_MANIN_BEST_ITEM_MD6 = 2719; //메인 베스트아이템MD6
    public final static int PC_MANIN_BEST_ITEM_MD7 = 2720; //메인 베스트아이템MD7
    public final static int PC_MANIN_BEST_ITEM_MD8 = 2721; //메인 베스트아이템MD8
    
    public final static int PC_MANIN_MD_PICK_MD1 = 2665; //메인 MD PICK MD1
    public final static int PC_MANIN_MD_PICK_MD2 = 2666; //메인 MD PICK MD2
    public final static int PC_MANIN_MD_PICK_MD3 = 2667; //메인 MD PICK MD3
    public final static int PC_MANIN_MD_PICK_MD4 = 2668; //메인 MD PICK MD4
    public final static int PC_MANIN_MD_PICK_MD5 = 2669; //메인 MD PICK MD5
    public final static int PC_MANIN_MD_PICK_MD6 = 2670; //메인 MD PICK MD6
    
    public final static int MB_MANIN_MD_PICK_MD1 = 2740; //메인 MD PICK MD1
    public final static int MB_MANIN_MD_PICK_MD2 = 2741; //메인 MD PICK MD2
    public final static int MB_MANIN_MD_PICK_MD3 = 2742; //메인 MD PICK MD3
    
    public final static int MB_MANIN_MD_PICK_PRODUT_MD1 = 2754; //메인 MD PICK PRODUCT MD1
    public final static int MB_MANIN_MD_PICK_PRODUT_MD2 = 2755; //메인 MD PICK PRODUCT MD2
    public final static int MB_MANIN_MD_PICK_PRODUT_MD3 = 2756; //메인 MD PICK PRODUCT MD3
    
    public final static int PC_MANIN_MD_PICK_PRODUT_MD1 = 2722; //메인 MD PICK PRODUCT MD1
    public final static int PC_MANIN_MD_PICK_PRODUT_MD2 = 2723; //메인 MD PICK PRODUCT MD2
    public final static int PC_MANIN_MD_PICK_PRODUT_MD3 = 2724; //메인 MD PICK PRODUCT MD3
    public final static int PC_MANIN_MD_PICK_PRODUT_MD4 = 2725; //메인 MD PICK PRODUCT MD4
    public final static int PC_MANIN_MD_PICK_PRODUT_MD5 = 2726; //메인 MD PICK PRODUCT MD5
    public final static int PC_MANIN_MD_PICK_PRODUT_MD6 = 2727; //메인 MD PICK PRODUCT MD6
    //MD PICK 키 순번대로 상품 키를 배열로 마춰야한다(프론트에서 해당 상품을 뿌리기 위해)
    final  public static int [] PC_MAIN_MD_PICK_PRD_ARY = {PC_MANIN_MD_PICK_PRODUT_MD1,PC_MANIN_MD_PICK_PRODUT_MD2,PC_MANIN_MD_PICK_PRODUT_MD3,PC_MANIN_MD_PICK_PRODUT_MD4,PC_MANIN_MD_PICK_PRODUT_MD5,PC_MANIN_MD_PICK_PRODUT_MD6};
    
    
    public final static int PC_MANIN_RENEW_BANNER = 2657; //메인 연장배너
    
    public final static int PC_MANIN_TREND_A_PRODUCT_ITEM = 1331; //트랜드A 상품
    public final static int PC_MANIN_TREND_B_PRODUCT_ITEM = 1333; //트랜드B 상품
    public final static int PC_MANIN_TREND_A_BANNER = 2662; //메인 트랜드 A 메인배너
    public final static int PC_MANIN_TREND_B_BANNER = 2660; //메인 트랜드 B 메인배너
    public final static int PC_MANIN_TREND_A_THEME_BANNER = 2663; //메인 트랜드 A 테마배너
    public final static int PC_MANIN_TREND_B_THEME_BANNER = 2661; //메인 트랜드 B 테마배너
    public final static int PC_MANIN_TREND_A_LEFT_BG_BANNER = 2734; //메인 트랜드 A 왼쪽 BG 배너
    public final static int PC_MANIN_TREND_A_RIGHT_BG_BANNER = 2735; //메인 트랜드 A 오른쪽 BG 배너
    public final static int PC_MANIN_TREND_B_LEFT_BG_BANNER = 2736; //메인 트랜드 B 왼쪽 BG 배너
    public final static int PC_MANIN_TREND_B_RIGHT_BG_BANNER = 2737; //메인 트랜드 B 오른쪽 BG 배너
    
    public final static int PC_MANIN_THEME_CLEAN_BANNER = 2728; //메인 테마서비스 > 클린킹
    public final static int PC_MANIN_THEME_GETITNOW_BANNER = 2729; //메인 테마서비스 > 겟잇나우
    public final static int PC_MANIN_THEME_WEDDING_BANNER = 2730; //메인 테마서비스 > 웨딩
    public final static int PC_MANIN_THEME_SINGLE_BANNER = 2731; //메인 테마서비스 > 싱글
    public final static int PC_MANIN_THEME_LNG_BANNER = 2732; //메인 테마서비스 > 장기할부
    public final static int PC_MANIN_THEME_HEALTH_BANNER = 2733; //메인 테마서비스 > 건강
    public final static int PC_MANIN_BOTTOM_EVENT_BANNER = 2675; //메인 하단 이벤트 배너
    
    public final static int MB_MANIN_TREND_A_BANNER = 1590; //메인 트랜드 A 메인배너
    public final static int MB_MANIN_TREND_B_BANNER = 1591; //메인 트랜드 B 메인배너
    public final static int MB_MANIN_TREND_A_THEME_BANNER = 2738; //메인 트랜드 A 테마배너
    public final static int MB_MANIN_TREND_B_THEME_BANNER = 2739; //메인 트랜드 B 테마배너
    public final static int MB_MANIN_TREND_A_PRODUCT_ITEM = 1402; //트랜드A 상품
    public final static int MB_MANIN_TREND_B_PRODUCT_ITEM = 1403; //트랜드B 상품
    
    public final static int MB_MANIN_EVENT_PMTION_BANNER = 1558; //메인 -> 이벤트 -> 프로모션
    public final static int MB_MANIN_EVENT_CARD_BANNER = 1559; //메인 -> 이벤트 -> 카드혜택
    public final static int MB_MANIN_EVENT_JOIN_BANNER = 1560; //메인 -> 이벤트 -> 가입혜택
    public final static int MB_MANIN_EVENT_NEW_BANNER = 1561; //메인 -> 이벤트 -> 최근이벤트
    public final static int MB_MANIN_EVENT_OTHER_BANNER = 1562; //메인 -> 이벤트 -> 기타혜택
    
    public final static int MB_MANIN_CATE_BANNER = 1504; //메인 -> 이벤트 -> 공기청청기 배너
    public final static int MB_MANIN_CATE_IDX = 2115; //메인 -> 이벤트 -> 공기청청기 카테고리idx
    
    public final static int PC_LOGIN_BANNER = 1304;	// PC로그인 배너
    public final static int PC_NON_LOGIN_BANNER = 1271;	// PC비회원 구매/주문조회
    
    public final static int PC_LEFT_WING_A_BANNER = 2645;	// PC윙배너A
    public final static int PC_LEFT_WING_B_BANNER = 2646;	// PC윙배너B
    
    public final static int MOBILE_LOGIN_BANNER = 2649;		// MOBILE로그인 배너
    public final static int MOBILE_NON_LOGIN_BANNER = 2745;	// MOBILE비회원 구매/주문조회
    public final static int MOBILE_APP_INTRO_BANNER = 2757;	// MOBILE APP INTRO BANNER
    
    public final static String BANNER_CONTROLL_TYPE_A = "A"; //배너 1개 템플릿
    public final static String BANNER_CONTROLL_TYPE_B = "B"; //배너 2개 템플릿
    public final static String BANNER_CONTROLL_TYPE_C = "C"; //공지배너 템플릿
    public final static String BANNER_CONTROLL_TYPE_D = "D"; //브랜드배너 템플릿
    public final static String BANNER_CONTROLL_TYPE_E = "E"; //MD배너 템플릿
    
    public final static String MEMBER_PREVILEGE = "3625"; //특정권한
    
    public final static String REVIEWER_PREVILEGE = "3626"; //리뷰권한
    public final static String SPEACIAL_REVIEWER_PREVILEGE = "3627"; //특정리뷰권한
    public final static String OOTD_PREVILEGE = "3628"; //OOTD 권한
    
    
    /** ############################### 프론트 배너 코드 추가 끝 ################################### */
    
    /* BATCH SMS 발송을 위해 셋팅 */
    public final static String BATCH_SEND_SMS_CODE = "2909";
    
    /* 우편번호 */
    public final static String POST_API_KEY = "TESTJUSOGOKR"; //우편번호 API KEY
    
    public final static String RESULT_CODE = "RESULT_CODE";
    
    public final static String VENDOR_WORK_DIVISION_CODE = "3226";
    
    public final static String PW_FIND_SESSION_KEY = "PW_FIND_SESSION_KEY";

	public static final Object CRYPT_KEY_TWIN = "Twins";
	
	public static final String ORDER_CANCEL_RETURN_REASON="3129";
	
    public static final int ORDER_CANCEL_REASON = 200; // 2020.06.01 주문취소 사유    
	
	public static final String EMPOYEE_GRADE = "3076";
}
