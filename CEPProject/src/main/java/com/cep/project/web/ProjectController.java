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
	
	@RequestMapping(value="/projectDetailBd.do")
	public String selectProjectDetailBd(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/projectDetailBd";
	}
	
	@RequestMapping(value="/projectDetailCt.do")
	public String selectProjectDetailCt(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/projectDetailCt";
	}
	
	@RequestMapping(value="/projectDetailOd.do")
	public String selectProjectDetailOd(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/projectDetailOd";
	}
	
	@RequestMapping(value="/writeProject.do")
	public String addProject(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/writeProject";
	}
	

	
	@RequestMapping(value="/writeBasicInfo.do")
	public String addBasicInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/writeBasicInfo";
	}
	
	
	@RequestMapping(value="/writeBiddingInfo.do")
	public String addBiddingInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/writeBiddingInfo";
	}
}
