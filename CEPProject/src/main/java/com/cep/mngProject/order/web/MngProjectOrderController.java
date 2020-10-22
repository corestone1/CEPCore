package com.cep.mngProject.order.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngProject.order.service.MngProjectOrderService;
import com.cep.mngProject.order.vo.MngProjectOrderVO;

@Controller
public class MngProjectOrderController {
	
	@Resource(name="mngProjectOrderService")
	private MngProjectOrderService service;
	
	@RequestMapping(value="/mngProject/order/list.do")
	public String selectOrder(MngProjectOrderVO orderVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngProject/order/list";
	}
}
