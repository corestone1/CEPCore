package com.cmm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.project.service.ProjectService;
import com.cep.project.vo.ProjectOrderVO;
import com.cmm.service.ComService;
import com.cmm.util.CepDisplayUtil;
import com.cmm.vo.OrderVO;
import com.cmm.vo.PaymentVO;
import com.cmm.vo.PurchaseVO;


@Controller
@RequestMapping("/cmm")
public class ComController {
	
	private static final Logger logger = LoggerFactory.getLogger(ComController.class);
	
	@Resource(name="comService")
	private ComService service;
	
	@Resource(name="projectService")
	private ProjectService projectService;
	
	/**
	 * 
	  * @Method Name : selectAcDirectorList
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :거래처 담당자 정보 조회(Selectbox용)
	  * @param request
	  * @param response
	  * @param mtAcKey
	  * @return
	  * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/selectAcDirectorList.do", method=RequestMethod.POST)
	public Map<String, Object>  selectAcDirectorList(HttpServletRequest request , HttpServletResponse response , @RequestBody String mtAcKey) throws Exception {
      
     String acKey = null;
     List < ? > acDirectorList = null;
     Map<String, Object> modelAndView = null;
     try {
         /* Ajax List 리턴을 위해서는 ModelAndView 로 세팅해야함 */
         modelAndView = new HashMap<String, Object>();
     
         acDirectorList =service.selectAcDirectorList(mtAcKey);
         
         logger.debug("acDirectorList.size=====>"+acDirectorList.size());
         modelAndView.put("result", acDirectorList);
	} catch (Exception e) {
		logger.error("selectAcDirectorList error", e);
	}

     return modelAndView; 
	}
	
	/*@RequestMapping(value="/insert/salesInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addSalesInfo(HttpServletRequest request, @RequestBody SalesVO salesVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.insertSalesInfo(request, salesVO);
		
		return returnMap;
	}*/
	
	/**
	 * 
	  * @Method Name : viewPurchaseInfo
	  * @Cdate       : 2021. 01. 31.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :매입금지급요청 메인 화면
	  * @param request
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/request/purchase/main.do")
	public String viewPurchaseInfo(HttpServletRequest request, ModelMap model) throws Exception {
		ProjectOrderVO orderVO = null;
		PurchaseVO purchaseVO = null;
		List<?> paymentList = null;
		List<?> resultList = null;
		List<?> depositList = null;
		
		String key = request.getParameter("mainKey");
		String orderKey = request.getParameter("orderKey");
		String acKey = "";
		
		try {
			if(key.substring(0, 2).equals("PJ")) {
				resultList = projectService.selectProjectDetail(key);
				model.addAttribute("resultList", resultList);
				
				orderVO = projectService.selectOrderDetail(orderKey);
				model.addAttribute("orderVO", orderVO);
			} else {
				/* 유지보수 일 때 계약 리스트 상세, 발주 상세 불러오기 */
			}
			
			purchaseVO = service.selectPurchaseDetail(orderKey);
			acKey = orderVO.getOrderAcKey();
			depositList = service.selectDepositList(acKey);
			paymentList = service.selectPaymentList(purchaseVO.getBuyKey());
			
			model.addAttribute("mainKey", key);
			model.addAttribute("purchaseVO", purchaseVO);
			model.addAttribute("depositList", depositList);
			model.addAttribute("paymentList", paymentList);
			model.put("displayUtil", new CepDisplayUtil());
			model.put("pmNm", request.getParameter("pmNm"));
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return "cmm/request/purchase/main";
	}
	
	/**
	 * 
	  * @Method Name : viewPaymentForm
	  * @Cdate       : 2021. 01. 31.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :매입금지급요청 지급 정보 화면
	  * @param request
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/request/purchase/paymentForm.do")
	public String viewPaymentForm(HttpServletRequest request, ModelMap model) throws Exception {
		ProjectOrderVO orderVO = null;
		PurchaseVO purchaseVO = null;
		List<?> paymentList = null;
		List<?> resultList = null;
		List<?> depositList = null;
		
		String key = request.getParameter("mainKey");
		String orderKey = request.getParameter("orderKey");
		String acKey = "";
		
		try {
			if(key.substring(0, 2).equals("PJ")) {
				resultList = projectService.selectProjectDetail(key);
				model.addAttribute("resultList", resultList);
				
				orderVO = projectService.selectOrderDetail(orderKey);
				model.addAttribute("orderVO", orderVO);
			} else {
				/* 유지보수 일 때 계약 리스트 상세, 발주 상세 불러오기 */
			}
			
			purchaseVO = service.selectPurchaseDetail(orderKey);
			acKey = orderVO.getOrderAcKey();
			depositList = service.selectDepositList(acKey);
			paymentList = service.selectPaymentList(purchaseVO.getBuyKey());
			
			model.addAttribute("mainKey", key);
			model.addAttribute("purchaseVO", purchaseVO);
			model.addAttribute("depositList", depositList);
			model.addAttribute("paymentList", paymentList);
			model.put("displayUtil", new CepDisplayUtil());
			model.put("pmNm", request.getParameter("pmNm"));
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return "cmm/request/purchase/paymentForm";
	}
	
	/**
	 * 
	  * @Method Name : viewPaymentList
	  * @Cdate       : 2021. 01. 31.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :기 지급 정보 화면
	  * @param request
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/request/purchase/prePaymentList.do")
	public String viewPrePaymentList(HttpServletRequest request, ModelMap model) throws Exception {
		PurchaseVO purchaseVO = null;
		List<?> prePaymentList = null;
		
		String orderKey = request.getParameter("orderKey");
		
		try {
			
			purchaseVO = service.selectPurchaseDetail(orderKey);
			prePaymentList = service.selectPrePaymentList(purchaseVO.getBuyKey());
			
			model.addAttribute("prePaymentList", prePaymentList);
			model.put("displayUtil", new CepDisplayUtil());
		} catch(Exception e) {
			throw new Exception(e);
		}
		return "cmm/request/purchase/prePaymentList";
	}
	
	/**
	 * 
	  * @Method Name : selectPurchaseInfo
	  * @Cdate       : 2021. 01. 31.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :매입금지급 상세 정보 조회
	  * @param 
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/detail/payment.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectPaymentInfo(HttpServletRequest request, @RequestBody PaymentVO paymentVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<>();
		List<?> depositList = null;
		
		try {
			//매입금지급 정보를 조회한다.
			returnMap = service.selectPaymentDetail(paymentVO);
			if(returnMap != null){
				depositList = service.selectDepositList(paymentVO.getPaymentAcFkKey());
			}
			
			returnMap.put("depositList", depositList);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;
	}
	
	/**
	 * 
	  * @Method Name : addPaymentInfo
	  * @Cdate       : 2021. 01. 31.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 매입금 지급 정보 등록
	  * @param paymentVO
	  * @return
	  * @throws Exception
	 */
	/*@RequestMapping(value="/insert/paymentInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addPaymentInfo(HttpServletRequest request, @RequestBody PaymentVO paymentVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			returnMap = service.insertPaymentInfo(request, paymentVO);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;
	}
	*/
	
	/**
	 * 
	  * @Method Name : updatePaymentInfo
	  * @Cdate       : 2021. 01. 31.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 매입금 지급 정보 수정
	  * @param paymentVO
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/update/paymentInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updatePaymentInfo(HttpServletRequest request, @RequestBody PaymentVO paymentVO) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.updatePaymentInfo(request, paymentVO);
		
		return returnMap;
	}
	
}
