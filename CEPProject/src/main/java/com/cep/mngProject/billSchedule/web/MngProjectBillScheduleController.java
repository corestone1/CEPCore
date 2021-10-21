package com.cep.mngProject.billSchedule.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngProject.billSchedule.service.MngProjectBillScheduleService;
import com.cep.mngProject.billSchedule.vo.MngProjectBillScheduleVO;
import com.cmm.util.CepDisplayUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MngProjectBillScheduleController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectBillScheduleController.class);
	
	@Resource(name="mngProjectBillScheduleService")
	private MngProjectBillScheduleService service;
	
	@RequestMapping(value="/mngProject/billSchedule/list.do")
	public String selectBillSchedule(@ModelAttribute("searchVO") MngProjectBillScheduleVO searchVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		try {
			
			
			logger.debug("======== selectBillSchedule ==========");
			logger.debug(" searchVO.getBillType()     : {}", searchVO.getBillType());
			logger.debug(" searchVO.getQuarter()      : {}", searchVO.getQuarter());
			logger.debug(" searchVO.getSearchFromDt() : {}", searchVO.getSearchFromDt());
			logger.debug(" searchVO.getSearchToDt()   : {}", searchVO.getSearchToDt());
			logger.debug(" searchVO.getSearchAcNm()   : {}", searchVO.getSearchAcNm());
			logger.debug(" searchVO.getSearchPjNm()   : {}", searchVO.getSearchPjNm());
			
			EgovMap egovMap = service.selectBillScheduleList(searchVO);
			//List 조회
			model.addAttribute("billList", egovMap.get("billList"));
			model.addAttribute("searchParam", egovMap.get("searchParam"));
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		
		return "mngProject/billSchedule/list";
	}
}
