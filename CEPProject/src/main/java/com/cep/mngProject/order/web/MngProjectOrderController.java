package com.cep.mngProject.order.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngProject.order.service.MngProjectOrderService;
import com.cep.mngProject.order.vo.MngProjectOrderVO;
import com.cep.project.vo.ProjectVO;

@Controller
@RequestMapping("/mngProject/order")
public class MngProjectOrderController {
	
	@Resource(name="mngProjectOrderService")
	private MngProjectOrderService service;
	
	@RequestMapping(value="/list.do")
	public String selectOrder(MngProjectOrderVO orderVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngProject/order/list";
	}
	
	@RequestMapping(value="/addInfo.do")
	public String addOrderInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngProject/order/addInfo";
	}
}
