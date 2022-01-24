package com.cep.mngMaint.fundSchedule.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;
import com.cep.mngMaint.fundSchedule.service.MngMaintFundScheduleService;
import com.cep.mngMaint.fundSchedule.vo.MngMaintFundScheduleVO;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MngMaintFundScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(MngMaintFundScheduleController.class);
	
	@Resource(name="mngMaintFundScheduleService")
	private MngMaintFundScheduleService service;
	
	@RequestMapping(value="/mngMaint/fundSchedule/list.do")
	public String selectFundSchedule(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		
		String toDay = null;
		Map<String, String> searchParam = null;
		List<EgovMap> mtCollectRequestList = null; //수금현황
		List<EgovMap> mtPaymentRequestList = null; //지급현황
		try {
			logger.debug("searchVO.getFromDate()===>"+searchVO.getFromDate());
			logger.debug("searchVO.getOrderDtTo()===>"+searchVO.getToDate());
			logger.debug("searchVO.getDateSearchType()===>"+searchVO.getDateSearchType());
			logger.debug("searchVO.getSearchGubun()===>"+searchVO.getSearchGubun());
			logger.debug("searchVO.getSearchWord()===>"+searchVO.getSearchWord());
			
			toDay = CepDateUtil.getToday(null);	
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getFromDate(), ""))){
				searchVO.setFromDate(searchVO.getFromDate().replace("-", ""));
			} else {
				searchVO.setFromDate(CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6));
			}
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getToDate(), ""))){
				searchVO.setToDate(searchVO.getToDate().replace("-", ""));
			} else {
				searchVO.setToDate(toDay);
			}
			searchParam = new HashMap<>();
			searchParam.put("fromDate", CepDateUtil.convertDisplayFormat(searchVO.getFromDate(), null, null));
			searchParam.put("toDate", CepDateUtil.convertDisplayFormat(searchVO.getToDate(), null, null));
			
			mtCollectRequestList = service.selectMtCollectRequestList(searchVO);
			mtPaymentRequestList = service.selectMtPaymentRequestList(searchVO);
			
			model.put("searchParam", searchParam);
			model.put("mtCollectRequestList", mtCollectRequestList);
			model.put("mtPaymentRequestList", mtPaymentRequestList);
			model.put("displayUtil", new CepDisplayUtil());
		} catch (Exception e) {
			logger.error("{}", e);
		}
		
		return "mngMaint/fundSchedule/list";
	}
	
	@RequestMapping(value="/mngMaint/fundSchedule/viewProductDetail.do")
	public String selectDetail(MngMaintFundScheduleVO fundScheduleVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngMaint/fundSchedule/viewProductDetail";
	}
}
