package com.cep.mngMaint.mapping.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.mngMaint.bill.vo.MtPaymentVO;
import com.cep.mngMaint.mapping.service.MngMaintMappingService;
import com.cep.mngMaint.mapping.vo.MtOrderBillVO;
import com.cep.mngMaint.order.service.MngMaintOrderService;
import com.cmm.config.AuthInfo;
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
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/list.do")
	public String selectMapping(@ModelAttribute("searchVO") MtOrderBillVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		List<?> orderBillList = null;
		String toDay = null;
		Map<String, String> searchParam = null;
		HashMap<String, String> sessionMap = null;
		String empAuthCd = null;
		try {
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			empAuthCd = request.getSession().getAttribute("empAuthCd").toString();
			
			logger.debug("empKey===>"+sessionMap.get("empKey"));
			logger.debug("empAuthCd===>"+empAuthCd);
			
			logger.debug("searchVO.getOrderDtFrom()===>"+searchVO.getOrderDtFrom());
			logger.debug("searchVO.getOrderDtTo()===>"+searchVO.getOrderDtTo());
			logger.debug("searchVO.getOrderEmpNm()===>"+searchVO.getOrderEmpNm());
			logger.debug("searchVO.getMtOrderAcKey()===>"+searchVO.getMtOrderAcKey());
			logger.debug("searchVO.getSearchGubun()===>"+searchVO.getSearchGubun());
			logger.debug("searchVO.getSearchWord()===>"+searchVO.getSearchWord());
			
			
			
			toDay = CepDateUtil.getToday(null);	
			/*
			 * 사용자 권한 정보가 null이 아니고 관리자(EMAU1001)가 아니고, 부서 key가 null이 아닌 경우
			 * 검색조건에 사용자 id를 이용하여 조회하도록 함.(관리자가 아닌 경우 본인것만 조회)
			 */
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
//			logger.debug("billDtFrom===>"+CepDateUtil.convertDisplayFormat(searchVO.getBillDtFrom(), "yyyyMMdd", "yyyy-MM-dd"));
//			logger.debug("billDtTo===>"+CepDateUtil.convertDisplayFormat(searchVO.getBillDtTo(), "yyyyMMdd", "yyyy-MM-dd"));
			
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
				searchVO.setMappingCompleteYn("Y");
			} else {
				orderBillDetail.setMappingCompleteYn("N");
				searchVO.setMappingCompleteYn("N");
			}
			logger.debug("searchVO.getMappingCompleteYn()====>"+searchVO.getMappingCompleteYn());
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
	
	/**
	 * 발주-계산서 매핑에서 계산서 매핑 등록
	 * 유지보수관리 >> 발주-계산서 매핑 >> 팝업에서 매핑.
	 * <pre>
	 * </pre>
	 * 
	 * @param request
	 * @param mtPaymentVO
	 * @return
	 * @throws Exception
	 * @cdate 2022. 2. 4. 오전 11:19:53
	 * @author aranghoo
	 */
	@RequestMapping(value="/writePaymentBillMapping.do")
	@ResponseBody
	public Map<String, Object> writePaymentBillMapping(HttpServletRequest request, @ModelAttribute("mtPaymentVO")  MtPaymentVO mtPaymentVO) throws Exception {
		String paymentKey = null;
		logger.debug("=============== writePaymentBillMapping ======================");

		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
//		EgovMap paymentRequestInfo = null;
//		String paymentStatusCdNm = null;
		try {
			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
			logger.debug("mtPaymentVO.getPaymentBuyFkKey()  : {}", mtPaymentVO.getPaymentBuyFkKey()); //발주키
			logger.debug("mtPaymentVO.getMtOrderKey()  : {}", mtPaymentVO.getMtOrderKey()); //발주키
			logger.debug("mtPaymentVO.getMtOrderType() : {}", mtPaymentVO.getMtOrderType());
//			logger.debug("mtPaymentVO.getPaymentStatusCd() : {}", mtPaymentVO.getPaymentStatusCd());
			logger.debug("mtPaymentVO.getCallAmount() : {}", mtPaymentVO.getCallAmount());
			logger.debug("mtPaymentVO.getPaymentAcFkKey()  : {}", mtPaymentVO.getPaymentAcFkKey()); //매입사업자번호.			
			logger.debug("mtPaymentVO.getBillFkKey() : {}", mtPaymentVO.getBillFkKey()); 	
			
						
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mtPaymentVO.setRegEmpKey(sessionMap.get("empKey"));
			mtPaymentVO.setModEmpKey(sessionMap.get("empKey"));
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getMtOrderType(), ""))) {
				logger.debug("writePaymentBillMapping insert===========>");
				//계산서 요청 관리키가 없는 경우 등록
				paymentKey = service.writePaymentBillMapping(mtPaymentVO);
				
				returnMap.put("successYN", "Y");
			} else {
				returnMap.put("successYN", "N");
			}
						
			
			returnMap.put("mtOrderType", mtPaymentVO.getMtOrderType());
			//유지보수 key
			returnMap.put("mtIntegrateKey", mtPaymentVO.getMtIntegrateKey());
			
			//유지보수 작업관리키
			returnMap.put("mtWorkKey", mtPaymentVO.getMtWorkKey());
			//발주관리키.
			returnMap.put("paymentBuyFkKey", mtPaymentVO.getPaymentBuyFkKey());
			
			//사업자번호(매입처관리키)
			returnMap.put("paymentAcFkKey", mtPaymentVO.getPaymentAcFkKey());
			
			returnMap.put("paymentKey", paymentKey);
			
		}catch(Exception e){
			returnMap.put("successYN", "N");
			logger.error("{}", e);
			//throw e;
		}		
		return returnMap;
	}
}
