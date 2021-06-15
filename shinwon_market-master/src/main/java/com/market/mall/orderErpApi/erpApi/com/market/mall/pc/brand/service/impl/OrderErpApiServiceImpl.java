package com.market.mall.orderErpApi.erpApi.com.market.mall.pc.brand.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.json.Json;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.orderErpApi.erpApi.com.market.mall.pc.brand.service.OrderErpApiService;

import egovframework.rte.fdl.property.EgovPropertyService;


@Service("orderErpApiService")
public class OrderErpApiServiceImpl implements OrderErpApiService {
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    
    /**
   	 * <pre>
   	 * 1. MethodName : orderErpApiTrans
   	 * 2. ClassName  : OrderErpApiServiceImpl.java
   	 * 3. Comment    : 주문 ERP INTERFACE 업무를 처리
   	 * 4. 작성자       : 정경수
   	 * 5. 작성일       : 2020.06.26
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */    
    @SuppressWarnings("unchecked")
	public Map<String,Object> orderErpApiTrans(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
       
    	
    	
    	// 주문정보	// 주문상세정보  // 주문단계
       String ORD_MST_CD =commandMap.get("ORD_MST_CD").toString();
       String ORD_PRD_IDX =commandMap.get("ORD_PRD_IDX").toString();
       String ORD_PRD_ORD_STATE =commandMap.get("ORD_PRD_ORD_STATE").toString();
 	
    	Map<String,Object> erpReqMap= new HashMap<String,Object>();
    	/*
         *  주문 데이터 추출
         */    	
    	Map<String,Object> erpParam = defaultDAO.select("OrderApi.selectOrderBasicInfo",commandMap);   
    	commandMap.put("ORD_PRD_MST_CD", erpParam.get("ORD_PRD_MST_CD")); //주문번호
    	commandMap.put("ORD_PRD_COLOR", erpParam.get("ORD_PRD_COLOR")); //색상
    	commandMap.put("ORD_PRD_SIZE", erpParam.get("ORD_PRD_SIZE"));//사이즈
    	commandMap.put("ORD_PRD_VDR_IDX", erpParam.get("ORD_PRD_VDR_IDX"));// 협력업체
    	commandMap.put("MEM_MST_MEM_ID", erpParam.get("ORD_MST_ORD_ID"));  //주문자 아이디
    	
    	/*
         *  주문 데이터 바인딩
         */    	
    	erpReqMap.put("ORD_PRD_ORD_STATE", StringUtil.nullConvert(ORD_PRD_ORD_STATE));// 주문단계(P:결제완료 D:배송중 Y:배송완료 C:취소완료 G:교환완료 E:구매확정 R:배송준비중) 
    	erpReqMap.put("ORD_MST_CD", StringUtil.nullConvert(ORD_MST_CD));// 주문정보
    	erpReqMap.put("ORD_ORD_PRD_IDX", StringUtil.nullConvert(ORD_PRD_IDX));// 주문상세정보

    	erpReqMap.put("BUY_CONFM_DATE", StringUtil.nullConvert(erpParam.get("BUY_CONFM_DATE")));  // 구매확정일
      	erpReqMap.put("DELI_DATE", StringUtil.nullConvert(erpParam.get("DELI_DATE")));            // 배송일자
      	erpReqMap.put("DELI_END_DATE", StringUtil.nullConvert(erpParam.get("DELI_END_DATE")));    // 배송종료일자 
      	erpReqMap.put("SALE_CONFM_DATE", StringUtil.nullConvert(erpParam.get("SALE_CONFM_DATE")));// 매출확정일자
      	erpReqMap.put("CANCEL_DATE", StringUtil.nullConvert(erpParam.get("CANCEL_DATE")));        // 취소일자
      	erpReqMap.put("RECHANGE_DATE", StringUtil.nullConvert(erpParam.get("RECHANGE_DATE")));    // 교환일자 
      	erpReqMap.put("LINKED_ORDER_NO", StringUtil.nullConvert(erpParam.get("ORD_PRD_ORG_IDX")));       // 연계주문번호(교환시 원본주문번호)  
      	erpReqMap.put("LINKED_ORDER_DETAIL_NO", StringUtil.nullConvert(erpParam.get("ORD_PRD_UP_IDX"))); // 연계주문상세번호
      	erpReqMap.put("ORDER_QTY", StringUtil.nullConvert(erpParam.get("ORD_PRD_ORD_CNT")));             // 주문수량
      	erpReqMap.put("ORDER_PRICE", StringUtil.nullConvert(erpParam.get("ORD_PRD_ORD_PRC")));           // 주문단가
      	erpReqMap.put("ORDER_AMT", StringUtil.nullConvert(erpParam.get("ORD_PRD_ORD_PRC")));             // 주문금액 
      	erpReqMap.put("USE_POINT", StringUtil.nullConvert(erpParam.get("ORD_PRD_DC_TOT_PIT")));                // 사용포인트
      	erpReqMap.put("OCCUR_POINT", StringUtil.nullConvert(erpParam.get("ORD_PRD_DC_SW_PIT")));               // 적립포인트
      	erpReqMap.put("USE_EPOINT", StringUtil.nullConvert(erpParam.get("ORD_PRD_DC_PIT")));                   // 사용E포인트
      	erpReqMap.put("TAG_PRICE", StringUtil.nullConvert(erpParam.get("ORD_PRD_ORD_PRC")));                   // 자사 : 0 / 입점사 : 할인전 금액
      	erpReqMap.put("PART_DIV", StringUtil.nullConvert(erpParam.get("PART_DIV")));// 유통망 
      	erpReqMap.put("PART_NO", StringUtil.nullConvert(erpParam.get("PART_NO")));// 매장코드
      	erpReqMap.put("ORD_PRD_DLV_CAG", StringUtil.nullConvert(erpParam.get("ORD_PRD_DLV_CAG")));
        // 실결재금액
		int RSALE_AMT=Integer.parseInt(erpParam.get("ORD_PRD_ORD_PRC").toString())-                    // 판매금액 
						Integer.parseInt(erpParam.get("ORD_PRD_DC_TOT_PIT").toString())-               // 통합포인트
							Integer.parseInt(erpParam.get("ORD_PRD_DC_SW_PIT").toString())-            // 임직원포인트
							Integer.parseInt(erpParam.get("ORD_PRD_DC_PIT").toString())-               // E포인트
									Integer.parseInt(erpParam.get("ORD_PRD_DC_PRM").toString())+       // 프로모션할인액
									Integer.parseInt(erpParam.get("ORD_PRD_DLV_CAG").toString());      // 배송비
		 
      	
      	erpReqMap.put("PROMOTION_AMT", Integer.parseInt(erpParam.get("ORD_PRD_DC_PRM").toString()));   // 프로모션금액
      	erpReqMap.put("RSALE_AMT", RSALE_AMT);                                                         // 실결재금액
      	erpReqMap.put("INVOICE_NO", StringUtil.nullConvert(erpParam.get("ORD_PRD_IVC_NO")));           // 송장번호
     	
      	
      	
      	erpReqMap.put("EMP_SALE_AMT", StringUtil.nullConvert(erpParam.get("ORD_PRD_DC_SW_PIT")));       // 복지할인금액 
      	erpReqMap.put("ORDER_PAYMENT_NO", StringUtil.nullConvert(erpParam.get("ORD_MST_CD")));          // 정해진규칙(주문번호)  

      	
      	
      	int ORD_PRD_ORD_PRC=Integer.parseInt(erpParam.get("ORD_PRD_ORD_PRC").toString());
      	int SAL_VAT   = (int) Math.round(((ORD_PRD_ORD_PRC/1.1)*0.1));    // 부가세(VAT)
      	int SUPPLY_AMT = Math.round(ORD_PRD_ORD_PRC - SAL_VAT); // 단가(반올림)
        SAL_VAT   = Math.round(SAL_VAT);    // 부가세(반올림)
        
      	
      	
      	erpReqMap.put("SUPPLY_AMT", SUPPLY_AMT);// VAT제외금액
      	erpReqMap.put("VAT_AMT", SAL_VAT);      // VAT금액
      	
      	
      	
      	String DIV = defaultDAO.selectStr("OrderApi.selectOrderdiv",commandMap);
		
		erpReqMap.put("DIV", DIV); // 본사(1)/입점사(2)구분
		 
      	
      	String MEMBER_ID = defaultDAO.selectStr("OrderApi.selectMemId",commandMap);
      	erpReqMap.put("MEMBER_ID", StringUtil.nullConvert(MEMBER_ID));// 고객번호 
      	
      	
      	if(DIV.equals("2")) {//타사인경우에만 
      	   erpReqMap.put("BUSI_NO", StringUtil.nullConvert(erpParam.get("BUSI_NO")));                // 입점사사업자번호
      	}else {
       	   erpReqMap.put("BUSI_NO", "");                // 입점사사업자번호
      	}
    	erpReqMap.put("ORDER_NO", commandMap.get("ORD_MST_CD"));         // 주문정보
      	erpReqMap.put("ORDER_DETAIL_NO", commandMap.get("ORD_PRD_IDX")); // 주문상세정보
    	
    	int ORDER_SEQ =0;
    	erpParam = defaultDAO.select("OrderApi.selectOrderStat",commandMap); 
    	if ( erpParam==null) {
			ORDER_SEQ =0;
        	erpReqMap.put("ORDER_SEQ", ORDER_SEQ);
          	erpReqMap.put("ORDER_STEP", "");  // 주문단계(P:결제완료 D:배송중 Y:배송완료 C:취소완료 G:교환완료 E:구매확정 R:배송준비중)
    	} else {
    		ORDER_SEQ =Integer.parseInt(erpParam.get("ORDER_SEQ").toString() );          // 주문상세정보-SEQ
        	erpReqMap.put("ORDER_SEQ", ORDER_SEQ);
          	erpReqMap.put("ORDER_STEP", StringUtil.nullConvert(erpParam.get("ORDER_STEP")));  // 주문단계(P:결제완료 D:배송중 Y:배송완료 C:취소완료 G:교환완료 E:구매확정 R:배송준비중)
    	}
    	
    	
  
      	String ORDER_TYPE = defaultDAO.selectStr("OrderApi.selectOrderType",commandMap);   
	    erpReqMap.put("ORDER_TYPE", StringUtil.nullConvert(ORDER_TYPE));// 주문유형(A:일반,X:비회원,E:임직원,C:협력업체) 

    	String O2O_GB = defaultDAO.selectStr("OrderApi.selectOTo",commandMap);
      	erpReqMap.put("O2O_GB", O2O_GB);// O2O구분
      	erpReqMap.put("ORDER_DATE", commandMap.get("ORD_MST_CD").toString().substring(0, 7));// 주문날짜 

      	
    	String STYLE_NO = defaultDAO.selectStr("OrderApi.selectStyleNo",commandMap);
      	erpReqMap.put("STYLE_NO", StringUtil.nullConvert(STYLE_NO));// 품번
    	String SEASON_YEAR = defaultDAO.selectStr("OrderApi.selectSeasonYear",commandMap);
      	erpReqMap.put("SEASON_YEAR", StringUtil.nullConvert(SEASON_YEAR));// 시즌년도

    	String COLOR_CODE = defaultDAO.selectStr("OrderApi.selectColor",commandMap);
      	erpReqMap.put("COLOR_CODE", StringUtil.nullConvert(COLOR_CODE));// 색상
      	
    	String SIZE_CODE = defaultDAO.selectStr("OrderApi.selectSize",commandMap);
      	erpReqMap.put("SIZE_CODE", StringUtil.nullConvert(SIZE_CODE));// 사이즈
    	
      	
      	String BRAND = defaultDAO.selectStr("OrderApi.selectBrand",commandMap);
      	erpReqMap.put("BRAND", StringUtil.nullConvert(BRAND));// 브랜드(품번의 브랜드와 다를수있음.주의요함)  

      	String COUPON_NO = defaultDAO.selectStr("OrderApi.selectCouponNo",commandMap);
      	erpReqMap.put("COUPON_NO", StringUtil.nullConvert(COUPON_NO));// 쿠폰번호
      	
      	String COUPON_NAME = defaultDAO.selectStr("OrderApi.selectCouponName",commandMap);
      	erpReqMap.put("COUPON_NAME", StringUtil.nullConvert(COUPON_NAME));// 쿠폰명 
      	
      	String COUPON_AMT = defaultDAO.selectStr("OrderApi.selectCouponAmt",commandMap);
      	erpReqMap.put("COUPON_AMT", Integer.parseInt(COUPON_AMT));// 쿠폰금액

      	String EMP_NO = defaultDAO.selectStr("OrderApi.selectEmpNo",commandMap);
      	erpReqMap.put("EMP_NO", StringUtil.nullConvert(EMP_NO));// 고객번호

      	//제휴사 주문의 경우 
      	if(ORDER_TYPE==null) {
          	erpReqMap.put("COOPER_NM", "");// 협력업체할인-협력업체명 
          	erpReqMap.put("COOPER_SALE_AMT", 0);// 협력업체할인금액 
      	} else {
          	//제휴사 주문의 경우 
          	if(ORDER_TYPE.equals("C")) {
              	String COOPER_NM = defaultDAO.selectStr("OrderApi.selectCooperNm",commandMap);
              	erpReqMap.put("COOPER_NM", StringUtil.nullConvert(COOPER_NM));// 협력업체할인-협력업체명 
              	
              	String COOPER_SALE_AMT = defaultDAO.selectStr("OrderApi.selectCooperSaleAmt",commandMap);
              	erpReqMap.put("COOPER_SALE_AMT", Integer.parseInt(COOPER_SALE_AMT));// 협력업체할인금액 
          	} else {
              	erpReqMap.put("COOPER_NM", "");// 협력업체할인-협력업체명 
              	erpReqMap.put("COOPER_SALE_AMT", 0);// 협력업체할인금액 
          	}
      	}

      	String DELIVERY_CUST_CODE = defaultDAO.selectStr("OrderApi.selectDelCustCode",commandMap);
      	erpReqMap.put("DELIVERY_CUST_CODE", StringUtil.nullConvert(DELIVERY_CUST_CODE));// 배송업체  
      	
      	String PAY_DATE = defaultDAO.selectStr("OrderApi.selectPayDate",commandMap);
      	erpReqMap.put("PAY_DATE", StringUtil.nullConvert(PAY_DATE));// 구매확정일
      	
      	String FEE_RATE = defaultDAO.selectStr("OrderApi.selectFeeRate",commandMap);
      	erpReqMap.put("FEE_RATE", Integer.parseInt(FEE_RATE));// O2O수수료율 or 입점사 수수료율
      	
    	erpParam = defaultDAO.select("OrderApi.selectMemDlvInfo",commandMap);   
    	
    	if ( erpParam==null) {
          	erpReqMap.put("SENDER_NAME","");      // 보낸이
          	erpReqMap.put("SENDER_ADDR", "");      // 보낸이주소
          	erpReqMap.put("SENDER_TEL_NO", "");  // 보낸이전화번호
          	erpReqMap.put("SENDER_CELL_NO", "");// 보낸이휴대폰번호 
          	erpReqMap.put("SENDER_MEMO", "");      // 보낸이메모
          	erpReqMap.put("RCVER_NAME", "");        // 받는이 
          	erpReqMap.put("RCVER_ADDR", "");        // 받는이주소 
          	erpReqMap.put("RCVER_TEL_NO", "");    // 받는이전화번호
          	erpReqMap.put("RCVER_CELL_NO", "");  // 받는이휴대폰번호
    	} else {
          	erpReqMap.put("SENDER_NAME",StringUtil.nullConvert( erpParam.get("SENDER_NAME")));      // 보낸이
          	erpReqMap.put("SENDER_ADDR", StringUtil.nullConvert(erpParam.get("SENDER_ADDR")));      // 보낸이주소
          	erpReqMap.put("SENDER_TEL_NO", StringUtil.nullConvert(erpParam.get("SENDER_TEL_NO")));  // 보낸이전화번호
          	erpReqMap.put("SENDER_CELL_NO", StringUtil.nullConvert(erpParam.get("SENDER_CELL_NO")));// 보낸이휴대폰번호 
          	erpReqMap.put("SENDER_MEMO", StringUtil.nullConvert(erpParam.get("SENDER_MEMO")));      // 보낸이메모
          	erpReqMap.put("RCVER_NAME", StringUtil.nullConvert(erpParam.get("RCVER_NAME")));        // 받는이 
          	erpReqMap.put("RCVER_ADDR", StringUtil.nullConvert(erpParam.get("RCVER_ADDR")));        // 받는이주소 
          	erpReqMap.put("RCVER_TEL_NO", StringUtil.nullConvert(erpParam.get("RCVER_TEL_NO")));    // 받는이전화번호
          	erpReqMap.put("RCVER_CELL_NO", StringUtil.nullConvert(erpParam.get("RCVER_CELL_NO")));  // 받는이휴대폰번호
    	}
    	
      	
      	if(DIV.equals("2")) {//타사인경우에만 
          	String BRAND_NM = defaultDAO.selectStr("OrderApi.selectBrandNm",commandMap);// 브랜드명
          	erpReqMap.put("BRAND_NM", StringUtil.nullConvert(BRAND_NM));
       	} else {
          	erpReqMap.put("BRAND_NM", "");
       	}
      	JSON json = new JSON();	
      	
      	 json.put("result", erpReqMap);
      	 
      	 System.out.println("====================>>>> "+json);
      	 
      	/**
		 *  주문 데이터 ERP연동
		*/
      	List<Map<String,Object>> resParam = ErpRequest.requestOrder(erpReqMap);
      	//erpReqMap = resParam.get(0);

      	String RESULT_CODE =resParam.get(0).get("resultCode").toString();
      	String RESULT_ORDER_DETAIL_NO =resParam.get(0).get("resultOrderDetailNo").toString();
      	String RESULT_ORDER_SEQ =resParam.get(0).get("resultOrderSeq").toString();
      	
      	erpReqMap.put("RESULT_CODE", Integer.parseInt(RESULT_CODE));                      //리턴코드 ( 성공 200 / 실패 400 )
      	erpReqMap.put("RESULT_ORDER_NO", resParam.get(0).get("resultOrderNo"));           //입력받은 주문번호
      	erpReqMap.put("RESULT_ORDER_DETAIL_NO", Integer.parseInt(RESULT_ORDER_DETAIL_NO));//입력받은 주문상세번호
      	erpReqMap.put("RESULT_ORDER_SEQ", Integer.parseInt(RESULT_ORDER_SEQ));            //입력받은 주문 시퀀스번호
      	erpReqMap.put("RESULT_TEXT", resParam.get(0).get("resultText"));                  //리턴텍스트
      	erpReqMap.put("ORD_PRD_REG_IP", "system");      	//입력받은 주문IP
      	
      	
      	defaultDAO.insert("OrderApi.insertOrderErpResult", erpReqMap);

      	
       return erpReqMap;
	}
    
