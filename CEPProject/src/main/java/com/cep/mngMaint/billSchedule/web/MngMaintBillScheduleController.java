package com.cep.mngMaint.billSchedule.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngMaint.billSchedule.service.MngMaintBillScheduleService;
import com.cep.mngMaint.billSchedule.vo.MngMaintBillScheduleVO;

@Controller
public class MngMaintBillScheduleController {
	
	@Resource(name="mngMaintBillScheduleService")
	private MngMaintBillScheduleService service;
	
	@RequestMapping(value="/mngMaint/billSchedule/list.do")
	public String selectBillSchedule(MngMaintBillScheduleVO billScheduleVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngMaint/billSchedule/list";
	}
}
