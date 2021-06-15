package com.market.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.epasscni.util.StringUtil;

import egovframework.rte.fdl.property.EgovPropertyService;

public class MailSender {
	public static int sendMail(final EgovPropertyService propertiesService,String memberEmail,String emailTitle, String emailContents) {
		Properties props =  System.getProperties();
		final String emailId = StringUtil.getString(propertiesService.getString("email.id"),"");
		final String emailPassword = StringUtil.getString(propertiesService.getString("email.password"),"");
		props.put("mail.smtp.host", StringUtil.getString(propertiesService.getString("email.host")));
		props.put("mail.smtp.port", StringUtil.getString(propertiesService.getString("email.port")));
    	props.put("mail.smtp.auth", "true");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=emailId;
			String pw=emailPassword;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); 
			} 
		});
		session.setDebug(true);
		MimeMessage message = new MimeMessage(session);
		InternetAddress[] toList = new InternetAddress[1];
		try {
			toList[0] = new InternetAddress(StringUtil.getString(memberEmail,""));
			message.setFrom(new InternetAddress(StringUtil.getString(emailId,"")));
			message.addRecipients(Message.RecipientType.TO, toList);
			message.setSubject(emailTitle);
			message.setContent(emailContents, "text/html;charset=UTF-8");
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
		
		
	}
}
