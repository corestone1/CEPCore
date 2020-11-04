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
		key = request.getParameter("key");
		pw = request.getParameter("pw");
		
		map.put("empKey", key);
		map.put("empPw", pw);

		int loginIdentify = 0;
		
		try { 
			loginIdentify = service.loginCheck(map);
		} catch(Exception e) { }
		
		if (loginIdentify == 1) {
			log.info("로그인 성공");
			//session.setAttribute("id", id);
			//session.setAttribute("pw", pw);
			session.setAttribute("admin", map);

		}
		else {
			log.info("로그인 실패");
		}

		System.out.println(loginIdentify);
		/*System.out.println(key);
		System.out.println(pw);*/
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

