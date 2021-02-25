package com.cep.mngMaint.bill.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngMaint.bill.service.MngMaintBillService;
import com.cep.mngMaint.bill.vo.MngMaintBillVO;

@Controller
public class MngMaintBillController {
	
	@Resource(name="mngMaintBillService")
	private MngMaintBillService service;
	
	@RequestMapping(value="/mngMaint/bill/list.do")
	public String selectBill(MngMaintBillVO billVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngMaint/bill/list";
	}
}
