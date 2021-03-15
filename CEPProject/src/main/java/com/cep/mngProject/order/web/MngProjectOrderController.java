package com.cep.mngProject.order.web;

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
import com.cep.mngProject.order.service.MngProjectOrderService;
import com.cep.mngProject.order.vo.MngOrderInsertVO;
import com.cep.mngProject.order.vo.MngOrderSearchVO;
import com.cep.mngProject.order.vo.MngProjectOrderVO;
import com.cmm.service.ComService;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping("/mngProject/order")
public class MngProjectOrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectOrderController.class);
	
	@Resource(name="mngProjectOrderService")
	private MngProjectOrderService service;
	
	@Resource(name="comService")
	private ComService comService;
	
	
	@RequestMapping(value="/list.do")
	public String selectOrder(@ModelAttribute("searchVO") MngOrderSearchVO searchVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		try
		{
			logger.debug("searchVO.getOrderCtClass() : {}", searchVO.getOrderCtClass());
			logger.debug("{}", service.selectOrderList(searchVO));
			
			model.addAttribute("orderList", service.selectOrderList(searchVO));
			model.put("displayUtil", new CepDisplayUtil());
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "mngProject/order/list";
	}
	
	@RequestMapping(value="/addInfo.do")
	public String addOrderInfo(@ModelAttribute("searchVO") MngOrderSearchVO searchVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		try{
			
			logger.debug("orderKey : {}", request.getParameter("orderKey"));
			logger.debug("searchVO.getOrderKey() : {}", searchVO.getOrderKey());
//			MngOrderSearchVO searchVO = new MngOrderSearchVO();
//			searchVO.setOrderKey(request.getParameter("orderKey"));
			
			model.addAttribute("orderKey",     searchVO.getOrderKey());
			model.addAttribute("employeeList", comService.selectEmployeeList());
			model.addAttribute("today",        CepDateUtil.getToday("yyyyMMdd"));
			model.addAttribute("displayUtil",  new CepDisplayUtil());
			
			if(searchVO != null && searchVO.getOrderKey() != null && searchVO.getOrderKey().length() == 8){
				
				logger.debug("-----------------------------------------------------");
				
				//CMM_ORDER_TB select
				EgovMap orderInfoMap = service.selectOrderInfo(searchVO);
				model.addAttribute("orderInfo", orderInfoMap);
				
				//고객 담당자 조회
				AccountSearchVO accoutSearchVO = new AccountSearchVO();
				accoutSearchVO.setAcKey((String)orderInfoMap.get("orderAcKey"));
				model.addAttribute("directorList", service.selectDirectorList(accoutSearchVO));
				
				//CMM_ORDER_PRODUCT_TB select
//				model.addAttribute("productList", service.selectOrderProductList(searchVO));
			}
			
		}catch(Exception e){
			logger.debug("{}", e);
			throw e;
		}
		
		return "mngProject/order/addInfo";
	}
	
	
	@RequestMapping(value="/selectOrderProductList.do")
	@ResponseBody
	public Map<String, Object> selectOrderProductList(@ModelAttribute("searchVO") MngOrderSearchVO searchVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try{
			
			logger.debug("orderKey : {}", request.getParameter("orderKey"));
			logger.debug("searchVO.getOrderKey() : {}", searchVO.getOrderKey());
			
			if(searchVO.getOrderKey() != null || searchVO.getOrderKey().length() == 8){
				//CMM_ORDER_PRODUCT_TB select
				returnMap.put("productList", service.selectOrderProductList(searchVO));
			}
			
		}catch(Exception e){
			logger.debug("{}", e);
		}
		
		
		return returnMap;
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
	
	@RequestMapping(value="/delete.do")
	@ResponseBody
	public Map<String, Object> deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		logger.debug(":::::: ORDER_KEY ======= {}", request.getParameter("ORDER_KEY"));
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		MngOrderSearchVO orderVO = new MngOrderSearchVO();
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
	
	@RequestMapping(value="/write/wirteProductInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> writeOrderInfo(HttpServletRequest request, @RequestBody MngOrderInsertVO orderVO) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		
		try{
			
			logger.debug("======================= writeOrderInfo =========================");
			logger.debug("orderVO.getOrderKey()       : {}", orderVO.getOrderKey());
			logger.debug("orderVO.getOrderCtFkKey()   : {}", orderVO.getOrderCtFkKey());
			logger.debug("mngOrderInsertVOList.size() : {}", orderVO.getMngOrderInsertVOList().size());
			
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
//			orderVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.writeOrderInfo(orderVO);
			
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		return returnMap;
	}
}
