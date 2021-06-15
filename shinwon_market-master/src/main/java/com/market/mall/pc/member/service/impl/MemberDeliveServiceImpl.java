package com.market.mall.pc.member.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.member.service.MemberDeliveService;

/**
 * @PackageName: com.market.mall.pc.member.service.impl
 * @FileName : MemberDeliveServiceImpl.java
 * @Date : 2014. 7. 21.
 * @프로그램 설명 :  프론트 > 배송지 관리를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("pcMemberDeliveService")
public class MemberDeliveServiceImpl implements MemberDeliveService{
	 
	@Resource(name="defaultDAO") 
	 private CommonDefaultDAO defaultDAO;

	/**
	* <pre>
	* 1. MethodName : selectMemberDeliveListCount
	* 2. ClassName  : MemberDeliveServiceImpl.java
	* 3. Comment    : 나의 배송지 개수 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMemberDeliveListCount(Map<String, Object> commandMap)	throws Exception {
		return defaultDAO.selectCount("PcMemberDelive.selectMemberDeliveListCount", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : selectMemberDeliveList
	* 2. ClassName  : MemberDeliveServiceImpl.java
	* 3. Comment    : 나의 배송지 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberDeliveList(Map<String, Object> commandMap)	throws Exception {
		return defaultDAO.selectList("PcMemberDelive.selectMemberDeliveList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMemberDeliveInfo
	* 2. ClassName  : MemberDeliveServiceImpl.java
	* 3. Comment    : 나의 배송지 상세
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberDeliveInfo(Map<String, Object> commandMap)	throws Exception {
		Map<String,Object> deliveryInfo = new HashMap<String, Object>();
		
		//-- 목록조회
		User user = (User)commandMap.get("user");
		
		if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			
			//배송지 정보 가져오기
			deliveryInfo = this.defaultDAO.select("PcMemberDelive.selectMemberDeliveInfo", commandMap);
		}
				
		
		return deliveryInfo;
	}

	/**
	* <pre>
	* 1. MethodName : updateMemberDelive
	* 2. ClassName  : MemberDeliveServiceImpl.java
	* 3. Comment    : 나의 배송지 수정 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateMemberDelive(Map<String, Object> commandMap) throws Exception {
		if("Y".equals(StringUtil.getString(commandMap.get("MEM_DLV_BSC_YN"),"N"))){
			//기본배송지로 선택한 경우 기존 기본배송지 N으로..
			defaultDAO.update("PcMemberDelive.updateMemberDeliveBaseN", commandMap);
		}
		return defaultDAO.update("PcMemberDelive.updateMemberDelive", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertMemberDelive
	* 2. ClassName  : MemberDeliveServiceImpl.java
	* 3. Comment    : 나의 배송지 등록
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertMemberDelive(Map<String, Object> commandMap) throws Exception {
		if("Y".equals(StringUtil.getString(commandMap.get("MEM_DLV_BSC_YN"),"N"))){
			//기본배송지로 선택한 경우 기존 기본배송지 N으로..
			defaultDAO.update("PcMemberDelive.updateMemberDeliveBaseN", commandMap);
		}
		
		return defaultDAO.insert("PcMemberDelive.insertMemberDelive", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : updateMemberDeliveBaseY
	* 2. ClassName  : MemberDeliveServiceImpl.java
	* 3. Comment    : 기본배송지로 설정
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateMemberDeliveBaseY (Map<String, Object> commandMap) throws Exception{
		//기존 기본배송지는 N으로..
		defaultDAO.update("PcMemberDelive.updateMemberDeliveBaseN", commandMap);
		
		return defaultDAO.update("PcMemberDelive.updateMemberDeliveBaseY", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : deleteMemberDelive
	* 2. ClassName  : MemberDeliveServiceImpl.java
	* 3. Comment    : 나의 배송지 삭제
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deleteMemberDelive(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.update("PcMemberDelive.deleteMemberDelive", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMemberBaseDeliveInfo
	* 2. ClassName  : MemberDeliveServiceImpl.java
	* 3. Comment    : 기본배송지 가져오기
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 5. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberBaseDeliveInfo(Map<String, Object> commandMap)	throws Exception {
		Map<String,Object> deliveryInfo = new HashMap<String, Object>();
		
		//-- 목록조회
		User user = (User)commandMap.get("user");
		
		if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			
			//배송지 정보 가져오기
			deliveryInfo = this.defaultDAO.select("PcMemberDelive.selectMemberBaseDeliveInfo", commandMap);//기본 배송지
		}
		
		return deliveryInfo;
	}

}
