package com.cep.project.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.project.service.ProjectService;
import com.cep.project.vo.ProjectVO;

@Controller
public class ProjectController {
	
	@Resource(name="projectService")
	private ProjectService service;
	
	@RequestMapping(value="/projectList.do")
	public String selectProject(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/projectList";
	}
	
	@RequestMapping(value="/projectDetail.do")
	public String selectProjectDetail(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/projectDetail";
	}
	
	@RequestMapping(value="/writeProject.do")
	public String addProject(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/writeProject";
	}
}
