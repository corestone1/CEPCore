package com.cep.dashboard.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class DashboardController {
	
	@RequestMapping(value="/dashboard/mngSales.do")
	public String selectSalesInfo() throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "dashboard/mngSales";
	}
	
}
