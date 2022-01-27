package com.cep.main.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.main.service.MainService;
import com.cep.main.vo.EmpVO;
import com.cmm.vo.MailVO;

@Controller
public class MainController {
	
	@Resource(name="mainService")
	private MainService service;
	
	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	EmpVO membersVO;

	@RequestMapping(value = "/login.do")
	@ResponseBody
	public Map<String, Object> login(HttpServletRequest request, @RequestBody EmpVO empVO) throws Exception {
		HttpSession session = request.getSession();
		HashMap<String, String> map = new HashMap<String, String>();
		String name = "";
		String empAuthCd = "";
		String prevUrl = "";
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		String key = empVO.getEmpKey();
		String pw = empVO.getEmpPw();
		
		map.put("empKey", key);
		map.put("empPw", pw);

		int loginIdentify = 0;
		
		try { 
			loginIdentify = service.loginCheck(map);
			name = service.selectName(map);
			empAuthCd = service.selectAuthCd(map).getEmpAuthCd();
		} catch(Exception e) { 
			log.error(null, e);
		}
		log.debug("key====>"+key);
		log.debug("pw====>"+pw);
		log.debug("loginIdentify====>"+loginIdentify);
		if (loginIdentify == 1) {
			log.info("로그인 성공");
			//session.setAttribute("id", id);
			//session.setAttribute("pw", pw);
			log.info(empAuthCd+"=====================");
			session.setAttribute("empAuthCd", empAuthCd);
			session.setAttribute("name", name);
			session.setAttribute("userInfo", map);
			
			prevUrl = (String)session.getAttribute("url");
			returnMap.put("successYN", "Y");
			returnMap.put("prevUrl", prevUrl);
		}
		else {
			log.info("로그인 실패");
			returnMap.put("successYN", "N");
		}

		return returnMap;
	}

	
	@RequestMapping(value="/main.do")
	public String main() {
		/*return "main";*/
		return "main";
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		String logoutUrl = "main";
		session = request.getSession();
		session.removeAttribute("userInfo");
		session.removeAttribute("url");
		return logoutUrl;
	}
	
	@RequestMapping(value = "/resetPw.do")
	public @ResponseBody int resetPw(HttpServletRequest request, @RequestBody MailVO mailVO) throws Exception {
		int result = service.resetPw(request, mailVO);
		
		return result;
	}
	
}
