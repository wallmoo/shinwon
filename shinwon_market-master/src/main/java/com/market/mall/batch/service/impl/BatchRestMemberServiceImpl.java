package com.market.mall.batch.service.impl;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.batch.service.BatchRestMemberService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;


/**
 * @PackageName: com.market.mall.batch.service.impl
 * @FileName : BatchRestMemberServiceImpl.java
 * @Date : 2015. 12. 16
 * @프로그램 설명 : 관리자 > 휴면회원 정보 이관을 처리하는 Service Implement Class
 * @author 김소영
 */
@Service("batchRestMemberService")
public class BatchRestMemberServiceImpl implements BatchRestMemberService{

    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    
    public Map<String, Object> transMember( final Map<String, Object> commandMap) throws Exception 
    {
	
    	commandMap.put("MEM_MST_UPD_IP", InetAddress.getLocalHost().getHostAddress());
    	
    	commandMap.put("COMMON_PRI_MEMBER_GRADE",	Code.COMMON_PRI_MEMBER_GRADE);  //일반회원
    	commandMap.put("MEMBER_TYPE_SIMPLE", 		Code.MEMBER_TYPE_SIMPLE);		//간편회원
    	commandMap.put("COMMON_COMP_MEMBER_GRADE",	Code.COMMON_COMP_MEMBER_GRADE);	//기업회원
    	commandMap.put("MEMBER_BREAK_DOWN", 		Code.MEMBER_BREAK_DOWN);
    	
    	commandMap.put("result", "F");
    	
    	this.defaultDAO.insert("BatchRestMember.insertPoint", commandMap);
    	this.defaultDAO.insert("BatchRestMember.insertRestMember", commandMap);
    	this.defaultDAO.delete("BatchRestMember.deleteMasterMember", commandMap);
    	
    	List<Map<String, Object>> selectRestMember = defaultDAO.selectList("BatchRestMember.selectRestMember", commandMap);
    	
    	for(int i=0;i < selectRestMember.size();i++)
		{
    		
			Map<String, Object> temp =  selectRestMember.get(i); 
			
			// 온라인 회원이 아닌경우만 해당
			if("N".equals(StringUtil.getString(temp.get("ONLINE_YN"))) && StringUtil.getInt(temp.get("MEM_MST_MEM_GBN")) != Code.MEMBER_TYPE_SIMPLE)
			{
				// 회원정보 등록(ERP)
				//erpDAO.insert("BatchRestMemberErp.insertRestMember", temp);
				
				// 회원가입관련 프로시저 호출(ERP)
				Map<String,Object> erpJoinParamMap = new HashMap<String, Object>();
				
				erpJoinParamMap.put("P_AN8", 		StringUtil.getInt(temp.get("P8AN8")));			// 고객번호
				erpJoinParamMap.put("P_E1URCD4", 	temp.get("P8E1URCD4"));							// I/F
				
				//erpDAO.select("BatchRestMemberErp.insertPROC_F58018SM", erpJoinParamMap);    	
			}
		}
    	

		commandMap.put("result", "S");
    	return commandMap;
    }
    
}
