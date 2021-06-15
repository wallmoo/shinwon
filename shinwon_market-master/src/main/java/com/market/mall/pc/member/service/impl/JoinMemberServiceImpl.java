package com.market.mall.pc.member.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_WSH_TAG_CONST;
import com.market.mall.common.mail.service.MailService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.model.Code;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.model.tag.WSH_TAG_MODEL;
import com.market.mall.pc.member.service.JoinMemberService;
import com.market.mall.pc.tag.service.TagService;
import com.market.mall.pc.tag.service.WishTagService;
import com.market.util.LoginPasswordCipher;
import com.market.util.ObjectToJsonUtil;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.member.service.impl
 * @FileName : JoinMemberServiceImpl.java
 * @Date : 2016. 8. 30.
 * @프로그램 설명 : 프론트 > 회원가입을 처리하는 Service Implement Class
 * @author DEV_KIMYEONGJUN
 */
@Service("pcJoinMemberService")
public class JoinMemberServiceImpl implements JoinMemberService {
	
	@Resource(name="defaultDAO") 
	private CommonDefaultDAO defaultDAO;  
	
	@Resource(name="propertiesService") 
	protected EgovPropertyService propertiesService;
	
	@Resource   
	protected Mail mail;	
	
	@Resource(name="mailSendingService") 
	protected MailService mailService;
	
	@Autowired
	WishTagService wishTagService;
	
