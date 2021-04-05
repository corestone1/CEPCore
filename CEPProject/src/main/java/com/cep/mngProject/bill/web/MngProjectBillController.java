
package com.cep.mngProject.bill.web;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import com.cep.mngProject.bill.service.MngProjectBillService;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;
import com.cep.mngProject.fundSchedule.web.MngProjectFundScheduleController;
import com.cep.mngProject.order.service.MngProjectOrderService;
import com.cep.project.service.ProjectDetailService;
import com.cep.project.vo.ProjectVO;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.FileMngUtil;
import com.cmm.vo.FileVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MngProjectBillController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectFundScheduleController.class);
	
	@Resource(name="mngProjectBillService")
	private MngProjectBillService service;
	
	@Resource(name="mngProjectOrderService")
	private MngProjectOrderService acService;
	
	@Resource(name="projectDetailService")
	private ProjectDetailService projectDetailService;
	
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
			logger.debug("================================= deleteBill ===========================");
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
	
	
	@RequestMapping(value="/mngProject/bill/popup/viewWriteSdBilling.do")
	public String viewWriteSdBilling(@ModelAttribute("mngProjectBillVO") MngProjectBillVO mngProjectBillVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		logger.debug("================= viewWriteSdBilling ====================");
		logger.debug("pjKey       : {}", mngProjectBillVO.getPjKey());
		logger.debug("billCallKey : {}", mngProjectBillVO.getBillCallKey());
		
		
		try {
			
			ProjectVO projectVO = new ProjectVO();
			projectVO.setPjKey(mngProjectBillVO.getPjKey());
			
			model.addAttribute("ProjectInfo", projectDetailService.selectProjectDetail(projectVO));
			
			model.addAttribute("billingOpInfo", service.selectSdBillingOp(mngProjectBillVO));
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		
		return "/mngProject/bill/popup/writeSdBilling";
		
	}
	
	
	@Resource(name="fileMngUtil")
	private FileMngUtil fileUtils;
	
	@RequestMapping(value="/mngProject/bill/xmlFileUpload.do", method=RequestMethod.POST)
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
	
	@RequestMapping(value="/mngProject/bill/saveXmlBilling.do", method=RequestMethod.POST)
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
	
	
	@RequestMapping(value="/mngProject/bill/popup/viewWritePcBillingExcel.do")
	public String viewWritePcBillingExcel(@ModelAttribute("mngProjectBillVO") MngProjectBillVO mngProjectBillVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		logger.debug("================= viewWritePcBillingExcel ====================");
		
		try {
			
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		
		return "/mngProject/bill/popup/writePcBillingExcel";
		
	}
	
	
	@RequestMapping(value="/mngProject/bill/excelFileUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> excelFileUpload(FileVO fileVO, MultipartHttpServletRequest multiRequest) throws Exception {
		                                                     
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		MultipartFile lmpfExcel = multiRequest.getFile("excelFile");
		
		String lstExcelPath = "D:/tmp/" + CepDateUtil.getToday("yyyyMMddHHmmssSSS");
		
		File lfExcel = new File(lstExcelPath);
		
		logger.debug("file path : {}", lfExcel.getAbsolutePath());
		logger.debug("lmpfExcel : {}", lmpfExcel);
		
		FileInputStream inputStream = null;
		XSSFWorkbook    xworkbook   = null;
		
		try {
			
			lmpfExcel.transferTo(lfExcel);
			
			File file = new File(lstExcelPath);
			inputStream = new FileInputStream(file);
            
			// 파일 스트림을 XSSFWorkbook 객체로 생성
			// xlsx 파일만 등록
            // HSSFWorkbook hworkbook = new HSSFWorkbook(inputStream); // 2007 이전 버전(xls파일)
            xworkbook = new XSSFWorkbook(inputStream);
            
            // XSSFWorkbook의 첫번째 시트를 가져옴
            XSSFSheet sheet = xworkbook.getSheetAt(0);
            
            int litXlsxRows = sheet.getPhysicalNumberOfRows();
            
            XSSFRow xlsxRow = null;
            List<EgovMap> llExcelValue = new ArrayList<EgovMap>();
            EgovMap lemRow = null;
            for(int i=1; i<litXlsxRows; i++) {
            	
            	
            	lemRow  = new EgovMap();
            	xlsxRow = sheet.getRow(i); //셀정보
            	
            	logger.debug("{} :  1 = {}", i, xlsxRow.getCell(1).toString()); 
                logger.debug("{} :  2 = {}", i, xlsxRow.getCell(2).toString());
                logger.debug("{} :  3 = {}", i, xlsxRow.getCell(3).toString());
                logger.debug("{} :  4 = {}", i, xlsxRow.getCell(4).toString());
                logger.debug("{} :  5 = {}", i, xlsxRow.getCell(5).toString());
                logger.debug("{} :  6 = {}", i, xlsxRow.getCell(6).toString());
                logger.debug("{} :  7 = {}", i, xlsxRow.getCell(7).toString());
                logger.debug("{} :  8 = {}", i, xlsxRow.getCell(8).getNumericCellValue());
                logger.debug("{} :  9 = {}", i, xlsxRow.getCell(9).getNumericCellValue());
                logger.debug("{} : 10 = {}", i, xlsxRow.getCell(10).getNumericCellValue());
                logger.debug("{} : 11 = {}", i, xlsxRow.getCell(11).toString());
                logger.debug("{} : 12 = {}", i, xlsxRow.getCell(12).toString());
                logger.debug("{} : 13 = {}", i, xlsxRow.getCell(13).toString());
                logger.debug("=================================================");

                lemRow.put("gubun",       xlsxRow.getCell(1).toString());
            	lemRow.put("kind",        xlsxRow.getCell(2).toString());
            	lemRow.put("writeDt",     xlsxRow.getCell(3).toString());
            	lemRow.put("acKey",       xlsxRow.getCell(4).toString());
            	lemRow.put("subAcKey",    xlsxRow.getCell(5).toString());
            	lemRow.put("acNm",        xlsxRow.getCell(6).toString());
            	lemRow.put("ceoNm",       xlsxRow.getCell(7).toString());
            	lemRow.put("billAmount",  xlsxRow.getCell(8).getNumericCellValue());
            	lemRow.put("billTax",     xlsxRow.getCell(9).getNumericCellValue());
            	lemRow.put("totalAmount", xlsxRow.getCell(10).getNumericCellValue());
            	lemRow.put("remark",      xlsxRow.getCell(11).toString());
            	lemRow.put("billNo",      xlsxRow.getCell(12).toString());
            	lemRow.put("billIssueDt", xlsxRow.getCell(13).toString());
            	
            	
            	if(xlsxRow.getCell(1).toString().trim().equals("매입"))
            		llExcelValue.add(lemRow);
            }
            
            returnMap.put("billingList", llExcelValue);
            
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		} finally {
			
			if(xworkbook   != null){ try{ xworkbook.close(); }catch(Exception e){}}
			if(inputStream != null){ try{ inputStream.close(); }catch(Exception e){}}
		}
		
		return returnMap;
		
	}

	@RequestMapping(value="/mngProject/bill/saveExcelBilling.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertBillingExcelBatch(HttpServletRequest request, @RequestBody MngProjectBillVO billVO ) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		
		try {
			
			logger.debug("======================= writeOrderInfo =========================");
			logger.debug("billVO.size() : {}", billVO.getMngBillInsertVOList().size());
			
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			billVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.insertBillingExcelBatch(billVO);
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
		
	}
}
