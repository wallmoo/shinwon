package com.market.mall.pc.mypage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.model.Code;
import com.market.mall.pc.member.service.MemberDeliveService;
import com.market.mall.pc.mypage.service.MyInfoService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.mypage.service.impl
 * @FileName : MyInfoServiceImpl.java
 * @Date : 2014. 7. 17.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 정보를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("pcMyInfoService")
public class MyInfoServiceImpl implements MyInfoService {

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	
	@Resource(name = "pcMemberDeliveService")
	private MemberDeliveService pcMemberDeliveService;
	
	@Resource   protected Mail mail;	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * <pre>
	 * 1. MethodName : selectCheckPwCount
	 * 2. ClassName  : MyInfoServiceImpl.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 비밀번호 체크
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectCheckPwCount (Map<String,Object> commandMap) throws Exception
	{
		// 비밀번호 인코딩
		String MEM_MST_PW = defaultDAO.selectStr("PcMyInfo.pwdEncoding", commandMap);
		
		System.out.println("############ selectCheckPwCount");
		System.out.println("############ MEM_MST_PW >> " + MEM_MST_PW);
		commandMap.put("MEM_MST_PW", MEM_MST_PW);
		
		// 비밀번호 체크
		return defaultDAO.selectCount("PcMyInfo.selectCheckPwCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMemberInfo
	* 2. ClassName  : MyInfoServiceImpl.java
	* 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 회원상세정보 조회(일반회원,간편회원)
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 12. 11.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectMemberInfo (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.select("PcMyInfo.selectMemberInfo", commandMap);
	}
	
	@Override
	public Map<String, Object> updateMyInfoWithoutErp(HttpServletRequest request, Map<String, Object> commandMap)
			throws Exception {
		commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
		
		int result = 0;
		
		try
		{
		    // 회원정보 수정
            result = defaultDAO.update("PcMyInfo.updateMyInfo", commandMap);
            
            // 수정 성공
            if(result > 0){
                
                // 해당 회원 약관동의 목록
                List<Map<String,Object>> memberAgreeList = defaultDAO.selectList("PcMyInfo.selectMemberAgreeList", commandMap);
                
                String MEM_AGR_TRM_CD = ""; // 정보수신코드
                String OLD_TRM_YN = "";     // 기존 정보수신여부
                String NEW_TRM_YN = "";     // 수정 정보수신여부
                
                for(int i=0; i < memberAgreeList.size(); i++)
                {
                    MEM_AGR_TRM_CD = StringUtil.getString(memberAgreeList.get(i).get("MEM_AGR_TRM_CD"),""); 
                    OLD_TRM_YN = StringUtil.getString(memberAgreeList.get(i).get("MEM_AGR_TRM_YN"),"");     
                    NEW_TRM_YN = StringUtil.getString(commandMap.get("TRM_YN" + MEM_AGR_TRM_CD),"");    
                        
                    if(! OLD_TRM_YN.equals(NEW_TRM_YN))
                    {
                        commandMap.put("MEM_AGR_TRM_CD", MEM_AGR_TRM_CD);
                        commandMap.put("MEM_AGR_TRM_YN", NEW_TRM_YN);
                        
                        // 약관동의 수정
                        defaultDAO.update("PcMyInfo.updateTermsAgree", commandMap);
                    }
                }
                if(commandMap.containsKey("MEM_DLV_ZIP_CDE5")) {
    	        	commandMap.put("MEM_DLV_BSC_YN", "Y");
    		        commandMap.put("MEM_DLV_NM", "기본배송지");
    		        commandMap.put("MEM_DLV_RCV_NM", commandMap.get("MEM_MST_MEM_NM"));
    		        commandMap.put("MEM_DLV_HP1", commandMap.get("MEM_MST_HP1"));
    		        commandMap.put("MEM_DLV_HP2", commandMap.get("MEM_MST_HP2"));
    		        commandMap.put("MEM_DLV_HP3", commandMap.get("MEM_MST_HP3"));
    		        this.pcMemberDeliveService.insertMemberDelive(commandMap);
    	        }
                
                commandMap.put("returnMsg", "S01");
            }
            // 수정 실패
            else
            {
                commandMap.put("returnMsg", "F01");
            }
		} 
		catch(Exception e)
		{
			e.printStackTrace();
			commandMap.put("returnMsg", "E99");
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return commandMap;
		}
		
		return commandMap;
		
	}
	/**
	 * <pre>
	 * 1. MethodName : updateMyInfo
	 * 2. ClassName  : MyInfoServiceImpl.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 수정
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> updateMyInfo (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		Map<String,Object> result = this.updateMyInfoWithoutErp(request,commandMap);
		Map<String,Object> erpParam = new HashMap<String,Object>();
        erpParam.put("ESHOP_ID", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
        erpParam.put("CELL_PHONE_NO1", StringUtil.getString(commandMap.get("MEM_MST_HP1")));
        erpParam.put("CELL_PHONE_NO2", StringUtil.getString(commandMap.get("MEM_MST_HP2")));
        erpParam.put("CELL_PHONE_NO3", StringUtil.getString(commandMap.get("MEM_MST_HP3")));
        erpParam.put("SMS_YN", StringUtil.getString(commandMap.get("TRM_YN0001"),"N"));
		erpParam.put("TM_YN", StringUtil.getString(commandMap.get("TRM_YN0002"),"N"));
		erpParam.put("DM_YN", StringUtil.getString(commandMap.get("TRM_YN0003"),"N"));
		erpParam.put("EMAIL_YN", StringUtil.getString(commandMap.get("TRM_YN0004"),"N"));
		erpParam.put("AD_YN", StringUtil.getString(commandMap.get("TRM_YN0005"),"N"));
		erpParam.put("KKO_YN", StringUtil.getString(commandMap.get("TRM_YN0006"),"N"));
        erpParam.put("EMAIL1", StringUtil.getString(commandMap.get("MAIL_ID")));
        erpParam.put("EMAIL2", StringUtil.getString(commandMap.get("MAIL_DOMAIN")));
        if(commandMap.containsKey("MEM_MST_ZIP_CDE5") &&commandMap.containsKey("MEM_MST_DRO_ADR1")) {
        	erpParam.put("HOME_ZIP_NO", StringUtil.getString(commandMap.get("MEM_MST_ZIP_CDE5")));
            erpParam.put("HOME_ADDR1", StringUtil.getString(commandMap.get("MEM_MST_DRO_ADR1")));
            erpParam.put("HOME_ADDR2", StringUtil.getString(commandMap.get("MEM_MST_DRO_ADR2")));
        }
        ErpRequest.requestMemberModify(erpParam);
		return result;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectCheckCtfEmailCount
	 * 2. ClassName  : MyInfoServiceImpl.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 간편회원 > 이메일 중복체크 및 인증번호 발송  
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selectCheckCtfEmailCount (Map<String,Object> commandMap) throws Exception
	{
	    Map<String,Object> resultMap = new HashMap<String,Object>();
	      
		// 이메일 중복체크
		int result = defaultDAO.selectCount("PcMyInfo.selectCheckCtfEmailCount", commandMap);
		
		//인증번호 발송
		if(result == 0)
		{
			// 인증번호 생성
			int cnt = 10;
	    	StringBuffer certNo = new StringBuffer();
	    	Random random = new Random();
	    	String chars[] = {
					            "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
					            "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
					         };

	    	for (int i = 0; i < cnt; i++) 
	    	{
	    		certNo.append(chars[random.nextInt(chars.length)]);
	    	}
	    	
	    	// 인증번호 생성
	    	commandMap.put("MEM_CTF_NO", certNo.toString());
	    	 
	        // 임시로 JSP로 노출  
            resultMap.put("exposureCertNO", certNo.toString());
            
	    	defaultDAO.insert("PcMyInfo.insertCertNo", commandMap);
	    	  
//	    	/* 메일 발송 시작 */
//	    	Map<String,Object> sendMap = defaultDAO.select("PcJoinMember.selectCertifyInfo", commandMap);
//	    	Map<String,Object> mailMap = new HashMap<String, Object>();
//	    	
//	    	String userNm = FormatUtil.markingName(StringUtil.getString(commandMap.get("MEM_MST_MEM_NM"),""));
//	    	
//			mailMap.put("MAIL_CODE", "8");	// 이메일 코드
//			mailMap.put("MEMBER_EMAIL", StringUtil.getString(sendMap.get("MEM_CTF_MAIL"),""));	//	수신자 이메일
//			mailMap.put("MEMBER_NAME", userNm);	//	수신자 이름
//			mailMap.put("EMAIL_TITLE", "[MarketPlant 프라이스킹] 이메일 변경을 위한 인증번호가 도착하였습니다.");	// 메일 제목
//			
//			StringBuffer resultContent = new StringBuffer();
//    		
//    		StringUtil.textSumDelimiter(resultContent.append(userNm));
//    		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(sendMap.get("MEM_CTF_NO") ,"")));
//    		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(sendMap.get("VAILD_DT"),"")));
//
//    		mailMap.put("EMAIL_CONTENTS", resultContent.toString());	// 메일 내용
//    		
//    		// 해당 업체 Email DB 연동 시
//    		this.mail.mailSend(mailMap);
//    		
//			/* 메일 발송 끝 */
		}
		
	    resultMap.put("result", result);
		
		return resultMap;
	}

