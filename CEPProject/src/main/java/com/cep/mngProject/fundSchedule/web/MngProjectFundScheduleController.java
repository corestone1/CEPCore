
package com.cep.mngProject.fundSchedule.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngProject.fundSchedule.service.MngProjectFundScheduleService;
import com.cep.mngProject.fundSchedule.vo.MngProjectFundScheduleVO;
import com.cmm.util.CepDisplayUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MngProjectFundScheduleController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectFundScheduleController.class);
	
	@Resource(name="mngProjectFundScheduleService")
	private MngProjectFundScheduleService service;
	
	@RequestMapping(value="/mngProject/fundSchedule/list.do")
	public String selectFundSchedule(@ModelAttribute("searchVO") MngProjectFundScheduleVO searchVO, ModelMap model) throws Exception {
		
		try{
			EgovMap legovMap = service.selectFundScheduleList(searchVO);
			
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			model.addAttribute("salesList", legovMap.get("salesList"));
			
			model.addAttribute("paymentList", legovMap.get("paymentList"));
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		
		
		
		return "mngProject/fundSchedule/list";
	}
	
	@RequestMapping(value="/mngProject/fundSchedule/viewProductDetail.do")
	public String selectDetail(@ModelAttribute("searchVO") MngProjectFundScheduleVO searchVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		try {
			
			logger.debug("================== selectDetail ===================");
			logger.debug("= searchVO. : {}", searchVO.getFundGb());
			logger.debug("= searchVO. : {}", searchVO.getPjKey());
			logger.debug("= searchVO. : {}", searchVO.getBuyKey());
			
			model.addAttribute("displayUtil", new CepDisplayUtil());
			model.addAttribute("productList", service.selectOrderProductList(searchVO));
			
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		return "mngProject/fundSchedule/viewProductDetail";
	}
}
