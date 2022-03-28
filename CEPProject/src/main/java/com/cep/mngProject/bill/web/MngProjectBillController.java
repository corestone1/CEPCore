package com.cep.mngProject.bill.web;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngCommon.bill.vo.MngCommonBillVO;
import com.cep.mngProject.bill.service.MngProjectBillService;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;
import com.cep.mngProject.order.service.MngProjectOrderService;
import com.cep.project.service.ProjectDetailService;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.FileMngUtil;
import com.cmm.vo.FileVO;

@Controller
@RequestMapping(value="/mngProject/bill")
public class MngProjectBillController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectBillController.class);
	
	@Resource(name="mngProjectBillService")
	private MngProjectBillService service;
	
	@Resource(name="mngProjectOrderService")
	private MngProjectOrderService acService;
	
	@Resource(name="projectDetailService")
	private ProjectDetailService projectDetailService;
	
	@Resource(name="fileMngUtil")
	private FileMngUtil fileUtils;
	
	@RequestMapping(value="/detail/main.do")
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
	
	@RequestMapping(value="/detail/billForm.do")
	public String billFormView(@ModelAttribute("searchVO") MngProjectBillSearchVO searchVO, ModelMap model) throws Exception {
		
		try {
			logger.debug("searchVO.getBillNo()			: {}", searchVO.getBillNo());
			logger.debug("searchVO.getPjKey()			: {}", searchVO.getPjKey());
			logger.debug("searchVO.getBillTurnNo()	: {}", searchVO.getBillTurnNo());
			
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			// 회차 정보 조회
			model.addAttribute("collectTurn", service.selectCollectTurn(searchVO));
			
			// 현재 계산서 정보 조회
			model.addAttribute("billInfo", service.selectBillDetailInfo(searchVO));
			
			// 고객사 키 전달
			model.addAttribute("acKey", searchVO.getAcKey());
			
			// 고객 담당자 조회
			AccountSearchVO accoutSearchVO = new AccountSearchVO();
			accoutSearchVO.setAcKey(searchVO.getAcKey());
			model.addAttribute("directorList", acService.selectDirectorList(accoutSearchVO));
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		return "mngProject/bill/detail/billForm";
	}
	
	@RequestMapping(value="/detail/preBillList.do")
	public String preBillListView(@ModelAttribute("searchVO") MngProjectBillSearchVO searchVO, ModelMap model) throws Exception {
		
		try{
			logger.debug("searchVO.getPjKey()      : {}", searchVO.getPjKey());
			logger.debug("searchVO.getAcKey()      : {}", searchVO.getAcKey());
			
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			model.addAttribute("pjKey", searchVO.getPjKey());
			model.addAttribute("acKey", searchVO.getAcKey());
			
			//계산서 목록 조회
			model.addAttribute("prePaymentList", service.selectSdBillList(searchVO));
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "mngProject/bill/detail/preBillList";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/detail/writeBillReqeust.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> writeBillReqeust(@RequestBody MngProjectBillVO mngProjectBillVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.debug("=============== write ======================");
		logger.debug("=== mngProjectBillVO.getPjKey()             = {}", mngProjectBillVO.getPjKey());
		logger.debug("=== mngProjectBillVO.getAcKey()             = {}", mngProjectBillVO.getAcKey());
		logger.debug("=== mngProjectBillVO.getBillCallKey()       = {}", mngProjectBillVO.getBillCallKey());
		logger.debug("=== mngProjectBillVO.getBillIssueType()     = {}", mngProjectBillVO.getBillIssueType());
		logger.debug("=== mngProjectBillVO.getBillTurnNo()        = {}", mngProjectBillVO.getBillTurnNo());
		logger.debug("=== mngProjectBillVO.getBillAmount()        = {}", mngProjectBillVO.getBillAmount());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorTel() = {}", mngProjectBillVO.getBillAcDirectorTel());
		logger.debug("=== mngProjectBillVO.getBillRequestDt()     = {}", mngProjectBillVO.getBillRequestDt());
		logger.debug("=== mngProjectBillVO.getRemark()            = {}", mngProjectBillVO.getRemark());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
		
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngProjectBillVO.setRegEmpKey(sessionMap.get("empKey"));
			
			returnMap = service.insertBillRequest(request, mngProjectBillVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
	}
	
	@RequestMapping(value="/popup/viewWriteSdBilling.do")
	public String viewWriteSdBilling(@ModelAttribute("mngProjectBillVO") MngProjectBillSearchVO mngProjectBillVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		logger.debug("================= viewWriteSdBilling ====================");
		logger.debug("pjKey       : {}", mngProjectBillVO.getPjKey());
		logger.debug("billCallKey : {}", mngProjectBillVO.getBillCallKey());
		logger.debug("billCtFkKey : {}", mngProjectBillVO.getBillCtFkKey());
		
		
		try {
			
			/*ProjectVO projectVO = new ProjectVO();
			projectVO.setPjKey(mngProjectBillVO.getPjKey());
			
			model.addAttribute("ProjectInfo", projectDetailService.selectProjectDetail(projectVO));*/
			
			model.addAttribute("billingOpInfo", service.selectSdBillList(mngProjectBillVO).get(0));
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		
		return "/mngProject/bill/popup/writeSdBilling";
		
	}
	
	@RequestMapping(value="/xmlFileUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> xmlFileUpload(FileVO fileVO, MultipartHttpServletRequest multiRequest) throws Exception {
		                                                     
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		MultipartFile lmpfXml = multiRequest.getFile("xmlFile");
		
		String lstXmlPath = "D:/tmp/" + CepDateUtil.getToday("yyyyMMddHHmmssSSS");
		
		File lfXml = new File(lstXmlPath);
		
		logger.debug("file path : {}", lfXml.getAbsolutePath());
		logger.debug(" lmpfXml : {}", lmpfXml);
		
		try {
			
			lmpfXml.transferTo(lfXml);
			
			DocumentBuilderFactory factory  = DocumentBuilderFactory.newInstance();
			DocumentBuilder        builder  = factory.newDocumentBuilder();
			Document               document = builder.parse(lstXmlPath);
			
			NodeList list    = document.getElementsByTagName("TaxInvoiceDocument");
			
			logger.debug(" ============= TaxInvoiceDocument ====================");
			for(Node node = list.item(0).getFirstChild(); node != null; node=node.getNextSibling()) {
				
				logger.debug("{} : {}", node.getNodeName(), node.getTextContent().trim());
				
				if(node.getNodeName().equals("IssueID"))
					returnMap.put("IssueID", node.getTextContent().trim());
				else if(node.getNodeName().equals("DescriptionText"))
					returnMap.put("DescriptionText", node.getTextContent().trim());
				else if(node.getNodeName().equals("IssueDateTime"))
					returnMap.put("IssueDateTime", node.getTextContent().trim());
			}
			
			
			
			/*
			list    = document.getElementsByTagName("InvoicerParty");
			
			logger.debug(" ============= InvoicerParty ====================");
			for(Node node = list.item(0).getFirstChild(); node != null; node=node.getNextSibling()) {
				
				logger.debug("{} : {}", node.getNodeName(), node.getTextContent().trim());
			}
			*/
			
			
			list    = document.getElementsByTagName("InvoiceeParty");
			
			logger.debug(" ============= InvoiceeParty ====================");
			for(Node node = list.item(0).getFirstChild(); node != null; node=node.getNextSibling()) {
				
				logger.debug("{} : {}", node.getNodeName(), node.getTextContent().trim());
				
				if(node.getNodeName().equals("ID"))
					returnMap.put("InvoiceePartyID", node.getTextContent().trim());
				else if(node.getNodeName().equals("NameText"))
					returnMap.put("InvoiceePartyNameText", node.getTextContent().trim());
				
			}
			
			
			list    = document.getElementsByTagName("PrimaryDefinedContact");
			
			logger.debug(" ============= PrimaryDefinedContact ====================");
			for(Node node = list.item(0).getFirstChild(); node != null; node=node.getNextSibling()) {
				
				logger.debug("{} : {}", node.getNodeName(), node.getTextContent().trim());
				
				if(node.getNodeName().equals("PersonNameText"))
					returnMap.put("PersonNameText", node.getTextContent().trim());
				else if(node.getNodeName().equals("URICommunication"))
					returnMap.put("URICommunication", node.getTextContent().trim());
			}
			
			
			list    = document.getElementsByTagName("SpecifiedMonetarySummation");
			
			logger.debug(" ============= SpecifiedMonetarySummation ====================");
			for(Node node = list.item(0).getFirstChild(); node != null; node=node.getNextSibling()) {
				
				logger.debug("{} : {}", node.getNodeName(), node.getTextContent().trim());
				
				if(node.getNodeName().equals("ChargeTotalAmount"))
					returnMap.put("ChargeTotalAmount", node.getTextContent().trim());
				else if(node.getNodeName().equals("TaxTotalAmount"))
					returnMap.put("TaxTotalAmount", node.getTextContent().trim());
				else if(node.getNodeName().equals("GrandTotalAmount"))
					returnMap.put("GrandTotalAmount", node.getTextContent().trim());
			}
			
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
		
	}
	
	@RequestMapping(value="/isExistBill.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> isExistBill(@ModelAttribute("mngProjectBillVO")  MngProjectBillVO mngProjectBillVO, HttpServletRequest request) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			
			logger.debug("============ isExistBill ================");
			logger.debug("billingVO.getBillNo()      : {}", mngProjectBillVO.getBillNo());
			logger.debug("billingVO.getPjKey()       : {}", mngProjectBillVO.getPjKey());
			logger.debug("billingVO.getBillCtFkKey() : {}", mngProjectBillVO.getBillCtFkKey());
			logger.debug("billingVO.getAcKey()       : {}", mngProjectBillVO.getAcKey());
			logger.debug("billingVO.getBillIssueDt() : {}", mngProjectBillVO.getBillIssueDt());
			logger.debug("billingVO.getBillAmount()  : {}", mngProjectBillVO.getBillAmount());
			logger.debug("billingVO.getRemark()      : {}", mngProjectBillVO.getRemark());
			
			returnMap = service.selectXmlBillList(mngProjectBillVO);
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/saveXmlBilling.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertXmlBilling(@ModelAttribute("billingVO")  MngProjectBillVO billingVO, HttpServletRequest request) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			
			logger.debug("============ insertXmlBilling ================");
			logger.debug("billingVO.getBillNo()      : {}", billingVO.getBillNo());
			logger.debug("billingVO.getPjKey()       : {}", billingVO.getPjKey());
			logger.debug("billingVO.getBillCtFkKey() : {}", billingVO.getBillCtFkKey());
			logger.debug("billingVO.getAcKey()       : {}", billingVO.getAcKey());
			logger.debug("billingVO.getBillIssueDt() : {}", billingVO.getBillIssueDt());
			logger.debug("billingVO.getBillAmount()  : {}", billingVO.getBillAmount());
			logger.debug("billingVO.getRemark()      : {}", billingVO.getRemark());
			
			HashMap<String, String> sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			billingVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.insertSdBillingXml(billingVO);
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/cancelXmlBilling.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteXmlBilling(@ModelAttribute("billingVO")  MngProjectBillVO billingVO, HttpServletRequest request) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			
			logger.debug("============ deleteXmlBilling ================");
			logger.debug("billingVO.getBillNo()      : {}", billingVO.getBillNo());
			logger.debug("billingVO.getPjKey()       : {}", billingVO.getPjKey());
			logger.debug("billingVO.getBillCtFkKey() : {}", billingVO.getBillCtFkKey());
			logger.debug("billingVO.getAcKey()       : {}", billingVO.getAcKey());
			logger.debug("billingVO.getBillIssueDt() : {}", billingVO.getBillIssueDt());
			logger.debug("billingVO.getBillAmount()  : {}", billingVO.getBillAmount());
			logger.debug("billingVO.getRemark()      : {}", billingVO.getRemark());
			
			HashMap<String, String> sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			billingVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.deleteSdBillingXml(billingVO);
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/detail/writeBillComplate.do")
	@ResponseBody
	public Map<String, Object> writeBillComplate(@ModelAttribute("mngProjectBillVO") MngProjectBillVO mngProjectBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== writeBillComplate ======================");
		logger.debug("=== mngProjectBillVO.getPjKey()             = {}", mngProjectBillVO.getPjKey());
		logger.debug("=== mngProjectBillVO.getBillCallKey()       = {}", mngProjectBillVO.getBillCallKey());
		logger.debug("=== mngProjectBillVO.getBillIssueType()     = {}", mngProjectBillVO.getBillIssueType());
		logger.debug("=== mngProjectBillVO.getBillTurnNo()        = {}", mngProjectBillVO.getBillTurnNo());
		logger.debug("=== mngProjectBillVO.getBillAmount()        = {}", mngProjectBillVO.getBillAmount());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorTel() = {}", mngProjectBillVO.getBillAcDirectorTel());
		logger.debug("=== mngProjectBillVO.getBillRequestDt()     = {}", mngProjectBillVO.getBillRequestDt());
		logger.debug("=== mngProjectBillVO.getRemark()            = {}", mngProjectBillVO.getRemark());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
		
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngProjectBillVO.setRegEmpKey(sessionMap.get("empKey"));
			mngProjectBillVO.setBillIssueStatus("I");
			
			returnMap = service.updateBillComplate(request, mngProjectBillVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		return returnMap;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/detail/deleteBillComplete.do")
	@ResponseBody
	public Map<String, Object> deleteBillComplete(@ModelAttribute("mngProjectBillVO") MngProjectBillVO mngProjectBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== deleteBillComplete ======================");
		logger.debug("=== mngProjectBillVO.getPjKey()             = {}", mngProjectBillVO.getPjKey());
		logger.debug("=== mngProjectBillVO.getBillCallKey()       = {}", mngProjectBillVO.getBillCallKey());
		logger.debug("=== mngProjectBillVO.getBillIssueType()     = {}", mngProjectBillVO.getBillIssueType());
		logger.debug("=== mngProjectBillVO.getBillTurnNo()        = {}", mngProjectBillVO.getBillTurnNo());
		logger.debug("=== mngProjectBillVO.getBillAmount()        = {}", mngProjectBillVO.getBillAmount());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorTel() = {}", mngProjectBillVO.getBillAcDirectorTel());
		logger.debug("=== mngProjectBillVO.getBillRequestDt()     = {}", mngProjectBillVO.getBillRequestDt());
		logger.debug("=== mngProjectBillVO.getRemark()            = {}", mngProjectBillVO.getRemark());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
		
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngProjectBillVO.setRegEmpKey(sessionMap.get("empKey"));
			
			mngProjectBillVO.setBillIssueStatus("R");
			returnMap = service.updateBillComplate(request, mngProjectBillVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		return returnMap;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/detail/writePaymentsComplate.do")
	@ResponseBody
	public Map<String, Object> writePaymentsComplate(@ModelAttribute("mngProjectBillVO") MngProjectBillVO mngProjectBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== writeBillComplate ======================");
		logger.debug("=== mngProjectBillVO.getPjKey()             = {}", mngProjectBillVO.getPjKey());
		logger.debug("=== mngProjectBillVO.getBillCallKey()       = {}", mngProjectBillVO.getBillCallKey());
		logger.debug("=== mngProjectBillVO.getSalesKey()          = {}", mngProjectBillVO.getSalesKey());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
		
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngProjectBillVO.setRegEmpKey(sessionMap.get("empKey"));
			
			returnMap = service.updatePaymentsComplate(request, mngProjectBillVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			returnMap.put("successYN", "N");
			throw e;
		}
		
		
		
		return returnMap;
	}
	
}
