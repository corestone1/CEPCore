package com.cmm.util;

/**
 * 메일 관리 클래스
 * @author sylim
 * @since 2020.11.24
 * @version 1.0
 * 
 * <pre>
 * << 개정 이력 >>
 * 
 * 수정일			수정자		수정내용
 * -------			-------		-------------------------------------------------------
 * 2020.11.24	sylim			최초 생성 (메일 존재 여부 판단 불가. 추후 검토 필요)
 * */

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import com.cmm.config.EmailInfo;
import com.cmm.service.impl.MailMapper;

public class CepMailMngUtil {
	// 메일 서버
	private String mailServer =EmailInfo.MAIL_SERVER.getValue();
	
	// port 정보
	private int port = Integer.parseInt(EmailInfo.MAIL_PORT.getValue());
//	EmailInfo.MAIL_PORT.toString()
	
	private MimeMessage message = null;
	private Session session = null;
	
	// 보내는 사람
	private String fromEmail = EmailInfo.MAIL_FROM.getValue();
	// 보내는 사람 이름
	private String senderName = EmailInfo.MAIL_SEND_NAME.getValue();
	// 보내는 사람 메일 계정 비밀번호
	private String senderPassword = EmailInfo.MAIL_SEND_PW.getValue();
	
	// 메일 제목
	private String subject = null;
	// 메일 내용
	private String content = null;
	// 받는 사람
	private String toEmail = null;
	// 바로가기 링크
	private String link = null;
	
	// 보내는 사람 주소
	private Address senderAddress = null;
	// 받는 사람 주소
	private Address[] receiverAddress = null;
	
	@Resource(name="mailMapper")
	private MailMapper mapper;
	
	public CepMailMngUtil() {}
	
	public CepMailMngUtil(String mailServer) {
		setMailServer(mailServer);
	}
	
	public void sendMail() throws UnsupportedEncodingException, MessagingException, Exception {
		if(fromEmail == null || subject == null || content == null || toEmail == null)
			throw new NullPointerException("보내는 이, 받는 이, 제목, 내용은 null값을 허용하지 않습니다.");
		
		initializeMailServer();
		initializeSender();
		initializeReceiver();
		
		send();
	}
	
	private void initializeMailServer() {
		Properties properties = new Properties();
		properties.put("mail.smtp.host", mailServer);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.ssl.trust", mailServer);
		properties.put("mail.smtp.socketFactory.port", port);
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		//session = Session.getDefaultInstance(properties);
		session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() { 
			protected PasswordAuthentication getPasswordAuthentication() { 
				return new PasswordAuthentication(fromEmail, senderPassword); 
			} 
		});

		message = new MimeMessage(session);
	}
	
	private void initializeSender() throws UnsupportedEncodingException {
		if(senderName == null) {
			senderName = fromEmail;
		}
		senderAddress = new InternetAddress(fromEmail, MimeUtility.encodeText(senderName, "UTF-8", "B"));
	}
	
	private void initializeReceiver() throws AddressException {
		ArrayList<String> receiverList = new ArrayList<String>();
		StringTokenizer stMailAddress = new StringTokenizer(toEmail, ";");
		while(stMailAddress.hasMoreElements()) {
			receiverList.add(stMailAddress.nextToken());
		}
		
		receiverAddress = new Address[receiverList.size()];
		for(int i = 0; i < receiverList.size(); i++) {
			receiverAddress[i] = new InternetAddress(receiverList.get(i));
		}
	}
	
	private void send() throws UnsupportedEncodingException, MessagingException, Exception {
		message.setHeader("content-type", "text/html;charset=UTF-8");
		message.setFrom(senderAddress);
		message.setRecipients(Message.RecipientType.TO, receiverAddress);
		message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
		message.setContent(content, "text/html;charset=euc-kr");
		message.setSentDate(new java.util.Date());
		
		/*Transport transport = session.getTransport("smtps");
		transport.connect(mailServer, senderName, senderPassword);
		transport.sendMessage(message, message.getAllRecipients());
		
		*/
		Transport.send(message);
	}
	
	public void setMailServer(String mailServer) {
		this.mailServer = mailServer;
	}
	
	public void setPort(int port) {
		this.port = port;
	}
	
	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail; 
	}
	
	public String getFromEmail() {
		return fromEmail;
	}
	
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	
	public void setSenderPassword(String senderPassword) {
		this.senderPassword = senderPassword;
	}
	
	public void setSubject(String subject) {
		this.subject = "[COBI] " + subject + " 안내";
	}
	
	public String getSubject() {
		return subject;
	}
	
	public void setLink(String link) {
		this.link = link;
	}
	
	public String getLink() {
		return link;
	}
	public void setContent(String content) {
		this.content = String.join(
                System.getProperty("line.separator"),
                "<div style='width:740px; margin: 0 auto; background-color: #7764cb; padding: 20px 50px; line-height: 1.5; font-family: sans-serif; font-size: 18px; border-bottom: 5px solid #4b3a93;'>",
				"<p style='color: #fff; text-align: center; font-size: 25px;'>"+subject+"</p>",
				"</div>",
				"<div style='width:740px; margin: 0 auto; border:1px solid #d8d8d8; padding: 50px; line-height: 1.5; font-family: sans-serif; font-size: 18px; text-align: center;'>",
				"<p>"+content+"</p>",
				"<a href='"+link+"' style='border: none; background-color: #2ebd95; color: #fff; font-size: 16px; margin: 0 auto; padding: 3px 20px; cursor: pointer; text-decoration: none;'>바로가기</a>",
				"</div>");
	}
	
	public String getContent() {
		return content;
	}
	
	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}
	
	public String getToEmail() {
		return toEmail;
	}
}