	@Autowired
	TagService tagService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * <pre>
	 * 1. MethodName : selectJoinCheck
	 * 2. ClassName  : JoinMemberServiceImpl.java
	 * 3. Comment    : 가입여부 체크
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selectJoinCheck (Map<String,Object> commandMap) throws Exception
	{
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		String resultMsg = "";
		  
		// CI값으로 가입여부 확인
		int ciCheckCnt = defaultDAO.selectCount("PcJoinMember.selectCheckDI", commandMap);
		 
	    // 미가입 상태
		if(ciCheckCnt <= 0)	
		{  
		    resultMsg = "S01";
		}   
		// CI 값으로 이미 회원가입 되어있음
		else
		{
		    resultMsg = "F01";
		}
 		  
		resultMap.put("resultMsg", resultMsg);
		
		return resultMap;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectCheckIdCount
	 * 2. ClassName  : JoinMemberServiceImpl.java
	 * 3. Comment    : 아이디 중복체크
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 29.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectCheckIdCount (Map<String,Object> commandMap) throws Exception
	{
		Map<String,Object> erpParam = new HashMap<String,Object>();
		erpParam.put("ESHOP_ID", commandMap.get("MEM_MST_MEM_ID"));
		Map<String,Object> erpResponse = ErpRequest.requestIdDupInfo(erpParam);
		
		int webDupCheckResult = defaultDAO.selectCount("PcJoinMember.selectCheckIdCount", commandMap);
		if(webDupCheckResult==1) {return webDupCheckResult;}
		int erpDupCheckResult = Integer.parseInt(("Y".equals(StringUtil.getString(erpResponse.get("MemberIdCheckResult"),"N")))?"1":"0");
		return (erpDupCheckResult==0&&webDupCheckResult==0)? 0 : 1;
	}
	
	@Override
	public int selectCheckNicknameCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("PcJoinMember.selectCheckNicknameCount", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : insertMember
	 * 2. ClassName  : JoinMemberServiceImpl.java
	 * 3. Comment    : 회원가입(통합회원,간편회원,기업회원)
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> insertMember(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
		
		commandMap.put("MEM_MST_REG_IP", request.getRemoteAddr());

		int result = 0;
		String resultMsg = "";
		
		try
		{
			// 회원구분 (일반 / 간편 / 기업)
			String joinType = StringUtil.getString(commandMap.get("joinType"),"");
			
			// 메일 코드
			//String mailCode = "";
			
            /*------------------------------------------------------------------------------------------------------------*/
            /*------------------------------------------ 일반회원(통합회원) ----------------------------------------------*/
            if("memberBasic".equals(joinType)||"memberSns".equals(joinType))
            {
                logger.info("###################################### 일반회원(통합회원) ####################################");
                //CI 값 임시 입력
                commandMap.put("MEM_IPN_CI", StringUtil.getString(commandMap.get("MEM_IPN_CI"),""));
                // CI 필수값 여부 확인
                if(! "".equals(StringUtil.getString(commandMap.get("MEM_IPN_DI"),"")))
                {
                    // 본인인증으로 가입여부 확인
                    int ciCheckCnt = defaultDAO.selectCount("PcJoinMember.selectCheckCI", commandMap);
                    if(ciCheckCnt <= 0)
                    {
                        int idCheckCnt = defaultDAO.selectCount("PcJoinMember.selectCheckIdCount", commandMap);
                        
                        // ID 중복 확인
                        if(idCheckCnt > 0)
                        {
                            commandMap.put("resultMsg", "F11");
                            return commandMap;
                        }
                        
                        commandMap.put("MEM_MST_MEM_GBN", Code.COMMON_PRI_MEMBER_GRADE);  // 일반회원     - 682
                        commandMap.put("MEM_MST_MEM_GRD", Code.PRI_MEMBER_BRONZE_GRADE);     // 일반회원등급 - RED
                            
                        // 회원 테이블 등록
                        String password = StringUtil.getString(commandMap.get("MEM_MST_PW"));
                        commandMap.put("MEM_MST_PW", LoginPasswordCipher.CipherPassword(password));
                        result = defaultDAO.insert("PcJoinMember.insertMember", commandMap);
                        
                        if(result > 0) 
                        {
                            // 본인인증 테이블 등록
                            result = defaultDAO.insert("PcJoinMember.insertCertInfo", commandMap);
                            
                            // 쿠폰 발행
                            //commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_MEMBER_REGIST_5);  // 회원가입 쿠폰
                            //result = defaultDAO.insert("PcJoinMember.insertJoinMemCoupon", commandMap);
                            
                            resultMsg = "S01";
                            // 메일코드
                            // mailCode = "1";
                            
                        }
                        // 등록 실패
                        else
                        {
                            resultMsg = "F99"; 
                        }
                    }
                    // 본인인증으로 이미 가입
                    else
                    {
                        resultMsg = "F13";
                    }
                }
                // 통합회원가입시 CI값 데이터 누락
                else
                {
                    resultMsg = "F12";
                } 
            }
            /*------------------------------------------------------------------------------------------------------------*/
            /*------------------------------------------ 이메일 간편회원 -------------------------------------------------*/
            else if("memberSimple".equals(joinType))
            {
                logger.info("###################################### 이메일 간편회원 ####################################");
                
                int emailCheckCnt = defaultDAO.selectCount("PcJoinMember.selectCheckEmailCount", commandMap);
                
                // 이메일 중복 여부 확인
                if(emailCheckCnt > 0)
                { 
                    commandMap.put("resultMsg", "F21");
                    return commandMap;
                }
                 
                commandMap.put("MEM_MST_MEM_GBN", Code.MEMBER_TYPE_SIMPLE);  // 간편회원 - 1961
                 
                result = defaultDAO.insert("PcJoinMember.insertMember", commandMap);
                
                if(result > 0)
                {
                    // 이메일 인증번호 정보 삭제 
                    result = defaultDAO.delete("PcJoinMember.deleteEmailCertInfo", commandMap);
                    
                    // 쿠폰 발행
                    commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_MEMBER_REGIST_5);
                    result = defaultDAO.insert("PcJoinMember.insertJoinMemCoupon", commandMap);
                    
                    resultMsg = "S01";
                    
                    // 메일코드
                    // mailCode = "2";
                }
                else
                {  
                    resultMsg = "F99";
                }
            }
            /*------------------------------------------------------------------------------------------------------------*/
            /*------------------------------------------------ 기업회원 --------------------------------------------------*/
            else if("memberBusiness".equals(joinType))
            {
                logger.info("######################################## 기업회원 #######################################");
                 
                int checkCnt = defaultDAO.selectCount("PcJoinMember.selectCheckBusinessNoCount", commandMap);
                
                // 기업회원 중복제한 확인
                if(checkCnt >= 5)
                {
                    commandMap.put("resultMsg", "F31");
                    return commandMap;  
                }
                
                commandMap.put("MEM_MST_MEM_GBN", Code.COMMON_COMP_MEMBER_GRADE);   // 기업회원     - 683
                commandMap.put("MEM_MST_MEM_GRD", Code.COMP_MEMBER_BASIC_GRADE);    // 기업회원등급 - 2등급
                
                // 담당자 주소가 따로 없으므로 기업주소를 회원주소에 넣음
                commandMap.put("MEM_MST_ZIP_CDE5", commandMap.get("MEM_CPR_ZIP_CDE5"));
                commandMap.put("MEM_MST_JBN_ADR1", commandMap.get("MEM_CPR_JBN_ADR1"));
                commandMap.put("MEM_MST_DRO_ADR1", commandMap.get("MEM_CPR_DRO_ADR1"));
                commandMap.put("MEM_MST_ADR2", commandMap.get("MEM_CPR_ADR2"));
                 
                // 기업 정보 등록 
                result = defaultDAO.insert("PcJoinMember.insertBusinessInfo", commandMap);
                
                if(result > 0)
                {
                    result = defaultDAO.insert("PcJoinMember.insertMember", commandMap);
                    
                    resultMsg = "S01";
                    
                    // 메일코드
                    // mailCode = "3";
                }
                else
                {
                    resultMsg = "F99";  
                }
            }
			
            /*------------------------------------------------------------------------------------------------------------*/
            /*------------------------------------------------ 약관동의 --------------------------------------------------*/
            String[] TERMS_AGREE_ARR = Code.TERMS_AGREE_ARR;  // 각 약관동의 값들의 배열
            String MEM_AGR_TRM_CD = "";                       // 약관동의 코드 값
            String MEM_AGR_TRM_YN = "";                       // 약관동의 여부체크
            
			// 마이그레이션 이유로 이용약관이 다중 등록 되어 있는 경우 에러 발생을 막고자 
			// 약관 등록 전에 해당 아이디로 약관 삭제함.
			defaultDAO.insert("PcMyInfo.deleteMyAgreement", commandMap);
			
			// 약관동의 등록
			for(int i=0; i < TERMS_AGREE_ARR.length; i++)
			{
				MEM_AGR_TRM_CD = TERMS_AGREE_ARR[i];  // 약관동의 코드 값
				MEM_AGR_TRM_YN = StringUtil.getString(commandMap.get("TRM_YN000" + (i+1)),"");  // 약관동의 여부체크
				
				commandMap.put("MEM_AGR_TRM_CD", MEM_AGR_TRM_CD);
				commandMap.put("MEM_AGR_TRM_YN", MEM_AGR_TRM_YN);
				
				result = defaultDAO.insert("PcJoinMember.insertTermsAgree", commandMap);
			}  
			
			memberTagInfoInsert(commandMap,StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"),""));
		}
		catch(Exception e)
		{  
			e.printStackTrace(); 
			commandMap.put("resultMsg", "E99");
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return commandMap;
		}
		mailService.sendJoinusComplete(commandMap);
		commandMap.put("resultMsg", resultMsg);
		
		return commandMap;
	}

	/**
	 * <pre>
	 * 1. MethodName : selectCheckEmailCount
	 * 2. ClassName  : JoinMemberServiceImpl.java
	 * 3. Comment    : 이메일 중복체크 및 인증번호 저장
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selectCheckEmailCount (Map<String,Object> commandMap) throws Exception
	{
	    Map<String,Object> resultMap = new HashMap<String,Object>();
	    
		// 이메일 중복체크
		int result = defaultDAO.selectCount("PcJoinMember.selectCheckEmailCount", commandMap);
		
		// 인증번호 발송    
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
	    	
	    	defaultDAO.insert("PcJoinMember.insertCertifyNo", commandMap);
	    	
//	    	/* 메일 발송 시작 */
//	    	Map<String,Object> sendMap = defaultDAO.select("PcJoinMember.selectCertifyInfo", commandMap);
//	    	Map<String,Object> mailMap = new HashMap<String, Object>();
//	    	
//	    	String userNm = FormatUtil.markingName(StringUtil.getString(commandMap.get("MEM_MST_MEM_NM"),""));
//	    	
//			mailMap.put("MAIL_CODE", "7");	// 이메일 코드
//			mailMap.put("MEMBER_EMAIL", StringUtil.getString(sendMap.get("MEM_CTF_MAIL"),""));	//	수신자 이메일
//			mailMap.put("MEMBER_NAME", userNm);	//	수신자 이름
//			mailMap.put("EMAIL_TITLE", "[전자랜드 프라이스킹] 회원가입을 위한 인증번호가 도착하였습니다.");	// 메일 제목
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
//    		// this.mail.mailSend(mailMap);
		}
		 
		resultMap.put("result", result);
		
		return resultMap;
	}
	
