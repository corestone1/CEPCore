package com.cep.mngMaint.fundSchedule.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngMaint.fundSchedule.service.MngMaintFundScheduleService;
import com.cep.mngMaint.fundSchedule.vo.MngMaintFundScheduleVO;

@Controller
public class MngMaintFundScheduleController {
	
	@Resource(name="mngMaintFundScheduleService")
	private MngMaintFundScheduleService service;
	
	@RequestMapping(value="/mngMaint/fundSchedule/list.do")
	public String selectFundSchedule(MngMaintFundScheduleVO fundScheduleVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngMaint/fundSchedule/list";
	}
	
	@RequestMapping(value="/mngMaint/fundSchedule/viewProductDetail.do")
	public String selectDetail(MngMaintFundScheduleVO fundScheduleVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngMaint/fundSchedule/viewProductDetail";
	}
}
