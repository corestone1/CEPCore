package com.cep.example.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.example.service.ExampleService;
import com.cep.example.vo.ExampleVO;

@Controller
public class ExampleController {
	
	@Resource(name="exampleService")
	private ExampleService service;
	
	@RequestMapping(value="/example.exampleList.do")
	public String exampleList(ExampleVO exampleVO, ModelMap model) throws Exception {
		
		model.addAttribute("exampleList", service.selectList(exampleVO));
		
		return "example/exampleList";
	}
}
