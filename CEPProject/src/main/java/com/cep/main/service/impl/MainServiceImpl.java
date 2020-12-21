package com.cep.main.service.impl;

/**
 * 메인 서비스 클래스
 * @author sylim
 * @since 2020.11.23
 * @version 1.0
 * 
 * <pre>
 * << 개정 이력 >>
 * 
 * 수정일			수정자		수정내용
 * -------			-------		-------------------------------------------------------
 * 2020.11.23	sylim			최초 생성
 * */

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.main.service.MainService;
import com.cep.main.vo.EmpVO;
import com.cmm.service.impl.MailMapper;
import com.cmm.util.CepMailMngUtil;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.MailVO;

@Service("mainService")
public class MainServiceImpl implements MainService {

	private static final Logger log = LoggerFactory.getLogger(MainServiceImpl.class);
	
	// TODO mybatis 사용
	@Resource(name="mainMapper")
	private MainMapper mapper;
	
	// TODO mybatis 사용
	@Resource(name="mailMapper")
	private MailMapper mailMapper;
	
	@Override
	public int loginCheck(HashMap<String, String> map) throws Exception {

		return mapper.selectEmp(map);
	}
	
	@Override
	public int resetPw(HttpServletRequest request) throws Exception {
		EmpVO empVo = new EmpVO();
		MailVO mailVO = new MailVO();
		int result = 0;
		String newPw = RandomStringUtils.randomNumeric(6);
		
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        
		CepMailMngUtil mail = new CepMailMngUtil();
        // 메일 서버 설정
		mail.setMailServer("smtp.gmail.com");
        // 메일 포트 설정
		mail.setPort(465);
		// 보내는 사람 이메일 설정
        mail.setFromEmail("corestone1602@gmail.com");
        // 보내는 사람 메일 계정 이름 설정
        mail.setSenderName("corestone1602");
        // 보내는 사람 메일 계정 비밀번호 설정
        mail.setSenderPassword("hihlljocnbncuicm");
        // 받는 사람 이메일 설정
        mail.setToEmail(CepStringUtil.getDefaultValue(request.getParameter("email"),""));
        // 메일 제목 설정
        mail.setSubject("비밀번호 안내");
        // 메일 내용 설정
        mail.setContent(String.join(
                System.getProperty("line.separator"),
                "<div style='width:720px; margin: 0 auto; border:1px solid #d8d8d8; padding: 50px; line-height: 1.5; font-family: sans-serif; font-size: 18px;'>",
                "<div style='margin-bottom: 30px;'><img style='width: 180px;' src='"+"/corestone.co.kr/common/logo"+"'/></div>",
                "<p><label>"+CepStringUtil.getDefaultValue(request.getParameter("email"),"")+"</label>님, <br>회원님의 CEP 계정 비밀번호를 안내합니다.</p>",
                "<p style='color:blue;'>"+newPw+"<label style='font-size:15px; color:#000;'> (변경 일자: "+format.format (System.currentTimeMillis())+")</label></p>",
                "<p>비밀번호는 전체관리자에 의해 관리됩니다. 비밀번호 변경을 원할 시에는 관리자에게 문의하세요.</p>",
                "</div>"));
        
        empVo.setEmpKey(request.getParameter("email"));
        empVo.setEmpPw(newPw);
        result = mapper.updatePassword(empVo);
    	
        try {
        	if(result != 0) { // 찾고자 하는 이메일 계정이 DB에 있을 때
        		log.info("Sending...");
        		mail.sendMail();
            	mailVO.setFromEmail(mail.getFromEmail());
            	mailVO.setSubject(mail.getSubject());
            	mailVO.setContent(mail.getContent());
            	mailVO.setToEmail(mail.getToEmail());
        		mailVO.setSuccessYn("Y");
        		log.info("Email sent!");
        	} else {
        		mailVO.setFromEmail(mail.getFromEmail());
            	mailVO.setSubject(mail.getSubject());
            	mailVO.setContent(mail.getContent());
            	mailVO.setToEmail(mail.getToEmail());
        		mailVO.setSuccessYn("N");
        	}
			mailMapper.insertMailInfo(mailVO);
        } catch(UnsupportedEncodingException e) {
        	e.printStackTrace();
        } catch(MessagingException e) {
        	e.printStackTrace();
        } catch(Exception e) {
        	e.printStackTrace();
        }
    	
        return result;
	}
	
	@Override
	public String selectName(HashMap<String, String> map) throws Exception {
		return mapper.selectName(map);
	}
	
}
