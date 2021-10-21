package com.cep.mngMaint.billSchedule.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngMaint.bill.service.MngMaintBillService;
import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;
import com.cep.mngMaint.billSchedule.service.MngMaintBillScheduleService;
import com.cep.mngMaint.billSchedule.vo.MngMaintBillScheduleVO;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;

@Controller
public class MngMaintBillScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(MngMaintBillScheduleController.class);
	
	@Resource(name="mngMaintBillScheduleService")
	private MngMaintBillScheduleService service;	

	
	@RequestMapping(value="/mngMaint/billSchedule/list.do")
	public String selectBillSchedule(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		
		String toDay = null;
		Map<String, String> searchParam = null;
		
		try {
			logger.debug("searchVO.getFromDate()===>"+searchVO.getFromDate());
			logger.debug("searchVO.getOrderDtTo()===>"+searchVO.getToDate());
			logger.debug("searchVO.getDateSearchType()===>"+searchVO.getDateSearchType());
			logger.debug("searchVO.getSearchGubun()===>"+searchVO.getSearchGubun());
			logger.debug("searchVO.getSearchWord()===>"+searchVO.getSearchWord());
			logger.debug("searchVO.getBillType()===>"+searchVO.getBillType());
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
			
			//처음조회시 계산서요청일 기준으로 데이타 조회.
			if("".equals(CepStringUtil.getDefaultValue(searchVO.getDateSearchType(), ""))){
				searchVO.setDateSearchType("BR");
			}
			
			//처음조회시 매출세금계산서를 조회한다.
			if("".equals(CepStringUtil.getDefaultValue(searchVO.getBillType(), ""))){
				searchVO.setBillType("SD");
			}
			
			searchParam = new HashMap<>();
			
			searchParam.put("fromDate", CepDateUtil.convertDisplayFormat(searchVO.getFromDate(), null, null));
			searchParam.put("toDate", CepDateUtil.convertDisplayFormat(searchVO.getToDate(), null, null));
			model.put("searchParam", searchParam);
			model.put("mtBillRequestList", service.selectMtBillRequestList(searchVO));
			model.put("displayUtil", new CepDisplayUtil());
			
		} catch (Exception e) {
			logger.error("{}", e);
		}
		return "mngMaint/billSchedule/list";
	}
}
