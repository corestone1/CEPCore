package com.cep.mngProject.mapping.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngProject.mapping.service.MngProjectMappingService;
import com.cep.mngProject.mapping.vo.MngProjectMappingVO;

@Controller
public class MngProjectMappingController {
	
	@Resource(name="mngProjectMappingService")
	private MngProjectMappingService service;
	
	@RequestMapping(value="/mngProject/mapping/list.do")
	public String selectMapping(MngProjectMappingVO mappingVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngProject/mapping/list";
	}
}
