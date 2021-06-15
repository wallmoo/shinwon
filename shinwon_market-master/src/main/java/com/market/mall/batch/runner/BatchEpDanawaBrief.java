package com.market.mall.batch.runner;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.batch.service.BatchManagerService;
import com.market.mall.ifcomm.ep.service.DanawaEPService;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.batch.runner
 * @FileName : BatchEpDaumAll.java
 * @Date : 2016. 04. 10
 * @프로그램 설명 : Batch > 다음 전체 ep
 * @author yong
 */
@Component
public class BatchEpDanawaBrief {
	
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name="batchManagerService") private BatchManagerService batchManagerService;
    @Resource(name="danawaEPService") private DanawaEPService danawaEPService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
     * 
     * <pre>
     * 1. MethodName	: WeatherApi
     * 2. ClassName		: BatchWeatherApi.java
     * 3. Commnet		: 날씨정보 API 호출하여 가져옴
     * 4. 작성자		: khcho
     * 5. 작성일		: 2015. 01. 05
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
    //@Scheduled(cron="0 40 0 ? * SUN") // 매주 월요일 새벽 0시 40분
    //@Scheduled(cron="0 */1 * * * *")
    //@Scheduled(cron="0 35 7-21 * * * ")	//실제설정
	public void BatchEpDanawaBrief() throws Exception{
        logger.info("===============================");
		// 서버IP 확인
//		String current_server_ip = InetAddress.getLocalHost().getHostAddress();
//		String batch_server_ip = StringUtil.getString(propertiesService.getString("batch.runner.server.ip"),"");
//		if (!current_server_ip.equals(batch_server_ip))
//		{
//			return;
//		}
		// 스케쥴잡 실행여부
		String excuteYn = StringUtil.getString(propertiesService.getString("batch.runner.excute"),"Y");
		if (!excuteYn.equals("Y"))
		{
			return;
		}

		Map<String, Object> commandMap = new HashMap<String,Object>();
		
		commandMap.put("BCH_MST_ID", Code.BATCH_CODE_EP_BRIEF_DANAWA); 	// 배치 아이디 	- "56"
		commandMap.put("BCH_MST_NM", Code.BATCH_NAME_EP_BRIEF_DANAWA); 	// 배치 명 		- [관리] 다나와 EP 데이터 변경분 생성
		commandMap.put("BCH_MST_REQ_ID", Code.BATCH_USER_SCHEDULED);// 배치수행요청ID - SYSTEM-BATCH
		commandMap.put("BCH_MST_REQ_IP", "");						// 배치수행요청IP
        
		
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
//	    		this.batchWeatherApiService.insertWeather();
	    		danawaEPService.makeDanawaBriefProductEP();
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
				String result = "S";
		    	if( "S".equals(result) ) commandMap.put("BCH_MST_STATE", Code.BATCH_RESULT_END);
		    	else  commandMap.put("BCH_MST_STATE", Code.BATCH_RESULT_FAIL);
		    	this.batchManagerService.updateBatchEtdt(commandMap);
	    	}			
        }
	}
}
