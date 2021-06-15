package com.market.mall.batch.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.batch.service.BatchCancelOrderService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;


/**
 * @PackageName: com.market.mall.am.batch.service.impl
 * @FileName : updateCartProduct.java
 * @Date : 2014. 8. 6.
 * @프로그램 설명 : 관리자 > 배치작업 관리 를 처리하는 Service Implement Class
 * @author 이미정
 */
@Service("batchCancelOrderService")
public class BatchCancleOrderServiceImpl implements BatchCancelOrderService{

    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    
    /**
     * 
        * <pre>
        * 1. MethodName : selectCancelOrder
        * 2. ClassName  : BatchCancleOrderServiceImpl.java
        * 3. Comment    : 입금만료 일자 기준으로 미입금된 리스트 확인하는 리스트
        * 4. 작성자       : DEV_LEEKWANGWOON
        * 5. 작성일       : 2016. 1. 15.
        * </pre>
        *
        * @param commandMap
        * @return
        * @throws Exception
     */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCancelOrder(Map<String, Object> commandMap) throws Exception 
    {
    	
        String [] arraySet = {StringUtil.getString(Code.PAY_DEPOSIT) , StringUtil.getString(Code.PAY_ESCROW)};
        commandMap.put("ORD_MST_PAY_TYPE", arraySet);        
    	commandMap.put("ORD_PRD_ORD_STATE", Code.OST_PAY_READY);	
 
    	return defaultDAO.selectList("BatchCancelOrder.selectCancelOrder",commandMap);
    }
    
    
	public static String randomString(int length){
		Random rnd =new Random();

		StringBuffer str =new StringBuffer();

		for(int i=0;i<length;i++){
			if(rnd.nextBoolean()){
				str.append(String.valueOf((char)((int)(rnd.nextInt(26))+97)).toLowerCase());
			}else{
				str.append((rnd.nextInt(10)));
			}
		}
		return str.toString();
	}    
	
	
	public static void main(String[] args){
		System.out.println("randomString test >> " + randomString(15));
		String txt = "31423438324430313144384341313935344642453136314545314644324433423631364130454241";
		System.out.println("txt.length >> " + txt.length());
		
	}
    
}
