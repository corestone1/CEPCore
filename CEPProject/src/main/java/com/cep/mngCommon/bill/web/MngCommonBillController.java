
package com.cep.mngCommon.bill.web;

import java.io.File;
import java.io.FileInputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cep.mngCommon.bill.service.MngCommonBillService;
import com.cep.mngCommon.bill.vo.MngCommonBillSearchVO;
import com.cep.mngCommon.bill.vo.MngCommonBillVO;
import com.cep.mngProject.fundSchedule.web.MngProjectFundScheduleController;
import com.cep.mngProject.order.service.MngProjectOrderService;
import com.cep.project.service.ProjectDetailService;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.FileMngUtil;
import com.cmm.vo.FileVO;
import com.mysql.jdbc.MysqlErrorNumbers;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping(value="/mngCommon/bill")
public class MngCommonBillController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectFundScheduleController.class);
	
	@Resource(name="mngCommonBillService")
	private MngCommonBillService service;
	
	@Resource(name="mngProjectOrderService")
	private MngProjectOrderService acService;
	
	@Resource(name="projectDetailService")
	private ProjectDetailService projectDetailService;
	
	@Value("#{comProps['fileStorePath']}")
	private String filePath;
	
	@RequestMapping(value="/list.do")
	public String selectBill(@ModelAttribute("searchVO") MngCommonBillSearchVO searchVO, ModelMap model) throws Exception {
		
		try{
			logger.debug("searchVO.getSearchClassCd() : {}", searchVO.getSearchClassCd());
			model.addAttribute("billList", service.selectBillList(searchVO));
			model.addAttribute("displayUtil", new CepDisplayUtil());
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "mngCommon/bill/list";
	}
	
	@RequestMapping(value="/delete.do")
	@ResponseBody
	public Map<String, Object> deleteBill(@RequestBody MngCommonBillSearchVO searchVO, HttpServletRequest request) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try{
			logger.debug("================================= deleteBill ===========================");
			
			returnMap = service.deleteBill(searchVO);
			
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return returnMap;
	}
	
	/*@RequestMapping(value="/detail/main.do")
	public String billDetailView(@ModelAttribute("searchVO") MngCommonBillSearchVO searchVO, ModelMap model) throws Exception {
		
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
		
		return "mngCommon/bill/detail/main";
	}*/
	
	/*@RequestMapping(value="/detail/billForm.do")
	public String billFromView(@ModelAttribute("searchVO") MngCommonBillSearchVO searchVO, ModelMap model) throws Exception {
		
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
		
		return "mngCommon/bill/detail/billForm";
	}*/
	
	/*@RequestMapping(value="/detail/preBillList.do")
	public String preBillListView(@ModelAttribute("searchVO") MngCommonBillSearchVO searchVO, ModelMap model) throws Exception {
		
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
		
		return "mngCommon/bill/detail/preBillList";
	}*/
	
	
	/*@RequestMapping(value="/detail/writeBillReqeust.do")
	@ResponseBody
	public Map<String, Object> writeBillReqeust(@ModelAttribute("mngCommonBillVO") MngCommonBillVO mngCommonBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== write ======================");
		logger.debug("=== mngProjectBillVO.getPjKey()             = {}", mngCommonBillVO.getPjKey());
		logger.debug("=== mngProjectBillVO.getAcKey()             = {}", mngCommonBillVO.getAcKey());
		logger.debug("=== mngProjectBillVO.getBillCallKey()       = {}", mngCommonBillVO.getBillCallKey());
		logger.debug("=== mngProjectBillVO.getBillIssueType()     = {}", mngCommonBillVO.getBillIssueType());
		logger.debug("=== mngProjectBillVO.getBillTurnNo()        = {}", mngCommonBillVO.getBillTurnNo());
		logger.debug("=== mngProjectBillVO.getBillAmount()        = {}", mngCommonBillVO.getBillAmount());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorKey() = {}", mngCommonBillVO.getBillAcDirectorKey());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorTel() = {}", mngCommonBillVO.getBillAcDirectorTel());
		logger.debug("=== mngProjectBillVO.getBillRequestDt()     = {}", mngCommonBillVO.getBillRequestDt());
		logger.debug("=== mngProjectBillVO.getRemark()            = {}", mngCommonBillVO.getRemark());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
		
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngCommonBillVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.insertBillRequest(mngCommonBillVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		
		return returnMap;
	}*/
	
	
	/*@RequestMapping(value="/detail/writeBillComplate.do")
	@ResponseBody
	public Map<String, Object> writeBillComplate(@ModelAttribute("mngCommonBillVO") MngCommonBillVO mngCommonBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== writeBillComplate ======================");
		logger.debug("=== mngProjectBillVO.getPjKey()             = {}", mngCommonBillVO.getPjKey());
		logger.debug("=== mngProjectBillVO.getBillCallKey()       = {}", mngCommonBillVO.getBillCallKey());
		logger.debug("=== mngProjectBillVO.getBillIssueType()     = {}", mngCommonBillVO.getBillIssueType());
		logger.debug("=== mngProjectBillVO.getBillTurnNo()        = {}", mngCommonBillVO.getBillTurnNo());
		logger.debug("=== mngProjectBillVO.getBillAmount()        = {}", mngCommonBillVO.getBillAmount());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorKey() = {}", mngCommonBillVO.getBillAcDirectorKey());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorTel() = {}", mngCommonBillVO.getBillAcDirectorTel());
		logger.debug("=== mngProjectBillVO.getBillRequestDt()     = {}", mngCommonBillVO.getBillRequestDt());
		logger.debug("=== mngProjectBillVO.getRemark()            = {}", mngCommonBillVO.getRemark());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
		
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngCommonBillVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.updateBillComplate(mngCommonBillVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		return returnMap;
	}*/
	
	
	/*@RequestMapping(value="/detail/writePaymentsComplate.do")
	@ResponseBody
	public Map<String, Object> writePaymentsComplate(@ModelAttribute("mngCommonBillVO") MngCommonBillVO mngCommonBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== writeBillComplate ======================");
		logger.debug("=== mngProjectBillVO.getPjKey()             = {}", mngCommonBillVO.getPjKey());
		logger.debug("=== mngProjectBillVO.getBillCallKey()       = {}", mngCommonBillVO.getBillCallKey());
		logger.debug("=== mngProjectBillVO.getSalesKey()          = {}", mngCommonBillVO.getSalesKey());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
		
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngCommonBillVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.updatePaymentsComplate(mngCommonBillVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		
		return returnMap;
	}*/
	
	
	
	/*@RequestMapping(value="/detail/writeBillInsert.do")
	@ResponseBody
	public Map<String, Object> writeBillInsert(@ModelAttribute("mngCommonBillVO") MngCommonBillVO mngCommonBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== writeBillComplate ======================");
		logger.debug("=== mngProjectBillVO.getPjKey()             = {}", mngCommonBillVO.getPjKey());
		logger.debug("=== mngProjectBillVO.getAcKey()             = {}", mngCommonBillVO.getAcKey());
		logger.debug("=== mngProjectBillVO.getBillCallKey()       = {}", mngCommonBillVO.getBillCallKey());
		logger.debug("=== mngProjectBillVO.getBillIssueType()     = {}", mngCommonBillVO.getBillIssueType());
		logger.debug("=== mngProjectBillVO.getBillTurnNo()        = {}", mngCommonBillVO.getBillTurnNo());
		logger.debug("=== mngProjectBillVO.getBillAmount()        = {}", mngCommonBillVO.getBillAmount());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorKey() = {}", mngCommonBillVO.getBillAcDirectorKey());
		logger.debug("=== mngProjectBillVO.getBillAcDirectorTel() = {}", mngCommonBillVO.getBillAcDirectorTel());
		logger.debug("=== mngProjectBillVO.getBillRequestDt()     = {}", mngCommonBillVO.getBillRequestDt());
		logger.debug("=== mngProjectBillVO.getRemark()            = {}", mngCommonBillVO.getRemark());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
		
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngCommonBillVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.writeBillInsert(mngCommonBillVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		
		return returnMap;
	}*/
	
	
	/*@RequestMapping(value="/popup/viewWriteSdBilling.do")
	public String viewWriteSdBilling(@ModelAttribute("mngCommonBillVO") MngCommonBillVO mngCommonBillVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		logger.debug("================= viewWriteSdBilling ====================");
		logger.debug("pjKey       : {}", mngCommonBillVO.getPjKey());
		logger.debug("billCallKey : {}", mngCommonBillVO.getBillCallKey());
		
		
		try {
			
			ProjectVO projectVO = new ProjectVO();
			projectVO.setPjKey(mngCommonBillVO.getPjKey());
			
			model.addAttribute("ProjectInfo", projectDetailService.selectProjectDetail(projectVO));
			
			model.addAttribute("billingOpInfo", service.selectSdBillingOp(mngCommonBillVO));
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		
		return "/mngCommon/bill/popup/writeSdBilling";
		
	}*/
	
	
	@Resource(name="fileMngUtil")
	private FileMngUtil fileUtils;
	
	/*@RequestMapping(value="/xmlFileUpload.do", method=RequestMethod.POST)
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
			
			
			
			
			list    = document.getElementsByTagName("InvoicerParty");
			
			logger.debug(" ============= InvoicerParty ====================");
			for(Node node = list.item(0).getFirstChild(); node != null; node=node.getNextSibling()) {
				
				logger.debug("{} : {}", node.getNodeName(), node.getTextContent().trim());
			}
			
			
			
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
		
	}*/
	
	/*@RequestMapping(value="/saveXmlBilling.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertXmlBilling(@ModelAttribute("billingVO")  MngCommonBillVO billingVO, HttpServletRequest request) throws Exception {
		
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
		
	}*/
	
	
	@RequestMapping(value="/popup/viewWritePcBillingExcel.do")
	public String viewWritePcBillingExcel(@ModelAttribute("mngCommonBillVO") MngCommonBillVO mngCommonBillVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		logger.debug("================= viewWritePcBillingExcel ====================");
		
		try {
			
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		
		return "/mngCommon/bill/popup/writePcBillingExcel";
		
	}
	
	
	@RequestMapping(value="/excelFileUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> excelFileUpload(FileVO fileVO, MultipartHttpServletRequest multiRequest) throws Exception {
		                                                     
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		MultipartFile lmpfExcel = multiRequest.getFile("excelFile");
		
		String lstExcelPath = filePath + "pcBill" + File.separator;
				//filePath + "pcBill" + File.separator;
				//"D:/tmp/" + "pcBill" + File.separator;
		
		File pathFile = new File(lstExcelPath);
		if(pathFile.exists() == false) {
			pathFile.mkdirs();
		}
		
		File lfExcel = new File(lstExcelPath + CepDateUtil.getToday("yyyyMMddHHmmssSSS"));
		
		logger.debug("file path : {}", lfExcel.getAbsolutePath());
		logger.debug("lmpfExcel : {}", lmpfExcel);
		
		FileInputStream inputStream = null;
		XSSFWorkbook    xworkbook   = null;
		
		try {
			
			lmpfExcel.transferTo(lfExcel);
			
			//File file = new File(lstExcelPath + CepDateUtil.getToday("yyyyMMddHHmmssSSS"));
			inputStream = new FileInputStream(lfExcel);
            
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
            
            for(int i=2; i<=litXlsxRows; i++) {
            	
            	int idx = 0;
            	lemRow  = new EgovMap();
            	xlsxRow = sheet.getRow(i); //셀정보
            	
            	
            	Iterator<Cell> cellIterator = sheet.getRow(i).iterator();
            	
            	
            	//while (cellIterator.hasNext()) {
            	for(int j  = 1; j <= sheet.getRow(i).getLastCellNum(); j++) {
            		String cellString = "";
                    Cell currentCell = sheet.getRow(i).getCell((short) j);
                    
                    if(currentCell == null) {
                    	
                    } else if(currentCell.getCellType() == currentCell.CELL_TYPE_STRING) {
                    	cellString = currentCell.getStringCellValue();
                    } else if(currentCell.getCellType() == currentCell.CELL_TYPE_NUMERIC) {
                    	if(DateUtil.isCellDateFormatted(currentCell)) {
                    		Date date = currentCell.getDateCellValue();
                    		cellString = new SimpleDateFormat("yyyy-MM-dd").format(date);
                    	} else {
                    		currentCell.setCellType(currentCell.CELL_TYPE_STRING);
                    		cellString = currentCell.getStringCellValue();
                    	}
                    } 
                    
                	lemRow.put("value"+idx, cellString);
                	
                    idx++;
                }
            	
            	//if(xlsxRow.getCell(1).toString().trim().equals("매입"))
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
	
	@RequestMapping(value="/isExistBill.do", method=RequestMethod.POST)
	@ResponseBody
	public int selectExist(HttpServletRequest request, @RequestBody MngCommonBillVO billVO ) throws Exception {
		
		int result = 0;
		try {
			
			logger.debug("======================= selectExistBill =========================");
			logger.debug("billVO.size() : {}", billVO.getMngBillInsertVOList().size());
			
			result = service.selectExistBill(billVO);
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		return result;
		
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/saveExcelBilling.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertBillingExcelBatch(HttpServletRequest request, @RequestBody MngCommonBillVO billVO ) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		
		try {
			
			logger.debug("======================= writeOrderInfo =========================");
			logger.debug("billVO.size() : {}", billVO.getMngBillInsertVOList().size());
			
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			billVO.setRegEmpKey(sessionMap.get("empKey"));
			
			returnMap = service.insertBillingExcelBatch(billVO);
			
		} catch(Exception e) {
        	e.printStackTrace();
			throw e;
		}
		
		return returnMap;
		
	}
}