	/**
	 * <pre>
	 * 1. MethodName : selectCheckCtfNoCount
	 * 2. ClassName  : MyInfoServiceImpl.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 인증번호 발송된 이메일 간편회원 > 인증번호 체크
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *  
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectCheckCtfNoCount (Map<String,Object> commandMap) throws Exception
	{
		// 이메일이 유무 체크
		int result = defaultDAO.selectCount("PcJoinMember.selectCheckCertMailCount", commandMap);
		
		if(result > 0)
		{
			// 인증번호 체크 전 유효시간 체크
			result = defaultDAO.selectCount("PcMyInfo.selectCheckCtfDtCount", commandMap);
			
			// 유효시간이 지나지 않은 경우
			if(result > 0){
			    
				// 인증번호 체크
				result = defaultDAO.selectCount("PcMyInfo.selectCheckCtfNoCount", commandMap);
			}
			// 유효시간이 지난 경우
			else{
				result = -1;
			}
		}
		else
		{
			result = -2;
		}
		
		return result;
	}
	
    /**
     * <pre>
     * 1. MethodName : updateMemEmail
     * 2. ClassName  : MyInfoServiceImpl.java
     * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 인증완료된 간편회원 > 이메일 update
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 9. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
	public int updateMemEmail (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
		
		// 새로운 Email로 수정 
		int result = defaultDAO.update("PcMyInfo.updateMemEmail", commandMap);
		
		if(result > 0)
		{
		    // 이메일 수정 성공 > 인증번호 받은 이메일 삭제
			defaultDAO.delete("PcMyInfo.deleteCtfEmail", commandMap);
		}
		
		return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : deleteCtfEmail
	* 2. ClassName  : MyInfoServiceImpl.java
	* 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 인증번호 발송된 간편회원 > 간편회원 취소(이메일 변경 하지 않을 경우) > 인증번호 받은 이메일 삭제 
	* 4. 작성자       : DEV_KIMYEONGJUN
	* 5. 작성일       : 2016. 9. 1.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
    public int deleteCtfEmail (Map<String,Object> commandMap) throws Exception
    {
        return defaultDAO.delete("PcMyInfo.deleteCtfEmail", commandMap);
    }
	    
    /**
     * <pre>
     * 1. MethodName : selectCompMemberInfo
     * 2. ClassName  : MyInfoServiceImpl.java
     * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 회원상세정보 조회(기업회원)
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 9. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectCompMemberInfo (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.select("PcMyInfo.selectCompMemberInfo", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : updateMyCompInfo
	 * 2. ClassName  : MyInfoServiceImpl.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 기업회원 > 수정
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 2.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> updateMyCompInfo (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
		commandMap.put("MEM_MST_JBN_ADR1", StringUtil.getString(commandMap.get("MEM_CPR_JBN_ADR1"),""));
		commandMap.put("MEM_MST_DRO_ADR1", StringUtil.getString(commandMap.get("MEM_CPR_DRO_ADR1"),""));
		commandMap.put("MEM_MST_ZIP_CDE5", StringUtil.getString(commandMap.get("MEM_CPR_ZIP_CDE5"),""));
		commandMap.put("MEM_MST_ADR2", StringUtil.getString(commandMap.get("MEM_CPR_ADR2"),""));
		
		int result = 0;
		
		try
		{
		    // 회원테이블 정보 수정
		    result = defaultDAO.update("PcMyInfo.updateMyInfo", commandMap); 
		    
            // 수정 성공
            if(result > 0){
                
                // 해당 회원 약관동의 목록
                List<Map<String,Object>> memberAgreeList = defaultDAO.selectList("PcMyInfo.selectMemberAgreeList", commandMap);
                String MEM_AGR_TRM_CD = ""; // 정보수신코드
                String OLD_TRM_YN = "";     // 기존 정보수신여부
                String NEW_TRM_YN = "";     // 수정 정보수신여부
                
                for(int i=0; i < memberAgreeList.size(); i++)
                {
                    MEM_AGR_TRM_CD = StringUtil.getString(memberAgreeList.get(i).get("MEM_AGR_TRM_CD"),""); 
                    OLD_TRM_YN = StringUtil.getString(memberAgreeList.get(i).get("MEM_AGR_TRM_YN"),"");     
                    NEW_TRM_YN = StringUtil.getString(commandMap.get("TRM_YN" + MEM_AGR_TRM_CD),"");    
                    
                    if(! OLD_TRM_YN.equals(NEW_TRM_YN))
                    {
                        commandMap.put("MEM_AGR_TRM_CD", MEM_AGR_TRM_CD);
                        commandMap.put("MEM_AGR_TRM_YN", NEW_TRM_YN);
                        
                        // 약관동의 수정
                        defaultDAO.update("PcMyInfo.updateTermsAgree", commandMap);
                    }
                }
                
                // 기업회원테이블 정보 수정
                result = defaultDAO.update("PcMyInfo.updateMyCompInfo", commandMap);
                commandMap.put("returnMsg", "S01");
            }
            // 수정 실패
            else
            {
                commandMap.put("returnMsg", "F01");
            }
		}
		catch(Exception e)
		{
			e.printStackTrace();
			commandMap.put("returnMsg", "E99");
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return commandMap;
		}
		
		return commandMap;
	}
	
	/**
    * <pre>
    * 1. MethodName : updateMyPwd
    * 2. ClassName  : MyInfoServiceImpl.java
    * 3. Comment    : 프론트 > 회원정보수정 > 비밀번호 수정
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 9. 2.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateMyPwd (Map<String,Object> commandMap) throws Exception
    {
        return defaultDAO.update("PcMyInfo.updateMyPwd", commandMap);
    }
	
	public int selectCheckOrderCount (Map<String,Object> commandMap) throws Exception
	{
		// 주문상태
		commandMap.put("OST_SEND_END", Code.OST_SEND_END);	// 배송완료
		commandMap.put("OST_FIX", Code.OST_FIX);	// 구매확정
		commandMap.put("OST_SWAP_END", Code.OST_SWAP_END);	// 교환완료
		commandMap.put("OST_SWAP_READY_CANCEL", Code.OST_SWAP_READY_CANCEL);	// 교환취소
		commandMap.put("OST_CANCEL_BEFORE_DEPOSIT", Code.OST_CANCEL_BEFORE_DEPOSIT);	// 주문취소(입금전 취소인 경우 해당 상태가 최종)
		commandMap.put("OST_CANCEL_END", Code.OST_CANCEL_END);	// 취소완료
		commandMap.put("OST_BACK_END", Code.OST_BACK_END);	// 반품완료
		commandMap.put("OST_REFUND_END", Code.OST_REFUND_END);	// 환불완료
		
		return defaultDAO.selectCount("PcMyInfo.selectCheckOrderCount", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : deleteMyInfo
	 * 2. ClassName  : MyInfoServiceImpl.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원탈퇴
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 5.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> deleteMyInfo (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
		
		commandMap.put("MEMBER_TYPE_PRI", Code.COMMON_PRI_MEMBER_GRADE);
		commandMap.put("MEMBER_TYPE_SIMPLE", Code.MEMBER_TYPE_SIMPLE);
		commandMap.put("MEMBER_TYPE_COMP", Code.COMMON_COMP_MEMBER_GRADE);		
	      
        int result = 0;
        String resultMsg = "F01";
		
		try
		{
	        // 간략한 회원정보(회원구분값) 가져오기
	        Map<String,Object> resultMap = defaultDAO.select("PcMyInfo.selectMemInfo", commandMap);
	        
		    if(resultMap!=null && !"".equals(StringUtil.getString(resultMap.get("MEM_MST_MEM_GBN"), ""))){
		        
		        // 회원구분값
	            int MEM_MST_MEM_GBN = StringUtil.getInt(resultMap.get("MEM_MST_MEM_GBN"));

	            // 통합회원인 경우 아이핀정보 삭제
	            if(MEM_MST_MEM_GBN == Code.COMMON_PRI_MEMBER_GRADE)
	            {
	                result = defaultDAO.delete("PcMyInfo.deleteMyIpinInfo", commandMap);
	            }
	            // 기업회원인 경우 기업정보 삭제
	            else if(MEM_MST_MEM_GBN == Code.COMMON_COMP_MEMBER_GRADE)
	            {
	                result = defaultDAO.update("PcMyInfo.deleteMyCompInfo", commandMap);    
	            }  
	            // 간편회원인 경우
	            else if(MEM_MST_MEM_GBN == Code.MEMBER_TYPE_SIMPLE)
	            {
	                result = 1;
	            }
	            
	            if(result > 0)
	            {
	                
	                // 회원탈퇴(회원정보 삭제)
	                result = defaultDAO.update("PcMyInfo.deleteMyInfo", commandMap);    
	                defaultDAO.delete("PcMyInfo.deleteSns", commandMap);  
	                resultMsg = "S01";
	            }
	            // 해당 회원정보 삭제 실패
	            else
	            {
	                resultMsg = "F01";
	            }
		    } 
		    // 데이터 누락(회원구분값)
		    else
		    {  
		        resultMsg = "F02";  
		    }  
		}
		catch(Exception e)
		{
			e.printStackTrace();
			resultMsg = "E99";  
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return commandMap;
		}
		
		commandMap.put("resultMsg", resultMsg);
		
		return commandMap;
	}

	@Override
	public List<Map<String, Object>> selectMemberGrade(HttpServletRequest request, Map<String, Object> commandMap)
			throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("PcMyInfo.selectMemberGrade", commandMap);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectYesterdayLoginUser (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("PcInfoMember.selectYesterdayLoginUser", commandMap);
	}

	@Override
	public void deleteMyInfoList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
		commandMap.put("MEMBER_TYPE_PRI", Code.COMMON_PRI_MEMBER_GRADE);
		commandMap.put("MEMBER_TYPE_SIMPLE", Code.MEMBER_TYPE_SIMPLE);
		commandMap.put("MEMBER_TYPE_COMP", Code.COMMON_COMP_MEMBER_GRADE);
		
		
        Map<String,Object> resultMap = defaultDAO.select("PcMyInfo.selectMemInfo", commandMap);
        // 회원구분값
        int MEM_MST_MEM_GBN = StringUtil.getInt(resultMap.get("MEM_MST_MEM_GBN"));

        // 통합회원인 경우 아이핀정보 삭제
        if(MEM_MST_MEM_GBN == Code.COMMON_PRI_MEMBER_GRADE)
        {
             defaultDAO.delete("PcMyInfo.deleteMyIpinInfo", commandMap);
        }
        // 기업회원인 경우 기업정보 삭제
        else if(MEM_MST_MEM_GBN == Code.COMMON_COMP_MEMBER_GRADE)
        {
            defaultDAO.update("PcMyInfo.deleteMyCompInfo", commandMap);    
        }  
	    if(resultMap!=null && !"".equals(StringUtil.getString(resultMap.get("MEM_MST_MEM_GBN"), ""))){
            // 회원탈퇴(회원정보 삭제)
            defaultDAO.update("PcMyInfo.deleteMyInfo", commandMap);    
            defaultDAO.delete("PcMyInfo.deleteSns", commandMap);  
	    } 
		
	}
	
}
