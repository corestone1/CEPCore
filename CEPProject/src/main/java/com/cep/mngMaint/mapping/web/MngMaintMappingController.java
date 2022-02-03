package com.cep.mngMaint.mapping.web;

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

import com.cep.mngMaint.mapping.service.MngMaintMappingService;
import com.cep.mngMaint.mapping.vo.MtOrderBillVO;
import com.cep.mngMaint.order.service.MngMaintOrderService;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;

@Controller
@RequestMapping("/mngMaint/mapping")
public class MngMaintMappingController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngMaintMappingController.class);
	
	@Resource(name="mngMaintMappingService")
	private MngMaintMappingService service;
	
	@Resource(name="mngMaintOrderService")
	private MngMaintOrderService orderService;
	
	/**
	 * 유지보수 발주-계산서 맵핑 목록조회
	 * 유지보수관리 >> 발주-계산서 맵핑
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @cdate 2022. 1. 26. 오후 1:47:27
	 * @author aranghoo
	 */
	@RequestMapping(value="/list.do")
	public String selectMapping(@ModelAttribute("searchVO") MtOrderBillVO searchVO, ModelMap model) throws Exception {
		
		List<?> orderBillList = null;
		String toDay = null;
		Map<String, String> searchParam = null;
		try {
			
			logger.debug("searchVO.getOrderDtFrom()===>"+searchVO.getOrderDtFrom());
			logger.debug("searchVO.getOrderDtTo()===>"+searchVO.getOrderDtTo());
			logger.debug("searchVO.getOrderEmpNm()===>"+searchVO.getOrderEmpNm());
			logger.debug("searchVO.getMtOrderAcKey()===>"+searchVO.getMtOrderAcKey());
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
				searchVO.setOrderDtTo(toDay);
			}
			searchParam = new HashMap<>();
			logger.debug("orderDtFrom===>"+CepDateUtil.convertDisplayFormat(searchVO.getOrderDtFrom(), "yyyyMMdd", "yyyy-MM-dd"));
			logger.debug("orderDtTo===>"+CepDateUtil.convertDisplayFormat(searchVO.getOrderDtTo(), "yyyyMMdd", "yyyy-MM-dd"));
			
			searchParam.put("orderDtFrom", CepDateUtil.convertDisplayFormat(searchVO.getOrderDtFrom(), "yyyyMMdd", "yyyy-MM-dd"));
			searchParam.put("orderDtTo", CepDateUtil.convertDisplayFormat(searchVO.getOrderDtTo(), "yyyyMMdd", "yyyy-MM-dd"));
			
			orderBillList = service.selectOrderBillList(searchVO);
			
			model.addAttribute("searchParam", searchParam);
			model.addAttribute("orderList", orderBillList);
			model.put("displayUtil", new CepDisplayUtil());
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "mngMaint/mapping/list";
	}
	
	/**
	 * 유지보수 발주계산서 매핑에서 목록을 클릭하면 나타나는 팝업.
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @cdate 2022. 1. 26. 오후 1:48:19
	 * @author aranghoo
	 */
	@RequestMapping(value="/mappingBill.do")
	public String mappingBill(@ModelAttribute("searchVO") MtOrderBillVO searchVO, ModelMap model) throws Exception {
		
		MtOrderBillVO orderBillDetail = null; //발주정보
		List<?> mappingBillList = null; //계산서 정보
		Map<String, String> searchParam = null;
		String toDay = null;
		try {
			logger.debug("searchVO.getMtOrderKey()===>"+searchVO.getMtOrderKey()); //발주관리키.
			logger.debug("searchVO.getMtOrderAcKey()===>"+searchVO.getMtOrderAcKey()); //매입처관리키
			logger.debug("searchVO.getBillDtFrom()===>"+searchVO.getBillDtFrom()); //계산서 발행일자
			logger.debug("searchVO.getBillDtTo()===>"+searchVO.getBillDtTo()); //계산서 발행일자
			
			toDay = CepDateUtil.getToday(null);	
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getBillDtFrom(), ""))){
				searchVO.setBillDtFrom(searchVO.getBillDtFrom().replace("-", ""));
			} else {
				searchVO.setBillDtFrom(CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6));
			}
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getBillDtTo(), ""))){
				searchVO.setBillDtTo(searchVO.getBillDtTo().replace("-", ""));
			} else {
				searchVO.setBillDtTo(toDay);
			}
			searchParam = new HashMap<>();
			logger.debug("billDtFrom===>"+CepDateUtil.convertDisplayFormat(searchVO.getBillDtFrom(), "yyyyMMdd", "yyyy-MM-dd"));
			logger.debug("billDtTo===>"+CepDateUtil.convertDisplayFormat(searchVO.getBillDtTo(), "yyyyMMdd", "yyyy-MM-dd"));
			
			searchParam.put("billDtFrom", CepDateUtil.convertDisplayFormat(searchVO.getBillDtFrom(), "yyyyMMdd", "yyyy-MM-dd"));
			searchParam.put("billDtTo", CepDateUtil.convertDisplayFormat(searchVO.getBillDtTo(), "yyyyMMdd", "yyyy-MM-dd"));
			
			
			orderBillDetail = service.selectMtOrderBillDetail(searchVO);
			
			/*
			 * 발주금액이 완료 여부
			 * Y : mtOrderAmount(발주금액) == billMappedAmount(맵핑금액)
			 * N : mtOrderAmount(발주금액) != billMappedAmount(맵핑금액)
			 */
			if(orderBillDetail.getMtOrderAmount() == orderBillDetail.getBillMappedAmount()) {
				orderBillDetail.setMappingCompleteYn("Y");
			} else {
				orderBillDetail.setMappingCompleteYn("N");
			}
			
			mappingBillList = service.selectMappingBillList(searchVO);
			
			model.put("orderBillDetail", orderBillDetail);
			model.put("mappingBillList", mappingBillList);
			model.put("displayUtil", new CepDisplayUtil());
			model.put("searchParam", searchParam);
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "mngMaint/mapping/mappingBill";
	}
}
