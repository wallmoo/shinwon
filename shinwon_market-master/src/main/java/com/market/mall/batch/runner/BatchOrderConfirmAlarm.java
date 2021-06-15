package com.market.mall.batch.runner;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.batch.service.BatchManagerService;
import com.market.mall.batch.service.BatchOrderConfirmAlarmService;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.batch.runner
 * @FileName : BatchOrderConfirmAlarm.java
 * @Date : 2016. 3. 15.
 * @프로그램 설명 : 배송완료+1 구매확정 요청 메일 발송 Class
 * @author DEV_KANGHYUNKYU
 */
@Component
public class BatchOrderConfirmAlarm {
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name="batchManagerService") private BatchManagerService batchManagerService;
	@Resource(name="batchOrderConfirmAlarmService") private BatchOrderConfirmAlarmService batchOrderConfirmAlarmService;

    /**
     * 
        * <pre>
        * 1. MethodName : updateOrderConfirmAlarm
        * 2. ClassName  : BatchOrderConfirmAlarm.java
        * 3. Comment    : 배송완료+1 구매확정 요청 메일 발송
        * 4. 작성자       : DEV_LEEKWANGWOON
        * 5. 작성일       : 2016. 1. 13.
        * </pre>
        *
        * @throws Exception
     */    
	//@Scheduled(cron="* * * * * *") // every 1 minute  (cron : second, minute, hour, day, month, weekday)
    //@Scheduled(cron="0 0 0 * * *") // every midnight
    //@Scheduled(cron="0 0 */1 * * *") // 매 한시간 마다
	//@Scheduled(fixedDelay = 1000 * 60 * 60 ) // 프로세스 종료 1시간 후 마다 재실행
	//@Scheduled(fixedDelay = 1000 * 5)	// 프로세스 종료 5초 후 마다 재실행
    //@Scheduled(cron="0 10 1 * * *") // 매일 새벽 1시 10분
    //@Scheduled(cron="0 46 11 * * *")
    //@Scheduled(cron="0 00 3 * * *") // 매일 새벽 3시 00분! 
    //@Scheduled(cron="0 35 0 * * *")
	public void updateOrderConfirmAlarm() throws Exception{
        
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
		
		commandMap.put("BCH_MST_ID", Code.BATCH_CODE_ORDER_CONFIRM_ALARM); // 배치 아이디 	- 45
		commandMap.put("BCH_MST_NM", Code.BATCH_NAME_ORDER_CONFIRM_ALARM); // 배치 명 - [관리] 배송완료 주문 구매확정 요청
		commandMap.put("BCH_MST_REQ_ID", Code.BATCH_USER_SCHEDULED); // 배치수행요청ID - SYSTEM-BATCH
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
	    		resultMap = this.batchOrderConfirmAlarmService.updateOrderConfirmAlarm(commandMap);
	    		json.put("resultYn","Y");
	    		json.put("message","정상적으로 종료되었습니다.");	
	    	}
	    	catch(Exception e){
	    		json.put("resultYn","N");
				json.put("message","에러발생");
		    	
				resultMap.put("result", "F");
				
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
