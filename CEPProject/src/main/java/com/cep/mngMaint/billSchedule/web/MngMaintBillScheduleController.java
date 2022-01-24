package com.cep.mngMaint.billSchedule.web;

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

import com.cep.mngCommon.code.service.CodeService;
import com.cep.mngCommon.code.vo.CodeSearchVO;
import com.cep.mngCommon.code.vo.CodeVO;
import com.cep.mngMaint.bill.service.MngMaintBillService;
import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;
import com.cep.mngMaint.billSchedule.service.MngMaintBillScheduleService;
import com.cep.mngMaint.billSchedule.vo.MngMaintBillScheduleVO;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MngMaintBillScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(MngMaintBillScheduleController.class);
	@Resource(name="codeService")
	private CodeService codeService;
	@Resource(name="mngMaintBillScheduleService")
	private MngMaintBillScheduleService service;	

	
	@RequestMapping(value="/mngMaint/billSchedule/list.do")
	public String selectBillSchedule(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		
		String toDay = null;
		Map<String, String> searchParam = null;
		List<EgovMap> billRequestList = null;
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
			
			
			billRequestList = service.selectMtBillRequestList(searchVO);
			
			model.put("searchParam", searchParam);
			model.put("mtBillRequestList", billRequestList);
			model.put("displayUtil", new CepDisplayUtil());
			
		} catch (Exception e) {
			logger.error("{}", e);
		}
		return "mngMaint/billSchedule/list";
	}

	
	@RequestMapping(value="/mngMaint/billSchedule/salesBillPlanList.do")
	public String selectMtSaleBillList(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		
		String toDay = null;
		Map<String, String> searchParam = null;
		List<EgovMap> salesBillPlanList = null;
		CodeSearchVO codeSearchVO = null;
		List<CodeVO> lltCodeList = null;
		List<EgovMap> manufacturerList = null;
		try {
			toDay = CepDateUtil.getToday(null);	
			
			logger.debug("searchVO.getFromDate()===>"+searchVO.getFromDate());
			logger.debug("searchVO.getToDate()===>"+searchVO.getToDate());
			logger.debug("searchVO.getSearchGubun()===>"+searchVO.getSearchGubun());
			logger.debug("searchVO.getSearchWord()===>"+searchVO.getSearchWord());
			logger.debug("searchVO.getSearchSaleEmpNm()===>"+searchVO.getSearchSaleEmpNm());
				
			logger.debug("toDay==========================>"+toDay);
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
			
			codeSearchVO = new CodeSearchVO();
			codeSearchVO.setCdUpCd("PDFG1000");
//			lltCodeList = codeService.selectCodeList(codeSearchVO); //계산서 매출구분
//			manufacturerList = service.selectManufacturerList();//계산서 제조사구분
			salesBillPlanList = service.selectMtSalesBillPlanList(searchVO);//매출계획목록
			searchParam = new HashMap<>();
			
			searchParam.put("fromDate", CepDateUtil.convertDisplayFormat(searchVO.getFromDate(), null, null));
			searchParam.put("toDate", CepDateUtil.convertDisplayFormat(searchVO.getToDate(), null, null));
			searchParam.put("toDay", toDay);
			model.put("searchParam", searchParam);
			model.put("salesCodeList", lltCodeList);
			model.put("manufacturerList", manufacturerList);
			model.put("mtSalesBillPlanList", salesBillPlanList);
			model.put("displayUtil", new CepDisplayUtil());
			//model.put("toDay", toDay);
			
		} catch (Exception e) {
			logger.error("{}", e);
		}
		return "mngMaint/billSchedule/salesBillPlanList";
	}
	
	

	
	@RequestMapping(value="/mngMaint/billSchedule/paymentPlanList.do")
	public String selectMtPaymentPlanList(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		
		String toDay = null;
		Map<String, String> searchParam = null;
		List<EgovMap> paymentPlanList = null;
//		CodeSearchVO codeSearchVO = null;
//		List<CodeVO> lltCodeList = null;
//		List<EgovMap> manufacturerList = null;
		try {
			toDay = CepDateUtil.getToday(null);	
			
			logger.debug("searchVO.getFromDate()===>"+searchVO.getFromDate());
			logger.debug("searchVO.getToDate()===>"+searchVO.getToDate());
			logger.debug("searchVO.getSearchGubun()===>"+searchVO.getSearchGubun());
			logger.debug("searchVO.getSearchWord()===>"+searchVO.getSearchWord());
			logger.debug("searchVO.getSearchSaleEmpNm()===>"+searchVO.getSearchSaleEmpNm());
				
			logger.debug("toDay==========================>"+toDay);
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
			
//			codeSearchVO = new CodeSearchVO();
//			codeSearchVO.setCdUpCd("PDFG1000");
//			lltCodeList = codeService.selectCodeList(codeSearchVO); //계산서 매출구분
//			manufacturerList = service.selectManufacturerList();//계산서 제조사구분
			paymentPlanList = service.selectMtPaymentPlanList(searchVO);//매출계획목록selectMtPaymentPlanList
			searchParam = new HashMap<>();
			
			searchParam.put("fromDate", CepDateUtil.convertDisplayFormat(searchVO.getFromDate(), null, null));
			searchParam.put("toDate", CepDateUtil.convertDisplayFormat(searchVO.getToDate(), null, null));
			searchParam.put("toDay", toDay);
			model.put("searchParam", searchParam);
//			model.put("salesCodeList", lltCodeList);
//			model.put("manufacturerList", manufacturerList);
			model.put("paymentPlanList", paymentPlanList);
			model.put("displayUtil", new CepDisplayUtil());
			//model.put("toDay", toDay);
			
		} catch (Exception e) {
			logger.error("{}", e);
		}
		return "mngMaint/billSchedule/paymentPlanList";
	}
}
