package com.market.mall.batch.runner;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.batch.service.BatchDeleteOrderTempService;
import com.market.mall.batch.service.BatchManagerService;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.batch.runner
 * @FileName : BatchCartProduct.java
 * @Date : 2014. 11. 19.
 * @프로그램 설명 : Batch > 장바구니를 처리하는 Class
 * @author LeeJongHo
 */
@Component
public class BatchDeleteOrderTemp {
	
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name="batchManagerService") private BatchManagerService batchManagerService;
    @Resource(name="batchDeleteOrderTempService") private BatchDeleteOrderTempService batchDeleteOrderTempService;

    /**
     * 
     * <pre>
     * 1. MethodName	: CartProduct
     * 2. ClassName		: BatchCartProduct.java
     * 3. Commnet		: 일정기간이 경과한 장바구니 상품 자동삭제
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
    //@Scheduled(cron="0 0 1 * * *") // 매일 새벽 1시 0분!
    //@Scheduled(cron="0 20 0 * * *")
	public void DeleteOrderTemp() throws Exception{
        
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
		
		commandMap.put("BCH_MST_ID", Code.BATCH_CODE_DELETE_ORDER_TEMP); 	// 배치 아이디 	- 17
		commandMap.put("BCH_MST_NM", Code.BATCH_NAME_DELETE_ORDER_TEMP); // 배치 명 		- [관리] 주문 임시 테이블 삭제
		commandMap.put("BCH_MST_REQ_ID", Code.BATCH_USER_SCHEDULED);// 배치수행요청ID - SYSTEM-BATCH
		commandMap.put("BCH_MST_REQ_IP", "");// 배치수행요청IP
        
        JSON json = new JSON();
		Map<String, Object> resultMap = new HashMap<String, Object>();

        String errMsg = "";

    	// 현재 실행중인 배치가 있는 지 여부 확인.
        commandMap.put("BCH_MST_STATE", Code.BATCH_RESULT_START); //배치수행상태(S:시작,E:종료(성공),F:종료(실패))
        
        // 배치 수행 상태가 'S'인 경우 진행 중(시작 후 종료가 안된 경우) 이므로 'S'인 상태 데이터 갯수 체크 
        int totalCount = this.batchManagerService.selectBatchListCount(commandMap);
        
        // 실행 중인 배치가 있는 경우 - 수동으로 T_BCH_OPT 에서 해당 배치 삭제 (실제 수행 중인 배치가 존재 할 수 있으므로 오류여부 확인 하여 오류인 경우 수동 삭제)
        // 실행 중인 배치가 없는 경우 배치 수행 시작 
        if( totalCount == 0 ){	        
	        
	    	// 배치 수행 시작시 이력 입력
	    	int BCH_MST_IDX = this.batchManagerService.insertBatchInfo(commandMap);
	    	commandMap.put("BCH_MST_IDX", BCH_MST_IDX);
	    	
	    	// 시작시각 업데이트
	    	this.batchManagerService.updateBatchStdt(commandMap);
	    	
	    	try{
	    		// 배치작업.
	    		resultMap = this.batchDeleteOrderTempService.deleteOrderTemp(commandMap);
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