    /**
    * <pre>
    * 1. MethodName : selectCheckCertNoCount
    * 2. ClassName  : JoinMemberServiceImpl.java
    * 3. Comment    : 인증번호 체크 
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCheckCertNoCount (Map<String,Object> commandMap) throws Exception
    {
        // 인증 테이블에 이메일이 있는지 여부 체크
        int result = defaultDAO.selectCount("PcJoinMember.selectCheckCertMailCount", commandMap);
        
        if(result > 0)
        {
            // 인증번호 체크 전 유효시간 체크
            result = defaultDAO.selectCount("PcJoinMember.selectCheckCertDtCount", commandMap);
            
            // 유효시간이 지나지 않은 경우
            if(result > 0){
                // 인증번호 체크
                result = defaultDAO.selectCount("PcJoinMember.selectCheckCertNoCount", commandMap);
            }
            // 유효시간이 지난 경우
            else{
                result = -1;
            }
        }
        else{
            result = -2;
        }
        
        return result;
    }
	    
	/**
	 * <pre>
	 * 1. MethodName : selectCheckSnsIdCount
	 * 2. ClassName  : JoinMemberServiceImpl.java
	 * 3. Comment    : SNS 아이디로 가입여부 확인
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 21.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public int selectCheckSnsIdCount(Map<String, Object> commandMap) throws Exception {
        
        return defaultDAO.selectCount("PcJoinMember.selectCheckSnsIdCount", commandMap);
    }
      
	/**
	 * <pre>
	 * 1. MethodName : insertSnsMember
	 * 2. ClassName  : JoinMemberServiceImpl.java
	 * 3. Comment    : SNS 간편 회원가입
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 19.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> insertSnsMember(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
	    
	    commandMap.put("MEM_MST_REG_IP", request.getRemoteAddr());  // 등록 IP 
	    commandMap.put("MEM_SNS_REG_IP", request.getRemoteAddr());  // 등록 IP 

        Map<String, Object> returnMap = new HashMap<String, Object>();     
        
        try
        { 
            // 아이디 중복 확인
            int checkIdCnt = defaultDAO.selectCount("PcJoinMember.selectCheckIdCount", commandMap);
            
            if(checkIdCnt > 0)
            {
                // 아이디 중복   
                returnMap.put("resultMsg", "F01");
            }
            else
            {
                // 가입유형 타입
                String joinType = StringUtil.getString(commandMap.get("joinType"),""); 
                
                
                // SNS 아이디로 가입여부 확인
                int snsIdJoinCnt = defaultDAO.selectCount("PcJoinMember.selectCheckSnsIdCount", commandMap);
                  
                if(snsIdJoinCnt > 0)
                {
                    // SNS 아이디 이미 가입  
                    returnMap.put("resultMsg", "F02");
                }
                else
                {
                    // SNS 테이블 등록
                    int result = defaultDAO.insert("PcJoinMember.insertSnsMember", commandMap);
                    
                    if(result > 0)
                    {
                    	Map<String,Object> memberInsertResult = this.insertMember(request, commandMap);
                    	
                        if("S01".equals(StringUtil.getString(memberInsertResult.get("resultMsg"))))
                        {
                            // 회원가입 성공
                            returnMap.put("resultMsg", "S01");
                        } 
                        else
                        {    
                            // 회원가입 실패 
                            returnMap.put("resultMsg", "F03");
                        }
                    } 
                    else
                    {   
                        // SNS 테이블 등록 실패 
                        returnMap.put("resultMsg", "F04");
                    }
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
            returnMap.put("resultMsg", "E99");  
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        } 
       
        return returnMap;       
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectCheckBusinessNoCount
	 * 2. ClassName  : JoinMemberServiceImpl.java
	 * 3. Comment    : 사업자 번호 체크
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectCheckBusinessNoCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("PcJoinMember.selectCheckBusinessNoCount", commandMap);
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectBusinessInfo
	 * 2. ClassName  : JoinMemberServiceImpl.java
	 * 3. Comment    : 프론트 > 회원가입 > 기업회원 > 사업자등록번호에 대한 기업의 아이디 목록
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectBusinessInfo (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("PcJoinMember.selectBusinessInfo", commandMap);
	}
	private void memberTagInfoInsert (Map<String,Object> commandMap,String MEM_MST_MEM_ID) throws Exception {
		//희망태그 등록
        String wishTagListString = commandMap.get(PARAM_WSH_TAG_CONST.WSH_TAG_TITLE_LIST).toString().trim();
        if(wishTagListString!=null && !wishTagListString.isEmpty() && !wishTagListString.contains("#")) {
        	List<String> tagList = StringUtil.tagListStringToList(wishTagListString);
            if(!tagList.isEmpty()) {
            	commandMap.put(WSH_TAG_MODEL.REG_ID, MEM_MST_MEM_ID);
            	commandMap.put(WSH_TAG_MODEL.WSH_TAG_TYPE, CONTENTS_TYPE_CODE.TYPE_MEMBER);
            	commandMap.put(PARAM_WSH_TAG_CONST.WSH_TAG_TITLE_LIST, tagList);
            	this.wishTagService.insertWithTagList(commandMap);
            }
        }
        String tagList = commandMap.get("TAG_LIST").toString();
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        List<Map<String, Object>> tagDataList = mapper.readValue(tagList, typeRef);
        
        if(tagDataList!=null && !tagDataList.isEmpty()) {
        	Map<String,Object> param = new HashMap<String,Object>();
        	JSONArray jsonArray = new JSONArray();
        	for(int i=0;i<tagDataList.size();i++) {
        		Map<String,Object> map = tagDataList.get(i);
            	map.put(TAG_MODEL.TAG_BND_ID, MEM_MST_MEM_ID);
            	JSONObject object = ObjectToJsonUtil.objectToJson(map);
            	jsonArray.add(object);
            }
        	param.put(TAG_MODEL.TAG_ID_LIST, jsonArray.toString());
        	param.put(TAG_MODEL.TAG_BND_ID, MEM_MST_MEM_ID);
        	this.tagService.insertTagBind(param);
        }
	}

}
