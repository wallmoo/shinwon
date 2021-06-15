package com.market.mall.batch.service.impl;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.lgcns.module.lite.CnsPayWebConnector;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.tools.generic.NumberTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.kicc.EasyPayClient;
import com.market.mall.batch.service.BatchMail;
import com.market.mall.batch.service.BatchOrderMailService;
import com.market.mall.batch.service.BatchOrderStateService;
import com.market.mall.batch.service.BatchSms;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 
    * @PackageName: com.market.mall.batch.service.impl
    * @FileName : BatchOrderStateServiceImpl.java
    * @Date : 2016. 1. 15.
    * @프로그램 설명 : 주문상태 업데이트
    * @author : DEV_LEEKWANGWOON
 */
@Service("batchOrderStateService")
public class BatchOrderStateServiceImpl implements BatchOrderStateService{

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	
	//메일 발송시 필요한 서비스 시작
	@Resource(name="batchOrderMailService") protected BatchOrderMailService batchOrderMailService;
	
	@Resource
	protected BatchMail batchMail;	
	
	@Resource
	protected BatchSms batchSms;
	
	@Resource(name = "velocityEngine") 
	protected VelocityEngine velocityEngine;
	//메일 발송시 필요한 서비스 끝
		
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 
        * <pre>
        * 1. MethodName : setOrderState
        * 2. ClassName  : BatchOrderStateEndServiceImpl.java
        * 3. Comment    : 주문 상태값 셋팅
        * 4. 작성자       : DEV_LEEKWANGWOON
        * 5. 작성일       : 2016. 1. 14.
        * </pre>
        *
        * @param commandMap
     */
    public void setOrderState(Map<String, Object> commandMap){
    	commandMap.put("OST_ORDER", Code.OST_ORDER);
		commandMap.put("OST_PAY_READY", Code.OST_PAY_READY);
		commandMap.put("OST_PAY", Code.OST_PAY);
		commandMap.put("OST_CANCEL_BEFORE_DEPOSIT", Code.OST_CANCEL_BEFORE_DEPOSIT);
		commandMap.put("OST_CANCEL", Code.OST_CANCEL);
		commandMap.put("OST_CANCEL_END", Code.OST_CANCEL_END);
		commandMap.put("OST_SEND_READY", Code.OST_SEND_READY);
		commandMap.put("OST_SEND", Code.OST_SEND);
		commandMap.put("OST_SEND_END", Code.OST_SEND_END);
		commandMap.put("OST_BACK", Code.OST_BACK);
		commandMap.put("OST_BACK_END", Code.OST_BACK_END);
		commandMap.put("OST_SWAP", Code.OST_SWAP);
		commandMap.put("OST_SWAP_READY", Code.OST_SWAP_READY);
		commandMap.put("OST_SWAP_END", Code.OST_SWAP_END);
		commandMap.put("OST_SWAP_CANCEL", Code.OST_SWAP_CANCEL);
		commandMap.put("OST_FIX", Code.OST_FIX);
		commandMap.put("OST_REFUND", Code.OST_REFUND);
		commandMap.put("OST_REFUND_END", Code.OST_REFUND_END);
	    commandMap.put("OST_SWAP_COLLECT_CALL", Code.OST_SWAP_COLLECT_CALL);
	    commandMap.put("OST_SWAP_COLLECT_END", Code.OST_SWAP_COLLECT_END);
	    commandMap.put("OST_BACK_COLLECT_CALL", Code.OST_BACK_COLLECT_CALL);
	    commandMap.put("OST_BACK_COLLECT_END", Code.OST_BACK_COLLECT_END);
		commandMap.put("OST_SWAP_READY_CANCEL", Code.OST_SWAP_READY_CANCEL);
		commandMap.put("OST_SWAP_TARGET_COLLECT_END", Code.OST_SWAP_TARGET_COLLECT_END);
		commandMap.put("OST_BACK_APPROVED", Code.OST_BACK_APPROVED);
		commandMap.put("OST_BACK_ARR", Code.OST_BACK_ARR);//개별 반품처리 위한 반품관련 주문상태값 리스트
		commandMap.put("OST_SWAP_IGNORE_ARR", Code.OST_SWAP_IGNORE_ARR);//계산시에는 없는 상품으로 쳐야할 주문상태값 리스트
		
    }    
    