    /**
   	 * <pre>
   	 * 1. MethodName : orderErpApiTrans
   	 * 2. ClassName  : OrderErpApiServiceImpl.java
   	 * 3. Comment    : 주문 ERP INTERFACE 업무를 처리
   	 * 4. 작성자       : 정경수
   	 * 5. 작성일       : 2020.06.26
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */    
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderErpInfo(Map<String, Object> commandMap) throws Exception {
	    /**
		 *  주문 데이터 추출
		*/
		
		List<Map<String,Object>> erpParam = defaultDAO.selectList("OrderApi.selectOrderErpInfo",commandMap);
      	Map<String,Object> erpMap = erpParam.get(0);
	    /**
		 *  주문 데이터 ERP연동
		*/
      	List<Map<String,Object>> resParam = ErpRequest.requestOrder(erpMap);
      	Map<String,Object> erpResMap = resParam.get(0);

	    /**
		 *  주문 데이터 ERP연동 히스토리 insert
		*/
      	erpResMap.put("ORD_PRD_ORD_STATE", commandMap.get("ORD_PRD_ORD_STATE"));
      	erpResMap.put("ORD_MST_CD", commandMap.get("ORD_MST_CD"));
      	erpResMap.put("ORD_ORD_PRD_IDX", commandMap.get("ORD_PRD_IDX"));
      	
      	String RESULT_CODE =resParam.get(0).get("resultCode").toString();
      	String RESULT_ORDER_DETAIL_NO =resParam.get(0).get("resultOrderDetailNo").toString();
      	String RESULT_ORDER_SEQ =resParam.get(0).get("resultOrderSeq").toString();
      	
      	erpResMap.put("RESULT_CODE", Integer.parseInt(RESULT_CODE));
      	erpResMap.put("RESULT_ORDER_NO", resParam.get(0).get("resultOrderNo"));
      	erpResMap.put("RESULT_ORDER_DETAIL_NO", Integer.parseInt(RESULT_ORDER_DETAIL_NO));
      	erpResMap.put("RESULT_ORDER_SEQ", Integer.parseInt(RESULT_ORDER_SEQ));
      	erpResMap.put("RESULT_TEXT", resParam.get(0).get("resultText"));
      	erpResMap.put("ORD_PRD_REG_IP", commandMap.get("ORD_PRD_REG_IP"));
      	
      	
      	erpResMap.put("DIV", erpParam.get(0).get("DIV"));
      	erpResMap.put("ORDER_NO", erpParam.get(0).get("ORDER_NO"));
      	erpResMap.put("ORDER_DETAIL_NO", erpParam.get(0).get("ORDER_DETAIL_NO"));
      	erpResMap.put("ORDER_SEQ", erpParam.get(0).get("ORDER_SEQ"));
      	erpResMap.put("ORDER_TYPE", erpParam.get(0).get("ORDER_TYPE"));
      	erpResMap.put("O2O_GB", erpParam.get(0).get("O2O_GB"));
      	erpResMap.put("ORDER_STEP", erpParam.get(0).get("ORDER_STEP"));
      	erpResMap.put("ORDER_DATE", erpParam.get(0).get("ORDER_DATE"));
      	erpResMap.put("STYLE_NO", erpParam.get(0).get("STYLE_NO"));
      	erpResMap.put("SEASON_YEAR", erpParam.get(0).get("SEASON_YEAR"));
      	erpResMap.put("COLOR_CODE", erpParam.get(0).get("COLOR_CODE"));
      	erpResMap.put("SIZE_CODE", erpParam.get(0).get("SIZE_CODE"));
      	erpResMap.put("PART_DIV", erpParam.get(0).get("PART_DIV"));
      	erpResMap.put("PART_NO", erpParam.get(0).get("PART_NO"));
      	erpResMap.put("BRAND", erpParam.get(0).get("BRAND"));
      	erpResMap.put("LINKED_ORDER_NO", erpParam.get(0).get("LINKED_ORDER_NO"));
      	erpResMap.put("LINKED_ORDER_DETAIL_NO", erpParam.get(0).get("LINKED_ORDER_DETAIL_NO"));
      	erpResMap.put("ORDER_QTY", erpParam.get(0).get("ORDER_QTY"));
      	erpResMap.put("ORDER_PRICE", erpParam.get(0).get("ORDER_PRICE"));
      	erpResMap.put("ORDER_AMT", erpParam.get(0).get("ORDER_AMT"));
      	erpResMap.put("SUPPLY_AMT", erpParam.get(0).get("SUPPLY_AMT"));
      	erpResMap.put("VAT_AMT", erpParam.get(0).get("VAT_AMT"));
      	erpResMap.put("COUPON_NO", erpParam.get(0).get("COUPON_NO"));
      	erpResMap.put("COUPON_NAME", erpParam.get(0).get("COUPON_NAME"));
      	erpResMap.put("COUPON_AMT", erpParam.get(0).get("COUPON_AMT"));
      	erpResMap.put("MEMBER_ID", erpParam.get(0).get("MEMBER_ID"));
      	erpResMap.put("USE_POINT", erpParam.get(0).get("USE_POINT"));
      	erpResMap.put("OCCUR_POINT", erpParam.get(0).get("OCCUR_POINT"));
      	erpResMap.put("USE_EPOINT", erpParam.get(0).get("USE_EPOINT"));
      	erpResMap.put("EMP_NO", erpParam.get(0).get("EMP_NO"));
      	erpResMap.put("EMP_SALE_AMT", erpParam.get(0).get("EMP_SALE_AMT"));
      	erpResMap.put("COOPER_NM", erpParam.get(0).get("COOPER_NM"));
      	erpResMap.put("COOPER_SALE_AMT", erpParam.get(0).get("COOPER_SALE_AMT"));
      	erpResMap.put("PROMOTION_AMT", erpParam.get(0).get("PROMOTION_AMT"));
      	erpResMap.put("RSALE_AMT", erpParam.get(0).get("RSALE_AMT"));
      	erpResMap.put("DELIVERY_CUST_CODE", erpParam.get(0).get("DELIVERY_CUST_CODE"));
      	erpResMap.put("INVOICE_NO", erpParam.get(0).get("INVOICE_NO"));
      	erpResMap.put("BUY_CONFM_DATE", erpParam.get(0).get("BUY_CONFM_DATE"));
      	erpResMap.put("ORDER_PAYMENT_NO", erpParam.get(0).get("ORDER_PAYMENT_NO"));
      	erpResMap.put("PAY_DATE", erpParam.get(0).get("PAY_DATE"));
      	erpResMap.put("DELI_DATE", erpParam.get(0).get("DELI_DATE"));
      	erpResMap.put("DELI_END_DATE", erpParam.get(0).get("DELI_END_DATE"));
      	erpResMap.put("SALE_CONFM_DATE", erpParam.get(0).get("SALE_CONFM_DATE"));
      	erpResMap.put("CANCEL_DATE", erpParam.get(0).get("CANCEL_DATE"));
      	erpResMap.put("RECHANGE_DATE", erpParam.get(0).get("RECHANGE_DATE"));
      	erpResMap.put("FEE_RATE", erpParam.get(0).get("FEE_RATE"));
      	erpResMap.put("SENDER_NAME", erpParam.get(0).get("SENDER_NAME"));
      	erpResMap.put("SENDER_ADDR", erpParam.get(0).get("SENDER_ADDR"));
      	erpResMap.put("SENDER_TEL_NO", erpParam.get(0).get("SENDER_TEL_NO"));
      	erpResMap.put("SENDER_CELL_NO", erpParam.get(0).get("SENDER_CELL_NO"));
      	erpResMap.put("SENDER_MEMO", erpParam.get(0).get("SENDER_MEMO"));
      	erpResMap.put("RCVER_NAME", erpParam.get(0).get("RCVER_NAME"));
      	erpResMap.put("RCVER_ADDR", erpParam.get(0).get("RCVER_ADDR"));
      	erpResMap.put("RCVER_TEL_NO", erpParam.get(0).get("RCVER_TEL_NO"));
      	erpResMap.put("RCVER_CELL_NO", erpParam.get(0).get("RCVER_CELL_NO"));
      	erpResMap.put("BUSI_NO", erpParam.get(0).get("BUSI_NO"));
      	erpResMap.put("TAG_PRICE", erpParam.get(0).get("TAG_PRICE"));
      	erpResMap.put("BRAND_NM", erpParam.get(0).get("BRAND_NM"));

      	defaultDAO.insert("Order.insertOrderErpResult", erpResMap);

		return resParam;
	}
    

    /**
   	 * <pre>
   	 * 1. MethodName : selectGetOrdData
   	 * 2. ClassName  : OrderErpApiServiceImpl.java
   	 * 3. Comment    : ERP 전송데이터 SELECT
   	 * 4. 작성일       : 2020.07.02 
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */    
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGetOrdData(Map<String, Object> selectMap) throws Exception {		 								
		return defaultDAO.selectList("PcCart.selectGetOrdData", selectMap);		
	}
    
}
