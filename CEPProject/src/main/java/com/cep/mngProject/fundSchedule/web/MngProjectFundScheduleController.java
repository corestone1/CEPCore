package com.cep.mngProject.fundSchedule.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngProject.fundSchedule.service.MngProjectFundScheduleService;
import com.cep.mngProject.fundSchedule.vo.MngProjectFundScheduleVO;

@Controller
public class MngProjectFundScheduleController {
	
	@Resource(name="mngProjectFundScheduleService")
	private MngProjectFundScheduleService service;
	
	@RequestMapping(value="/mngProject/fundSchedule/list.do")
	public String selectFundSchedule(MngProjectFundScheduleVO fundScheduleVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngProject/fundSchedule/list";
	}
	
	@RequestMapping(value="/mngProject/fundSchedule/viewProductDetail.do")
	public String selectDetail(MngProjectFundScheduleVO fundScheduleVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngProject/fundSchedule/viewProductDetail";
	}
}