    /**
     * 
        * <pre>
        * 1. MethodName : updateOrderState
        * 2. ClassName  : BatchOrderStateEndServiceImpl.java
        * 3. Comment    : 주문상태코드 업데이트
        * 4. 작성자       : DEV_LEEKWANGWOON
        * 5. 작성일       : 2016. 1. 14.
        * </pre>
        *
        * @param commandMap
        * @param request
        * @return
        * @throws Exception
     */
	@SuppressWarnings({ "unchecked", "unused" })
	public Map<String,Object> updateOrderState( final Map<String, Object> commandMap) throws Exception {
	
		Map<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		String resultCode = "";
		String resultMsg = "에러가 발생했습니다.";		
		
		//주문상태 
    	this.setOrderState(commandMap);
		
        logger.info("=====================================================================================");
        logger.info("Message : 주문 상태변경 Start.");
        logger.info("=====================================================================================");		
        
        // 주문정보
    	Map<String, Object> orderInfo		   = defaultDAO.select("BatchOrderState.selectOrderInfo", commandMap);
    	// 배송정보
        Map<String, Object> orderDeliveryInfo  = defaultDAO.select("BatchOrderState.selectDeliveryInfo",commandMap);
        // 할인/결제정보
        Map<String, Object> orderPayInfo 	   = defaultDAO.select("BatchOrderState.selectOrderPayInfo",commandMap);        
        // 현재 주문상태 확인
        Map<String, Object> cState 			   = defaultDAO.select("BatchOrderState.selectOrderStateCnt",commandMap);

        resultMap.put("result", "F");
        
        if(orderInfo!=null && cState!=null)
        {
        	
        	String ORD_MST_CD 						= StringUtil.getString(orderInfo.get("ORD_MST_CD"));    // 주문번호
        	int ORD_MST_DLV_GBN 					= StringUtil.getInt(orderInfo.get("ORD_MST_DLV_GBN"));	// 배송유형
        	
    		// 상태값 정보
        	int totCnt       						= StringUtil.getInt(cState.get("TOTAL_CNT"));
        	String COUPON_RESTORE_POSSIBLE_YN       = StringUtil.getString(cState.get("COUPON_RESTORE_POSSIBLE_YN"));
        	int toChangeOrderState 					= StringUtil.getInt(commandMap.get("ORD_PRD_ORD_STATE"));
        	
        	logger.info("toChangeOrderState==========================="+toChangeOrderState);
        	String pgPayYn = StringUtil.getString(cState.get("PG_PAY_YN"), "");
        	
        	// 재결제 주문인 경우 원주문번호
        	String ORD_MST_PRE_CD = StringUtil.getString(orderInfo.get("ORD_MST_PRE_CD"), "");        	
        	
        	if(totCnt > 0)
        	{
        		
        		// 결제수단
        		int ORD_MST_PAY_TYPE = StringUtil.getInt(orderPayInfo.get("ORD_MST_PAY_TYPE"));
        		// 결제일시
        		String ORD_MST_PAY_DT = StringUtil.getString(orderPayInfo.get("ORD_MST_PAY_DT"));        		
    	
        		//주문 배송완료후 구매확정(7일)
		        if (toChangeOrderState == Code.OST_FIX)	// 구매확정
		        {
		            logger.info("=====================================================================================");
		            logger.info("Message : 주문 상태변경(배송완료 -> 구매확정)");
		            logger.info("=====================================================================================");
		
		            List<Map<String, Object>> pList = defaultDAO.selectList("BatchOrderState.selectOrderStateList",commandMap);
		        	for(Map<String, Object> pMap:pList)
		        	{
		        		//배송완료 건만 구매확정
                		if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_SEND_END))
                		{
                			//상태변경
    		        		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
    		        		result += defaultDAO.update("BatchOrderState.updateOrderState", commandMap);
    		        		
    		        		//변경이력 등록
    		        		commandMap.put("ORD_PRD_DSC", "구매확정 처리");
    		            	defaultDAO.insert("BatchOrderState.insertOrderHistory",commandMap);
                		}
		        	}
		        	
		        	if(result > 0){
		        		resultMap.put("result", "S");
		        		
		        		// 현재 주문상태 확인 후 모든 상품이 구매확정인 경우에만 적립한다.
                        cState = defaultDAO.select("BatchOrderState.selectOrderStateCnt",commandMap);
                        int EXCEPT_SWAP_TOTAL_CNT = StringUtil.getInt(cState.get("EXCEPT_SWAP_TOTAL_CNT"));//전체상품수
                        int FIX_CNT = StringUtil.getInt(cState.get("FIX_CNT"));//구매확정수
                        if(EXCEPT_SWAP_TOTAL_CNT > 0 && EXCEPT_SWAP_TOTAL_CNT == FIX_CNT){
                        	//회원 아이디
    			        	String ORD_MST_ORD_ID = StringUtil.getString(orderInfo.get("ORD_MST_ORD_ID"));
    			        	if(!"".equals("_GUEST_")){//회원인 경우에만
    			            	// 캐쉬백 적립 처리
    			        		int TOT_ORD_SAV_OCB = StringUtil.getInt(orderPayInfo.get("TOT_ORD_SAV_OCB"));//캐쉬백 적립금액
    			        		
    			        		System.out.println("TOT_ORD_SAV_OCB >>> " + TOT_ORD_SAV_OCB);
    			        		
    			        		if(TOT_ORD_SAV_OCB > 0){
    		        				String CASHBAG_CARD_NO = "";
    	                			
    	                			//0. 사용 이력
    	                			commandMap.put("trStatus", "U");//사용 이력
    	                			Map<String, Object> cashbagUseInfo = this.defaultDAO.select("BatchOrderState.selectOrderCashbagInfo", commandMap);
    	                			
    	                			if(cashbagUseInfo == null){//사용 이력 없는 경우 회원 캐쉬백 정보 가져온다.
    	                				//1. 회원 캐쉬백 번호
    	                            	commandMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
    	                            	Map<String, Object> memberCashbagInfo = this.defaultDAO.select("BatchOrderState.selectMemberCashbagInfo", commandMap);
    	                            	
    	                            	if(memberCashbagInfo != null){
    	                            		CASHBAG_CARD_NO = StringUtil.getString(memberCashbagInfo.get("MEM_MST_OCB_NO"));//캐쉬백 카드번호 
    	                            	}
    	                			}else{
    	                				CASHBAG_CARD_NO = StringUtil.getString(cashbagUseInfo.get("PAY_MST_KICC_CARD_NO"));//캐쉬백 카드번호 주문때 썼던 카드로 수정!
    	                			}
    	                        	
    	                        	if(!"".equals(CASHBAG_CARD_NO)){
    			                		//2. 적립 이력(적립이력 없는 경우에만 적립)
    			                    	commandMap.put("trStatus", "S");//적립 이력
    			            			Map<String, Object> cashbagSavedInfo = this.defaultDAO.select("BatchOrderState.selectOrderCashbagInfo", commandMap);
    			            			
    			            			if(cashbagSavedInfo == null){
    			            				String PAY_MST_PAYTYPE = StringUtil.getString(orderPayInfo.get("PAY_MST_PAYTYPE"));
                            				String EP_mall_id = StringUtil.getString(orderPayInfo.get("PAY_MST_MID"));
                            				
                            				if(!"KICC".equals(PAY_MST_PAYTYPE)){//kicc 아닌 경우 default mid
                            					EP_mall_id = this.propertiesService.getString("payment.kicc.mall.id");//default kicc mid
                            				}
                            				
                            				logger.debug("캐쉬백 적립시 결제때 쓴 kicc mid 쓴다. 없으면 그냥 default mid쓴다. EP_mall_id========"+EP_mall_id);
                            				
                            				Map<String, Object> cashbagMap = new HashMap<String, Object>();
                            				cashbagMap.put("EP_mall_id", EP_mall_id);
                            				String CST_PLATFORM = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
                            				if("test".equals(CST_PLATFORM)){
                            					cashbagMap.put("EP_mall_id", "T0001981"); //TODO 삭제예정
                            				}
    			            				cashbagMap.put("EP_pay_type", "point");
    			            				cashbagMap.put("EP_pnt_txtype", "40");
    			            				cashbagMap.put("EP_pnt_cp_cd", "OCB");
    			            				cashbagMap.put("EP_pnt_idno", CASHBAG_CARD_NO);
    			            				cashbagMap.put("EP_pnt_pwd", "0000");
    			            				cashbagMap.put("EP_order_no", ORD_MST_CD);
    			            				cashbagMap.put("ORD_MST_CD", ORD_MST_CD);
    			            				cashbagMap.put("EP_product_amt", TOT_ORD_SAV_OCB);
    			            				cashbagMap.put("EP_tot_amt", TOT_ORD_SAV_OCB);
    			            				cashbagMap.put("EP_pnt_amt", TOT_ORD_SAV_OCB);
    			            				cashbagMap.put("EP_currency", "00");
    			            				cashbagMap.put("EP_escrow_yn", "N");
    			            				cashbagMap.put("EP_complex_yn", "N");
    			            				
    			            				// 캐쉬백 포인트 적립
    			            				Map<String,Object> cashbagSaveResult = null;
    			            				cashbagSaveResult = this.kiccPayment(cashbagMap);
    			            				
    			            				System.out.println("cashbagSaveResult >> " + cashbagSaveResult);
    			            				
    			            				// 2. PAY_MST INSERT
    				            			if(cashbagSaveResult != null){
    				            				this.defaultDAO.insert("BatchOrderState.insertPayMaster", cashbagSaveResult);
    				            			}
    			        					
    			        					if("0000".equals(StringUtil.getString(cashbagSaveResult.get("PAY_MST_RESPCODE"))))
    			            				{
    			        						resultMsg = "완료되었습니다.";
    			        						
    			            					logger.info("=====================================================================================");
    			            					logger.info("Message : PG 캐쉬백 적립 성공");
    			            					logger.info("=====================================================================================");
    			            					
    			            	                resultMap.put("result", "S");
    			            				}
    			            				else
    			            				{
    			            					
    			            	                resultMap.put("result", "F");	            					
    			            					result = 0;
    			            					resultMsg = StringUtil.getString(cashbagSaveResult.get("PAY_MST_RESPMSG"));
    			            					logger.info("=====================================================================================");
    			            					//logger.info("Message : PG 캐쉬백 적립시 오류발생-주문상태변경 Rollback.");
    			            					logger.info("Message : PG 캐쉬백 적립시 오류발생 PAY_MST_RESPCODE ["+ StringUtil.getString(cashbagSaveResult.get("PAY_MST_RESPCODE")) +"] PAY_MST_RESPMSG ["+ resultMsg +"]");
    			            					logger.info("=====================================================================================");
    			            					
    			            				}
    			            			}
    	                        	}
    			        		}
    			        	}
                        }
		        	}
		        }
	            // 입금대기,결제완료,배송준비중 -> 주문취소접수
	            // 입금전인 주문은 주문취소로, 입금후 주문은 취소접수로, 기타 결제는 모두 취소완료 처리한다.	        
		        else if (toChangeOrderState == Code.OST_CANCEL)
	            {
	                logger.info("=====================================================================================");
	                logger.info("Message : 주문 상태변경(입금대기,결제완료,배송준비중 -> 주문취소접수)");
	                logger.info("=====================================================================================");
	
	                // 취소가능여부
                    boolean isCancelable = true;
                	if(ORD_MST_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){//겟잇나우인 경우
                    	// ERP UPDATE 후 프로시져 호출까지 완료되면 PG 취소한다.
                		Map<String, Object> map_erp = new HashMap<String,Object>();
                		map_erp.put("P1E1SDOCO", ORD_MST_CD);
                		//int erp_result = this.erpDAO.update("BatchErpOrderErp.updateErpF58T2004", map_erp);	//1순위
                		int erp_result = 0;
                		if(erp_result > 0){
                			map_erp.put("SBE1SDOCO", ORD_MST_CD);
                			//erp_result = this.erpDAO.update("BatchErpOrderErp.updateErpF58T1402", map_erp);	//2순위
                			erp_result = 0;
                			if(erp_result > 0){
                				
                				// 겟잇나우 프로시져 호출(상품단위)
        						//insertPROC_F41021
                				map_erp.put("ORD_MST_CD", ORD_MST_CD);
                				List<Map<String, Object>> orderProductList = defaultDAO.selectList("BatchErpOrder.selectErpOrderProductList",map_erp);
                				if(orderProductList != null){
                					for(Map<String,Object> orderProduct : orderProductList){
            							String VAR_ITM = this.defaultDAO.selectStr("BatchOrderState.selectErpItm",orderProduct);//ITEM 코드
            							int VAR_MCU = StringUtil.getInt(orderProduct.get("GET_SHP_ERP_CD"));//ERP 지점 코드
            							int VAR_PQOH = StringUtil.getInt(orderProduct.get("ORD_PRD_ORD_CNT"));//수량
            							
            							Map<String,Object> map_proc = new HashMap<String,Object>();
            							logger.debug("VAR_ITM = "+Integer.valueOf(VAR_ITM));
            							logger.debug("VAR_MCU = "+VAR_MCU);
            							logger.debug("VAR_PQOH = "+VAR_PQOH);
            							
            							map_proc.put("VAR_ITM", Integer.valueOf(VAR_ITM));
            							map_proc.put("VAR_MCU", VAR_MCU);
            							map_proc.put("VAR_LOCN", 37);
            							map_proc.put("VAR_PQOH", VAR_PQOH);
            							
            							logger.debug("############# insertPROC_F41021 #############");
            							//this.erpDAO.insert("BatchErpOrderErp.insertPROC_F41021",map_proc);
            							
            							logger.debug("RESULT_RETURN========="+map_proc.get("RESULT_RETURN"));
            							logger.debug("SQLERRM_RETURN========="+map_proc.get("SQLERRM_RETURN"));
            							
            							if(Integer.valueOf(String.valueOf(map_proc.get("RESULT_RETURN"))) < 0){
            								resultMsg = "################# insertPROC_F41021 실패 RESULT_RETURN : "+ map_proc.get("RESULT_RETURN") +" / SQLERRM_RETURN : "+ map_proc.get("SQLERRM_RETURN") +" ######################";
            								logger.error(resultMsg);
            								throw new Exception();
            							}
            						}
                					
                					isCancelable = true;
                					
                				}else{
                					logger.error("=====================================================================================");
                					logger.error("Message : 겟잇나우 주문상품리스트 불러오기 실패 ");
                					logger.error("=====================================================================================");
                					
                					resultMap.put("result", "F");
                					isCancelable = false;
                				}
        						
                			}else{
                				logger.error("=====================================================================================");
            					logger.error("Message : 겟잇나우 updateErpF58T1402 실패 ");
            					logger.error("=====================================================================================");
            					
            					resultMap.put("result", "F");
            					isCancelable = false;
                			}
                		}else{
                			logger.error("=====================================================================================");
        					logger.error("Message : 겟잇나우 updateErpF58T2004 실패 ");
        					logger.error("=====================================================================================");
        					
        					resultMap.put("result", "F");
        					isCancelable = false;
                		}
                		
                    }

                	if(isCancelable){
                		boolean isCancelBeforeDeposit = false; //입금전 취소여부
    	                List<Map<String, Object>> pList = defaultDAO.selectList("BatchOrderState.selectOrderStateList",commandMap);
    	            	for(Map<String, Object> pMap:pList)
    	            	{
    	            		//결제대기,결제완료,배송준비중 건만 취소완료
    	            		if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_PAY_READY)
    	            				|| StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_PAY)
    	                    		|| StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_SEND_READY))
    	            		{
    	            			boolean isStockReset = true; //재고 원복 여부
    	            			if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT || ORD_MST_PAY_TYPE == Code.PAY_ESCROW){// 가상계좌 or 에스크로
    	            				if(ORD_MST_PAY_DT.equals("00000000000000")){//입금 전이면 주문취소로 변경
    	            					commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_BEFORE_DEPOSIT);
    	            				}else{//입금 후면 취소접수로 변경
    	            					isStockReset = false; //입금후 주문인 경우 취소완료로 변경시 재고 원복한다.
    	            					commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL);
    	            				}
    	            			}else{//나머지는 취소완료로 변경
    	            				commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_END);
    	            			}
    	            			
    	                		//주문상품 상태변경
    	                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
    	                		result += defaultDAO.update("BatchOrderState.updateOrderState", commandMap);
    	                		
    	                		//변경이력 등록
    	                    	defaultDAO.insert("BatchOrderState.insertOrderHistory",commandMap);
    	
    	                    	if(isStockReset){
    	                    		// 재고 원복(겟잇나우는 어떻게?)
    	                        	// 재결제 주문인 경우 미갱신
    	                        	if("".equals(ORD_MST_PRE_CD) && ORD_MST_DLV_GBN != Code.CART_DLV_GBN_GET_IT_NOW_CD){
    	                        		Map<String, Object> map_prd = new HashMap<String, Object>();
    	                    			map_prd.put("ORD_PRD_MST_CD", StringUtil.getString(pMap.get("ORD_PRD_MST_CD"),"")); //ORD_PRD_MST_CD
    	                    			map_prd.put("ORD_PRD_ORD_CNT", StringUtil.getString(pMap.get("ORD_PRD_ORD_CNT"),"")); //주문수량
    	                    			
    	                    			int ORD_PRD_OPT_DTL_IDX = StringUtil.getInt(pMap.get("ORD_PRD_OPT_DTL_IDX"));
    	            					if(ORD_PRD_OPT_DTL_IDX == 0){//옵션 없는 상품 - 마스터 재고 원복
    	            						this.defaultDAO.update("BatchOrderState.updatePrdMstStock", pMap);
    	            					}else{// 옵션 있는 상품 - 옵션 재고 원복
    	            						this.defaultDAO.update("BatchOrderState.updatePrdOptStock", pMap);
    	            					}
    	                        	}
    	                    	}
    	            		}
    	            	}	
    	            	
    	            	if(result > 0){
                    		// 쿠폰 사용 여부 체크 후 쿠폰 복원 여부 결정
                    		// 복원할 쿠폰은 상품쿠폰 하나이기 때문에 한번만 update 하면 된다. 
                            int ORD_MST_DC_CPN = StringUtil.getInt(orderInfo.get("ORD_MST_DC_CPN"));
                            if(ORD_MST_DC_CPN > 0 && "Y".equals(COUPON_RESTORE_POSSIBLE_YN)){
                            	boolean isUpdated = false;
                            	List<Map<String, Object>> orderCouponList = defaultDAO.selectList("Order.selectOrderCouponList",commandMap);
                            	for(Map<String, Object> orderCoupon : orderCouponList){
                            		if(!isUpdated){
                            			String CPN_MST_GBN = StringUtil.getString(orderCoupon.get("CPN_MST_GBN"));
                                		if(!"F".equals(CPN_MST_GBN)){//배송비 쿠폰이 아닌 경우에만 복원 가능
                            				orderCoupon.put("CPN_MEM_USE_YN", "N");
                                			orderCoupon.put("CPN_MEM_ID", StringUtil.getString(orderInfo.get("ORD_MST_ORD_ID")));
                                			defaultDAO.update("Order.updateCpnUseYn", orderCoupon);
                                			isUpdated = true;
                                		}
                            		}else{
                        				break;
                        			}
                            	}
                            }
                    	}
    	            	
    	            	if(result > 0)
    	            	{
    	            		// 캐쉬백 사용한 경우 캐쉬백 처리
    	            		// 캐쉬백 포인트 사용 이력 
    	            		Map<String,Object> cashbagCancelResult = null;
    	        			commandMap.put("trStatus", "U");//사용 이력
    	        			Map<String, Object> cashbagUseInfo = defaultDAO.select("BatchOrderState.selectOrderCashbagInfo", commandMap);
    	        			if(cashbagUseInfo != null){//캐쉬백 사용 이력 있는 경우 취소
    	        				cashbagUseInfo.put("cashbagTrStatus", "N"); // 적립 취소인 경우 X / 사용 취소인 경우 N
    	        				cashbagUseInfo.put("mgr_txtype", 40);
    	        				cashbagCancelResult = this.kiccManagePayment(cashbagUseInfo);
    	        				
    	        				//2. PAY_MST INSERT
    	            			if(cashbagCancelResult != null){
    	            				cashbagCancelResult.put("ORD_MST_CD", ORD_MST_CD);
    	            				defaultDAO.insert("BatchOrderState.insertPayMaster", cashbagCancelResult);
    	            			}
    	            			
    	            			System.out.println("111111>>>>>>>>>>>>>> " + StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE")) );
    	            			
    	            			if("0000".equals(StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE"))))
    	        				{
    	        					logger.info("=====================================================================================");
    	        					logger.info("Message : PG 캐쉬백 결제취소 성공");
    	        					logger.info("=====================================================================================");
    	        					
    	        					resultMap.put("result", "S");	        					
    	        				}
    	        				else
    	        				{
    	        					logger.info("=====================================================================================");
    	        					logger.info("Message : PG 캐쉬백 결제취소시 오류발생-주문상태변경 Rollback.");
    	        					logger.info("=====================================================================================");
    	        					
    	        					commandMap.put("resultCode", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE")));
    	        					commandMap.put("resultMsg", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPMSG")));

    	        					resultMap.put("result", "F");	        					
    	        					resultMsg = "ERR_PG";
    	        					//throw new Exception("ERR_PG");
    	        				}
    	        			}
    	        			
    	        			// 캐쉬백 포인트 적립 이력 
    	        			commandMap.put("trStatus", "S");//적립 이력
    	        			Map<String, Object> cashbagSavedInfo = defaultDAO. select("BatchOrderState.selectOrderCashbagInfo", commandMap);
    	        			if(cashbagSavedInfo != null){//캐쉬백 적립 이력 있는 경우 취소
    	        				cashbagSavedInfo.put("cashbagTrStatus", "X"); // 적립 취소인 경우 X / 사용 취소인 경우 N
    	        				cashbagSavedInfo.put("mgr_txtype", 40);
    	        				cashbagCancelResult = this.kiccManagePayment(cashbagSavedInfo);
    	        				
    	        				//2. PAY_MST INSERT
    	            			if(cashbagCancelResult != null){
    	            				cashbagCancelResult.put("ORD_MST_CD", ORD_MST_CD);
    	            				defaultDAO.insert("BatchOrderState.insertPayMaster", cashbagCancelResult);
    	            				
    	            			}
    	            			
    	            			if("0000".equals(StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE"))))
    	        				{
    	        					logger.info("=====================================================================================");
    	        					logger.info("Message : PG 캐쉬백 적립취소 성공");
    	        					logger.info("=====================================================================================");
    	        					resultMap.put("result", "S");
    	        				}
    	        				else
    	        				{
    	        					logger.info("=====================================================================================");
    	        					logger.info("Message : PG 캐쉬백 적립취소시 오류발생-주문상태변경 Rollback.");
    	        					logger.info("=====================================================================================");
    	        					
    	        					commandMap.put("resultCode", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE")));
    	        					commandMap.put("resultMsg", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPMSG")));
    	        					
    	        					resultMap.put("result", "F");
    	        					resultMsg = "ERR_PG";
    	        					//throw new Exception("ERR_PG");
    	        				}
    	        			}
    	            		
    	            		// 결제취소
    	            		// point 결제 아니고
    	            		// 가상계좌인 경우 입금대기 상태에서만 pg사 취소 가능
    	            		// 그외에는 현금 환불 수기 처리.
    	            		if("Y".equals(pgPayYn)) 
    	            		{
    	            			logger.info("=====================================================================================");
    	            			logger.info("Message : PG 결제 전체 취소 시작");
    	            			logger.info("=====================================================================================");
    						     
    	            			// PG 연동 취소/환불처리
    	            			orderPayInfo.put("LGD_RFPHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"))+StringUtil.getString(orderInfo.get("ORD_MST_HP2"))+StringUtil.getString(orderInfo.get("ORD_MST_HP3")));	// 환불요청자 휴대폰번호
    	            			
    	            			Map<String,Object> cancelResult = null;
    	            			
    	            			boolean isCashReturn = false; //현금환불여부
    	            			if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT || ORD_MST_PAY_TYPE == Code.PAY_ESCROW){// 가상계좌 or 에스크로
    	            				if(ORD_MST_PAY_DT.equals("00000000000000")){
    	            					if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT){
    	            						orderPayInfo.put("mgr_txtype", 40);
    	            					}else if(ORD_MST_PAY_TYPE == Code.PAY_ESCROW){
    	            						orderPayInfo.put("mgr_txtype", 61);
    	            						orderPayInfo.put("mgr_subtype", "ES02");
    	            					}
    	            					cancelResult = this.kiccManagePayment(orderPayInfo);
    	            					isCancelBeforeDeposit = true;
    	            				}else{
    	            					logger.info("=====================================================================================");
    	                    			logger.info("Message : 가상계좌 입금완료 주문 - 현금환불 처리");
    	                    			logger.info("=====================================================================================");
    	                    			
    	                    			result = 3;
    	                    			resultMsg = "완료되었습니다.";
    	                    			isCashReturn = true;
    	            				}
    	            			}else if(ORD_MST_PAY_TYPE == Code.PAY_CARD || ORD_MST_PAY_TYPE == Code.PAY_FOREIGN_CARD){//신용카드
    	            				orderPayInfo.put("mgr_txtype", 40);
    	            				cancelResult = this.kiccCardManagePayment(orderPayInfo);
    	            			}else if(ORD_MST_PAY_TYPE == Code.PAY_ACCOUNT){//계좌이체
    	            				orderPayInfo.put("mgr_txtype", 40);
    	            				cancelResult = this.kiccManagePayment(orderPayInfo);
    	            			}else if(ORD_MST_PAY_TYPE == Code.PAY_PAYNOW){//페이나우
    	            				//cancelResult = this.lgCancelPayment(orderPayInfo);
    	            			}else if(ORD_MST_PAY_TYPE == Code.PAY_KAKAOPAY){//카카오페이
    	            				cancelResult = this.kakaoCancelPayment(orderPayInfo);
    	            			}
    	            			
    	            			// 2. PAY_MST INSERT
    	            			if(cancelResult != null){
    	            				this.defaultDAO.insert("BatchOrderState.insertPayMaster", cancelResult);
    	            			}
    	            			
    	            			if(!isCashReturn){
    	            				if("0000".equals(StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE"))))
    	            				{
    	            					result = 1;
    	            					resultMsg = "완료되었습니다.";
    	            					
    	            					logger.info("=====================================================================================");
    	            					logger.info("Message : PG 결제취소 성공");
    	            					logger.info("=====================================================================================");
    	            					
    	            					resultMap.put("result", "S");	            					
    	            				}
    	            				else
    	            				{
    	            					logger.info("=====================================================================================");
    	            					logger.info("Message : PG 결제취소시 오류발생-주문상태변경 Rollback.");
    	            					logger.info("=====================================================================================");
    	            					
    	            					commandMap.put("resultCode", StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE")));
    	            					commandMap.put("resultMsg", StringUtil.getString(cancelResult.get("PAY_MST_RESPMSG")));
    	            					
    	            					resultMap.put("result", "F");
    	            					resultMsg = "ERR_PG";
    	            					//throw new Exception("ERR_PG");
    	            				}	
    	            			}
    	            		}
    	            		else
    	            		{
    	            			result = 2;
    	            			logger.info("=====================================================================================");
    						    logger.info("Message : 마일리지 only 결제");
    						    logger.info("=====================================================================================");
    						    
    						    resultMap.put("result", "S");
    	            		}
    	            	}
    	            	
    	            	logger.debug("result============="+result);
    	
    	            	// 취소완료 메일 & LMS 발송
    	            	if (result > 0)
    	            	{
    	            		String mailTemplate = "";
    	            		if(isCancelBeforeDeposit){//입금 전 취소인 경우
    	            			mailTemplate = "MAIL-ORDER-CANCEL-BEFORE-DEPOSIT";
    	            		}else{
    	            			mailTemplate = "MAIL-ORDER-CANCEL";
    	            		}
    	            		
    	            		try{
                				// 메일 발송시 필요한 정보 가져오기 시작...
                				
                				// 주문상품 목록
                				commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
                				commandMap.put("ORD_PRD_IDX", "");
                				commandMap.put("ordPrdIdxs", "");
                		        List<Map<String, Object>> orderProductList = this.batchOrderMailService.selectOrderProductList(commandMap);//공통 사용 가능
                		        
                		        //  상품 옵션 가져오기
                		 		for(Map<String, Object> ordPrd : orderProductList){
                		 			int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
                		 			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
                		 				List<Map<String,Object>> optionList = this.batchOrderMailService.selectCartOptionDetailList(ordPrd);//공통 사용 가능
                		 				ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
                		 			}
                		 			
                		 			//서브 옵션 리스트
                		 			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
                		 			int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
                		 			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
                						subPrdList = this.batchOrderMailService.selectOrderSubPrdList(ordPrd);//공통 사용 가능
                						ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
                		 			}
                		 		}
                		 		
                		 		// 취소/교환/반품 정보
                         		commandMap.put("targetState", "cancel");
                         		List<Map<String,Object>> cancelInfoList = this.batchOrderMailService.selectOrdCancelSwapBackInfo(commandMap);
                         		commandMap.put("targetState", "back");
                         		List<Map<String,Object>> backInfoList = this.batchOrderMailService.selectOrdCancelSwapBackInfo(commandMap);
                		 		
                		        // 사은품 정보
                		        List<Map<String, Object>> requestedGiftList = this.batchOrderMailService.selectRequestedGiftList(commandMap);//공통 사용 가능
                		        
                		        // 배송정보
                		        Map<String, Object> orderDeliveryInfo2 = this.batchOrderMailService.selectOrderDeliveryInfo(commandMap);//공통 사용 가능
                		        
                		        // 할인/결제정보
                		        Map<String, Object> orderPayInfo2 = this.batchOrderMailService.selectOrderPayInfo(commandMap);//공통 사용 가능
                		        
                		  		//  로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
                		  		// 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
                		        String DEFAULT_CASHBAG_CARD_NO = "";
                        		Map<String,Object> getItNowShopInfo = null;
                        		Map<String, Object> userInfo = null;
                        		String ORD_MST_ORD_ID = StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_ID"));
                				if(!"_GUEST_".equals(ORD_MST_ORD_ID)){//회원인 경우
                					commandMap.put("trStatus", "U");//사용 이력
                					Map<String, Object> cashbagSavedInfo = this.batchOrderMailService.selectOrderCashbagInfo(commandMap);//공통 사용 가능
                					
                					if(cashbagSavedInfo != null){
                						DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(cashbagSavedInfo.get("PAY_MST_KICC_CARD_NO"));
                					}else{
                						// 캐쉬백 카드번호
                						commandMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
                						Map<String, Object> memberCashbagInfo = this.batchOrderMailService.selectMemberCashbagInfo(commandMap);//공통 사용 가능
                						
                						if(memberCashbagInfo != null){//회원 캐쉬백 카드 있는 경우
                							DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(memberCashbagInfo.get("MEM_MST_OCB_NO"));
                						}
                					}
                					
                					// 겟잇나우 주문인 경우 지점 정보 가져오기
                			 		int ORD_MST_DLV_GBN2 = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_GBN"));
                			 		if(ORD_MST_DLV_GBN2 == Code.CART_DLV_GBN_GET_IT_NOW_CD){
                			 			getItNowShopInfo = this.batchOrderMailService.selectOrderGetItNowShopInfo(commandMap);//공통 사용 가능
                			 		}
                			 		
                			 		// 회원정보
                			 		Map<String,Object> userMap = new HashMap<String,Object>();
                			 		userMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
                        			userInfo = this.batchOrderMailService.selectUserInfo(userMap);
                				}
                				
                				// 메일 contents 맵
                	    		Map<String,Object> mailContentsMap = new HashMap<String,Object>();
                	    		mailContentsMap.put("orderDeliveryInfo", orderDeliveryInfo2);//배송지정보
                	    		mailContentsMap.put("orderProductList", orderProductList);//주문상품리스트
                	    		mailContentsMap.put("requestedGiftList", requestedGiftList);//사은품리스트
                	    		mailContentsMap.put("orderPayInfo", orderPayInfo2);//주문결제정보
                	    		mailContentsMap.put("getItNowShopInfo", getItNowShopInfo);//겟잇나우정보
                	    		mailContentsMap.put("cancelInfoList", cancelInfoList);//취소사유정보
                	    		mailContentsMap.put("backInfoList", backInfoList);//반품사유정보
                	    		mailContentsMap.put("userInfo", userInfo);//회원정보
                	    		
                	    		mailContentsMap.put("autoCancelYn", "Y"); //입금기한 만료 자동 취소 여부
                	    		
                	    		if(!"".equals(DEFAULT_CASHBAG_CARD_NO) && DEFAULT_CASHBAG_CARD_NO.length() >= 8){
                    				mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO1", DEFAULT_CASHBAG_CARD_NO.substring(0, 4));
                	    			mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO2", DEFAULT_CASHBAG_CARD_NO.substring(4, 8));
                	    		}
                	    		
                	    		// 주문일 
                	    		Calendar calendar = Calendar.getInstance();
                	    		SimpleDateFormat dateformat_text = new SimpleDateFormat("yyyy년 MM월 dd일");
                	    		String today = dateformat_text.format(calendar.getTime());
                	    		mailContentsMap.put("today", today);
                	    		
                	    		mailContentsMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));			// 수신자 이름
                	    		mailContentsMap.put("ORD_MST_CD", StringUtil.getString(orderPayInfo2.get("ORD_MST_CD")));//주문 번호
                	    		mailContentsMap.put("ORD_MST_PAY_TYPE", commandMap.get("ORD_MST_PAY_TYPE"));//결제방법
                				
                	    		mailContentsMap.put("SMS_HP", StringUtil.getString(commandMap.get("ORD_MST_HP1"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP2"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP3"),""));//SMS 발신용 휴대폰 번호
                	    		mailContentsMap.put("PAY_MST_FINANCENAME", StringUtil.getString(commandMap.get("PAY_MST_FINANCENAME"),""));//입금은행
                	    		mailContentsMap.put("PAY_MST_ACCOUNTNUM", StringUtil.getString(commandMap.get("PAY_MST_ACCOUNTNUM"),""));//입금계좌
                				
                	    		int dlvCagTmp = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_CAG"));
                	    		int addCag = StringUtil.getInt(orderProductList.get(0).get("SUM_DLV_ADD_CHARGE"));
                	    		int dlvCag = dlvCagTmp - addCag;
                	    		
                	    		mailContentsMap.put("dlvCag", dlvCag);
                				mailContentsMap.put("cdnDomain", "http://"+this.propertiesService.getString("cdn.domain"));
                				mailContentsMap.put("frontDomain", this.propertiesService.getString("front.domain"));
                				mailContentsMap.put("serverSslDomain", this.propertiesService.getString("server.ssl.domain"));
                				mailContentsMap.put("number", new NumberTool());
                				
                	    		//-- 메일본문 정리
                				String body = VelocityEngineUtils.mergeTemplateIntoString(
                						velocityEngine, "/MAIL-HEADER.vm", "utf-8", mailContentsMap);
                				body += VelocityEngineUtils.mergeTemplateIntoString(
                						velocityEngine, "/"+ mailTemplate +".vm", "utf-8", mailContentsMap);
                				body += VelocityEngineUtils.mergeTemplateIntoString(
                						velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
                				
                				//메일 발송용 맵
                				Map<String, Object> mailMap = new HashMap<String, Object>();
                				
                				mailMap.put("MAIL_CODE", "13");	// 이메일 코드
                	    		mailMap.put("MEMBER_EMAIL", StringUtil.getString(orderPayInfo2.get("ORD_MST_MAIL")) );		// 수신자 이메일
                	    		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));			// 수신자 이름
                	    		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM")))  + "님의 주문이 취소되었습니다. ");	// 메일 제목
                	    		mailMap.put("EMAIL_CONTENTS", body);	// 메일 내용
                				
                				this.batchMail.mailSend(mailMap);
                				
                				// SMS 발송
                            	Map<String, Object> smsMap = new HashMap<String, Object>();
                				
                				smsMap.put("TR_PHONE", StringUtil.getString(orderPayInfo2.get("ORD_MST_HP1"), "")+StringUtil.getString(orderPayInfo2.get("ORD_MST_HP2"), "")+StringUtil.getString(orderPayInfo2.get("ORD_MST_HP3"), ""));  
                				smsMap.put("TR_NAME", StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"), ""));  		
                				
                				smsMap.put("TR_MSG", StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"), "") +"님, 주문이 취소되었습니다. 더 좋은 상품으로 찾아뵙겠습니다. "+StringUtil.getString(propertiesService.getString("app.name"),"")+"을 이용해 주셔서 감사드립니다."); 		
                				
                				smsMap = this.batchSms.sendLongMessage(smsMap);
                			}catch(Exception e){
                				e.printStackTrace();
                				logger.error("SMS, EMAIL 발송 중 예외 발생");
                			}
    	            	}
                	}
	            }

		        
		        // 결제후 주문취소 (반품완료 처리)
		        // 전체반품완료 & 재결제의 원주문 반품완료 처리만 한다.
		        // 부분 반품 처리는 하지 않는다.
                else if (toChangeOrderState == Code.OST_BACK_END)
                {
            		logger.info("=====================================================================================");
            		logger.info("Message : 주문 상태변경(반품회수완료(erp취소요청) -> 전체 반품완료)");
            		logger.info("=====================================================================================");
            		
            		String ORIGINAL_ORDER_CANCEL_YN = StringUtil.getString(commandMap.get("ORIGINAL_ORDER_CANCEL_YN"));//재결제 원 주문 반품완료처리 여부
            		
            		List<Map<String, Object>> pList = defaultDAO.selectList("BatchOrderState.selectOrderStateList",commandMap);
            		List<Map<String, Object>> targetPrdList = new ArrayList<Map<String, Object>>();	//문자,메일 발송 대상 상품 리스트
            		for(Map<String, Object> pMap:pList)
            		{
            			// 반품회수완료(반품대기중) 건만 반품완료
            			// 반품회수완료 주문상태 삭제로 인한 수정
            			// 반품회수완료 건만 반품완료
            			// 단, 재결제 원 주문 반품완료 처리시에는 배송완료, 구매확정 상품이 타겟이다.
            			boolean isTargetPrd = false;
            			if("Y".equals(ORIGINAL_ORDER_CANCEL_YN)){
            				if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_SEND_END)
            					|| StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_FIX))
                			{
            					isTargetPrd = true;
                			}
            			}else{
            				if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_COLLECT_END))
                			{
            					isTargetPrd = true;
                			}
            			}
            			
            			if (isTargetPrd)
            			{
        				//상태변경
        				commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
        				result += defaultDAO.update("BatchOrderState.updateOrderState", commandMap);
        				
        				//변경이력 등록
        				defaultDAO.insert("BatchOrderState.insertOrderHistory",commandMap);
        				
        				// 재고 원복
                    	// 재결제 주문인 경우 미갱신 (재결제 주문 이고, 배송이 겟잇나우배송일 경우)
                    	if("".equals(ORD_MST_PRE_CD) && ORD_MST_DLV_GBN != Code.CART_DLV_GBN_GET_IT_NOW_CD){
                    		Map<String, Object> map_prd = new HashMap<String, Object>();
                			map_prd.put("ORD_PRD_MST_CD", StringUtil.getString(pMap.get("ORD_PRD_MST_CD"),"")); //ORD_PRD_MST_CD
                			map_prd.put("ORD_PRD_ORD_CNT", StringUtil.getString(pMap.get("ORD_PRD_ORD_CNT"),"")); //주문수량
                			
                			int ORD_PRD_OPT_DTL_IDX = StringUtil.getInt(pMap.get("ORD_PRD_OPT_DTL_IDX"));
        					if(ORD_PRD_OPT_DTL_IDX == 0){//옵션 없는 상품 - 마스터 재고 원복
        						this.defaultDAO.update("BatchOrderState.updatePrdMstStock", pMap);
        					}else{// 옵션 있는 상품 - 옵션 재고 원복
        						this.defaultDAO.update("BatchOrderState.updatePrdOptStock", pMap);
        					}
                    	}
        				
        				if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT || ORD_MST_PAY_TYPE == Code.PAY_ESCROW){// 가상계좌 or 에스크로
        					//입금 후면 환불접수로 변경(반품은 입금전인 상태가 있을 수 없다. 그러므로 무조건 환불접수.)
        					commandMap.put("ORD_PRD_ORD_STATE", Code.OST_REFUND);
        				}else{//나머지는 환불완료로 변경
        					commandMap.put("ORD_PRD_ORD_STATE", Code.OST_REFUND_END);
        				}
        				
        				//상태변경
        				commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
        				result += defaultDAO.update("BatchOrderState.updateOrderState", commandMap);
        				
        				//변경이력 등록
        				defaultDAO.insert("BatchOrderState.insertOrderHistory",commandMap);
        				
        				targetPrdList.add(pMap);
        				
            			}
            		}
            		
            		if(result > 0)
            		{
            			// 캐쉬백 사용한 경우 캐쉬백 처리
                		// 캐쉬백 포인트 사용 이력 
                		Map<String,Object> cashbagCancelResult = null;
            			commandMap.put("trStatus", "U");//사용 이력
            			Map<String, Object> cashbagUseInfo = this.defaultDAO.select("BatchOrderState.selectOrderCashbagInfo", commandMap);
            			if(cashbagUseInfo != null){//캐쉬백 사용 이력 있는 경우 취소
            				cashbagUseInfo.put("cashbagTrStatus", "N"); // 적립 취소인 경우 X / 사용 취소인 경우 N
            				cashbagUseInfo.put("mgr_txtype", 40);
            				cashbagCancelResult = this.kiccManagePayment(cashbagUseInfo);
            				
            				// 2. PAY_MST INSERT
	            			if(cashbagCancelResult != null){
	            				cashbagCancelResult.put("ORD_MST_CD", ORD_MST_CD);
	            				this.defaultDAO.insert("BatchOrderState.insertPayMaster", cashbagCancelResult);
	            			}
	            			
	            			if("0000".equals(StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE"))))
            				{
            					logger.info("=====================================================================================");
            					logger.info("Message : PG 캐쉬백 결제취소 성공");
            					logger.info("=====================================================================================");
            				}
            				else
            				{
            					logger.info("=====================================================================================");
            					logger.info("Message : PG 캐쉬백 결제취소시 오류발생-주문상태변경 Rollback.");
            					logger.info("=====================================================================================");
            					
            					commandMap.put("resultCode", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE")));
            					commandMap.put("resultMsg", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPMSG")));
            					
            					throw new Exception("ERR_PG");
            				}
            			}
            			
            			// 캐쉬백 포인트 적립 이력 
            			commandMap.put("trStatus", "S");//적립 이력
            			Map<String, Object> cashbagSavedInfo = this.defaultDAO.select("BatchOrderState.selectOrderCashbagInfo", commandMap);
            			
            			if(cashbagSavedInfo != null){//캐쉬백 적립 이력 있는 경우 취소
            				cashbagSavedInfo.put("cashbagTrStatus", "X"); // 적립 취소인 경우 X / 사용 취소인 경우 N
            				cashbagSavedInfo.put("mgr_txtype", 40);
            				cashbagCancelResult = this.kiccManagePayment(cashbagSavedInfo);
            				
            				// 2. PAY_MST INSERT
	            			if(cashbagCancelResult != null){
	            				cashbagCancelResult.put("ORD_MST_CD", ORD_MST_CD);
	            				this.defaultDAO.insert("BatchOrderState.insertPayMaster", cashbagCancelResult);
	            				
	            			}
	            			
	            			if("0000".equals(StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE"))))
            				{
            					logger.info("=====================================================================================");
            					logger.info("Message : PG 캐쉬백 적립취소 성공");
            					logger.info("=====================================================================================");
            				}
            				else
            				{
            					logger.info("=====================================================================================");
            					logger.info("Message : PG 캐쉬백 적립취소시 오류발생-주문상태변경 Rollback.");
            					logger.info("=====================================================================================");
            					
            					commandMap.put("resultCode", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE")));
            					commandMap.put("resultMsg", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPMSG")));
            					
            					throw new Exception("ERR_PG");
            				}
            			}
            			
            			// 결제취소
            			// point 결제 아니고
            			// 가상계좌인 경우 입금대기 상태에서만 pg사 취소 가능
            			// 그외에는 현금 환불 수기 처리.
            			if("Y".equals(pgPayYn)) 
            			{
            				logger.info("=====================================================================================");
            				logger.info("Message : PG 결제 전체 취소 시작");
            				logger.info("=====================================================================================");
            				
            				// PG 연동 취소/환불처리
            				orderPayInfo.put("LGD_RFPHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"))+StringUtil.getString(orderInfo.get("ORD_MST_HP2"))+StringUtil.getString(orderInfo.get("ORD_MST_HP3")));	// 환불요청자 휴대폰번호
            				
            				Map<String,Object> cancelResult = null;
            				
            				boolean isCashReturn = false; //현금환불여부
            				if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT || ORD_MST_PAY_TYPE == Code.PAY_ESCROW){// 가상계좌 or 에스크로
            					if(ORD_MST_PAY_DT.equals("00000000000000")){
            						if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT){
            							orderPayInfo.put("mgr_txtype", 40);
            						}else if(ORD_MST_PAY_TYPE == Code.PAY_ESCROW){
            							orderPayInfo.put("mgr_txtype", 61);
            							orderPayInfo.put("mgr_subtype", "ES02");
            						}
            						cancelResult = this.kiccManagePayment(orderPayInfo);
            					}else{
            						logger.info("=====================================================================================");
            						logger.info("Message : 가상계좌 입금완료 주문 - 현금환불 처리");
            						logger.info("=====================================================================================");
            						
            						result = 3;
            						resultMsg = "완료되었습니다.";
            						isCashReturn = true;
            					}
            				}else if(ORD_MST_PAY_TYPE == Code.PAY_CARD || ORD_MST_PAY_TYPE == Code.PAY_FOREIGN_CARD){//신용카드
            					orderPayInfo.put("mgr_txtype", 40);
            					cancelResult = this.kiccCardManagePayment(orderPayInfo);
            				}else if(ORD_MST_PAY_TYPE == Code.PAY_ACCOUNT){//계좌이체
            					orderPayInfo.put("mgr_txtype", 40);
            					cancelResult = this.kiccManagePayment(orderPayInfo);
            				}else if(ORD_MST_PAY_TYPE == Code.PAY_PAYNOW){//페이나우
            					//cancelResult = this.lgCancelPayment(orderPayInfo);
            				}else if(ORD_MST_PAY_TYPE == Code.PAY_KAKAOPAY){//카카오페이
            					cancelResult = this.kakaoCancelPayment(orderPayInfo);
            				}
            				
            				// 2. PAY_MST INSERT
            				if(cancelResult != null){
            					this.defaultDAO.insert("BatchOrderState.insertPayMaster", cancelResult);
            				}
            				
            				
            				System.out.println("isCashReturn >>> " + isCashReturn);
            				
            				if(!isCashReturn){
            					if("0000".equals(StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE"))))
            					{
            						result = 1;
            						resultMsg = "완료되었습니다.";
            						
            						logger.info("=====================================================================================");
            						logger.info("Message : PG 결제취소 성공");
            						logger.info("=====================================================================================");
            					}
            					else
            					{
            						logger.info("=====================================================================================");
            						logger.info("Message : PG 결제취소시 오류발생-주문상태변경 Rollback.");
            						logger.info("=====================================================================================");
            						
            						commandMap.put("resultCode", StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE")));
            						commandMap.put("resultMsg", StringUtil.getString(cancelResult.get("PAY_MST_RESPMSG")));
            						
            						throw new Exception("ERR_PG");
            					}	
            				}
            			}
            			else
            			{
            				result = 2;
            				logger.info("=====================================================================================");
            				logger.info("Message : 마일리지 only 결제");
            				logger.info("=====================================================================================");
            			}
            		}
            		
            		// 메일, LMS 발송
					// 주문정보
					//Map<String, Object> orderInfo = defaultDAO.select("BatchOrderMail.selectOrderInfo", commandMap);
					
					//int ORD_MST_DLV_GBN = StringUtil.getInt(orderInfo.get("ORD_MST_DLV_GBN"));//상품배송유형
					
					// 겟잇나우/클린킹은 제외하고 발송
					if(Code.CART_DLV_GBN_GET_IT_NOW_CD != ORD_MST_DLV_GBN && Code.CART_DLV_GBN_SERVICE_CD != ORD_MST_DLV_GBN){
						try{
							// 메일 발송시 필요한 정보 가져오기 시작...
							
							// 주문상품 목록
							commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
            				commandMap.put("ORD_PRD_IDX", "");
            				commandMap.put("ordPrdIdxs", "");
					        List<Map<String, Object>> orderProductList = this.batchOrderMailService.selectOrderProductList(commandMap);//공통 사용 가능
					        
					        //  상품 옵션 가져오기
					 		for(Map<String, Object> ordPrd : orderProductList){
					 			int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
					 			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
					 				List<Map<String,Object>> optionList = this.batchOrderMailService.selectCartOptionDetailList(ordPrd);//공통 사용 가능
					 				ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
					 			}
					 			
					 			//서브 옵션 리스트
					 			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
					 			int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
					 			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
									subPrdList = this.batchOrderMailService.selectOrderSubPrdList(ordPrd);//공통 사용 가능
									ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
					 			}
					 		}
					 		
					 		// 취소/교환/반품 정보
                     		commandMap.put("targetState", "cancel");
                     		List<Map<String,Object>> cancelInfoList = this.batchOrderMailService.selectOrdCancelSwapBackInfo(commandMap);
                     		commandMap.put("targetState", "back");
                     		List<Map<String,Object>> backInfoList = this.batchOrderMailService.selectOrdCancelSwapBackInfo(commandMap);
					 		
					        // 사은품 정보
					        List<Map<String, Object>> requestedGiftList = this.batchOrderMailService.selectRequestedGiftList(commandMap);//공통 사용 가능
					        
					        // 배송정보
					        Map<String, Object> orderDeliveryInfo2 = this.batchOrderMailService.selectOrderDeliveryInfo(commandMap);//공통 사용 가능
					        
					        // 할인/결제정보
					        Map<String, Object> orderPayInfo2 = this.batchOrderMailService.selectOrderPayInfo(commandMap);//공통 사용 가능
					        
					  		//  로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
					  		// 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
					        String DEFAULT_CASHBAG_CARD_NO = "";
			        		Map<String,Object> getItNowShopInfo = null;
			        		String ORD_MST_ORD_ID = StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_ID"));
							if(!"_GUEST_".equals(ORD_MST_ORD_ID)){//회원인 경우
								commandMap.put("trStatus", "U");//사용 이력
								Map<String, Object> cashbagSavedInfo = this.batchOrderMailService.selectOrderCashbagInfo(commandMap);//공통 사용 가능
								
								if(cashbagSavedInfo != null){
									DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(cashbagSavedInfo.get("PAY_MST_KICC_CARD_NO"));
								}else{
									// 캐쉬백 카드번호
									commandMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
									Map<String, Object> memberCashbagInfo = this.batchOrderMailService.selectMemberCashbagInfo(commandMap);//공통 사용 가능
									
									if(memberCashbagInfo != null){//회원 캐쉬백 카드 있는 경우
										DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(memberCashbagInfo.get("MEM_MST_OCB_NO"));
									}
								}
								
								// 겟잇나우 주문인 경우 지점 정보 가져오기
						 		/*int ORD_MST_DLV_GBN = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_GBN"));
						 		if(ORD_MST_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){
						 			getItNowShopInfo = this.selectOrderGetItNowShopInfo(commandMap);//공통 사용 가능
						 		}*/
							}
							
							// 메일 contents 맵
				    		Map<String,Object> mailContentsMap = new HashMap<String,Object>();
				    		mailContentsMap.put("orderDeliveryInfo", orderDeliveryInfo2);//배송지정보
				    		mailContentsMap.put("orderProductList", orderProductList);//주문상품리스트
				    		mailContentsMap.put("requestedGiftList", requestedGiftList);//사은품리스트
				    		mailContentsMap.put("orderPayInfo", orderPayInfo2);//주문결제정보
				    		mailContentsMap.put("getItNowShopInfo", getItNowShopInfo);//겟잇나우정보
				    		
				    		if(!"".equals(DEFAULT_CASHBAG_CARD_NO) && DEFAULT_CASHBAG_CARD_NO.length() >= 8){
			    				mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO1", DEFAULT_CASHBAG_CARD_NO.substring(0, 4));
				    			mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO2", DEFAULT_CASHBAG_CARD_NO.substring(4, 8));
				    		}
				    		
				    		// 주문일 
				    		Calendar calendar = Calendar.getInstance();
				    		SimpleDateFormat dateformat_text = new SimpleDateFormat("yyyy년 MM월 dd일");
				    		String today = dateformat_text.format(calendar.getTime());
				    		mailContentsMap.put("today", today);
				    		
				    		// 발송일
				    		SimpleDateFormat dateformat_text2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				    		String sendDay = dateformat_text2.format(calendar.getTime());
				    		mailContentsMap.put("sendDay", sendDay);
				    		
				    		mailContentsMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));			// 수신자 이름
				    		mailContentsMap.put("ORD_MST_CD", StringUtil.getString(orderPayInfo2.get("ORD_MST_CD")));//주문 번호
				    		mailContentsMap.put("ORD_MST_PAY_TYPE", commandMap.get("ORD_MST_PAY_TYPE"));//결제방법
							
				    		mailContentsMap.put("SMS_HP", StringUtil.getString(commandMap.get("ORD_MST_HP1"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP2"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP3"),""));//SMS 발신용 휴대폰 번호
				    		mailContentsMap.put("PAY_MST_FINANCENAME", StringUtil.getString(commandMap.get("PAY_MST_FINANCENAME"),""));//입금은행
				    		mailContentsMap.put("PAY_MST_ACCOUNTNUM", StringUtil.getString(commandMap.get("PAY_MST_ACCOUNTNUM"),""));//입금계좌
							
				    		int dlvCagTmp = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_CAG"));
				    		int addCag = StringUtil.getInt(orderProductList.get(0).get("SUM_DLV_ADD_CHARGE"));
				    		int dlvCag = dlvCagTmp - addCag;
				    		
				    		mailContentsMap.put("dlvCag", dlvCag);
							mailContentsMap.put("cdnDomain", "http://"+this.propertiesService.getString("cdn.domain"));
							mailContentsMap.put("frontDomain", this.propertiesService.getString("front.domain"));
							mailContentsMap.put("serverSslDomain", this.propertiesService.getString("server.ssl.domain"));
							mailContentsMap.put("number", new NumberTool());
							
				    		//-- 메일본문 정리
							String body = VelocityEngineUtils.mergeTemplateIntoString(
									velocityEngine, "/MAIL-HEADER.vm", "utf-8", mailContentsMap);
							body += VelocityEngineUtils.mergeTemplateIntoString(
									velocityEngine, "/MAIL-ORDER-BACK-END.vm", "utf-8", mailContentsMap);
							body += VelocityEngineUtils.mergeTemplateIntoString(
									velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
							
							//메일 발송용 맵
							Map<String, Object> mailMap = new HashMap<String, Object>();
							
							mailMap.put("MAIL_CODE", "14");	// 이메일 코드
							mailMap.put("MEMBER_EMAIL", StringUtil.getString(orderPayInfo2.get("ORD_MST_MAIL")) );		// 수신자 이메일
				    		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));			// 수신자 이름
				    		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM")))  + "님이 주문하신 상품이 반품되었습니다.");	// 메일 제목
							mailMap.put("EMAIL_CONTENTS", body);	// 메일 내용
							
							this.batchMail.mailSend(mailMap);
						}catch(Exception e){
							logger.error("SMS, EMAIL 발송 중 예외 발생");
						}
					}
            		
					if (result > 0)
	            	{
            			for(Map<String, Object> pMap:targetPrdList)
                		{
            				String ORD_PRD_ORG_IDX = StringUtil.getString(pMap.get("ORD_PRD_ORG_IDX"));//교환상품여부
            				if("".equals(ORD_PRD_ORG_IDX)){//교환상품 아닌 경우에만 발송
            					// 반품완료 SMS 발송
                            	Map<String, Object> smsMap = new HashMap<String, Object>();
            					
            					smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));  
            					smsMap.put("TR_NAME", StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), ""));  		
            					
            					String TR_MSG = StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 반품이 완료되었습니다. 더 좋은 상품으로 찾아뵙겠습니다. "+StringUtil.getString(propertiesService.getString("app.name"),"")+"을 이용해 주셔서 감사드립니다.";
            					
            					smsMap.put("TR_MSG", TR_MSG); 		
            					
            					smsMap = this.batchSms.sendLongMessage(smsMap);
                    		}
                		}
	            	}
            		
            		if(result > 0){
            			resultMap.put("result", "S");
            		}
                		
                } // 반품완료 작업끝		 
		        
		        // 배송준비중 -> 배송중
                else if (toChangeOrderState == Code.OST_SEND)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(배송준비중 -> 배송중)");
                    logger.info("=====================================================================================");

                    List<Map<String, Object>> pList = defaultDAO.selectList("BatchOrderState.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
            			//int totalCnt = this.erpDAO.selectCount("BatchErpDeliveryErp.selectInvoiceCnt", commandMap);
                	    int totalCnt = 0;
                		if ( totalCnt > 0 )
                		{
                			commandMap.put("ERP_INVOICE", defaultDAO.selectStr("BatchErpDeliveryErp.selectInvoice", commandMap));
                		}
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result = defaultDAO.update("BatchOrderState.updateOrderState", commandMap);
                		
                		//변경이력 등록
                		commandMap.put("ORD_PRD_DSC", "배송중 처리");
                    	defaultDAO.insert("BatchOrderState.insertOrderHistory",commandMap);
                    	
                    	if(result > 0){
            				// 배송구분 체크
            		        Map<String,Object> ordPrdDlvTypeInfo = this.batchOrderMailService.selectOrdPrdDlvTypeInfo(commandMap);
            		        int dlvType = StringUtil.getInt(ordPrdDlvTypeInfo.get("ORD_PRD_DLV_TYPE"));
            		        String ORD_PRD_SLT_YN = StringUtil.getString(ordPrdDlvTypeInfo.get("ORD_PRD_SLT_YN"));//선택상품여부
            		        String ORD_PRD_ORG_IDX = StringUtil.getString(ordPrdDlvTypeInfo.get("ORD_PRD_ORG_IDX"));//교환상품여부
            		        
            		        //마스터 상품/교환 상품 아닌 경우만 메일 / LMS 발송
            				if("N".equals(ORD_PRD_SLT_YN) && "".equals(ORD_PRD_ORG_IDX)){
            					// 주문정보
            					//Map<String, Object> orderInfo = defaultDAO.select("BatchOrderMail.selectOrderInfo", commandMap);
            					
            					//int ORD_MST_DLV_GBN = StringUtil.getInt(orderInfo.get("ORD_MST_DLV_GBN"));//상품배송유형
            					
            					// 겟잇나우/클린킹은 제외하고 발송
            					if(Code.CART_DLV_GBN_GET_IT_NOW_CD != ORD_MST_DLV_GBN && Code.CART_DLV_GBN_SERVICE_CD != ORD_MST_DLV_GBN){
            						//배송업체명
            						String ORD_DLV_CPN_NM = StringUtil.getString(commandMap.get("ORD_DLV_CPN_NM"));
            						//송장번호
            						String ORD_PRD_IVC_NO = StringUtil.getString(commandMap.get("ORD_PRD_IVC_NO"));
            						
            						try{
            							// 송장번호 입력 SMS 발송 
            							Map<String, Object> smsMap = new HashMap<String, Object>();
            							
            							smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));  
            							smsMap.put("TR_NAME", StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), ""));  		
            							smsMap.put("TR_MSG", StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 주문하신 상품이 발송되었습니다. *"+ StringUtil.getString(orderInfo.get("PRD_NM"), "") +"/["+ ORD_DLV_CPN_NM +"]"+ORD_PRD_IVC_NO+" *빠르고 안전하게 배송될 수 있도록 최선을 다하겠습니다."); 		
            							
            							smsMap = this.batchSms.sendLongMessage(smsMap);
            							
            							// 메일 발송시 필요한 정보 가져오기 시작...
            							
            							// 주문상품 목록(commandMap에 ORD_PRD_IDX 가 있기 때문에, 송장 입력한 상품만 불러온다.)
            							commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
            					        List<Map<String, Object>> orderProductSelectedList = this.batchOrderMailService.selectOrderProductList(commandMap);//공통 사용 가능
            					        
            					        //  상품 옵션 가져오기
            					 		for(Map<String, Object> ordPrd : orderProductSelectedList){
            					 			int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
            					 			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
            					 				List<Map<String,Object>> optionList = this.batchOrderMailService.selectCartOptionDetailList(ordPrd);//공통 사용 가능
            					 				ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
            					 			}
            					 			
            					 			//서브 옵션 리스트
            					 			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
            					 			int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
            					 			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
            									subPrdList = this.batchOrderMailService.selectOrderSubPrdList(ordPrd);//공통 사용 가능
            									ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
            					 			}
            					 		}
            					 		
            					 		// 전체 주문상품 목록(commandMap에 ORD_PRD_IDX를 삭제 후, 전체 상품 리스트를 불러온다.)
            					 		commandMap.put("ORD_PRD_IDX","");
            							commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
            					        List<Map<String, Object>> orderProductList = this.batchOrderMailService.selectOrderProductList(commandMap);//공통 사용 가능
            					        
            					        //  상품 옵션 가져오기
            					 		for(Map<String, Object> ordPrd : orderProductList){
            					 			int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
            					 			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
            					 				List<Map<String,Object>> optionList = this.batchOrderMailService.selectCartOptionDetailList(ordPrd);//공통 사용 가능
            					 				ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
            					 			}
            					 			
            					 			//서브 옵션 리스트
            					 			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
            					 			int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
            					 			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
            									subPrdList = this.batchOrderMailService.selectOrderSubPrdList(ordPrd);//공통 사용 가능
            									ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
            					 			}
            					 		}
            					 		
            					        // 사은품 정보
            					        List<Map<String, Object>> requestedGiftList = this.batchOrderMailService.selectRequestedGiftList(commandMap);//공통 사용 가능
            					        
            					        // 배송정보
            					        Map<String, Object> orderDeliveryInfo2 = this.batchOrderMailService.selectOrderDeliveryInfo(commandMap);//공통 사용 가능
            					        
            					        // 할인/결제정보
            					        Map<String, Object> orderPayInfo2 = this.batchOrderMailService.selectOrderPayInfo(commandMap);//공통 사용 가능
            					        
            					  		//  로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
            					  		// 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
            					        String DEFAULT_CASHBAG_CARD_NO = "";
            			        		Map<String,Object> getItNowShopInfo = null;
            			        		Map<String, Object> userInfo = null;
            			        		String ORD_MST_ORD_ID = StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_ID"));
            							if(!"_GUEST_".equals(ORD_MST_ORD_ID)){//회원인 경우
            								commandMap.put("trStatus", "U");//사용 이력
            								Map<String, Object> cashbagSavedInfo = this.batchOrderMailService.selectOrderCashbagInfo(commandMap);//공통 사용 가능
            								
            								if(cashbagSavedInfo != null){
            									DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(cashbagSavedInfo.get("PAY_MST_KICC_CARD_NO"));
            								}else{
            									// 캐쉬백 카드번호
            									commandMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
            									Map<String, Object> memberCashbagInfo = this.batchOrderMailService.selectMemberCashbagInfo(commandMap);//공통 사용 가능
            									
            									if(memberCashbagInfo != null){//회원 캐쉬백 카드 있는 경우
            										DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(memberCashbagInfo.get("MEM_MST_OCB_NO"));
            									}
            								}
            								
            								// 겟잇나우 주문인 경우 지점 정보 가져오기
            						 		/*int ORD_MST_DLV_GBN = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_GBN"));
            						 		if(ORD_MST_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){
            						 			getItNowShopInfo = this.selectOrderGetItNowShopInfo(commandMap);//공통 사용 가능
            						 		}*/
            								
            								// 회원정보
            						 		Map<String,Object> userMap = new HashMap<String,Object>();
            						 		userMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
            			        			userInfo = this.batchOrderMailService.selectUserInfo(userMap);
            							}
            							
            							// 메일 contents 맵
            				    		Map<String,Object> mailContentsMap = new HashMap<String,Object>();
            				    		mailContentsMap.put("orderDeliveryInfo", orderDeliveryInfo2);//배송지정보
            				    		mailContentsMap.put("orderProductSelectedList", orderProductSelectedList);//송장입력 해당 상품 리스트
            				    		mailContentsMap.put("orderProductList", orderProductList);//주문상품리스트
            				    		mailContentsMap.put("requestedGiftList", requestedGiftList);//사은품리스트
            				    		mailContentsMap.put("orderPayInfo", orderPayInfo2);//주문결제정보
            				    		mailContentsMap.put("getItNowShopInfo", getItNowShopInfo);//겟잇나우정보
            				    		mailContentsMap.put("userInfo", userInfo);//회원정보
            				    		
            				    		mailContentsMap.put("ORD_DLV_CPN_NM", ORD_DLV_CPN_NM);	//배송업체명
            				    		mailContentsMap.put("ORD_PRD_IVC_NO", ORD_PRD_IVC_NO);	//송장번호
            				    		
            				    		if(!"".equals(DEFAULT_CASHBAG_CARD_NO) && DEFAULT_CASHBAG_CARD_NO.length() >= 8){
            			    				mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO1", DEFAULT_CASHBAG_CARD_NO.substring(0, 4));
            				    			mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO2", DEFAULT_CASHBAG_CARD_NO.substring(4, 8));
            				    		}
            				    		
            				    		// 주문일 
            				    		Calendar calendar = Calendar.getInstance();
            				    		SimpleDateFormat dateformat_text = new SimpleDateFormat("yyyy년 MM월 dd일");
            				    		String today = dateformat_text.format(calendar.getTime());
            				    		mailContentsMap.put("today", today);
            				    		
            				    		// 발송일
            				    		SimpleDateFormat dateformat_text2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            				    		String sendDay = dateformat_text2.format(calendar.getTime());
            				    		mailContentsMap.put("sendDay", sendDay);
            				    		
            				    		mailContentsMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));			// 수신자 이름
            				    		mailContentsMap.put("ORD_MST_CD", StringUtil.getString(orderPayInfo2.get("ORD_MST_CD")));//주문 번호
            				    		mailContentsMap.put("ORD_MST_PAY_TYPE", commandMap.get("ORD_MST_PAY_TYPE"));//결제방법
            							
            				    		mailContentsMap.put("SMS_HP", StringUtil.getString(commandMap.get("ORD_MST_HP1"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP2"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP3"),""));//SMS 발신용 휴대폰 번호
            				    		mailContentsMap.put("PAY_MST_FINANCENAME", StringUtil.getString(commandMap.get("PAY_MST_FINANCENAME"),""));//입금은행
            				    		mailContentsMap.put("PAY_MST_ACCOUNTNUM", StringUtil.getString(commandMap.get("PAY_MST_ACCOUNTNUM"),""));//입금계좌
            							
            				    		int dlvCagTmp = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_CAG"));
            				    		int addCag = StringUtil.getInt(orderProductList.get(0).get("SUM_DLV_ADD_CHARGE"));
            				    		int dlvCag = dlvCagTmp - addCag;
            				    		
            				    		mailContentsMap.put("dlvCag", dlvCag);
            							mailContentsMap.put("cdnDomain", "http://"+this.propertiesService.getString("cdn.domain"));
            							mailContentsMap.put("frontDomain", this.propertiesService.getString("front.domain"));
            							mailContentsMap.put("serverSslDomain", this.propertiesService.getString("server.ssl.domain"));
            							mailContentsMap.put("number", new NumberTool());
            							
            				    		//-- 메일본문 정리
            							String body = VelocityEngineUtils.mergeTemplateIntoString(
            									velocityEngine, "/MAIL-HEADER.vm", "utf-8", mailContentsMap);
            							body += VelocityEngineUtils.mergeTemplateIntoString(
            									velocityEngine, "/MAIL-ORDER-DELIVERY-START.vm", "utf-8", mailContentsMap);
            							body += VelocityEngineUtils.mergeTemplateIntoString(
            									velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
            							
            							//메일 발송용 맵
            							Map<String, Object> mailMap = new HashMap<String, Object>();
            							
            							mailMap.put("MAIL_CODE", "12");	// 이메일 코드
            							mailMap.put("MEMBER_EMAIL", StringUtil.getString(orderPayInfo2.get("ORD_MST_MAIL")) );		// 수신자 이메일
            				    		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));			// 수신자 이름
            				    		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM")))  + "님이 주문하신 상품이 발송되었습니다.");	// 메일 제목
            							mailMap.put("EMAIL_CONTENTS", body);	// 메일 내용
            							
            							this.batchMail.mailSend(mailMap);
            						}catch(Exception e){
            							logger.error("SMS, EMAIL 발송 중 예외 발생");
            						}
            					}
            				}
                    	}
                	}
                	
                	if(result > 0){
                		resultMap.put("result", "S");
                	}
                }
		        
                // 배송중 -> 배송완료
                else if (toChangeOrderState == Code.OST_SEND_END)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(배송중 -> 배송완료)");
                    logger.info("=====================================================================================");

                    List<Map<String, Object>> pList = defaultDAO.selectList("BatchOrderState.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result = defaultDAO.update("BatchOrderState.updateOrderState", commandMap);
                		
                		//변경이력 등록
                		commandMap.put("ORD_PRD_DSC", "배송완료 처리");
                    	defaultDAO.insert("BatchOrderState.insertOrderHistory",commandMap);
                    	

                    	// SMS, EMAIL 발송 작업 필요
                    	if(result > 0){
                    		// 배송구분 체크
            		        Map<String,Object> ordPrdDlvTypeInfo = this.batchOrderMailService.selectOrdPrdDlvTypeInfo(commandMap);
            		        String ORD_PRD_SLT_YN = StringUtil.getString(ordPrdDlvTypeInfo.get("ORD_PRD_SLT_YN"));//선택상품여부
            		        String ORD_PRD_ORG_IDX = StringUtil.getString(ordPrdDlvTypeInfo.get("ORD_PRD_ORG_IDX"));//교환상품여부
            		        
            		        //마스터 상품/교환 상품 아닌 경우만 메일 / LMS 발송
            				if("N".equals(ORD_PRD_SLT_YN) && "".equals(ORD_PRD_ORG_IDX)){
            					// 주문정보
            					//Map<String, Object> orderInfo = defaultDAO.select("BatchOrderMail.selectOrderInfo", commandMap);
            					
            					//int ORD_MST_DLV_GBN = StringUtil.getInt(orderInfo.get("ORD_MST_DLV_GBN"));//상품배송유형
            					
            					// 겟잇나우/클린킹은 제외하고 발송
            					if(Code.CART_DLV_GBN_GET_IT_NOW_CD != ORD_MST_DLV_GBN && Code.CART_DLV_GBN_SERVICE_CD != ORD_MST_DLV_GBN){
            						try{
            							// SMS 발송 
            							Map<String, Object> smsMap = new HashMap<String, Object>();
            							
            							String ORD_MST_ORD_ID = StringUtil.getString(orderInfo.get("ORD_MST_ORD_ID"));
            							String linkUrl = this.propertiesService.getString("mobile.ssl.domain") + "/mobile/mypage/myShoppingList.do";
            							if("_GUEST_".equals(ORD_MST_ORD_ID)){
            								//비회원 주문인 경우 링크 없음
            								linkUrl = "";
            							}
            							
            							smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));  
            							smsMap.put("TR_NAME", StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), ""));  		
            							smsMap.put("TR_MSG", StringUtil.getString(propertiesService.getString("app.name"),"")+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 상품은 잘 받으셨나요? 상품을 만족하셨나요? 상품평을 작성해 주시면, 포인트를 적립해 드립니다. 지금 "+StringUtil.getString(propertiesService.getString("app.name"),"")+"에 방문하세요."); 		
            							
            							smsMap = this.batchSms.sendLongMessage(smsMap);
            						}catch(Exception e){
            							logger.error("SMS, EMAIL 발송 중 예외 발생");
            						}
            					}
            				}
                    	}
                	}
                	
                	if(result > 0){
                		resultMap.put("result", "S");
                		
                		// 에스크로 주문인 경우 마지막 상품이 배송완료인 경우 kicc에 보내줘야한다.
                    	// 완료시 배치쪽에도 추가 필요.
                    	// 배송완료 이력 확인
                		if(ORD_MST_PAY_TYPE == Code.PAY_ESCROW){
                			Map<String,Object> kiccEscrowInfo = defaultDAO.select("BatchOrderState.selectKiccSendEndInfo",commandMap);
                            
                            if(kiccEscrowInfo != null){
                            	try{
                            		 int SEND_END_HIS_CNT = StringUtil.getInt(kiccEscrowInfo.get("SEND_END_HIS_CNT")); /* 배송완료 이력이 있는 상품 개수 */
                                     int TOT_CNT = StringUtil.getInt(kiccEscrowInfo.get("TOT_CNT")); /* 전체 상품 개수 */
                                     String IVC_NO = StringUtil.getString(kiccEscrowInfo.get("IVC_NO")); /* 송장번호 */
                                     String DLV_CPN_ESC_CD = StringUtil.getString(kiccEscrowInfo.get("DLV_CPN_ESC_CD")); /* 택배사 코드 */
                                     
                                     if(SEND_END_HIS_CNT == TOT_CNT && !"".equals(IVC_NO)){//마지막 배송완료 상품이고, 송장번호 있는 경우 kicc 호출
                                		Map<String,Object> escrowMap = new HashMap<String,Object>();
                                     	escrowMap.put("PAY_MST_MID", StringUtil.getString(orderPayInfo.get("PAY_MST_MID"))); //에스크로 상태변경	
                                     	escrowMap.put("mgr_txtype", 61); //에스크로 상태변경	
                                     	escrowMap.put("mgr_subtype", "ES07"); //배송중 
                                     	escrowMap.put("PAY_MST_TID", StringUtil.getString(orderPayInfo.get("PAY_MST_TID"))); //고유거래번호
                                     	
                                     	escrowMap.put("deli_cd", "DE02"); //DE01 : 자가, DE02 : 택배
                                     	escrowMap.put("deli_corp_cd", DLV_CPN_ESC_CD); //택배사 코드
                                     	escrowMap.put("deli_invoice", IVC_NO); //운송장 번호
                                     	escrowMap.put("deli_rcv_nm", StringUtil.getString(orderDeliveryInfo.get("ORD_DLV_NM"))); //수령인 이름
                                     	escrowMap.put("deli_rcv_tel", StringUtil.getString(orderDeliveryInfo.get("ORD_DLV_HP")) ); //수령인 연락처
                                     	
                                     	logger.debug("########### 마지막 배송상품!!!! kicc 배송중 상태변경 필요!!!!! ##############");
                                     	logger.debug("########### escrowMap["+ escrowMap +"] ##############");
                                     	Map<String,Object> escrowSendEndResult = this.kiccManagePayment(escrowMap);
                                     	
                                     	// 2. PAY_MST INSERT
            	            			/*if(escrowSendEndResult != null){
            	            				escrowSendEndResult.put("ORD_MST_CD", ORD_MST_CD);
            	            				this.paymentService.insertPayMaster(escrowSendEndResult);
            	            			}*/
                                     }
                            	}catch(Exception e){
                            		e.printStackTrace();
                            		logger.error("에스크로 마지막 상품 배송완료시 kicc에 배송 요청 중 에러...");
                            	}
                            }
                		}
                	}
                }		       
		        
		        // 교환접수 -> 교환완료
                else if (toChangeOrderState == Code.OST_SWAP_END)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(교환접수 -> 교환완료)");
                    logger.info("=====================================================================================");
					
                    String ORD_PRD_ORG_IDX = "0";
                    
                    List<Map<String, Object>> pList = defaultDAO.selectList("BatchOrderState.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		ORD_PRD_ORG_IDX = StringUtil.getString(pMap.get("ORD_PRD_ORG_IDX"));//교환상품여부
                		
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("BatchOrderState.updateOrderState", commandMap);
                		
                		//변경이력 등록
                    	defaultDAO.insert("BatchOrderState.insertOrderHistory",commandMap);
                	}
                	
                	if(result > 0){
                		//  교환대상 새상품을 교환상품준비중으로 변경한다.
                    	// 배송구분, 출고처, 배송처는 ERP에서 수정한다.
                    	// ERP에서 수정한 정보를 우리 DB로 반영하는 거는 확인 필요함...
                    	String NEW_ORD_PRD_IDX = this.defaultDAO.selectStr("BatchOrderState.selectNewSwapProduct", commandMap); //신규상품 IDX 가져오기
                    	commandMap.put("ORD_PRD_IDX", NEW_ORD_PRD_IDX);
                    	commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SWAP_TARGET_COLLECT_END);// 주문 상태 : 교환상품준비중
                    	result = defaultDAO.update("BatchOrderState.updateOrderState", commandMap);
                		
                		//변경이력 등록
                		//commandMap.put("ORD_PRD_DSC", "기존상품 교환완료 처리 후 배송준비중 변경");
                    	result = defaultDAO.insert("Order.insertOrderHistory",commandMap);
                    	
                    	if(result > 0){
                    		resultMap.put("result", "S");
                    		
                    		if("".equals(ORD_PRD_ORG_IDX)){//교환상품 아닌 경우에만 발송
            					// 교환완료 SMS 발송
                            	Map<String, Object> smsMap = new HashMap<String, Object>();
            					
            					smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));  
            					smsMap.put("TR_NAME", StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), ""));  		
            					smsMap.put("TR_MSG", "[MarketPlant] "+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 교환이 완료되어 교환상품발송을 준비중입니다. 궁금하신 내용이 있으시면 연락주시기 바랍니다."); 		
            					
            					smsMap = this.batchSms.sendLongMessage(smsMap);
            				}
                    	}
                	}
                }
		        
		        // 결제완료 -> 주문확정
		        // 입점상품 자동 주문확정만 배치에서 처리한다. 
                else if (toChangeOrderState == Code.OST_SEND_READY)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(결제완료 -> 주문확정)");
                    logger.info("=====================================================================================");
					
                    List<Map<String, Object>> pList = defaultDAO.selectList("BatchOrderState.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		String ORD_PRD_IDX =  StringUtil.getString(pMap.get("ORD_PRD_IDX"));
                		String ORD_PRD_DLV_DUE_DT = StringUtil.getString(pMap.get("ORD_PRD_DLV_DUE_DT"));
                		
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", ORD_PRD_IDX);
                		commandMap.put("ORD_PRD_DLV_TYPE", Code.DLV_TYPE_PARTNER);//배송구분 입점업체 고정
                		commandMap.put("ORD_PRD_DLV_DUE_DT", ORD_PRD_DLV_DUE_DT);//배송예정일
                		
                		result += defaultDAO.update("BatchOrderState.updateOrderState", commandMap);
                		
                		//변경이력 등록
                		commandMap.put("ORD_PRD_DSC", "주문확정");
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                	}
                	
                	if(result > 0){
                		// ERP 임시 테이블 저장 (겟잇나우, 클린킹, 교환상품(개별상품) 주문확정은 제외)
                		Map<String,Object> erpResultMap = new HashMap<String,Object>();
                		erpResultMap.put("ORD_MST_CD", ORD_MST_CD);
                		// 배치에는 판매자 사번을 무엇으로 넣는가?
                		erpResultMap.put("ADM_MST_ERP_NO", StringUtil.getString(commandMap.get("ADM_MST_ERP_NO")));//판매자 사번...
                		erpResultMap.put("SCM_AUTO_ORDER_CONFIRM_YN", "Y");//입점업체 자동 주문확정 여부
                		//erpResultMap = this.batchErpOrderService.insertErpOrder(erpResultMap);
                		
                		int erpResult = Integer.valueOf(String.valueOf(erpResultMap.get("result")));
                		String erpResultMsg = StringUtil.getString(erpResultMap.get("resultMsg"));
                		
                		if(erpResult > 0){
                			result = erpResult;
                			resultMap.put("result", "S");
                		}else{//롤백
                			result = erpResult;
                			resultMsg = erpResultMsg;
                			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                		}
                	}else{
                		logger.error("============================= 주문확정 실패 ==================================");
                		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                	}
                }
		        
        	}
        }
        
        logger.info("=====================================================================================");
        logger.info("Message : 주문 상태변경 End.");
        logger.info("=====================================================================================");

        resultMap.put("resultMsg", resultMsg);
        
        return resultMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : kiccPayment
	* 2. ClassName  : BatchOrderStateEndServiceImpl.java
	* 3. Comment    : kicc 결제승인
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kiccPayment(Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] KICC 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		// ============================================================================== 
		// =   PAGE : 결제 정보 환경 설정 PAGE                                     		= 
		// = -------------------------------------------------------------------------- = 
		// =   Copyright (c)  2010   KICC Inc.   All Rights Reserved.                   = 
		// ============================================================================== 
		
		// ============================================================================== 
		// =   01. 지불 데이터 셋업 (업체에 맞게 수정)                             		= 
		// = -------------------------------------------------------------------------- = 
		// = ※ 주의 ※                                                           		= 
		// =  cert_file 변수 설정                                                 		= 
		// = pg_cert.pem 파일이 있는 디렉토리의  절대 경로 설정                         = 
		// =                                                                            = 
		// =  log_dir 변수 설정                                                   		=
		// = log 디렉토리 설정                                                    		=
		// =  log_level 변수 설정                                                 		=
		// = log 레벨 설정                                                        		=
		// = -------------------------------------------------------------------------- =
		
		String g_cert_file  = this.propertiesService.getString("payment.kicc.certificate.path");
		String g_log_dir    = this.propertiesService.getString("payment.kicc.log.path");
		int g_log_level  = 1;
		
		// ============================================================================== /
		// =   02. 쇼핑몰 지불 정보 설정                                                = /
		// = -------------------------------------------------------------------------- = /		
		String g_gw_url    = this.propertiesService.getString("payment.kicc.server.url");  // Gateway URL ( test )
		String g_gw_port   = "80";                  // 포트번호(변경불가) /
		
		//String g_mall_id   =  this.propertiesService.getString("payment.kicc.mall.id");             // 리얼 반영시 KICC에 발급된 mall_id 사용
		String g_mall_id           = StringUtil.getString(commandMap.get("EP_mall_id"          ));   // [필수]가맹점ID
		// ============================================================================= /
		
		/* -------------------------------------------------------------------------- */
	    /* ::: 처리구분 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    final String TRAN_CD_NOR_PAYMENT    = "00101000";   // 승인(일반, 에스크로)

	    String tr_cd            = TRAN_CD_NOR_PAYMENT;           // [필수]요청구분
	    String pay_type         = StringUtil.getString(commandMap.get("EP_pay_type"));        // [필수]결제수단

	    /* -------------------------------------------------------------------------- */
	    /* ::: 신용카드 정보 설정                                                     */
	    /* -------------------------------------------------------------------------- */
	    String card_amt          = StringUtil.getString(commandMap.get("EP_card_amt"));        // [필수]신용카드 결제금액
	    String card_txtype       = StringUtil.getString(commandMap.get("EP_card_txtype"));     // [필수]처리종류
	    String req_type          = StringUtil.getString(commandMap.get("EP_req_type"));        // [필수]카드결제종류
	    String cert_type         = StringUtil.getString(commandMap.get("EP_cert_type"));       // [필수]인증여부
	    String wcc               = StringUtil.getString(commandMap.get("EP_wcc"));             // [필수]wcc
	    String card_no           = StringUtil.getString(commandMap.get("EP_card_no"));         // [필수]카드번호
	    String expire_date       = StringUtil.getString(commandMap.get("EP_expire_date"));     // [필수]유효기간
	    String install_period    = StringUtil.getString(commandMap.get("EP_install_period"));  // [필수]할부개월
	    String noint             = StringUtil.getString(commandMap.get("EP_noint"));           // [필수]무이자여부
	    String card_user_type    = StringUtil.getString(commandMap.get("EP_card_user_type"));  // [선택]카드구분 : 인증여부에 따라 필수
	    String password          = StringUtil.getString(commandMap.get("EP_password"));        // [선택]비밀번호 : 인증여부에 따라 필수
	    String auth_value        = StringUtil.getString(commandMap.get("EP_auth_value"));      // [선택]인증값   : 인증여부에 따라 필수
	    String cavv              = StringUtil.getString(commandMap.get("EP_cavv"));            // [선택]CAVV  : 카드결제종류에 따라 필수
	    String xid               = StringUtil.getString(commandMap.get("EP_xid"));             // [선택]XID   : 카드결제종류에 따라 필수
	    String eci               = StringUtil.getString(commandMap.get("EP_eci"));             // [선택]ECI   : 카드결제종류에 따라 필수
	    String kvp_cardcode      = StringUtil.getString(commandMap.get("EP_kvp_cardcode"));    // [선택]KVP_CARDCODE   : 카드결제종류에 따라 필수
	    String kvp_sessionkey    = StringUtil.getString(commandMap.get("EP_kvp_sessionkey"));  // [선택]KVP_SESSIONKEY : 카드결제종류에 따라 필수
	    String kvp_encdata       = StringUtil.getString(commandMap.get("EP_kvp_encdata"));     // [선택]KVP_ENCDATA    : 카드결제종류에 따라 필수
	    String req_cno           = StringUtil.getString(commandMap.get("EP_cno"));             // [선택]은련카드 인증거래번호
	    String kvp_pgid          = StringUtil.getString(commandMap.get("EP_kvp_pgid"));        // [선택]은련카드 PGID

	    kvp_sessionkey = URLEncoder.encode( kvp_sessionkey );
	    kvp_encdata = URLEncoder.encode( kvp_encdata );

	    /* -------------------------------------------------------------------------- */
	    /* ::: 계좌이체 정보 설정                                                     */
	    /* -------------------------------------------------------------------------- */
	    String acnt_amt          = StringUtil.getString(commandMap.get("EP_acnt_amt"));        // [필수]계좌이체 결제금액
	    String acnt_txtype       = StringUtil.getString(commandMap.get("EP_acnt_txtype"));     // [필수]계좌이체 처리종류
	    String kftc_signdata     = StringUtil.getString(commandMap.get("hd_pi"));              // [필수]전자지갑 암호문
	    String kftc_serialno     = StringUtil.getString(commandMap.get("hd_serial_no"));       // [필수]전자지갑 일련번호

	    /* -------------------------------------------------------------------------- */
	    /* ::: 무통장입금 정보 설정                                                   */
	    /* -------------------------------------------------------------------------- */
	    String vacct_amt         = StringUtil.getString(commandMap.get("EP_vacct_amt"));       // [필수]무통장입금 결제금액
	    String vacct_txtype      = StringUtil.getString(commandMap.get("EP_vacct_txtype"));    // [필수]무통장입금 처리종류
	    String bank_cd           = StringUtil.getString(commandMap.get("EP_bank_cd"));         // [필수]은행코드
	    String vacct_expr_date   = StringUtil.getString(commandMap.get("EP_expire_date"));     // [필수]입금만료일
	    String vacct_expr_time   = StringUtil.getString(commandMap.get("EP_expire_time"));     // [필수]입금만료시간

	    /* -------------------------------------------------------------------------- */
	    /* ::: 현금영수증 정보 설정                                                   */
	    /* -------------------------------------------------------------------------- */
	    String cash_yn           = StringUtil.getString(commandMap.get("EP_cash_yn"));         // [필수]현금영수증 발행여부
	    String cash_issue_type   = StringUtil.getString(commandMap.get("EP_cash_issue_type")); // [선택]현금영수증발행용도
	    String cash_auth_type    = StringUtil.getString(commandMap.get("EP_cash_auth_type"));  // [선택]인증구분
	    String cash_auth_value   = StringUtil.getString(commandMap.get("EP_cash_auth_value")); // [선택]인증번호

	    /* -------------------------------------------------------------------------- */
	    /* ::: 휴대폰결제 정보 설정                                                   */
	    /* -------------------------------------------------------------------------- */
	    String mob_amt           = StringUtil.getString(commandMap.get("EP_mob_amt"));         // [필수]휴대폰 결제금액
	    String mob_txtype        = StringUtil.getString(commandMap.get("EP_mob_txtype"));      // [필수]휴대폰 처리종류
	    String mobile_cd         = StringUtil.getString(commandMap.get("EP_mobile_cd"));       // [필수]이통사코드
	    String mobile_no         = StringUtil.getString(commandMap.get("EP_mobile_no"));       // [필수]휴대폰번호
	    String jumin_no          = StringUtil.getString(commandMap.get("EP_jumin_no"));        // [필수]휴대폰 가입자 주민등록번호
	    String mob_auth_id       = StringUtil.getString(commandMap.get("EP_mob_auth_id"));     // [필수]인증고유번호(승인 시 필수)
	    String mob_billid        = StringUtil.getString(commandMap.get("EP_mob_billid"));      // [필수]인증번호(승인 시 필수)
	    String mob_cno           = StringUtil.getString(commandMap.get("EP_mob_cno"));         // [필수]PG거래번호(승인 시 필수)

	    /* -------------------------------------------------------------------------- */
	    /* ::: 포인트 결제 정보 설정                                                  */
	    /* -------------------------------------------------------------------------- */
	    String pnt_amt           = StringUtil.getString(commandMap.get("EP_pnt_amt"));         // [필수]포인트 결제금액
	    String pnt_txtype        = StringUtil.getString(commandMap.get("EP_pnt_txtype"));      // [필수]포인트 처리종류
	    String pnt_cp_cd         = StringUtil.getString(commandMap.get("EP_pnt_cp_cd"));       // [필수]포인트 서비스사 코드
	    String pnt_idno          = StringUtil.getString(commandMap.get("EP_pnt_idno"));        // [필수]포인트 ID(카드)번호
	    String pnt_pwd           = StringUtil.getString(commandMap.get("EP_pnt_pwd"));         // [옵션]포인트 비밀번호

	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제 주문 정보 설정                                                    */
	    /* -------------------------------------------------------------------------- */
	    String user_type        = StringUtil.getString(commandMap.get("EP_user_type"));        // [선택]사용자구분구분[1:일반,2:회원]
	    String order_no         = StringUtil.getString(commandMap.get("EP_order_no"));         // [필수]주문번호
	    String memb_user_no     = StringUtil.getString(commandMap.get("EP_memb_user_no"));     // [선택]가맹점 고객일련번호
	    String user_id          = StringUtil.getString(commandMap.get("EP_user_id"));          // [선택]고객 ID
	    String user_nm          = StringUtil.getString(commandMap.get("EP_user_nm"));          // [필수]고객명
	    String user_mail        = StringUtil.getString(commandMap.get("EP_user_mail"));        // [필수]고객 E-mail
	    String user_phone1      = StringUtil.getString(commandMap.get("EP_user_phone1"));      // [필수]가맹점 고객 연락처1
	    String user_phone2      = StringUtil.getString(commandMap.get("EP_user_phone2"));      // [선택]가맹점 고객 연락처2
	    String user_addr        = StringUtil.getString(commandMap.get("EP_user_addr"));        // [선택]가맹점 고객 주소
	    String product_type     = StringUtil.getString(commandMap.get("EP_product_type"));     // [필수]상품정보구분[0:실물,1:컨텐츠]
	    String product_nm       = StringUtil.getString(commandMap.get("EP_product_nm"));       // [필수]상품명
	    String product_amt      = StringUtil.getString(commandMap.get("EP_product_amt"));      // [필수]상품금액
		String user_define1     = StringUtil.getString(commandMap.get("EP_user_define1"));     // [선택]가맹점필드1
		String user_define2     = StringUtil.getString(commandMap.get("EP_user_define2"));     // [선택]가맹점필드2
		String user_define3     = StringUtil.getString(commandMap.get("EP_user_define3"));     // [선택]가맹점필드3
		String user_define4     = StringUtil.getString(commandMap.get("EP_user_define4"));     // [선택]가맹점필드4
		String user_define5     = StringUtil.getString(commandMap.get("EP_user_define5"));     // [선택]가맹점필드5
		String user_define6     = StringUtil.getString(commandMap.get("EP_user_define6"));     // [선택]가맹점필드6
		
		 /* -------------------------------------------------------------------------- */
	    /* :::  에스크로정보                                                    */
	    /* -------------------------------------------------------------------------- */
		String bask_cnt         = StringUtil.getString(commandMap.get("EP_bask_cnt"));         // [필수]상품금액
	    String bask_info        = StringUtil.getString(commandMap.get("EP_bask_info"));        // [필수]상품금액
	    
	    String escr_type        = StringUtil.getString(commandMap.get("EP_escr_type"));        //[필수] 에스크로구분 Y : 신한, K : 자체, O : 오픈마켓
	    String bk_cnt       	= StringUtil.getString(commandMap.get("EP_bk_cnt"));       	   // [필수] 장바구니 건수 
	    String bk_totamt      	= StringUtil.getString(commandMap.get("EP_bk_totamt"));        //[필수] 장바구니 총 금액 
	    String bk_goodinfo      = StringUtil.getString(commandMap.get("EP_bk_goodinfo"));      // [필수] 장바구니 상품정보

	    String recv_id          = StringUtil.getString(commandMap.get("EP_recv_id"));          // [선택] 구매자ID
	    String recv_nm     		= StringUtil.getString(commandMap.get("EP_recv_nm"));     	   // [선택] 구매자명 (KICC 에스크로(K) 경우 필수)
	    String recv_tel         = StringUtil.getString(commandMap.get("EP_recv_tel"));         // [선택] 구매자 전화번호
	    String recv_mob         = StringUtil.getString(commandMap.get("EP_recv_mob"));         // [선택] 구매자 휴대폰번호 (KICC 에스크로(K) 경우 필수)
	    String recv_mail        = StringUtil.getString(commandMap.get("EP_recv_mail"));        // [선택] 구매자 email (KICC 에스크로(K) 경우 필수)
	    String recv_zip      	= StringUtil.getString(commandMap.get("EP_recv_zip"));         // [선택] 구매자 우편번호
	    String recv_addr1       = StringUtil.getString(commandMap.get("EP_recv_addr1"));       // [선택] 구매자 주소1
	    String recv_addr2     	= StringUtil.getString(commandMap.get("EP_recv_addr2"));       // [선택] 구매자 주소2
	    String deli_type      	= StringUtil.getString(commandMap.get("EP_deli_type"));        // [선택] 배송 구분(택배,자가)

	    /* -------------------------------------------------------------------------- */
	    /* ::: 기타정보 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    //String client_ip        = request.getRemoteAddr();                                   // [필수]결제고객 IP
	    String client_ip        = "127.0.0.1";				                                   // [필수]결제고객 IP (배치이기에 고정으로 아이피 설정)
	    String tot_amt          = StringUtil.getString(commandMap.get("EP_tot_amt"));          // [필수]결제 총 금액
	    String currency         = StringUtil.getString(commandMap.get("EP_currency"));         // [필수]통화코드
	    String escrow_yn        = StringUtil.getString(commandMap.get("EP_escrow_yn"));        // [필수]에스크로여부
	    String complex_yn       = StringUtil.getString(commandMap.get("EP_complex_yn"));       // [필수]복합결제여부
	    String tax_flg          = StringUtil.getString(commandMap.get("EP_tax_flg"));          // [필수]과세구분 플래그(TG01:복합과세 승인거래)
	    String com_tax_amt      = StringUtil.getString(commandMap.get("EP_com_tax_amt"));      // [필수]과세 승인 금액(복합과세 거래 시 필수)
	    String com_free_amt     = StringUtil.getString(commandMap.get("EP_com_free_amt"));     // [필수]비과세 승인 금액(복합과세 거래 시 필수)
	    String com_vat_amt      = StringUtil.getString(commandMap.get("EP_com_vat_amt"));      // [필수]부가세 금액(복합과세 거래 시 필수)

	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제 결과                                                              */
	    /* -------------------------------------------------------------------------- */
	    String bDBProc          = "";
	    String res_cd           = "";
	    String res_msg          = "";
	    String r_order_no       = "";
	    String r_complex_yn     = "";
	    String r_msg_type       = "";     //거래구분
	    String r_noti_type	    = "";     //노티구분
	    String r_cno            = "";     //PG거래번호
	    String r_amount         = "";     //총 결제금액
	    String r_auth_no        = "";     //승인번호
	    String r_tran_date      = "";     //거래일시
	    String r_pnt_auth_no    = "";     //포인트 승인 번호
	    String r_pnt_tran_date  = "";     //포인트 승인 일시
	    String r_cpon_auth_no   = "";     //쿠폰 승인 번호
	    String r_cpon_tran_date = "";     //쿠폰 승인 일시
	    String r_card_no        = "";     //카드번호
	    String r_issuer_cd      = "";     //발급사코드
	    String r_issuer_nm      = "";     //발급사명
	    String r_acquirer_cd    = "";     //매입사코드
	    String r_acquirer_nm    = "";     //매입사명
	    String r_install_period = "";     //할부개월
	    String r_noint          = "";     //무이자여부
	    String r_bank_cd        = "";     //은행코드
	    String r_bank_nm        = "";     //은행명
	    String r_account_no     = "";     //계좌번호
	    String r_deposit_nm     = "";     //입금자명
	    String r_expire_date    = "";     //계좌사용 만료일
	    String r_cash_res_cd    = "";     //현금영수증 결과코드
	    String r_cash_res_msg   = "";     //현금영수증 결과메세지
	    String r_cash_auth_no   = "";     //현금영수증 승인번호
	    String r_cash_tran_date = "";     //현금영수증 승인일시
	    String r_auth_id        = "";     //PhoneID
	    String r_billid         = "";     //인증번호
	    String r_mobile_no      = "";     //휴대폰번호
	    String r_ars_no         = "";     //ARS 전화번호
	    String r_cp_cd          = "";     //포인트사
	    String r_used_pnt       = "";     //사용포인트
	    String r_remain_pnt     = "";     //잔여한도
	    String r_pay_pnt        = "";     //할인/발생포인트
	    String r_accrue_pnt     = "";     //누적포인트
	    String r_remain_cpon    = "";     //쿠폰잔액
	    String r_used_cpon      = "";     //쿠폰 사용금액
	    String r_mall_nm        = "";     //제휴사명칭
	    String r_escrow_yn	    = "";     //에스크로 사용유무
	    String r_canc_acq_data  = "";     //매입취소일시
	    String r_canc_date      = "";     //취소일시
	    String r_refund_date    = "";     //환불예정일시

	    /* -------------------------------------------------------------------------- */
	    /* ::: EasyPayClient 인스턴스 생성 [변경불가 !!].                             */
	    /* -------------------------------------------------------------------------- */
	    EasyPayClient easyPayClient = new EasyPayClient();
	    easyPayClient.easypay_setenv_init( g_gw_url, g_gw_port, g_cert_file, g_log_dir );
	    easyPayClient.easypay_reqdata_init();

	    /* -------------------------------------------------------------------------- */
	    /* ::: 승인요청 전문 설정                                                     */
	    /* -------------------------------------------------------------------------- */
	    if( TRAN_CD_NOR_PAYMENT.equals(tr_cd) ) {

	        // 승인요청 전문 설정
	    	// 결제 주문 정보 DATA
	        int easypay_order_data_item;
	        easypay_order_data_item = easyPayClient.easypay_item( "order_data" );

	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_type"		, user_type 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "order_no"		, order_no		);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "memb_user_no"	, memb_user_no 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_id"		, user_id		);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_nm"		, user_nm		);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_mail"		, user_mail 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_phone1"	, user_phone1 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_phone2"	, user_phone2 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_addr"		, user_addr 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "product_type"	, product_type 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "product_nm"	, product_nm 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "product_amt"	, product_amt 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define1"	, user_define1 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define2"	, user_define2 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define3"	, user_define3 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define4"	, user_define4 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define5"	, user_define5 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define6"	, user_define6 	);

	        // 결제정보 DATA부
	        int easypay_pay_data_item;
	        easypay_pay_data_item = easyPayClient.easypay_item( "pay_data" );

	        // 결제 공통 정보 DATA
	        int easypay_common_item;
	        easypay_common_item = easyPayClient.easypay_item( "common" );

	        easyPayClient.easypay_deli_us( easypay_common_item, "tot_amt"       , tot_amt       );
	        easyPayClient.easypay_deli_us( easypay_common_item, "currency"      , currency      );
	        easyPayClient.easypay_deli_us( easypay_common_item, "client_ip"     , client_ip     );
	        easyPayClient.easypay_deli_us( easypay_common_item, "escrow_yn"     , escrow_yn     );
	        easyPayClient.easypay_deli_us( easypay_common_item, "complex_yn"    , complex_yn    );
	        easyPayClient.easypay_deli_us( easypay_common_item, "tax_flg"       , tax_flg       );
	        easyPayClient.easypay_deli_us( easypay_common_item, "com_tax_amt"   , com_tax_amt   );
	        easyPayClient.easypay_deli_us( easypay_common_item, "com_free_amt"  , com_free_amt  );
	        easyPayClient.easypay_deli_us( easypay_common_item, "com_vat_amt"   , com_vat_amt   );
	        easyPayClient.easypay_deli_us( easypay_common_item, "cli_ver"       , "N8"          );

	        if ( !req_cno.equals( "" ) )
	            easyPayClient.easypay_deli_us( easypay_common_item, "req_cno", req_cno      );
	        easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_common_item );
	        
	        // 신용카드 결제 DATA SET
	        if( pay_type.equals("card") ) {
	            int easypay_card_item;

	            easypay_card_item = easyPayClient.easypay_item( "card" );

	            easyPayClient.easypay_deli_us( easypay_card_item, "card_txtype"    , card_txtype       );
	            easyPayClient.easypay_deli_us( easypay_card_item, "req_type"       , req_type          );
	            easyPayClient.easypay_deli_us( easypay_card_item, "card_amt"       , card_amt          );
	            easyPayClient.easypay_deli_us( easypay_card_item, "noint"          , noint             );
	            easyPayClient.easypay_deli_us( easypay_card_item, "cert_type"      , cert_type         );
	            easyPayClient.easypay_deli_us( easypay_card_item, "wcc"            , wcc               );
	            easyPayClient.easypay_deli_us( easypay_card_item, "install_period" , install_period    );

	            if( req_type.equals("0") ) {
	                // 일반(SSL)
	                easyPayClient.easypay_deli_us( easypay_card_item, "card_no"        , card_no           );
	                easyPayClient.easypay_deli_us( easypay_card_item, "expire_date"    , expire_date       );
	                easyPayClient.easypay_deli_us( easypay_card_item, "user_type"      , card_user_type    );

	                if( cert_type.equals("0") ) {

	                    easyPayClient.easypay_deli_us( easypay_card_item, "password"       , password          );
	                    easyPayClient.easypay_deli_us( easypay_card_item, "auth_value"     , auth_value        );
	                }
	            }
	            else if( req_type.equals("1") ) {
	                // ISP
	                easyPayClient.easypay_deli_us( easypay_card_item, "kvp_cardcode"   , kvp_cardcode   );
	                easyPayClient.easypay_deli_us( easypay_card_item, "kvp_sessionkey" , kvp_sessionkey );
	                easyPayClient.easypay_deli_us( easypay_card_item, "kvp_encdata"    , kvp_encdata    );
	            }
	            else if( req_type.equals("2") ) {
	                // 안심클릭
	                easyPayClient.easypay_deli_us( easypay_card_item, "card_no"        , card_no           );
	                easyPayClient.easypay_deli_us( easypay_card_item, "expire_date"    , expire_date       );
	                easyPayClient.easypay_deli_us( easypay_card_item, "cavv"           , cavv              );
	                easyPayClient.easypay_deli_us( easypay_card_item, "xid"            , xid               );
	                easyPayClient.easypay_deli_us( easypay_card_item, "eci"            , eci               );
	            }

	            easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_card_item );
	        }
	        else if( pay_type.equals("bank") ) {

	            int easypay_bank_item;

	            easypay_bank_item = easyPayClient.easypay_item( "acnt" );

	            easyPayClient.easypay_deli_us( easypay_bank_item, "acnt_txtype"    , acnt_txtype     );
	            easyPayClient.easypay_deli_us( easypay_bank_item, "acnt_amt"       , acnt_amt        );
	            easyPayClient.easypay_deli_us( easypay_bank_item, "kftc_signdata"  , kftc_signdata   );
	            easyPayClient.easypay_deli_us( easypay_bank_item, "kftc_serialno"  , kftc_serialno   );
	            easyPayClient.easypay_deli_us( easypay_bank_item, "bank_cd"        , bank_cd         );
	            easyPayClient.easypay_deli_us( easypay_bank_item, "cash_yn"        , cash_yn         );

	            // 현금영수증
	            if( cash_yn.equals("1") ) {
	                easyPayClient.easypay_deli_us( easypay_bank_item, "cash_issue_type" , cash_issue_type  );
	                easyPayClient.easypay_deli_us( easypay_bank_item, "cash_auth_type"  , cash_auth_type   );
	                easyPayClient.easypay_deli_us( easypay_bank_item, "cash_auth_value" , cash_auth_value  );
	            }
	            easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_bank_item );
	        }
	        else if( pay_type.equals("vacct") ) {

	            int easypay_vacct_item;

	            easypay_vacct_item = easyPayClient.easypay_item( "vacct" );

	            easyPayClient.easypay_deli_us( easypay_vacct_item, "vacct_txtype"    , vacct_txtype     );
	            easyPayClient.easypay_deli_us( easypay_vacct_item, "vacct_amt"       , vacct_amt        );
	            easyPayClient.easypay_deli_us( easypay_vacct_item, "bank_cd"         , bank_cd          );
	            easyPayClient.easypay_deli_us( easypay_vacct_item, "expire_date"     , vacct_expr_date  );
	            easyPayClient.easypay_deli_us( easypay_vacct_item, "expire_time"     , vacct_expr_time  );
	            easyPayClient.easypay_deli_us( easypay_vacct_item, "cash_yn"         , cash_yn          );

	            // 현금영수증
	            if( cash_yn.equals("1") ) {

	                easyPayClient.easypay_deli_us( easypay_vacct_item, "cash_issue_type" , cash_issue_type  );
	                easyPayClient.easypay_deli_us( easypay_vacct_item, "cash_auth_type"  , cash_auth_type   );
	                easyPayClient.easypay_deli_us( easypay_vacct_item, "cash_auth_value" , cash_auth_value  );
	            }

	            easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_vacct_item );


	        }
	        else if( pay_type.equals("mobile") ) {

	            int easypay_mobile_item;

	            easypay_mobile_item = easyPayClient.easypay_item( "mob" );

	            easyPayClient.easypay_deli_us( easypay_mobile_item, "mob_txtype"    , mob_txtype    );
	            easyPayClient.easypay_deli_us( easypay_mobile_item, "mob_amt"       , mob_amt       );
	            easyPayClient.easypay_deli_us( easypay_mobile_item, "mobile_cd"     , mobile_cd     );
	            easyPayClient.easypay_deli_us( easypay_mobile_item, "mobile_no"     , mobile_no     );
	            easyPayClient.easypay_deli_us( easypay_mobile_item, "jumin_no"      , jumin_no      );

	            // 승인
	            if( mob_txtype.equals("20") ) {

	                easyPayClient.easypay_deli_us( easypay_mobile_item, "auth_id" , mob_auth_id  );
	                easyPayClient.easypay_deli_us( easypay_mobile_item, "billid"  , mob_billid   );
	                easyPayClient.easypay_deli_us( easypay_mobile_item, "cno"     , mob_cno      );
	            }

	            easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_mobile_item );
	        }
	        else if( pay_type.equals("point") ) {

	        	int easypay_point_item;

	            easypay_point_item = easyPayClient.easypay_item( "pnt" );

	            easyPayClient.easypay_deli_us( easypay_point_item, "pnt_txtype"   , pnt_txtype   );
	            easyPayClient.easypay_deli_us( easypay_point_item, "pnt_amt"      , pnt_amt      );
	            easyPayClient.easypay_deli_us( easypay_point_item, "cp_cd"        , pnt_cp_cd    );
	            easyPayClient.easypay_deli_us( easypay_point_item, "pnt_idno"     , pnt_idno     );
	            easyPayClient.easypay_deli_us( easypay_point_item, "pnt_pwd"      , pnt_pwd      );

	            easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_point_item );
	        }
	        
	        //에스크로 여부 
	        if("Y".equals(escrow_yn)){
	        	
	        	int easypay_escrow_data_item;
	        	easypay_escrow_data_item = easyPayClient.easypay_item( "escrow_data" );

	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "escr_type"		, escr_type 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "bk_cnt"		, bk_cnt		);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "bk_totamt"	, bk_totamt 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "bk_goodinfo"		, bk_goodinfo );
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_id"		, recv_id		);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_nm"		, recv_nm 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_tel"	, recv_tel 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_mob"	, recv_mob 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_mail"		, recv_mail 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_zip"	, recv_zip 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_addr1"	, recv_addr1 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_addr2"	, recv_addr2 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "deli_type"	, deli_type 	);
	        	
	        }
	    }


	    /* -------------------------------------------------------------------------- */
	    /* ::: 실행                                                                   */
	    /* -------------------------------------------------------------------------- */
	    if ( tr_cd.length() > 0 ) {
	        easyPayClient.easypay_run( g_mall_id, tr_cd, order_no );

	        res_cd = easyPayClient.res_cd;
	        res_msg = easyPayClient.res_msg;

	    }
	    else {
	        res_cd  = "M114";
	        res_msg = "연동 오류|tr_cd값이 설정되지 않았습니다.";
	    }
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결과 처리                                                              */
	    /* -------------------------------------------------------------------------- */
	    r_cno             = easyPayClient.easypay_get_res( "cno"             );    // PG거래번호
	    r_amount          = easyPayClient.easypay_get_res( "amount"          );    //총 결제금액
	    r_order_no        = easyPayClient.easypay_get_res( "order_no"        );    //주문번호
	    r_noti_type       = easyPayClient.easypay_get_res( "noti_type"       );    //노티구분
	    r_auth_no         = easyPayClient.easypay_get_res( "auth_no"         );    //승인번호
	    r_tran_date       = easyPayClient.easypay_get_res( "tran_date"       );    //승인일시
	    r_pnt_auth_no     = easyPayClient.easypay_get_res( "pnt_auth_no"     );    //포인트승인번호
	    r_pnt_tran_date   = easyPayClient.easypay_get_res( "pnt_tran_date"   );    //포인트승인일시
	    r_cpon_auth_no    = easyPayClient.easypay_get_res( "cpon_auth_no"    );    //쿠폰승인번호
	    r_cpon_tran_date  = easyPayClient.easypay_get_res( "cpon_tran_date"  );    //쿠폰승인일시
	    r_card_no         = easyPayClient.easypay_get_res( "card_no"         );    //카드번호
	    r_issuer_cd       = easyPayClient.easypay_get_res( "issuer_cd"       );    //발급사코드
	    r_issuer_nm       = easyPayClient.easypay_get_res( "issuer_nm"       );    //발급사명
	    r_acquirer_cd     = easyPayClient.easypay_get_res( "acquirer_cd"     );    //매입사코드
	    r_acquirer_nm     = easyPayClient.easypay_get_res( "acquirer_nm"     );    //매입사명
	    r_install_period  = easyPayClient.easypay_get_res( "install_period"  );    //할부개월
	    r_noint           = easyPayClient.easypay_get_res( "noint"           );    //무이자여부
	    r_bank_cd         = easyPayClient.easypay_get_res( "bank_cd"         );    //은행코드
	    r_bank_nm         = easyPayClient.easypay_get_res( "bank_nm"         );    //은행명
	    r_account_no      = easyPayClient.easypay_get_res( "account_no"      );    //계좌번호
	    r_deposit_nm      = easyPayClient.easypay_get_res( "deposit_nm"      );    //입금자명
	    r_expire_date     = easyPayClient.easypay_get_res( "expire_date"     );    //계좌사용만료일
	    r_cash_res_cd     = easyPayClient.easypay_get_res( "cash_res_cd"     );    //현금영수증 결과코드
	    r_cash_res_msg    = easyPayClient.easypay_get_res( "cash_res_msg"    );    //현금영수증 결과메세지
	    r_cash_auth_no    = easyPayClient.easypay_get_res( "cash_auth_no"    );    //현금영수증 승인번호
	    r_cash_tran_date  = easyPayClient.easypay_get_res( "cash_tran_date"  );    //현금영수증 승인일시
	    r_auth_id         = easyPayClient.easypay_get_res( "auth_id"         );    //PhoneID
	    r_billid          = easyPayClient.easypay_get_res( "billid"          );    //인증번호
	    r_mobile_no       = easyPayClient.easypay_get_res( "mobile_no"       );    //휴대폰번호
	    r_ars_no          = easyPayClient.easypay_get_res( "ars_no"          );    //전화번호
	    r_cp_cd           = easyPayClient.easypay_get_res( "cp_cd"           );    //포인트사/쿠폰사
	    r_used_pnt        = easyPayClient.easypay_get_res( "used_pnt"        );    //사용포인트
	    r_remain_pnt      = easyPayClient.easypay_get_res( "remain_pnt"      );    //잔여한도
	    r_pay_pnt         = easyPayClient.easypay_get_res( "pay_pnt"         );    //할인/발생포인트
	    r_accrue_pnt      = easyPayClient.easypay_get_res( "accrue_pnt"      );    //누적포인트
	    r_remain_cpon     = easyPayClient.easypay_get_res( "remain_cpon"     );    //쿠폰잔액
	    r_used_cpon       = easyPayClient.easypay_get_res( "used_cpon"       );    //쿠폰 사용금액
	    r_mall_nm         = easyPayClient.easypay_get_res( "mall_nm"         );    //제휴사명칭
	    r_escrow_yn       = easyPayClient.easypay_get_res( "escrow_yn"       );    //에스크로 사용유무
	    r_complex_yn      = easyPayClient.easypay_get_res( "complex_yn"      );    //복합결제 유무
	    r_canc_acq_data   = easyPayClient.easypay_get_res( "canc_acq_data"   );    //매입취소일시
	    r_canc_date       = easyPayClient.easypay_get_res( "canc_date"       );    //취소일시
	    r_refund_date     = easyPayClient.easypay_get_res( "refund_date"     );    //환불예정일시
	    
	    logger.debug("res_cd========================"+res_cd);
	    logger.debug("res_msg========================"+res_msg);
	    logger.debug("r_cno========================"+r_cno);
	    logger.debug("r_amount========================"+r_amount);
	    logger.debug("r_order_no========================"+r_order_no);
	    logger.debug("r_noti_type========================"+r_noti_type);// 메뉴얼에도 없는 파라미터..
	    logger.debug("r_auth_no========================"+r_auth_no);
	    logger.debug("r_tran_date========================"+r_tran_date);
	    
	    logger.debug("r_pnt_auth_no========================"+r_pnt_auth_no);//캐쉬백 사용 or 적립시 리턴되는 승인번호
	    logger.debug("r_pnt_tran_date========================"+r_pnt_tran_date);
	    logger.debug("r_cpon_auth_no========================"+r_cpon_auth_no);// 메뉴얼에도 없는 파라미터..
	    logger.debug("r_cpon_tran_date========================"+r_cpon_tran_date);// 메뉴얼에도 없는 파라미터..
	    
	    logger.debug("r_card_no========================"+r_card_no);
	    logger.debug("r_issuer_cd========================"+r_issuer_cd);
	    logger.debug("r_issuer_nm========================"+r_issuer_nm);
	    logger.debug("r_acquirer_cd========================"+r_acquirer_cd);
	    logger.debug("r_acquirer_nm========================"+r_acquirer_nm);
	    logger.debug("r_install_period========================"+r_install_period);
	    logger.debug("r_noint========================"+r_noint);
	    
	    logger.debug("r_bank_cd========================"+r_bank_cd);
	    logger.debug("r_bank_nm========================"+r_bank_nm);
	    logger.debug("r_account_no========================"+r_account_no);
	    logger.debug("r_deposit_nm========================"+r_deposit_nm);
	    logger.debug("r_expire_date========================"+r_expire_date);
	    logger.debug("r_cash_res_cd========================"+r_cash_res_cd);
	    logger.debug("r_cash_res_msg========================"+r_cash_res_msg);
	    logger.debug("r_cash_auth_no========================"+r_cash_auth_no);
	    logger.debug("r_cash_tran_date========================"+r_cash_tran_date);
	    logger.debug("r_auth_id========================"+r_auth_id);
	    logger.debug("r_billid========================"+r_billid);
	    logger.debug("r_mobile_no========================"+r_mobile_no);
	    logger.debug("r_auth_id========================"+r_auth_id);
	    logger.debug("r_billid========================"+r_billid);
	    logger.debug("r_mobile_no========================"+r_mobile_no);
	    
	    logger.debug("r_ars_no========================"+r_ars_no);
	    logger.debug("r_cp_cd========================"+r_cp_cd);//캐쉬백인 경우 OCB 리턴 받음
	    logger.debug("r_used_pnt========================"+r_used_pnt);//캐쉬백 사용시 사용 포인트 리턴, 적립시 적립 포인트 리턴
	    logger.debug("r_remain_pnt========================"+r_remain_pnt);
	    logger.debug("r_pay_pnt========================"+r_pay_pnt);
	    logger.debug("r_accrue_pnt========================"+r_accrue_pnt);
	    logger.debug("r_remain_cpon========================"+r_remain_cpon);// 메뉴얼에도 없는 파라미터..
	    logger.debug("r_used_cpon========================"+r_used_cpon);// 메뉴얼에도 없는 파라미터..
	    logger.debug("r_mall_nm========================"+r_mall_nm);// 메뉴얼에도 없는 파라미터..
	    logger.debug("r_escrow_yn========================"+r_escrow_yn);
	    logger.debug("r_complex_yn========================"+r_complex_yn);
	    logger.debug("r_canc_acq_data========================"+r_canc_acq_data);
	    logger.debug("r_canc_date========================"+r_canc_date);
	    logger.debug("r_refund_date========================"+r_refund_date);
	    
	    // 포인트 처리종류가 있는 경우에는 포인트 처리종류, 없는 경우에는 A가 들어간다.
	    String PAY_MST_TR_STATUS = "A";
	    if(!"".equals(pnt_txtype)){
	    	if("10".equals(pnt_txtype)){//포인트 조회
	    		PAY_MST_TR_STATUS = "I";
	    	}else if("20".equals(pnt_txtype)){//포인트 사용
	    		PAY_MST_TR_STATUS = "U";
	    	}else if("40".equals(pnt_txtype)){//포인트 적립
	    		PAY_MST_TR_STATUS = "S";
	    	}
	    }
	    
	    commandMap.put("PAY_MST_TR_STATUS",		PAY_MST_TR_STATUS);
	    commandMap.put("PAY_MST_RESPCODE", res_cd);
	    commandMap.put("PAY_MST_RESPMSG", res_msg);
	    commandMap.put("PAY_MST_TID", r_cno);
	    commandMap.put("PAY_MST_AMOUNT", r_amount);
	    commandMap.put("PAY_MST_OID", r_order_no);
	    commandMap.put("PAY_MST_MID",				g_mall_id);
	    commandMap.put("PAY_MST_KICC_AUTH_NO", r_auth_no);
	    commandMap.put("PAY_MST_KICC_TRAN_DATE", r_tran_date);
	    commandMap.put("PAY_MST_KICC_PNT_AUTH_NO", r_pnt_auth_no);
	    commandMap.put("PAY_MST_KICC_PNT_TRAN_DATE", r_pnt_tran_date);
	    commandMap.put("PAY_MST_KICC_CARD_NO", r_card_no);
	    commandMap.put("PAY_MST_KICC_ISSUER_CD", r_issuer_cd);
	    commandMap.put("PAY_MST_KICC_ISSUER_NM", r_issuer_nm);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_CD", r_acquirer_cd);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_NM", r_acquirer_nm);
	    commandMap.put("PAY_MST_KICC_INSTALL_PERIOD", r_install_period);
	    commandMap.put("PAY_MST_KICC_NOINT", r_noint);
	    commandMap.put("PAY_MST_KICC_BANK_CD", r_bank_cd);
	    commandMap.put("PAY_MST_KICC_BANK_NM", r_bank_nm);
	    commandMap.put("PAY_MST_KICC_ACCOUNT_NO", r_account_no);
	    commandMap.put("PAY_MST_KICC_DEPOSIT_NM", r_deposit_nm);
	    commandMap.put("PAY_MST_KICC_EXPIRE_DATE", r_expire_date);
	    commandMap.put("PAY_MST_KICC_CASH_RES_CD", r_cash_res_cd);
	    commandMap.put("PAY_MST_KICC_CASH_RES_MSG", r_cash_res_msg);
	    commandMap.put("PAY_MST_KICC_CASH_AUTH_NO", r_cash_auth_no);
	    commandMap.put("PAY_MST_KICC_CASH_TRAN_DATE", r_cash_tran_date);
	    commandMap.put("PAY_MST_KICC_AUTH_ID", r_auth_id);
	    commandMap.put("PAY_MST_KICC_BILLID", r_billid);
	    commandMap.put("PAY_MST_KICC_MOBILE_NO", r_mobile_no);
	    commandMap.put("PAY_MST_KICC_ARS_NO", r_ars_no);
	    commandMap.put("PAY_MST_KICC_USED_PNT", r_used_pnt); // 'P'가 리턴돼서.. 주석처리
	    commandMap.put("PAY_MST_KICC_REMAIN_PNT", r_remain_pnt);
	    commandMap.put("PAY_MST_KICC_PAY_PNT", r_pay_pnt);
	    commandMap.put("PAY_MST_KICC_ACCURE_PNT", r_accrue_pnt);
	    commandMap.put("PAY_MST_KICC_ESCROW_YN", r_escrow_yn);
	    commandMap.put("PAY_MST_KICC_COMPLEX_YN", r_complex_yn);
	    commandMap.put("PAY_MST_KICC_CANC_ACQ_DATE", r_canc_acq_data);
	    commandMap.put("PAY_MST_KICC_CANC_DATE", r_canc_date);
	    commandMap.put("PAY_MST_KICC_REFUND_DATE", r_refund_date);
	    
	    commandMap.put("client_ip", client_ip);	//즉시 취소시 필요한 client_ip 

	    /* -------------------------------------------------------------------------- */
	    /* ::: 가맹점 DB 처리                                                         */
	    /* -------------------------------------------------------------------------- */
	    /* r_amount가 주문DB의 금액과 다를 시 반드시 취소 요청을 하시기 바랍니다.     */
	    /* DB 처리 실패 시 취소 처리를 해주시기 바랍니다.                             */
	    /* -------------------------------------------------------------------------- */
	    /*if ( res_cd.equals("0000") && TRAN_CD_NOR_PAYMENT.equals( tr_cd ) )
	    {
	    	bDBProc = "false";     // DB처리 성공 시 "true", 실패 시 "false"
	    	if ( bDBProc.equals("false") )
	    	{
	    		
	    	}
	    }*/
	    
	    logger.info("#######[END] KICC 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
	    
	    return commandMap;
	}	
	
	/**
	 * 
	    * <pre>
	    * 1. MethodName : kiccManagePayment
	    * 2. ClassName  : BatchOrderStateServiceImpl.java
	    * 3. Comment    : kicc 변경 요청(취소, 에스크로 등등)
	    * 4. 작성자       : DEV_LEEKWANGWOON
	    * 5. 작성일       : 2016. 1. 18.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	 */
	public Map<String, Object> kiccManagePayment(Map<String, Object> commandMap) throws Exception {
		
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] KICC 변경 요청 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		/**
		 * 
		 * 		-	mgr_txtype(거래구분)
				매입요청 : 20
				매입취소 : 30
				부분매입취소(신용카드) : 31
				부분취소(계좌이체) : 33
				즉시취소(승인/매입자동판단 취소) : 40
				현금영수증 취소 : 51
				에스크로 상태변경 : 61

				-	mgr_subtype(변경세부 구분)
				코드	내용	비고
				ES02	승인취소	배송 전 취소!
				ES05	환불요청	
				ES07	배송중	송장 나오면 그때 kicc 쪽에 보냄
				ES08	배송중 취소요청	
				ES09	배송중 취소완료	
				ES10	배송중 환불요청	
		 * 
		 */
		// ============================================================================== 
		// =   PAGE : 결제 정보 환경 설정 PAGE                                     		= 
		// = -------------------------------------------------------------------------- = 
		// =   Copyright (c)  2010   KICC Inc.   All Rights Reserved.                   = 
		// ============================================================================== 
		
		// ============================================================================== 
		// =   01. 지불 데이터 셋업 (업체에 맞게 수정)                             		= 
		// = -------------------------------------------------------------------------- = 
		// = ※ 주의 ※                                                           		= 
		// =  cert_file 변수 설정                                                 		= 
		// = pg_cert.pem 파일이 있는 디렉토리의  절대 경로 설정                         = 
		// =                                                                            = 
		// =  log_dir 변수 설정                                                   		=
		// = log 디렉토리 설정                                                    		=
		// =  log_level 변수 설정                                                 		=
		// = log 레벨 설정                                                        		=
		// = -------------------------------------------------------------------------- =
		
		String g_cert_file  = this.propertiesService.getString("payment.kicc.certificate.path");
		String g_log_dir    = this.propertiesService.getString("payment.kicc.log.path");
		int g_log_level  = 1;
		
		// ============================================================================== /
		// =   02. 쇼핑몰 지불 정보 설정                                                = /
		// = -------------------------------------------------------------------------- = /		
		String g_gw_url    = this.propertiesService.getString("payment.kicc.server.url");  // Gateway URL ( test )
		String g_gw_port   = "80";                  // 포트번호(변경불가) /
		
		String g_mall_id   =  StringUtil.getString(commandMap.get("PAY_MST_MID"));             //주문시 사용한 mid 그대로
		// ============================================================================= /
		
		/* -------------------------------------------------------------------------- */
	    /* ::: 처리구분 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    final String TRAN_CD_NOR_MGR        = "00201000";   // 변경(일반, 에스크로)

	    String tr_cd            = TRAN_CD_NOR_MGR;           // [필수]요청구분
	    String pay_type         = StringUtil.getString(commandMap.get("EP_pay_type"));        // [필수]결제수단
	    String order_no         = ORD_MST_CD;         // [필수]주문번호
		
	    /* -------------------------------------------------------------------------- */
	    /* ::: 기타정보 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    //String client_ip        = request.getRemoteAddr();                                     // [필수]결제고객 IP
	    String client_ip        = "127.0.0.1";                                     // [필수]결제고객 IP

	    /* -------------------------------------------------------------------------- */
	    /* ::: 변경관리 정보 설정                                                     */
	    /* -------------------------------------------------------------------------- */
	    String mgr_txtype       = StringUtil.getString(commandMap.get("mgr_txtype"));          // [필수]거래구분
	    String mgr_subtype      = StringUtil.getString(commandMap.get("mgr_subtype"));         // [선택]변경세부구분
	    String org_cno          = StringUtil.getString(commandMap.get("PAY_MST_TID"));             // [필수]원거래고유번호
	    String mgr_amt          = StringUtil.getString(commandMap.get("mgr_amt"));             // [선택]부분취소/환불요청 금액
	    String mgr_bank_cd      = StringUtil.getString(commandMap.get("mgr_bank_cd"));         // [선택]환불계좌 은행코드
	    String mgr_account      = StringUtil.getString(commandMap.get("mgr_account"));         // [선택]환불계좌 번호
	    String mgr_depositor    = StringUtil.getString(commandMap.get("mgr_depositor"));       // [선택]환불계좌 예금주명
	    String mgr_socno        = StringUtil.getString(commandMap.get("mgr_socno"));           // [선택]환불계좌 주민번호
	    String mgr_telno        = StringUtil.getString(commandMap.get("mgr_telno"));           // [선택]환불고객 연락처
	    String deli_cd          = StringUtil.getString(commandMap.get("deli_cd"));             // [선택]배송구분[자가:DE01,택배:DE02]
	    String deli_corp_cd     = StringUtil.getString(commandMap.get("deli_corp_cd"));        // [선택]택배사코드
	    String deli_invoice     = StringUtil.getString(commandMap.get("deli_invoice"));        // [선택]운송장 번호
	    String deli_rcv_nm      = StringUtil.getString(commandMap.get("deli_rcv_nm"));         // [선택]수령인 이름
	    String deli_rcv_tel     = StringUtil.getString(commandMap.get("deli_rcv_tel"));        // [선택]수령인 연락처
	    String req_id           = StringUtil.getString(commandMap.get("req_id"));               // [선택]가맹점 관리자 로그인 아이디
	    String mgr_msg          = StringUtil.getString(commandMap.get("mgr_msg"));             // [선택]변경 사유

	    /* -------------------------------------------------------------------------- */
	    /* ::: 전문                                                                   */
	    /* -------------------------------------------------------------------------- */
	    String mgr_data    = "";     // 변경정보
	    String tx_req_data = "";     // 요청전문

	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제 결과                                                              */
	    /* -------------------------------------------------------------------------- */
	    String bDBProc          = "";
	    String res_cd           = "";
	    String res_msg          = "";
	    String r_order_no       = "";
	    String r_complex_yn     = "";
	    String r_msg_type       = "";     //거래구분
	    String r_noti_type	    = "";     //노티구분
	    String r_cno            = "";     //PG거래번호
	    String r_amount         = "";     //총 결제금액
	    String r_auth_no        = "";     //승인번호
	    String r_tran_date      = "";     //거래일시
	    String r_pnt_auth_no    = "";     //포인트 승인 번호
	    String r_pnt_tran_date  = "";     //포인트 승인 일시
	    String r_cpon_auth_no   = "";     //쿠폰 승인 번호
	    String r_cpon_tran_date = "";     //쿠폰 승인 일시
	    String r_card_no        = "";     //카드번호
	    String r_issuer_cd      = "";     //발급사코드
	    String r_issuer_nm      = "";     //발급사명
	    String r_acquirer_cd    = "";     //매입사코드
	    String r_acquirer_nm    = "";     //매입사명
	    String r_install_period = "";     //할부개월
	    String r_noint          = "";     //무이자여부
	    String r_bank_cd        = "";     //은행코드
	    String r_bank_nm        = "";     //은행명
	    String r_account_no     = "";     //계좌번호
	    String r_deposit_nm     = "";     //입금자명
	    String r_expire_date    = "";     //계좌사용 만료일
	    String r_cash_res_cd    = "";     //현금영수증 결과코드
	    String r_cash_res_msg   = "";     //현금영수증 결과메세지
	    String r_cash_auth_no   = "";     //현금영수증 승인번호
	    String r_cash_tran_date = "";     //현금영수증 승인일시
	    String r_auth_id        = "";     //PhoneID
	    String r_billid         = "";     //인증번호
	    String r_mobile_no      = "";     //휴대폰번호
	    String r_ars_no         = "";     //ARS 전화번호
	    String r_cp_cd          = "";     //포인트사
	    String r_used_pnt       = "";     //사용포인트
	    String r_remain_pnt     = "";     //잔여한도
	    String r_pay_pnt        = "";     //할인/발생포인트
	    String r_accrue_pnt     = "";     //누적포인트
	    String r_remain_cpon    = "";     //쿠폰잔액
	    String r_used_cpon      = "";     //쿠폰 사용금액
	    String r_mall_nm        = "";     //제휴사명칭
	    String r_escrow_yn	    = "";     //에스크로 사용유무
	    String r_canc_acq_data  = "";     //매입취소일시
	    String r_canc_date      = "";     //취소일시
	    String r_refund_date    = "";     //환불예정일시

	    /* -------------------------------------------------------------------------- */
	    /* ::: EasyPayClient 인스턴스 생성 [변경불가 !!].                             */
	    /* -------------------------------------------------------------------------- */
	    EasyPayClient easyPayClient = new EasyPayClient();
	    easyPayClient.easypay_setenv_init( g_gw_url, g_gw_port, g_cert_file, g_log_dir );
	    easyPayClient.easypay_reqdata_init();

        int easypay_mgr_data_item;
        easypay_mgr_data_item = easyPayClient.easypay_item( "mgr_data" );

        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_txtype"		, mgr_txtype 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_subtype"		, mgr_subtype 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "org_cno"			, org_cno 		);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "order_no"		, order_no		);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "pay_type"		, pay_type		);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_amt"			, mgr_amt		);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_bank_cd"		, mgr_bank_cd 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_account"		, mgr_account 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_depositor"	, mgr_depositor );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_socno"		, mgr_socno 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_telno"		, mgr_telno 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "deli_cd"			, deli_cd 		);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "deli_corp_cd"	, deli_corp_cd 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "deli_invoice"	, deli_invoice 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "deli_rcv_nm"		, deli_rcv_nm 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "deli_rcv_tel"	, deli_rcv_tel 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "req_ip"			, client_ip		);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "req_id"			, req_id        );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_msg"			, mgr_msg		);


	    /* -------------------------------------------------------------------------- */
	    /* ::: 실행                                                                   */
	    /* -------------------------------------------------------------------------- */
	    if ( tr_cd.length() > 0 ) {
	        easyPayClient.easypay_run( g_mall_id, tr_cd, order_no );

	        res_cd = easyPayClient.res_cd;
	        res_msg = easyPayClient.res_msg;

	    }
	    else {
	        res_cd  = "M114";
	        res_msg = "연동 오류|tr_cd값이 설정되지 않았습니다.";
	    }
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결과 처리                                                              */
	    /* -------------------------------------------------------------------------- */
	    r_cno             = easyPayClient.easypay_get_res( "cno"             );    // PG거래번호
	    r_amount          = easyPayClient.easypay_get_res( "amount"          );    //총 결제금액
	    r_order_no        = easyPayClient.easypay_get_res( "order_no"        );    //주문번호
	    r_noti_type       = easyPayClient.easypay_get_res( "noti_type"       );    //노티구분
	    r_auth_no         = easyPayClient.easypay_get_res( "auth_no"         );    //승인번호
	    r_tran_date       = easyPayClient.easypay_get_res( "tran_date"       );    //승인일시
	    r_pnt_auth_no     = easyPayClient.easypay_get_res( "pnt_auth_no"     );    //포인트승인번호
	    r_pnt_tran_date   = easyPayClient.easypay_get_res( "pnt_tran_date"   );    //포인트승인일시
	    r_cpon_auth_no    = easyPayClient.easypay_get_res( "cpon_auth_no"    );    //쿠폰승인번호
	    r_cpon_tran_date  = easyPayClient.easypay_get_res( "cpon_tran_date"  );    //쿠폰승인일시
	    r_card_no         = easyPayClient.easypay_get_res( "card_no"         );    //카드번호
	    r_issuer_cd       = easyPayClient.easypay_get_res( "issuer_cd"       );    //발급사코드
	    r_issuer_nm       = easyPayClient.easypay_get_res( "issuer_nm"       );    //발급사명
	    r_acquirer_cd     = easyPayClient.easypay_get_res( "acquirer_cd"     );    //매입사코드
	    r_acquirer_nm     = easyPayClient.easypay_get_res( "acquirer_nm"     );    //매입사명
	    r_install_period  = easyPayClient.easypay_get_res( "install_period"  );    //할부개월
	    r_noint           = easyPayClient.easypay_get_res( "noint"           );    //무이자여부
	    r_bank_cd         = easyPayClient.easypay_get_res( "bank_cd"         );    //은행코드
	    r_bank_nm         = easyPayClient.easypay_get_res( "bank_nm"         );    //은행명
	    r_account_no      = easyPayClient.easypay_get_res( "account_no"      );    //계좌번호
	    r_deposit_nm      = easyPayClient.easypay_get_res( "deposit_nm"      );    //입금자명
	    r_expire_date     = easyPayClient.easypay_get_res( "expire_date"     );    //계좌사용만료일
	    r_cash_res_cd     = easyPayClient.easypay_get_res( "cash_res_cd"     );    //현금영수증 결과코드
	    r_cash_res_msg    = easyPayClient.easypay_get_res( "cash_res_msg"    );    //현금영수증 결과메세지
	    r_cash_auth_no    = easyPayClient.easypay_get_res( "cash_auth_no"    );    //현금영수증 승인번호
	    r_cash_tran_date  = easyPayClient.easypay_get_res( "cash_tran_date"  );    //현금영수증 승인일시
	    r_auth_id         = easyPayClient.easypay_get_res( "auth_id"         );    //PhoneID
	    r_billid          = easyPayClient.easypay_get_res( "billid"          );    //인증번호
	    r_mobile_no       = easyPayClient.easypay_get_res( "mobile_no"       );    //휴대폰번호
	    r_ars_no          = easyPayClient.easypay_get_res( "ars_no"          );    //전화번호
	    r_cp_cd           = easyPayClient.easypay_get_res( "cp_cd"           );    //포인트사/쿠폰사
	    r_used_pnt        = easyPayClient.easypay_get_res( "used_pnt"        );    //사용포인트
	    r_remain_pnt      = easyPayClient.easypay_get_res( "remain_pnt"      );    //잔여한도
	    r_pay_pnt         = easyPayClient.easypay_get_res( "pay_pnt"         );    //할인/발생포인트
	    r_accrue_pnt      = easyPayClient.easypay_get_res( "accrue_pnt"      );    //누적포인트
	    r_remain_cpon     = easyPayClient.easypay_get_res( "remain_cpon"     );    //쿠폰잔액
	    r_used_cpon       = easyPayClient.easypay_get_res( "used_cpon"       );    //쿠폰 사용금액
	    r_mall_nm         = easyPayClient.easypay_get_res( "mall_nm"         );    //제휴사명칭
	    r_escrow_yn       = easyPayClient.easypay_get_res( "escrow_yn"       );    //에스크로 사용유무
	    r_complex_yn      = easyPayClient.easypay_get_res( "complex_yn"      );    //복합결제 유무
	    r_canc_acq_data   = easyPayClient.easypay_get_res( "canc_acq_data"   );    //매입취소일시
	    r_canc_date       = easyPayClient.easypay_get_res( "canc_date"       );    //취소일시
	    r_refund_date     = easyPayClient.easypay_get_res( "refund_date"     );    //환불예정일시
	    
	    logger.debug("res_cd========================"+res_cd);
	    logger.debug("res_msg========================"+res_msg);
	    logger.debug("r_cno========================"+r_cno);
	    logger.debug("r_amount========================"+r_amount);
	    logger.debug("r_order_no========================"+r_order_no);
	    logger.debug("r_noti_type========================"+r_noti_type);
	    logger.debug("r_auth_no========================"+r_auth_no);
	    logger.debug("r_tran_date========================"+r_tran_date);
	    logger.debug("r_pnt_auth_no========================"+r_pnt_auth_no);
	    logger.debug("r_pnt_tran_date========================"+r_pnt_tran_date);
	    logger.debug("r_cpon_auth_no========================"+r_cpon_auth_no);
	    logger.debug("r_cpon_tran_date========================"+r_cpon_tran_date);
	    logger.debug("r_card_no========================"+r_card_no);
	    logger.debug("r_issuer_cd========================"+r_issuer_cd);
	    logger.debug("r_issuer_nm========================"+r_issuer_nm);
	    logger.debug("r_acquirer_cd========================"+r_acquirer_cd);
	    logger.debug("r_install_period========================"+r_install_period);
	    logger.debug("r_noint========================"+r_noint);
	    logger.debug("r_bank_cd========================"+r_bank_cd);
	    logger.debug("r_bank_nm========================"+r_bank_nm);
	    logger.debug("r_account_no========================"+r_account_no);
	    logger.debug("r_deposit_nm========================"+r_deposit_nm);
	    logger.debug("r_expire_date========================"+r_expire_date);
	    logger.debug("r_cash_res_cd========================"+r_cash_res_cd);
	    logger.debug("r_cash_res_msg========================"+r_cash_res_msg);
	    logger.debug("r_cash_auth_no========================"+r_cash_auth_no);
	    logger.debug("r_cash_tran_date========================"+r_cash_tran_date);
	    logger.debug("r_auth_id========================"+r_auth_id);
	    logger.debug("r_billid========================"+r_billid);
	    logger.debug("r_mobile_no========================"+r_mobile_no);
	    logger.debug("r_auth_id========================"+r_auth_id);
	    logger.debug("r_billid========================"+r_billid);
	    logger.debug("r_mobile_no========================"+r_mobile_no);
	    logger.debug("r_ars_no========================"+r_ars_no);
	    logger.debug("r_cp_cd========================"+r_cp_cd);
	    logger.debug("r_used_pnt========================"+r_used_pnt);
	    logger.debug("r_remain_pnt========================"+r_remain_pnt);
	    logger.debug("r_pay_pnt========================"+r_pay_pnt);
	    logger.debug("r_accrue_pnt========================"+r_accrue_pnt);
	    logger.debug("r_remain_cpon========================"+r_remain_cpon);
	    logger.debug("r_used_cpon========================"+r_used_cpon);
	    logger.debug("r_mall_nm========================"+r_mall_nm);
	    logger.debug("r_escrow_yn========================"+r_escrow_yn);
	    logger.debug("r_complex_yn========================"+r_complex_yn);
	    logger.debug("r_canc_acq_data========================"+r_canc_acq_data);
	    logger.debug("r_canc_date========================"+r_canc_date);
	    logger.debug("r_refund_date========================"+r_refund_date);
	    
		String PAY_MST_TR_STATUS = "";
		
		if("61".equals(mgr_txtype)){
			PAY_MST_TR_STATUS = "M";	//에스크로 상태변경인 경우
		}else{
			String cashbagTrStatus = StringUtil.getString(commandMap.get("cashbagTrStatus"));
			
			if("".equals(cashbagTrStatus)){
				PAY_MST_TR_STATUS = "C"; //일반 취소인 경우
			}else{
				PAY_MST_TR_STATUS = cashbagTrStatus;	//캐쉬백 적립 취소 X/사용 취소 N 
			}
		}
	    
	    commandMap.put("PAY_MST_TR_STATUS",		PAY_MST_TR_STATUS);//변경상태값에 따라 다르게 
	    commandMap.put("PAY_MST_RESPCODE", res_cd);
	    commandMap.put("PAY_MST_RESPMSG", res_msg);
	    commandMap.put("PAY_MST_TID", r_cno);
	    commandMap.put("PAY_MST_MID",				g_mall_id);
	    commandMap.put("PAY_MST_AMOUNT", r_amount);
	    commandMap.put("PAY_MST_OID", r_order_no);
	    commandMap.put("PAY_MST_KICC_AUTH_NO", r_auth_no);
	    commandMap.put("PAY_MST_KICC_TRAN_DATE", r_tran_date);
	    commandMap.put("PAY_MST_KICC_PNT_AUTH_NO", r_pnt_auth_no);
	    commandMap.put("PAY_MST_KICC_PNT_TRAN_DATE", r_pnt_tran_date);
	    commandMap.put("PAY_MST_KICC_CARD_NO", r_card_no);
	    commandMap.put("PAY_MST_KICC_ISSUER_CD", r_issuer_cd);
	    commandMap.put("PAY_MST_KICC_ISSUER_NM", r_issuer_nm);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_CD", r_acquirer_cd);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_NM", r_acquirer_nm);
	    commandMap.put("PAY_MST_KICC_INSTALL_PERIOD", r_install_period);
	    commandMap.put("PAY_MST_KICC_NOINT", r_noint);
	    commandMap.put("PAY_MST_KICC_BANK_CD", r_bank_cd);
	    commandMap.put("PAY_MST_KICC_BANK_NM", r_bank_nm);
	    commandMap.put("PAY_MST_KICC_ACCOUNT_NO", r_account_no);
	    commandMap.put("PAY_MST_KICC_DEPOSIT_NM", r_deposit_nm);
	    commandMap.put("PAY_MST_KICC_EXPIRE_DATE", r_expire_date);
	    commandMap.put("PAY_MST_KICC_CASH_RES_CD", r_cash_res_cd);
	    commandMap.put("PAY_MST_KICC_CASH_RES_MSG", r_cash_res_msg);
	    commandMap.put("PAY_MST_KICC_CASH_AUTH_NO", r_cash_auth_no);
	    commandMap.put("PAY_MST_KICC_CASH_TRAN_DATE", r_cash_tran_date);
	    commandMap.put("PAY_MST_KICC_AUTH_ID", r_auth_id);
	    commandMap.put("PAY_MST_KICC_BILLID", r_billid);
	    commandMap.put("PAY_MST_KICC_MOBILE_NO", r_mobile_no);
	    commandMap.put("PAY_MST_KICC_ARS_NO", r_ars_no);
	    //commandMap.put("PAY_MST_KICC_USED_PNT", r_used_pnt);		// 'P'가 리턴돼서.. 주석처리
	    commandMap.put("PAY_MST_KICC_REMAIN_PNT", r_remain_pnt);
	    commandMap.put("PAY_MST_KICC_PAY_PNT", r_pay_pnt);
	    commandMap.put("PAY_MST_KICC_ACCURE_PNT", r_accrue_pnt);
	    commandMap.put("PAY_MST_KICC_ESCROW_YN", r_escrow_yn);
	    commandMap.put("PAY_MST_KICC_COMPLEX_YN", r_complex_yn);
	    commandMap.put("PAY_MST_KICC_CANC_ACQ_DATE", r_canc_acq_data);
	    commandMap.put("PAY_MST_KICC_CANC_DATE", r_canc_date);
	    commandMap.put("PAY_MST_KICC_REFUND_DATE", r_refund_date);

	    /* -------------------------------------------------------------------------- */
	    /* ::: 가맹점 DB 처리                                                         */
	    /* -------------------------------------------------------------------------- */
	    /* r_amount가 주문DB의 금액과 다를 시 반드시 취소 요청을 하시기 바랍니다.     */
	    /* DB 처리 실패 시 취소 처리를 해주시기 바랍니다.                             */
	    /* -------------------------------------------------------------------------- */
	    
	    logger.info("#######[END] KICC 변경 요청 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
	    return commandMap;
	    
	}
	
	
	
	
	/**
	* <pre>
	* 1. MethodName : kiccCardManagePayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : kicc 카드 승인 취소
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kiccCardManagePayment(Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] KICC 카드 결제 취소 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		/* -------------------------------------------------------------------------- */
	    /* ::: 처리구분 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    final String TRAN_CD_NOR_MGR        = "00201000";   // 변경

	    /* -------------------------------------------------------------------------- */
	    /* ::: 쇼핑몰 지불 정보 설정                                                  */
	    /* -------------------------------------------------------------------------- */
	    final String GW_URL                 = this.propertiesService.getString("payment.kicc.server.url");  // Gateway URL ( test )
	    final String GW_PORT                = "80";                    // 포트번호(변경불가) 
		
	    /* -------------------------------------------------------------------------- */ 
	    /* ::: 지불 데이터 셋업 (업체에 맞게 수정)                                    */ 
	    /* -------------------------------------------------------------------------- */ 
	    /* ※ 주의 ※                                                                 */ 
	    /* cert_file 변수 설정                                                        */
	    /* - pg_cert.pem 파일이 있는 디렉토리의  절대 경로 설정                       */ 
	    /* log_dir 변수 설정                                                          */
	    /* - log 디렉토리 설정                                                        */
	    /* log_level 변수 설정                                                        */
	    /* - log 레벨 설정                                                            */
	    /* -------------------------------------------------------------------------- */
	    final String CERT_FILE              = this.propertiesService.getString("payment.kicc.certificate.path");
	    final String LOG_DIR                = this.propertiesService.getString("payment.kicc.log.path");
	    final int LOG_LEVEL                 = 1;
	    
	    /* --------------------------------------------------------------------------- */
	    /* ::: 결제요청 - 가맹점 주문정보                                              */
	    /* --------------------------------------------------------------------------- */
	    String order_no          = ORD_MST_CD;   // [필수]*주문번호
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제요청 - 승인공통 정보                                               */
	    /* -------------------------------------------------------------------------- */
	    //String mall_id           = this.propertiesService.getString("payment.kicc.mall.id");
	    String mall_id           = StringUtil.getString(commandMap.get("PAY_MST_MID"          ));   // [필수]가맹점ID
	    String tr_cd             = TRAN_CD_NOR_MGR;   // [필수]*처리구분    
	    //String client_ip         = request.getRemoteAddr();                                        // [선택]고객IP
	    String client_ip         = "127.0.0.1";                                        // [선택]고객IP
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 변경관리 정보 설정(mgr.jsp)                                            */
	    /* -------------------------------------------------------------------------- */
	    String mgr_txtype        = StringUtil.getString(commandMap.get("mgr_txtype"          ));   // [필수]거래구분
	    String org_cno           = StringUtil.getString(commandMap.get("PAY_MST_TID"             ));   // [필수]원거래고유번호 
	    String mgr_amt           = StringUtil.getString(commandMap.get("mgr_amt"             ));   // [선택]취소요청금액
	    String req_ip            = client_ip;   // [필수]요청자 IP
	    String req_id            = StringUtil.getString(commandMap.get("req_id"              ));   // [선택]요청자 ID
	    String mgr_msg           = StringUtil.getString(commandMap.get("mgr_msg"             ));   // [선택]변경 사유
	   
	    /* -------------------------------------------------------------------------- */
	    /* ::: 승인 응답 결과 선언                                                    */
	    /* -------------------------------------------------------------------------- */
	    // CA : 카드승인, CAO : 카드승인옵션 
	    // CC : 카드승인취소, CCO : 카드승인취소옵션, CPC : 카드매입취소 
	    String r_res_cd          = "";    // 응답코드          (CA, CAO, CC, CCO, CPC)
	    String r_res_msg         = "";    // 응답메시지        (CA, CAO, CC, CCO, CPC)
	    String r_cno             = "";    // PG거래번호        (CA, CAO, CC, CCO, CPC)
	    String r_amount          = "";    // 총 결제금액       (CA,                  )
	    String r_order_no        = "";    // 주문번호          (CA,                  )
	    String r_auth_no         = "";    // 승인번호          (CA,                  )
	    String r_tran_date       = "";    // 승인일시          (CA,      CC,      CPC)
	    String r_escrow_yn       = "";    // 에스크로 사용유무 (CA,                  )
	    String r_complex_yn      = "";    // 복합결제 유무     (CA,                  )
	    String r_stat_cd         = "";    // 상태코드          (CA,      CC,      CPC)
	    String r_stat_msg        = "";    // 상태메시지        (CA,      CC,      CPC)
	    String r_pay_type        = "";    // 결제수단          (CA,                  )
	    String r_mall_id         = "";    // 가맹점 Mall ID    (CA                   )
	    String r_card_no         = "";    // 카드번호          (CA,          CCO     )
	    String r_issuer_cd       = "";    // 발급사코드        (CA,          CCO     )
	    String r_issuer_nm       = "";    // 발급사명          (CA,          CCO     )
	    String r_acquirer_cd     = "";    // 매입사코드        (CA,          CCO     )
	    String r_acquirer_nm     = "";    // 매입사명          (CA,          CCO     )
	    String r_install_period  = "";    // 할부개월          (CA,          CCO     )
	    String r_noint           = "";    // 무이자여부        (CA                   )
	    String r_join_no         = "";    // 가맹점 번호       (CA,          CCO     )
	    String r_part_cancel_yn  = "";    // 부분취소 가능여부 (CA                   )
	    String r_card_gubun      = "";    // 신용카드 종류     (CA                   )
	    String r_card_biz_gubun  = "";    // 신용카드 구분     (CA                   )
	    String r_cpon_flag       = "";    // 쿠폰 사용유무     (    CAO,     CCO     )
	    String r_used_cpon       = "";    // 쿠폰 사용금액     (    CAO              )
	    String r_canc_acq_date   = "";    // 매입취소일시      (                  CPC)
	    String r_canc_date       = "";    // 취소일시          (CC,               CPC)

	/* -------------------------------------------------------------------------- */
	    /* ::: EasyPayClient 인스턴스 생성 [변경불가 !!].                             */
	    /* -------------------------------------------------------------------------- */
	    EasyPayClient easyPayClient = new EasyPayClient();
	   
	    easyPayClient.easypay_setenv_init( GW_URL, GW_PORT, CERT_FILE, LOG_DIR );
	    easyPayClient.easypay_reqdata_init();

        /* -------------------------------------------------------------------------- */
        /* ::: 변경관리 요청                                                          */
        /* -------------------------------------------------------------------------- */
        int easypay_mgr_data_item;
        easypay_mgr_data_item = easyPayClient.easypay_item( "mgr_data" );

        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_txtype" , mgr_txtype );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "org_cno"    , org_cno    );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_amt"    , mgr_amt    );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "req_ip"     , req_ip     );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "req_id"     , req_id     );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_msg"    , mgr_msg    );

	    /* -------------------------------------------------------------------------- */
	    /* ::: 실행                                                                   */
	    /* -------------------------------------------------------------------------- */
	    if ( tr_cd.length() > 0 ) 
	    {
	        easyPayClient.easypay_run( mall_id, tr_cd, order_no );
	        r_res_cd  = easyPayClient.res_cd;
	        r_res_msg = easyPayClient.res_msg;
	    }
	    else 
	    {
	        r_res_cd  = "M114";
	        r_res_msg = "연동 오류|tr_cd값이 설정되지 않았습니다.";
	    }
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결과 처리                                                              */
	    /* -------------------------------------------------------------------------- */
	    r_cno                  = getNullToSpace(easyPayClient.easypay_get_res("cno"           ));    // PG거래번호        (CA, CAO, CC, CCO, CPC)
	    r_amount               = getNullToSpace(easyPayClient.easypay_get_res("amount"        ));    // 총 결제금액       (CA,                  )
	    r_order_no             = getNullToSpace(easyPayClient.easypay_get_res("order_no"      ));    // 주문번호          (CA,                  )
	    r_auth_no              = getNullToSpace(easyPayClient.easypay_get_res("auth_no"       ));    // 승인번호          (CA,                  )
	    r_tran_date            = getNullToSpace(easyPayClient.easypay_get_res("tran_date"     ));    // 승인일시          (CA,      CC,      CPC)
	    r_escrow_yn            = getNullToSpace(easyPayClient.easypay_get_res("escrow_yn"     ));    // 에스크로 사용유무 (CA,                  )
	    r_complex_yn           = getNullToSpace(easyPayClient.easypay_get_res("complex_yn"    ));    // 복합결제 유무     (CA,                  )
	    r_stat_cd              = getNullToSpace(easyPayClient.easypay_get_res("stat_cd"       ));    // 상태코드          (CA,      CC,      CPC)
	    r_stat_msg             = getNullToSpace(easyPayClient.easypay_get_res("stat_msg"      ));    // 상태메시지        (CA,      CC,      CPC)
	    r_pay_type             = getNullToSpace(easyPayClient.easypay_get_res("pay_type"      ));    // 결제수단          (CA,                  )
	    r_mall_id              = getNullToSpace(easyPayClient.easypay_get_res("mall_id"       ));    // 가맹점 Mall ID    (CA                   )
	    r_card_no              = getNullToSpace(easyPayClient.easypay_get_res("card_no"       ));    // 카드번호          (CA,          CCO     )
	    r_issuer_cd            = getNullToSpace(easyPayClient.easypay_get_res("issuer_cd"     ));    // 발급사코드        (CA,          CCO     )
	    r_issuer_nm            = getNullToSpace(easyPayClient.easypay_get_res("issuer_nm"     ));    // 발급사명          (CA,          CCO     )
	    r_acquirer_cd          = getNullToSpace(easyPayClient.easypay_get_res("acquirer_cd"   ));    // 매입사코드        (CA,          CCO     )
	    r_acquirer_nm          = getNullToSpace(easyPayClient.easypay_get_res("acquirer_nm"   ));    // 매입사명          (CA,          CCO     )
	    r_install_period       = getNullToSpace(easyPayClient.easypay_get_res("install_period"));    // 할부개월          (CA,          CCO     )
	    r_noint                = getNullToSpace(easyPayClient.easypay_get_res("noint"         ));    // 무이자여부        (CA                   )
	    r_join_no              = getNullToSpace(easyPayClient.easypay_get_res("join_no"       ));    // 가맹점 번호       (CA,          CCO     )
	    r_part_cancel_yn       = getNullToSpace(easyPayClient.easypay_get_res("part_cancel_yn"));    // 부분취소 가능여부 (CA                   )
	    r_card_gubun           = getNullToSpace(easyPayClient.easypay_get_res("card_gubun"    ));    // 신용카드 종류     (CA                   )
	    r_card_biz_gubun       = getNullToSpace(easyPayClient.easypay_get_res("card_biz_gubun"));    // 신용카드 구분     (CA                   )
	    r_cpon_flag            = getNullToSpace(easyPayClient.easypay_get_res("cpon_flag"     ));    // 쿠폰 사용유무     (    CAO,     CCO     )
	    r_used_cpon            = getNullToSpace(easyPayClient.easypay_get_res("used_cpon"     ));    // 쿠폰 사용금액     (    CAO              )
	    r_canc_acq_date        = getNullToSpace(easyPayClient.easypay_get_res("canc_acq_date" ));    // 매입취소일시      (                  CPC)
	    r_canc_date            = getNullToSpace(easyPayClient.easypay_get_res("canc_date"     ));    // 취소일시          (CC,               CPC)
	   
	    logger.debug("r_res_cd========================"+r_res_cd);
	    logger.debug("r_res_msg========================"+r_res_msg);
	    logger.debug("r_cno========================"+r_cno);
	    logger.debug("r_amount========================"+r_amount);
	    logger.debug("r_order_no========================"+r_order_no);
	    logger.debug("r_auth_no========================"+r_auth_no);
	    logger.debug("r_tran_date========================"+r_tran_date);
	    logger.debug("r_card_no========================"+r_card_no);
	    logger.debug("r_issuer_cd========================"+r_issuer_cd);
	    logger.debug("r_issuer_nm========================"+r_issuer_nm);
	    logger.debug("r_acquirer_cd========================"+r_acquirer_cd);
	    logger.debug("r_acquirer_nm========================"+r_acquirer_nm);
	    logger.debug("r_install_period========================"+r_install_period);
	    logger.debug("r_noint========================"+r_noint);
	    logger.debug("r_escrow_yn========================"+r_escrow_yn);
	    logger.debug("r_complex_yn========================"+r_complex_yn);
	    logger.debug("r_canc_date========================"+r_canc_date);
	    
	    logger.debug("r_stat_cd========================"+r_stat_cd);
	    logger.debug("r_stat_msg========================"+r_stat_msg);
	    logger.debug("r_pay_type========================"+r_pay_type);
	    logger.debug("r_mall_id========================"+r_mall_id);
	    logger.debug("r_join_no========================"+r_join_no);
	    logger.debug("r_part_cancel_yn========================"+r_part_cancel_yn);
	    logger.debug("r_card_gubun========================"+r_card_gubun);
	    logger.debug("r_card_biz_gubun========================"+r_card_biz_gubun);
	    logger.debug("r_cpon_flag========================"+r_cpon_flag);
	    logger.debug("r_used_cpon========================"+r_used_cpon);
	    logger.debug("r_canc_acq_date========================"+r_canc_acq_date);
	    
	    
	    commandMap.put("PAY_MST_TR_STATUS",		"C");
	    commandMap.put("PAY_MST_RESPCODE", r_res_cd);
	    commandMap.put("PAY_MST_RESPMSG", r_res_msg);
	    commandMap.put("PAY_MST_TID", r_cno);
	    commandMap.put("PAY_MST_MID",				mall_id);
	    commandMap.put("PAY_MST_AMOUNT", r_amount);
	    commandMap.put("PAY_MST_OID", r_order_no);
	    commandMap.put("PAY_MST_KICC_AUTH_NO", r_auth_no);
	    commandMap.put("PAY_MST_KICC_TRAN_DATE", r_tran_date);
	    commandMap.put("PAY_MST_KICC_CARD_NO", r_card_no);
	    commandMap.put("PAY_MST_KICC_ISSUER_CD", r_issuer_cd);
	    commandMap.put("PAY_MST_KICC_ISSUER_NM", r_issuer_nm);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_CD", r_acquirer_cd);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_NM", r_acquirer_nm);
	    commandMap.put("PAY_MST_KICC_INSTALL_PERIOD", r_install_period);
	    commandMap.put("PAY_MST_KICC_NOINT", r_noint);
	    commandMap.put("PAY_MST_KICC_ESCROW_YN", r_escrow_yn);
	    commandMap.put("PAY_MST_KICC_COMPLEX_YN", r_complex_yn);
	    commandMap.put("PAY_MST_KICC_CANC_DATE", r_canc_date);
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 가맹점 DB 처리                                                         */
	    /* -------------------------------------------------------------------------- */
	    /* r_amount가 주문DB의 금액과 다를 시 반드시 취소 요청을 하시기 바랍니다.     */
	    /* DB 처리 실패 시 취소 처리를 해주시기 바랍니다.                             */
	    /* -------------------------------------------------------------------------- */
	    /*if ( r_res_cd.equals("0000") && TRAN_CD_NOR_PAYMENT.equals( tr_cd ) )
	    {
	        String bDBProc = "true";     // DB처리 성공 시 "true", 실패 시 "false"
	        if ( bDBProc.equals("false") )
	        {
	        	
	        }
	    }*/
	    
	    logger.info("#######[END] KICC 카드 결제 취소 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
	    
	    return commandMap;
	}
	
	
	/**
	* <pre>
	* 1. MethodName : kakaoCancelPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : 카카오페이 결제취소
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kakaoCancelPayment(Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] 카카오페이 결제 취소 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		CnsPayWebConnector connector = new CnsPayWebConnector();
		
		// 1. 로그 디렉토리 생성 : cnsPayHome/log 로 생성
	    connector.setLogHome(this.propertiesService.getString("payment.kakaopay.log.path"));
	    connector.setCnsPayHome(this.propertiesService.getString("payment.kakaopay.config.path"));
	    
	    // 2. 요청 페이지 파라메터 셋팅 ( Batch에서 request를 받아올수 없어서 주석처리 문제없음)
	    //connector.setRequestData(request);
	    
	    // 3. 추가 파라메터 셋팅
	    connector.addRequestData("MID", StringUtil.getString(commandMap.get("PAY_MST_MID"),"")); //가맹점 id
	    connector.addRequestData("TID", StringUtil.getString(commandMap.get("PAY_MST_TID"),"")); //승인 응답값으로 받은 거래 구분 Transaction ID
	    connector.addRequestData("CancelAmt", StringUtil.getString(commandMap.get("PAY_MST_AMOUNT"),"")); //취소금액
	    connector.addRequestData("CancelMsg", "고객요청");
	    connector.addRequestData("PartialCancelCode", StringUtil.getString(commandMap.get("PartialCancelCode"),"")); //0:전체취소, 1:부분취소
	    connector.addRequestData("CancelNo", StringUtil.getString(commandMap.get("CancelNo"),""));//부분취소일 경우 식별넘버 필요.
	    
	    connector.addRequestData("actionType", "CL0");              // actionType : CL0 취소, PY0 승인
	    //connector.addRequestData("MallIP", request.getRemoteAddr());// 가맹점 고유 ip
	    connector.addRequestData("MallIP", "127.0.0.1");// 가맹점 고유 ip
	    connector.addRequestData("CancelPwd", this.propertiesService.getString("payment.kakaopay.CANCEL_PWD"));//결제취소비밀번호
	    
	    //가맹점키 셋팅 (MID 별로 틀림) 
	    connector.addRequestData("EncodeKey", this.propertiesService.getString("payment.kakaopay.ENCODE_KEY"));

		// 4. CNSPAY Lite 서버 접속하여 처리
		connector.requestAction();

		// 5. 결과 처리
		String resultCode = connector.getResultData("ResultCode");  // 결과코드 (정상 :2001(취소성공), 2002(취소진행중), 그 외 에러)
		String resultMsg = connector.getResultData("ResultMsg");    // 결과메시지
		String cancelAmt = connector.getResultData("CancelAmt");    // 취소금액
		String cancelDate = connector.getResultData("CancelDate");  // 취소일
		String cancelTime = connector.getResultData("CancelTime");  // 취소시간
		String cancelNum = connector.getResultData("CancelNum");    // 취소번호
		String payMethod = connector.getResultData("PayMethod");    // 취소 결제수단
		String mid =    connector.getResultData("MID");             // 가맹점 ID
		String tid = connector.getResultData("TID");                // 거래 ID
		String errorCD = connector.getResultData("ErrorCD");        // 에러코드
		String errorMsg = connector.getResultData("ErrorMsg");      // 에러메시지
		String AuthDate = cancelDate + cancelTime;                  // 취소거래시간
		String stateCD = connector.getResultData("StateCD");        // 거래상태코드
		String ccPartCl = connector.getResultData("CcPartCl");      // 부분취소 가능여부
		
		logger.info("resultCode====="+resultCode);
	    logger.info("resultMsg====="+resultMsg);
	    logger.info("payMethod====="+payMethod);
	    logger.info("mid====="+mid);
	    logger.info("tid====="+tid);
	    logger.info("cancelAmt====="+cancelAmt);
	    logger.info("cancelNum====="+cancelNum);
	    logger.info("errorCD====="+errorCD);
	    logger.info("errorMsg====="+errorMsg);
	    logger.info("AuthDate====="+AuthDate);
	    logger.info("stateCD====="+stateCD);
	    logger.info("ccPartCl====="+ccPartCl);
	    
	    // 결과코드 2001, 2002만 정상, 그 외는 에러.. LG 에서는 0000이 정상이기 때문에 카카오페이도 2001,2002이면 PAY_MST_RESPCODE에 0000을 넣어준다. 
	    // 에러 코드는 그대로 PAY_MST_RESPCODE에 넣는다.
	    String PAY_MST_RESPCODE = resultCode.equals("2001") || resultCode.equals("2002") ? "0000" : resultCode;
	    
	    if("0000".equals(PAY_MST_RESPCODE)){
	    	commandMap.put("XPAY_RESULT_YN", "Y"); // 정상
			commandMap.put("XPAY_REFUND_YN", "Y"); // 환불완료
	    }
		
	    commandMap.put("PAY_MST_PAYDATE",			AuthDate);//YYYYMMDD 취소때는 이런 형식으로 오기때문에 20 붙여줄 필요가 없음
		commandMap.put("PAY_MST_TR_STATUS",			"C"); // 취소승인
		commandMap.put("PAY_MST_RESPCODE",			PAY_MST_RESPCODE);
		commandMap.put("PAY_MST_RESPMSG",			resultMsg);
		
        logger.info( "결제정상처리여부  = " + StringUtil.getString(commandMap.get("XPAY_RESULT_YN")));
        logger.info("#######[END] 카카오페이 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		return commandMap;
	}	
	

	/** kicc 파라미터 체크 메소드 */
    public String getNullToSpace(String param) { return (param == null) ? "" : param.trim(); }	

    
    
    
}
