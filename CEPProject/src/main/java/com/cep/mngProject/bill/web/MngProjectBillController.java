package com.cep.mngProject.bill.web;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngProject.bill.service.MngProjectBillService;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;
import com.cep.mngProject.fundSchedule.web.MngProjectFundScheduleController;
import com.cep.mngProject.order.service.MngProjectOrderService;
import com.cmm.util.CepDisplayUtil;

@Controller
public class MngProjectBillController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectFundScheduleController.class);
	
	@Resource(name="mngProjectBillService")
	private MngProjectBillService service;
	
	@Resource(name="mngProjectOrderService")
	private MngProjectOrderService acService;
	
	@RequestMapping(value="/mngProject/bill/list.do")
	public String selectBill(@ModelAttribute("searchVO") MngProjectBillSearchVO searchVO, ModelMap model) throws Exception {
		
		try{
			logger.debug("searchVO.getSearchClassCd() : {}", searchVO.getSearchClassCd());
			model.addAttribute("billList", service.selectBillList(searchVO));
			model.addAttribute("displayUtil", new CepDisplayUtil());
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "mngProject/bill/list";
	}
	
	@RequestMapping(name="/mngProject/bill/delete.do")
	@ResponseBody
	public Map<String, Object> deleteBill(@ModelAttribute("searchVO") MngProjectBillSearchVO searchVO, HttpServletRequest request) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try{
			searchVO.setBillNo(request.getParameter("billNo"));
			
			service.deleteBill(searchVO);
			
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return returnMap;
	}
	
	@RequestMapping(value="/mngProject/bill/detail/main.do")
	public String billDetailView(@ModelAttribute("searchVO") MngProjectBillSearchVO searchVO, ModelMap model) throws Exception {
		
		try{
			logger.debug("searchVO.getPjKey()  : {}", searchVO.getPjKey());
			logger.debug("searchVO.getBillNo() : {}", searchVO.getBillNo());
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			//기본정보 조회
			model.addAttribute("basicInfo", service.selectBillBasicInfo(searchVO));
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "mngProject/bill/detail/main";
	}
	
	@RequestMapping(value="/mngProject/bill/detail/billForm.do")
	public String billFromView(@ModelAttribute("searchVO") MngProjectBillSearchVO searchVO, ModelMap model) throws Exception {
		
		try{
			logger.debug("searchVO.getBillNo()     : {}", searchVO.getBillNo());
			logger.debug("searchVO.getPjKey()      : {}", searchVO.getPjKey());
			logger.debug("searchVO.getBillTurnNo() : {}", searchVO.getBillTurnNo());
			
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			//회차  정보 조회
			model.addAttribute("collectTurn", service.selectCollectTurn(searchVO));
			
			//현재 계산서 정보 조회
			model.addAttribute("billInfo", service.selectBillDetailInfo(searchVO));
			
			//고객사 키 전달
			model.addAttribute("acKey", searchVO.getAcKey());
			
			//고객 담당자 조회
			AccountSearchVO accoutSearchVO = new AccountSearchVO();
			accoutSearchVO.setAcKey(searchVO.getAcKey());
			model.addAttribute("directorList", acService.selectDirectorList(accoutSearchVO));
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "mngProject/bill/detail/billForm";
	}
	
	@RequestMapping(value="/mngProject/bill/detail/preBillList.do")
	public String preBillListView(@ModelAttribute("searchVO") MngProjectBillSearchVO searchVO, ModelMap model) throws Exception {
		
		try{
			logger.debug("searchVO.getPjKey()      : {}", searchVO.getPjKey());
			logger.debug("searchVO.getAcKey()      : {}", searchVO.getAcKey());
			
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			model.addAttribute("pjKey", searchVO.getPjKey());
			model.addAttribute("acKey", searchVO.getAcKey());
			
			//계산서 목록 조회
			model.addAttribute("prePaymentList", service.selectBillList(searchVO));
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "mngProject/bill/detail/preBillList";
	}
	
	
	@RequestMapping(value="/mngProject/bill/detail/writeBillReqeust.do")
	@ResponseBody
	public Map<String, Object> writeBillReqeust(@ModelAttribute("mngProjectBillVO") MngProjectBillVO mngProjectBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== write ======================");
		logger.debug("=== mngProjectBillVO.getPjKey()             = {}", mngProjectBillVO.getPjKey());
		logger.debug("=== mngProjectBillVO.getAcKey()             = {}", mngProjectBillVO.getAcKey());
		logger.debug("=== mngProjectBillVO.getBillCallKey()       = {}", mngProjectBillVO.getBillCallKey());
		logger.debug("=== mngProjectBillVO.getBillIssueType()     = {}", mngProjectBillVO.getBillIssueType());
		logger.debug("=== mngProjectBillVO.getBillTurnNo()        = {}", mngProjectBillVO.getBillTurnNo());
		logger.debug("=== mngProjectBillVO.getBillAmount()        = {}", mngProjectBillVO.getBillAmount());
		logger.debug("=== mngProjectBillVO.getBillTaxYn()         = {}", mngProjectBillVO.getBillTaxYn());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorKey() = {}", mngProjectBillVO.getBillAcDirectorKey());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorTel() = {}", mngProjectBillVO.getBillAcDirectorTel());
		logger.debug("=== mngProjectBillVO.getBillRequestDt()     = {}", mngProjectBillVO.getBillRequestDt());
		logger.debug("=== mngProjectBillVO.getRemark()            = {}", mngProjectBillVO.getRemark());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
		
			if(mngProjectBillVO.getBillTaxYn() == null)
				mngProjectBillVO.setBillTaxYn("N");
				
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngProjectBillVO.setRegEmpKey(sessionMap.get("empKey"));
			
			logger.debug("=== mngProjectBillVO.getBillTaxYn()         = {}", mngProjectBillVO.getBillTaxYn());
			
			service.insertBillRequest(mngProjectBillVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		
		return returnMap;
	}
	
	
	@RequestMapping(value="/mngProject/bill/detail/writeBillComplate.do")
	@ResponseBody
	public Map<String, Object> writeBillComplate(@ModelAttribute("mngProjectBillVO") MngProjectBillVO mngProjectBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== writeBillComplate ======================");
		logger.debug("=== mngProjectBillVO.getPjKey()             = {}", mngProjectBillVO.getPjKey());
		logger.debug("=== mngProjectBillVO.getBillCallKey()       = {}", mngProjectBillVO.getBillCallKey());
		logger.debug("=== mngProjectBillVO.getBillIssueType()     = {}", mngProjectBillVO.getBillIssueType());
		logger.debug("=== mngProjectBillVO.getBillTurnNo()        = {}", mngProjectBillVO.getBillTurnNo());
		logger.debug("=== mngProjectBillVO.getBillAmount()        = {}", mngProjectBillVO.getBillAmount());
		logger.debug("=== mngProjectBillVO.getBillTaxYn()         = {}", mngProjectBillVO.getBillTaxYn());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorKey() = {}", mngProjectBillVO.getBillAcDirectorKey());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorTel() = {}", mngProjectBillVO.getBillAcDirectorTel());
		logger.debug("=== mngProjectBillVO.getBillRequestDt()     = {}", mngProjectBillVO.getBillRequestDt());
		logger.debug("=== mngProjectBillVO.getRemark()            = {}", mngProjectBillVO.getRemark());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
		
			if(mngProjectBillVO.getBillTaxYn() == null)
				mngProjectBillVO.setBillTaxYn("N");
				
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngProjectBillVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.updateBillComplate(mngProjectBillVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		return returnMap;
	}
	
	
	@RequestMapping(value="/mngProject/bill/detail/writePaymentsComplate.do")
	@ResponseBody
	public Map<String, Object> writePaymentsComplate(@ModelAttribute("mngProjectBillVO") MngProjectBillVO mngProjectBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== writeBillComplate ======================");
		logger.debug("=== mngProjectBillVO.getPjKey()             = {}", mngProjectBillVO.getPjKey());
		logger.debug("=== mngProjectBillVO.getBillCallKey()       = {}", mngProjectBillVO.getBillCallKey());
		logger.debug("=== mngProjectBillVO.getSalesKey()          = {}", mngProjectBillVO.getSalesKey());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
		
			if(mngProjectBillVO.getBillTaxYn() == null)
				mngProjectBillVO.setBillTaxYn("N");
				
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngProjectBillVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.updatePaymentsComplate(mngProjectBillVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		
		return returnMap;
	}
	
	
	
	@RequestMapping(value="/mngProject/bill/detail/writeBillInsert.do")
	@ResponseBody
	public Map<String, Object> writeBillInsert(@ModelAttribute("mngProjectBillVO") MngProjectBillVO mngProjectBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== writeBillComplate ======================");
		logger.debug("=== mngProjectBillVO.getPjKey()             = {}", mngProjectBillVO.getPjKey());
		logger.debug("=== mngProjectBillVO.getAcKey()             = {}", mngProjectBillVO.getAcKey());
		logger.debug("=== mngProjectBillVO.getBillCallKey()       = {}", mngProjectBillVO.getBillCallKey());
		logger.debug("=== mngProjectBillVO.getBillIssueType()     = {}", mngProjectBillVO.getBillIssueType());
		logger.debug("=== mngProjectBillVO.getBillTurnNo()        = {}", mngProjectBillVO.getBillTurnNo());
		logger.debug("=== mngProjectBillVO.getBillAmount()        = {}", mngProjectBillVO.getBillAmount());
		logger.debug("=== mngProjectBillVO.getBillTaxYn()         = {}", mngProjectBillVO.getBillTaxYn());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorKey() = {}", mngProjectBillVO.getBillAcDirectorKey());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorTel() = {}", mngProjectBillVO.getBillAcDirectorTel());
		logger.debug("=== mngProjectBillVO.getBillRequestDt()     = {}", mngProjectBillVO.getBillRequestDt());
		logger.debug("=== mngProjectBillVO.getRemark()            = {}", mngProjectBillVO.getRemark());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
		
			if(mngProjectBillVO.getBillTaxYn() == null)
				mngProjectBillVO.setBillTaxYn("N");
				
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngProjectBillVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.writeBillInsert(mngProjectBillVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		
		return returnMap;
	}
	
	
}
