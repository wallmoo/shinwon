package com.market.mall.batch.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.ibm.icu.math.BigDecimal;
import com.market.mall.batch.service.BatchMemberGradeMonthService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.model.Code;
import com.market.util.MailSender;
import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * 
    * @PackageName: com.market.mall.batch.service.impl
    * @FileName : BatchMemberGradeMonthServiceImpl.java
    * @Date : 2016. 1. 20.
    * @프로그램 설명 : 최근 6개월 구매금액에 따른 회원등급 상향조정 처리하는  Class
    * @author : DEV_LEEKWANGWOON
 */
@Service("batchMemberGradeMonthService")
public class BatchMemberGradeMonthServiceImpl implements BatchMemberGradeMonthService{

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * <pre>
	 * 1. MethodName : updateMemberGradeMonth
	 * 2. ClassName  : BatchMemberGradeMonthServiceImpl.java
	 * 3. Comment    : 개인회원 등급 변경처리
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 1. 20.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	public Map<String, Object> updateMemberGradeMonth( final Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("result", "F");
    	
		commandMap.put("IGNO_ORD_PRD_ORD_STATE", Code.OST_SWAP_IGNORE_ARR);	// 교환관련 주문상태
		commandMap.put("ORD_PRD_ORD_STATE", 	 Code.OST_FIX);	// 구매확정
		commandMap.put("MEM_MST_MEM_GBN", 	 	 Code.COMMON_PRI_MEMBER_GRADE);	// 개인회원    	
		commandMap.put("MASK", 	 	 "?");	// 물음표 파람처리    	

		/**
		 *  step 1. 전체회원 조회
         **/
    	List<Map<String, Object>> list = defaultDAO.selectList("BatchMemberGradeMonth.selectMemberAllId", commandMap);
    	
    	String MEM_MST_MEM_ID="";
    	String MEM_MST_MAIL="";
		/**
		 *  step 2. 회원 등급변경 정보 조회
         **/
		
		  for(int i=0;i<list.size();i++) {
		     		MEM_MST_MEM_ID =list.get(i).get("MEM_MST_MEM_ID").toString();

    		commandMap.put("MEM_MST_MEM_ID", MEM_MST_MEM_ID);	// 회원ID
    		commandMap.put("ORD_MST_ORD_ID", MEM_MST_MEM_ID);	// 회원ID

    		List<Map<String, Object>> gradeInfo = defaultDAO.selectList("BatchMemberGradeMonth.selectMemberGradeInfo", commandMap);
            
    		int DOWN=0;
 			
    		/**
    		 *  step3  회원 등급변경 사항이 존재하면 변경 
             **/
    		if (gradeInfo.get(0).get("MEM_GRD_CD_CHG").equals("U")) {
 	    		commandMap.put("UPDATE_CMN_COM_IDX", gradeInfo.get(0).get("MEM_GRD_CD_NEW"));
 	    		commandMap.put("MEM_MST_BUY_AMT", gradeInfo.get(0).get("ORD_PRD_ORD_PRC"));
 	    		
 	    		defaultDAO.update("BatchMemberGradeMonth.updateMemberGradeMonth", commandMap);

 	    		/**
 	    		 *  step4-1  회원 등급변경 사항이 존재하면 쿠폰도 준다 
 	             **/
 	    		commandMap.put("MEM_GRD_CD", gradeInfo.get(0).get("MEM_GRD_CD"));	// 신규등업
 	    		List<Map<String, Object>> gradeCoupon = defaultDAO.selectList("BatchMemberGradeMonth.selectGrdCoupon", commandMap);

 	    		if (gradeCoupon.size() >0) {
 	 	    		commandMap.put("CPN_MST_IDX", gradeCoupon.get(0).get("CPN_MST_IDX"));	
 	 	    		defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);
 	    		}
 	    		

 	    		/**
 	    		 *  step4-2  회원 등급변경 사항이 존재하면 포인트도 준다
 	             **/
 	    		BigDecimal bigDecimal = new BigDecimal(""+gradeInfo.get(0).get("MEM_GRD_CD_NEW"));
 	    		 
 	            int MEM_GRD_CD_NEW =bigDecimal.intValue();
 	            
 	    		commandMap.put("MEM_GRD_CD_NEW", gradeInfo.get(0).get("MEM_GRD_CD_NEW"));	// 신규등업
 	 	    	List<Map<String, Object>> gradePoint = defaultDAO.selectList("BatchMemberGradeMonth.selectGrdPoint", commandMap);
 	    		
 	 	    	if (gradePoint.size() >0) {
 	 	 	    	commandMap.put("PIT_MST_IDX", gradePoint.get(0).get("PIT_MST_IDX"));	// PIT_MST_IDX
 	 	 	    	commandMap.put("MEM_PIT_PLS", gradePoint.get(0).get("PIT_MST_PIT"));	// PIT_MST_PIT
 	 	 	    	
 	 	    		BigDecimal bigDecimalp = new BigDecimal(""+gradeInfo.get(0).get("MEM_PIT_TOT_PIT"));
 	 	    		BigDecimal bigDecimals = new BigDecimal(""+gradePoint.get(0).get("PIT_MST_PIT"));
 	 	 	    		
 	 	 	    	int MEM_PIT_TOT_PIT =bigDecimalp.intValue();
 	 	 	    	int PIT_MST_PIT =bigDecimals.intValue();
 	 	 	    		
 	 	 	    	int MEM_PIT_TOT_SUM_PIT =MEM_PIT_TOT_PIT+PIT_MST_PIT;
 	 	 	    		
 	 	 	    	commandMap.put("MEM_PIT_TOT_PIT", MEM_PIT_TOT_SUM_PIT);	// 신규등업
 	 	 	    		
 	 	 	    	defaultDAO.insert("BatchMemberGradeMonth.insertDwnPoint", commandMap);
 	    		}
 	    		
 	    		/**
 	    		 *  step5  회원 등급변경 사항 이메일 발송 
 	             **/
	    	  	//sendMail(propertiesService, "MEM_MST_MAIL", "emailTitle", "emailContents");
    		} else if (gradeInfo.get(0).get("MEM_GRD_CD_CHG").equals("D")) {// 등급 업데이트 하향
 	    		commandMap.put("UPDATE_CMN_COM_IDX", gradeInfo.get(0).get("MEM_GRD_CD_NEW"));
 	    		commandMap.put("MEM_MST_BUY_AMT", gradeInfo.get(0).get("ORD_PRD_ORD_PRC"));
 	    		defaultDAO.update("BatchMemberGradeMonth.updateMemberGradeMonth", commandMap);

 	    		/**
 	    		 *  step4-1  회원 등급변경 사항이 존재하면 쿠폰도 준다 
 	             **/
 	    		commandMap.put("MEM_GRD_CD", gradeInfo.get(0).get("MEM_GRD_CD_NEW"));	// 신규등업
 	    		List<Map<String, Object>> gradeCoupon = defaultDAO.selectList("BatchMemberGradeMonth.selectGrdCoupon", commandMap);

 	    		if (gradeCoupon.size() >0) {
 	 	    		commandMap.put("CPN_MST_IDX", gradeCoupon.get(0).get("CPN_MST_IDX"));	
 	 	    		defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);
 	    		}
 	    		

 	    		/**
 	    		 *  step4-2  회원 등급변경 사항이 존재하면 포인트도 준다
 	             **/
 	    		BigDecimal bigDecimal = new BigDecimal(""+gradeInfo.get(0).get("MEM_GRD_CD_NEW"));
 	    		 
 	            int MEM_GRD_CD_NEW =bigDecimal.intValue();
 	            
 	    		commandMap.put("MEM_GRD_CD_NEW", gradeInfo.get(0).get("MEM_GRD_CD_NEW"));	// 신규등업
 	 	    	List<Map<String, Object>> gradePoint = defaultDAO.selectList("BatchMemberGradeMonth.selectGrdPoint", commandMap);
 	    		
 	 	    	if (gradePoint.size() >0) {
 	 	 	    	commandMap.put("PIT_MST_IDX", gradePoint.get(0).get("PIT_MST_IDX"));	// PIT_MST_IDX
 	 	 	    	commandMap.put("MEM_PIT_PLS", gradePoint.get(0).get("PIT_MST_PIT"));	// PIT_MST_PIT
 	 	 	    	
 	 	    		BigDecimal bigDecimalp = new BigDecimal(""+gradeInfo.get(0).get("MEM_PIT_TOT_PIT"));
 	 	    		BigDecimal bigDecimals = new BigDecimal(""+gradePoint.get(0).get("PIT_MST_PIT"));
 	 	 	    		
 	 	 	    	int MEM_PIT_TOT_PIT =bigDecimalp.intValue();
 	 	 	    	int PIT_MST_PIT =bigDecimals.intValue();
 	 	 	    		
 	 	 	    	int MEM_PIT_TOT_SUM_PIT =MEM_PIT_TOT_PIT+PIT_MST_PIT;
 	 	 	    		
 	 	 	    	commandMap.put("MEM_PIT_TOT_PIT", MEM_PIT_TOT_SUM_PIT);	// 신규등업
 	 	 	    		
 	 	 	    	defaultDAO.insert("BatchMemberGradeMonth.insertDwnPoint", commandMap);
 	    		}

 	    		/**
 	    		 *  step5  회원 등급변경 사항 이메일 발송 
 	             **/
	    	  	   //sendMail(propertiesService, "MEM_MST_MAIL", "emailTitle", "emailContents");
    		} else {
 	    		commandMap.put("UPDATE_CMN_COM_IDX", gradeInfo.get(0).get("MEM_GRD_CD_NEW"));	// 등급 업데이트 상향
 	    		commandMap.put("MEM_MST_BUY_AMT", gradeInfo.get(0).get("ORD_PRD_ORD_PRC"));
 	    		defaultDAO.update("BatchMemberGradeMonth.updateMemberGradeMonth", commandMap);
    		}
		} 
    	commandMap.put("result", "S");
    	return commandMap;
    }	
    
	public static int sendMail(final EgovPropertyService propertiesService,String memberEmail,String emailTitle, String emailContents) {

		
        final String user = ""; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        final String password = "";   // 패스워드

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(user)); 

            // Subject
            message.setSubject(""); //메일 제목을 입력

            // Text
            message.setText(emailContents, "text/html;charset=UTF-8");    //메일 내용을 입력

            // send the message
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		return 0;
    }
}
