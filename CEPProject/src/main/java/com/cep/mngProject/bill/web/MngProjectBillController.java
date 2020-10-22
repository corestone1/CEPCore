package com.cep.mngProject.bill.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngProject.bill.service.MngProjectBillService;
import com.cep.mngProject.bill.vo.MngProjectBillVO;

@Controller
public class MngProjectBillController {
	
	@Resource(name="mngProjectBillService")
	private MngProjectBillService service;
	
	@RequestMapping(value="/mngProject/bill/list.do")
	public String selectBill(MngProjectBillVO billVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngProject/bill/list";
	}
}
