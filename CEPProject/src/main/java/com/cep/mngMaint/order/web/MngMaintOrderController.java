package com.cep.mngMaint.order.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngMaint.order.service.MngMaintOrderService;
import com.cep.mngMaint.order.vo.MngMaintOrderVO;
import com.cep.mngMaint.order.vo.MngMtOrderSearchVO;
import com.cmm.service.ComService;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;

@Controller
@RequestMapping("/mngMaint/order")
public class MngMaintOrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngMaintOrderController.class);
	
	@Resource(name="mngMaintOrderService")
	private MngMaintOrderService service;
	
	@Resource(name="comService")
	private ComService comService;
	
	
	@RequestMapping(value="/list.do")
	public String selectOrder(@ModelAttribute("searchVO") MngMtOrderSearchVO searchVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		String toDay = null;
		Map<String, String> searchParam = null;
		try {
			
			logger.debug("searchVO.getOrderDtFrom()===>"+searchVO.getOrderDtFrom());
			logger.debug("searchVO.getOrderDtTo()===>"+searchVO.getOrderDtTo());
			logger.debug("searchVO.getMtOrderType()===>"+searchVO.getMtOrderType());
			logger.debug("searchVO.getSearchOderAcKeyNm()===>"+searchVO.getSearchOderAcKeyNm());
			logger.debug("searchVO.getSearchGubun()===>"+searchVO.getSearchGubun());
			logger.debug("searchVO.getSearchWord()===>"+searchVO.getSearchWord());
			
			
			toDay = CepDateUtil.getToday(null);		
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getOrderDtFrom(), ""))){
				searchVO.setOrderDtFrom(searchVO.getOrderDtFrom().replace("-", ""));
			} else {
				searchVO.setOrderDtFrom(CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6));
			}
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getOrderDtTo(), ""))){
				searchVO.setOrderDtTo(searchVO.getOrderDtTo().replace("-", ""));
			} else {
//				searchVO.setOrderDtTo(toDay); 
			}
			searchParam = new HashMap<>();
//			searchParam.put("orderDtFrom", CepDateUtil.displayDate(searchVO.getOrderDtFrom()));
			searchParam.put("orderDtFrom", CepDateUtil.convertDisplayFormat(searchVO.getOrderDtFrom(), null, null));
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getOrderDtTo(), ""))){
				searchParam.put("orderDtTo", CepDateUtil.convertDisplayFormat(searchVO.getOrderDtTo(), null, null));
			}
			
			model.put("searchParam", searchParam);
			model.put("orderList", service.selectMtOrdertList(searchVO));
			model.put("displayUtil", new CepDisplayUtil());
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "mngMaint/order/list";
	}
	
	@RequestMapping(value="/addInfo.do")
	public String addOrderInfo(MngMaintOrderVO mngMaintOrderVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		/*for(MngMaintOrderVO str : mngMaintOrderVO.getList()) {
			System.out.println("orderPmFkKet----------->"+str.getOrderPmFkKey());
			System.out.println("orderUprice-------->"+str.getOrderUprice());
		}*/
		
		try{
		
			model.addAttribute("employeeList", comService.selectEmployeeList());
			model.addAttribute("today", CepDateUtil.getToday("yyyy-MM-dd"));
			
		}catch(Exception e){
			logger.debug("{}", e);
		}
		
		
		return "mngMaint/order/addInfo";
	}
	
	@RequestMapping(value="/test.do", method=RequestMethod.POST)
	@ResponseBody
	public String test(@RequestBody MngMaintOrderVO mngMaintOrderVO) throws Exception {
		for(MngMaintOrderVO str : mngMaintOrderVO.getList()) {
			System.out.println("orderPmFkKet----------->"+str.getOrderPmFkKey());
			System.out.println("orderUprice-------->"+str.getOrderUprice());
		}
		return "";
	}
	
	@RequestMapping(value="/delete.do")
	@ResponseBody
	public Map<String, Object> deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		logger.debug(":::::: ORDER_KEY ======= {}", request.getParameter("ORDER_KEY"));
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		MngMtOrderSearchVO orderVO = new MngMtOrderSearchVO();
		try
		{
			orderVO.setOrderKey(request.getParameter("ORDER_KEY"));
			
			HashMap<String, String> session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			orderVO.setRegEmpKey(session.get("empKey"));
			
			service.deleteOrder(orderVO);
		}catch(Exception e)
		{
			logger.error("{}", e);
		}
			
		
		return returnMap;
		 
	}
	
	
	@RequestMapping(value="/getAcDirectorList.do")
	@ResponseBody
	public Map<String, Object> selectDirectorList(@ModelAttribute("accountVO") AccountSearchVO searchVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== selectDirectorList ======================");
		logger.debug("== AccountSearchVO : {}", searchVO);
		
		try{
			
			returnMap.put("directorList", service.selectDirectorList(searchVO));
		
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return returnMap;
	}
}
