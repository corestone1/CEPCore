package com.cep.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	@RequestMapping(value="/main.do")
	public String selectProject() throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "main";
	}
}
