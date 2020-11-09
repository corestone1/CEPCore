package com.cep.maintenance.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.maintenance.service.MaintenanceService;
import com.cep.maintenance.vo.MaintenanceVO;
import com.cep.project.service.ProjectService;
import com.cep.project.vo.ProjectVO;

@Controller
@RequestMapping("/maintenance")
public class MaintenanceController {
	
	@Resource(name="maintenanceService")
	private MaintenanceService service;
	
	@RequestMapping(value="/list.do")
	public String selectMtList(MaintenanceVO maintenanceVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "maintenance/list";
	}
	
	@RequestMapping(value="/workList.do")
	public String selectMtWorkList(MaintenanceVO maintenanceVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "maintenance/workList";
	}
	
	@RequestMapping(value="/detail/prodInfo.do")
	public String selectMtDetailProdInfo(MaintenanceVO maintenanceVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "maintenance/detail/prodInfo";
	}
	
}
