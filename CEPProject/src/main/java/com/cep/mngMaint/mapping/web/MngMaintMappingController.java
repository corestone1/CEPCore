package com.cep.mngMaint.mapping.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngMaint.mapping.service.MngMaintMappingService;
import com.cep.mngMaint.mapping.vo.MtOrderBillVO;
import com.cep.mngMaint.order.service.MngMaintOrderService;
import com.cmm.util.CepDisplayUtil;

@Controller
@RequestMapping("/mngMaint/mapping")
public class MngMaintMappingController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngMaintMappingController.class);
	
	@Resource(name="mngMaintMappingService")
	private MngMaintMappingService service;
	
	@Resource(name="mngMaintOrderService")
	private MngMaintOrderService orderService;
	
	@RequestMapping(value="/list.do")
	public String selectMapping(@ModelAttribute("searchVO") MtOrderBillVO searchVO, ModelMap model) throws Exception {
		try {
			model.addAttribute("orderList", service.selectOrderBillList(searchVO));
			model.put("displayUtil", new CepDisplayUtil());
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "mngMaint/mapping/list";
	}
	
	@RequestMapping(value="/mappingBill.do")
	public String mappingBill(@ModelAttribute("searchVO") MtOrderBillVO searchVO, ModelMap model) throws Exception {
		
		try {
			model.addAttribute("orderList", service.selectOrderBillList(searchVO));
			model.addAttribute("billList", service.selectBillList(searchVO));
			model.put("displayUtil", new CepDisplayUtil());
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "mngMaint/mapping/mappingBill";
	}
}
