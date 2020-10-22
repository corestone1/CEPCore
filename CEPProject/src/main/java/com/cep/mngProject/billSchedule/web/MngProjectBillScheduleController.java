package com.cep.mngProject.billSchedule.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngProject.billSchedule.service.MngProjectBillScheduleService;
import com.cep.mngProject.billSchedule.vo.MngProjectBillScheduleVO;

@Controller
public class MngProjectBillScheduleController {
	
	@Resource(name="mngProjectBillScheduleService")
	private MngProjectBillScheduleService service;
	
	@RequestMapping(value="/mngProject/billSchedule/list.do")
	public String selectBillSchedule(MngProjectBillScheduleVO billScheduleVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngProject/billSchedule/list";
	}
}
