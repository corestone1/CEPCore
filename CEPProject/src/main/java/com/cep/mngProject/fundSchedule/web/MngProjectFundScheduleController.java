package com.cep.mngProject.fundSchedule.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.fundSchedule.service.MngProjectFundScheduleService;
import com.cep.mngProject.fundSchedule.vo.MngProjectFundScheduleVO;

@Controller
public class MngProjectFundScheduleController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectFundScheduleController.class);
	
	@Resource(name="mngProjectFundScheduleService")
	private MngProjectFundScheduleService service;
	
	@RequestMapping(value="/mngProject/fundSchedule/list.do")
	public String selectFundSchedule(@ModelAttribute("searchVO") MngProjectBillSearchVO searchVO, ModelMap model) throws Exception {
		
		try{
			
			model.addAttribute("billList", service.selectBillScheduleList(searchVO));
			
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		
		
		
		
		return "mngProject/fundSchedule/list";
	}
	
	@RequestMapping(value="/mngProject/fundSchedule/viewProductDetail.do")
	public String selectDetail(MngProjectFundScheduleVO fundScheduleVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngProject/fundSchedule/viewProductDetail";
	}
}
