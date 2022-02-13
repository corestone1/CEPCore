package com.cep.project.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.project.service.ProjectRequestService;
import com.cep.project.service.ProjectService;
import com.cep.project.vo.ProjectOrderVO;
import com.cep.project.vo.ProjectPaymentVO;
import com.cep.project.vo.ProjectPurchaseVO;
import com.cmm.service.ComService;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;


@Controller
@RequestMapping("/project/request")
public class ProjectRequestController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectRequestController.class);
	
	@Resource(name="projectRequestService")
	private ProjectRequestService reqService;
	
	@Resource(name="projectService")
	private ProjectService service;
	
	@Resource(name="comService")
	private ComService comService;
	
	
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
	@RequestMapping(value="/purchase/main.do")
	public String viewPurchaseInfo(HttpServletRequest request, ModelMap model) throws Exception {
		ProjectOrderVO orderVO = null;
		ProjectPurchaseVO purchaseVO = null;
		List<?> paymentList = null;
		List<?> resultList = null;
		List<?> depositList = null;
		
		String key = request.getParameter("mainKey");
		String orderKey = request.getParameter("orderKey");
		String acKey = "";
		
		try {
			resultList = service.selectProjectDetail(key);
			model.addAttribute("resultList", resultList);
			
			orderVO = service.selectOrderDetail(orderKey);
			model.addAttribute("orderVO", orderVO);
			
			purchaseVO = reqService.selectPurchaseDetail(orderKey);
			acKey = orderVO.getOrderAcKey();
			depositList = comService.selectDepositList(acKey);
			paymentList = reqService.selectPaymentList(purchaseVO.getBuyKey());
			
			model.addAttribute("mainKey", key);
			model.addAttribute("purchaseVO", purchaseVO);
			model.addAttribute("depositList", depositList);
			model.addAttribute("paymentList", paymentList);
			model.put("displayUtil", new CepDisplayUtil());
			model.put("pmNm", request.getParameter("pmNm"));
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return "project/request/purchase/main";
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
	@RequestMapping(value="/purchase/paymentForm.do")
	public String viewPaymentForm(HttpServletRequest request, ModelMap model) throws Exception {
		ProjectOrderVO orderVO = null;
		ProjectPurchaseVO purchaseVO = null;
		List<?> paymentList = null;
		List<?> prePaymentList = null;
		List<?> resultList = null;
		List<?> depositList = null;
		
		String key = request.getParameter("mainKey");
		String orderKey = request.getParameter("orderKey");
		String acKey = "";
		
		try {
			resultList = service.selectProjectDetail(key);
			model.addAttribute("resultList", resultList);
			
			orderVO = service.selectOrderDetail(orderKey);
			model.addAttribute("orderVO", orderVO);
			
			purchaseVO = reqService.selectPurchaseDetail(orderKey);
			acKey = orderVO.getOrderAcKey();
			depositList = comService.selectDepositList(acKey);
			paymentList = reqService.selectPaymentList(purchaseVO.getBuyKey());
			prePaymentList = reqService.selectPrePaymentList(purchaseVO.getBuyKey());
			
			model.addAttribute("mainKey", key);
			model.addAttribute("orderKey", orderKey);
			model.addAttribute("purchaseVO", purchaseVO);
			model.addAttribute("depositList", depositList);
			model.addAttribute("paymentList", paymentList);
			model.addAttribute("prePaymentList", prePaymentList);
			model.put("displayUtil", new CepDisplayUtil());
			model.put("pmNm", request.getParameter("pmNm"));
			
			/*model.put("purchaseCodeList", CepStringUtil.getPurchaseCodeList());
			model.put("manufacturerList", CepStringUtil.getManuFacturerList());*/
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return "project/request/purchase/paymentForm";
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
	@RequestMapping(value="/purchase/prePaymentList.do")
	public String viewPrePaymentList(HttpServletRequest request, ModelMap model) throws Exception {
		ProjectPurchaseVO purchaseVO = null;
		List<?> prePaymentList = null;
		
		String orderKey = request.getParameter("orderKey");
		
		try {
			
			purchaseVO = reqService.selectPurchaseDetail(orderKey);
			prePaymentList = reqService.selectPrePaymentList(purchaseVO.getBuyKey());
			
			model.addAttribute("prePaymentList", prePaymentList);
			model.put("displayUtil", new CepDisplayUtil());
		} catch(Exception e) {
			throw new Exception(e);
		}
		return "project/request/purchase/prePaymentList";
	}
	
	/**
	 * 
	  * @Method Name : writePaymentInfo
	  * @Cdate       : 2021. 09. 15.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :지급 정보 요청화면
	  * @param request
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/purchase/writePaymentInfo.do")
	public String writePaymentInfo(HttpServletRequest request, ModelMap model) throws Exception {
		ProjectOrderVO orderVO = null;
		List<?> depositList = null;
		String orderKey = request.getParameter("orderKey");
		String acKey = "";
		try {
			orderVO = service.selectOrderDetail(orderKey);
			
			acKey = orderVO.getOrderAcKey();
			depositList = comService.selectDepositList(acKey);
		
			model.addAttribute("orderKey", orderKey);
			model.addAttribute("acKey", acKey);
			model.addAttribute("depositList", depositList);
		} catch(Exception e) {
			throw new Exception(e);
		}
		return "project/request/purchase/writePaymentInfo";
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
	public Map<String, Object> selectPaymentInfo(HttpServletRequest request, @RequestBody ProjectPaymentVO paymentVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<>();
		List<?> depositList = null;
		
		try {
			//매입금지급 정보를 조회한다.
			returnMap = reqService.selectPaymentDetail(paymentVO);
			if(returnMap != null){
				depositList = comService.selectDepositList(paymentVO.getPaymentAcFkKey());
			}
			
			returnMap.put("depositList", depositList);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			returnMap.put("successYN", "N");
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
	@RequestMapping(value="/insert/paymentInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addPaymentInfo(HttpServletRequest request, @RequestBody ProjectPaymentVO paymentVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			returnMap = reqService.insertPaymentInfo(request, paymentVO);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;
	}
	
	
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
	public Map<String, Object> updatePaymentInfo(HttpServletRequest request, @RequestBody ProjectPaymentVO paymentVO) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = reqService.updatePaymentInfo(request, paymentVO);
		
		return returnMap;
	}
	
	/**
	 * 
	  * @Method Name : viewBillInfo
	  * @Cdate       : 2021. 09. 15.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :매입 계산서 화면
	  * @param request
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/purchase/viewBillInfo.do")
	public String viewBillInfo(HttpServletRequest request, ModelMap model) throws Exception {
		List<?> billList = null;
		String billNo = request.getParameter("billNo");
		ProjectPaymentVO projectPaymentVO = new ProjectPaymentVO();
		String paymentKey = request.getParameter("paymentKey");
		try {
			billList = reqService.selectPcBillInfo(billNo);
			projectPaymentVO.setPaymentKey(paymentKey);
		
			model.put("displayUtil", new CepDisplayUtil());
			model.addAttribute("billList", billList);
			model.addAttribute("paymentVO", reqService.selectPaymentDetail(projectPaymentVO));
		} catch(Exception e) {
			throw new Exception(e);
		}
		return "project/request/purchase/viewBillInfo";
	}
	
}
