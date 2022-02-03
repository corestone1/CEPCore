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
import com.cmm.config.AuthInfo;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;

@Controller
@RequestMapping("/mngProject/mapping")
public class MngProjectMappingController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectMappingController.class);
	
	@Resource(name="mngProjectMappingService")
	private MngProjectMappingService service;
	
	@Resource(name="mngProjectOrderService")
	private MngProjectOrderService orderService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/list.do")
	public String selectMapping(@ModelAttribute("searchVO") OrderBillVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		String toDay = null;
		toDay = CepDateUtil.getToday(null);	
		
		try {
			HashMap<String, String> sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			String empAuthCd = request.getSession().getAttribute("empAuthCd").toString();
			
			if(!"".equals(CepStringUtil.getDefaultValue(empAuthCd, "")) && 
				!empAuthCd.equals(AuthInfo.AUTH_ADMIN.getValue()) &&
				"".equals(CepStringUtil.getDefaultValue(searchVO.getDeptKey(), ""))) {
				searchVO.setRegEmpKey(sessionMap.get("empKey"));
				model.put("empKey", sessionMap.get("empKey"));
			}
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getOrderDtFrom(), ""))){
				searchVO.setOrderDtFrom(searchVO.getOrderDtFrom().replace("-", ""));
			} else {
				searchVO.setOrderDtFrom(CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6));
			}
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getOrderDtTo(), ""))){
				searchVO.setOrderDtTo(searchVO.getOrderDtTo().replace("-", ""));
			} else {
				searchVO.setOrderDtTo(toDay);
			}
			
			model.put("orderDtFrom", CepDateUtil.convertDisplayFormat(searchVO.getOrderDtFrom(), null, null));
			model.put("orderDtTo", CepDateUtil.convertDisplayFormat(searchVO.getOrderDtTo(), null, null));
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
			searchVO.setBillFkPjKey(resultVO.getOrderCtFkKey());
			
			if(resultVO.getOrderAmount() == resultVO.getBillMappedAmount()) {
				// 맵핑 완료
				searchVO.setMappedStatus("C");
			} else if(resultVO.getBillMappedAmount() > 0 && resultVO.getOrderAmount() != resultVO.getBillMappedAmount()) {
				// 맵핑 미완료(일부만 맵핑)
				searchVO.setMappedStatus("IC");
			} else {
				// 맵핑 미완료(전체 맵핑x)
				searchVO.setMappedStatus("NL");
			}
			
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
