package com.cep.main.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.main.service.MainService;
import com.cep.main.vo.EmpVO;

@Controller
public class MainController {
	
	@Resource(name="mainService")
	private MainService service;
	
	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	EmpVO membersVO;

	@RequestMapping(value = "/login.do")
	@ResponseBody
	public int login(String key, String pw, HttpServletRequest request){
		HttpSession session = request.getSession();
		HashMap<String, String> map = new HashMap<String, String>();
		String name = "";
		
		key = request.getParameter("key");
		pw = request.getParameter("pw");
		
		map.put("empKey", key);
		map.put("empPw", pw);

		int loginIdentify = 0;
		
		try { 
			loginIdentify = service.loginCheck(map);
			name = service.selectName(map);
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
			session.setAttribute("name", name);
			session.setAttribute("admin", map);

		}
		else {
			log.info("로그인 실패");
		}

		return loginIdentify;
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
		session.removeAttribute("admin");
		return logoutUrl;
	}
	
	@RequestMapping(value = "/resetPw.do")
	public @ResponseBody int resetPw(HttpServletRequest request) throws Exception {
		int result = service.resetPw(request);
		
		return result;
	}
	
}
