package com.cep.mngProject.order.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.mngProject.order.service.MngProjectOrderService;
import com.cep.mngProject.order.vo.MngProjectOrderVO;

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
	public String addOrderInfo(MngProjectOrderVO mngProjectOrderVO) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		/*for(MngProjectOrderVO str : mngProjectOrderVO.getList()) {
			System.out.println("orderPmFkKet----------->"+str.getOrderPmFkKey());
			System.out.println("orderUprice-------->"+str.getOrderUprice());
		}*/
		
		return "mngProject/order/addInfo";
	}
	
	@RequestMapping(value="/test.do", method=RequestMethod.POST)
	@ResponseBody
	public String test(@RequestBody MngProjectOrderVO mngProjectOrderVO) throws Exception {
		for(MngProjectOrderVO str : mngProjectOrderVO.getList()) {
			System.out.println("orderPmFkKet----------->"+str.getOrderPmFkKey());
			System.out.println("orderUprice-------->"+str.getOrderUprice());
		}
		return "";
	}
}
