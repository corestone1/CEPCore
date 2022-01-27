package com.cep.main.service.impl;

import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.main.service.MainService;
import com.cep.main.vo.EmpVO;
import com.cmm.service.ComService;
import com.cmm.service.impl.MailMapper;
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
	
	// TODO mybatis 사용
	@Resource(name="comService")
	private ComService comService;
	
	@Override
	public int loginCheck(HashMap<String, String> map) throws Exception {

		return mapper.selectEmp(map);
	}
	
	@Override
	public int resetPw(HttpServletRequest request, MailVO mailVO) throws Exception {
		int result = 0;
		String newPw = RandomStringUtils.randomNumeric(6);
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		
		String subject = "비밀번호";
		String content = String.join(
				                System.getProperty("line.separator"),
				                ""+CepStringUtil.getDefaultValue(mailVO.getEmpKey(),"")+"님, 회원님의 CEP 계정 비밀번호를 안내합니다.<br>",
				                ""+newPw,
				                "(변경 일자: "+format.format (System.currentTimeMillis())+")<br>",
								"비밀번호는 전체관리자에 의해 관리됩니다.<br> 비밀번호 변경을 원할 시에는 관리자에게 문의하세요.<br><br>");
		
		mailVO.setSubject(subject);
		mailVO.setContent(content);
		mailVO.setIsNewPw(true);
		mailVO.setEmpPw(newPw);
		
		result = comService.sendMail(request, mailVO);
    	
        return result;
	}
	
	@Override
	public String selectName(HashMap<String, String> map) throws Exception {
		return mapper.selectName(map);
	}
	
	@Override
	public EmpVO selectAuthCd(HashMap<String, String> map) throws Exception {
		return mapper.selectAuthCd(map);
	}
	
}
