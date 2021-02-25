package com.cep.mngProject.mapping.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.mngProject.mapping.service.MngProjectMappingService;
import com.cep.mngProject.mapping.vo.OrderBillVO;
import com.cep.mngProject.order.service.MngProjectOrderService;
import com.cmm.util.CepDisplayUtil;

@Controller
@RequestMapping("/mngProject/mapping")
public class MngProjectMappingController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectMappingController.class);
	
	@Resource(name="mngProjectMappingService")
	private MngProjectMappingService service;
	
	@Resource(name="mngProjectOrderService")
	private MngProjectOrderService orderService;
	
	@RequestMapping(value="/list.do")
	public String selectMapping(@ModelAttribute("searchVO") OrderBillVO searchVO, ModelMap model) throws Exception {
		try {
			model.addAttribute("orderList", service.selectOrderBillList(searchVO));
			model.put("displayUtil", new CepDisplayUtil());
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "mngProject/mapping/list";
	}
	
	@RequestMapping(value="/mappingBill.do")
	@Transactional
	public String mappingBill(@ModelAttribute("searchVO") OrderBillVO searchVO, ModelMap model) throws Exception {
		OrderBillVO resultVO = null;
		try {
		/*	resultVO = service.selectOrderDetail(searchVO);
			model.addAttribute("orderVO", resultVO);*/
			/*resultVO.setBillDtFrom(searchVO.getBillDtFrom());
			resultVO.setBillDtTo(searchVO.getBillDtTo());*/
			resultVO = service.selectOrderDetail(searchVO);
			model.addAttribute("orderVO", resultVO);
			searchVO.setOrderAcKey(resultVO.getOrderAcKey());
			model.addAttribute("billList", service.selectBillDetail(searchVO));
			model.put("displayUtil", new CepDisplayUtil());
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "mngProject/mapping/mappingBill";
	}
	
	@RequestMapping(value="/compMapping.do")
	@ResponseBody
	public Map<String, Object> compMapping(HttpServletRequest request, @RequestBody OrderBillVO orderBillVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.updateOrderBill(request, orderBillVO);
		
		return returnMap;
	}
	
}
