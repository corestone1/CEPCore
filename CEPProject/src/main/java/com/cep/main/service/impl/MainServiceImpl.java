package com.cep.main.service.impl;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Service;

import com.cep.main.service.MainService;
import com.cep.main.vo.EmpVO;
import com.cmm.util.StringUtil;

@Service("mainService")
public class MainServiceImpl implements MainService {

	// TODO mybatis 사용
	@Resource(name="mainMapper")
	private MainMapper mapper;
	
	@Override
	public int loginCheck(HashMap<String, String> map) throws Exception {

		return mapper.selectEmp(map);
	}
	
	@Override
	public int resetPw(HttpServletRequest request) throws Exception {
		EmpVO empVo = new EmpVO();
		int result = 0;
		String newPw = RandomStringUtils.randomNumeric(6);
		
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		
		String FROM = "corestone1602@gmail.com";
        String TO = StringUtil.nullToString(request.getParameter("email"));
        
        System.out.println(TO+"============");
        String SMTP_USERNAME = "corestone1602";
        String SMTP_PASSWORD = "tqcjpixcjkfewfev";
        
        String HOST = "smtp.gmail.com";
        int PORT = 465;
        
        String SUBJECT = "비밀번호 안내";
        
        String BODY = String.join(
            System.getProperty("line.separator"),
            "<div style='width:720px; margin: 0 auto; border:1px solid #d8d8d8; padding: 50px; line-height: 1.5; font-family: sans-serif; font-size: 18px;'>",
            "<div style='margin-bottom: 30px;'><img style='width: 180px;' src='"+"/corestone.co.kr/common/logo"+"'/></div>",
            "<p><label>"+TO+"</label>님, <br>회원님의 CEP 계정 비밀번호를 안내합니다.</p>",
            "<p style='color:blue;'>"+newPw+"<label style='font-size:15px; color:#000;'> (변경 일자: "+format.format (System.currentTimeMillis())+")</label></p>",
            "<p>비밀번호는 전체관리자에 의해 관리됩니다. 비밀번호 변경을 원할 시에는 관리자에게 문의하세요.</p>",
            "</div>"
        );
        
        empVo.setEmpKey(request.getParameter("email"));
        empVo.setEmpPw(newPw);
        result = mapper.updatePassword(empVo);
    	
    	Properties props = System.getProperties();
    	props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.port", PORT); 
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", HOST);
        
        Session session = Session.getDefaultInstance(props);
        
        session.setDebug(true);
 
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(FROM));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
        msg.setSubject(SUBJECT);
        msg.setContent(BODY, "text/html;charset=euc-kr");
        
        /*Transport transport = session.getTransport();*/
        Transport transport = session.getTransport("smtps");
        
        try {
            System.out.println("Sending...");
            
            transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
            transport.sendMessage(msg, msg.getAllRecipients());
 
            System.out.println("Email sent!");
        } catch (Exception ex) {
            ex.printStackTrace();
 
        } finally {
            transport.close();
        }
        
        return result;
	}
	
	@Override
	public String selectName(HashMap<String, String> map) throws Exception {
		return mapper.selectName(map);
	}
	
}
