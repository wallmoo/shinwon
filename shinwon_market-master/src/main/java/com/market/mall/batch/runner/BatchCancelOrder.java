package com.market.mall.batch.runner;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.batch.service.BatchCancelOrderService;
import com.market.mall.batch.service.BatchManagerService;
import com.market.mall.batch.service.BatchOrderStateService;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 
    * @PackageName: com.market.mall.batch.runner
    * @FileName : BatchCancelOrder.java
    * @Date : 2016. 1. 15.
    * @프로그램 설명 : Batch > 결제대기 주문 자동취소를 처리하는 Class 
    * @author : DEV_LEEKWANGWOON
 */
@Component
public class BatchCancelOrder {
	
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name="batchManagerService") private BatchManagerService batchManagerService;
    @Resource(name="batchCancelOrderService") private BatchCancelOrderService batchCancelOrderService;
    @Resource(name="batchOrderStateService") private BatchOrderStateService batchOrderStateService;

    /**
     * 
     * <pre>
     * 1. MethodName	: CancelOrder
     * 2. ClassName		: BatchCancelOrder.java
     * 3. Commnet		: 결제대기 주문 일정기간 경과후 자동주문취소
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 11. 19. 오전 11:17:09
     * </pre>
     *
     * @return void
     * @throws Exception
     */
	//@Scheduled(cron="* * * * * *") // every 1 minute  (cron : second, minute, hour, day, month, weekday)
    //@Scheduled(cron="0 0 0 * * *") // every midnight
    //@Scheduled(cron="0 0 */1 * * *") // 매 한시간 마다
	//@Scheduled(fixedDelay = 1000 * 60 * 60 ) // 프로세스 종료 1시간 후 마다 재실행
	//@Scheduled(fixedDelay = 1000 * 5)	// 프로세스 종료 5초 후 마다 재실행
    //@Scheduled(cron="0 50 0 * * *") // 매일 새벽 0시 50분
    //@Scheduled(cron="0 00 4 * * *") // 매일 새벽 4시 00분!
    //@Scheduled(cron="0 5 0 * * *")
	public void CancelOrder() throws Exception{
        
		// 서버IP 확인
    	/*
		String current_server_ip = InetAddress.getLocalHost().getHostAddress();
		String batch_server_ip = StringUtil.getString(propertiesService.getString("batch.runner.server.ip"),"");
		if (!current_server_ip.equals(batch_server_ip))
		{
			return;
		}
		*/
		
		// 스케쥴잡 실행여부
		String excuteYn = StringUtil.getString(propertiesService.getString("batch.runner.excute"),"N");
		if (!excuteYn.equals("Y"))
		{
			return;
		}

		Map<String, Object> commandMap = new HashMap<String,Object>();
		
		commandMap.put("BCH_MST_ID", Code.BATCH_CODE_CANCEL_ORDER); // 배치 아이디 	- 가상계좌 주문 취소:09
		commandMap.put("BCH_MST_NM", Code.BATCH_NAME_CANCEL_ORDER);  // 배치 명 		- [관리] 가상계좌 주문 취소
		commandMap.put("BCH_MST_REQ_ID", Code.BATCH_USER_SCHEDULED);// 배치수행요청ID - SYSTEM-BATCH
		commandMap.put("BCH_MST_REQ_IP", "");// 배치수행요청IP
        
        JSON json = new JSON();
		Map<String, Object> resultMap = new HashMap<String, Object>();

        String errMsg = "";

    	// 현재 실행중인 배치가 있는 지 여부 확인.
        commandMap.put("BCH_MST_STATE", Code.BATCH_RESULT_START);
        int totalCount = this.batchManagerService.selectBatchListCount(commandMap);
        if( totalCount == 0 ){	        
	        
	    	// 배치 수행 시작시 이력 입력
	    	int BCH_MST_IDX = this.batchManagerService.insertBatchInfo(commandMap);
	    	commandMap.put("BCH_MST_IDX", BCH_MST_IDX);
	    	
	    	// 시작시각 업데이트
	    	this.batchManagerService.updateBatchStdt(commandMap);
	    	
	    	try{
	    		// 배치작업.
	        	List<Map<String, Object>> list = this.batchCancelOrderService.selectCancelOrder(commandMap);
	        	
	        	System.out.println("list.size() >>> " + list.size());
	        	
	        	resultMap.put("result", "S");
	        	for( Map<String,Object>orderMap : list )
	        	{
		    		commandMap.put("ORD_MST_CD",  StringUtil.getString(orderMap.get("ORD_MST_CD")));	// 주문번호
	        		commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL);				 	 // 취소접수
	        		commandMap.put("SELECT_REASON", Code.EXPIRED_DEPOSIT_ORDER_CANCEL_CODE); // 자동취소
	        		commandMap.put("ORD_PRD_DSC", "무통장 입금일 기간 만료 자동취소");			 // 취소사유	        		
		    		resultMap = this.batchOrderStateService.updateOrderState(commandMap);
	        	}
	        	
	    		json.put("resultYn","Y");
	    		json.put("message","정상적으로 종료되었습니다.");	    		
	    	}
	    	catch(Exception e){
	    		json.put("resultYn","N");
				json.put("message","에러발생");
		    	
				// 에러메시지 DB 기록
				StringWriter errors = new StringWriter();
				e.printStackTrace(new PrintWriter(errors));
				errMsg = new String(errors.toString());
				errMsg = errMsg.substring(0, Math.min(errMsg.length(), 3800));
				
				if(errMsg == null || "".equals(errMsg)){
					errMsg = (String)resultMap.get("resultMsg");
				}
				
				commandMap.put("BCH_MST_ERRMSG", errMsg );
				
								
	    	}
	    	finally{
	    		
		    	// 종료시각 업데이트 (+결과 업데이트)
				String result = (String)resultMap.get("result");
		    	if( "S".equals(result) ) commandMap.put("BCH_MST_STATE", Code.BATCH_RESULT_END);
		    	else  commandMap.put("BCH_MST_STATE", Code.BATCH_RESULT_FAIL);
		    	this.batchManagerService.updateBatchEtdt(commandMap);
	    	}
			
        }
	}
}
