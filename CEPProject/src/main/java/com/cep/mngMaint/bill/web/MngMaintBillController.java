package com.cep.mngMaint.bill.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.maintenance.amount.service.MtAmountService;
import com.cep.maintenance.contract.service.MtContractService;
import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngMaint.bill.service.MngMaintBillService;
import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;
import com.cep.mngMaint.bill.vo.MngMaintBillVO;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;
import com.cep.project.vo.ProjectVO;
import com.cmm.service.FileMngService;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.FileVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;
/**
 * 유지보수 리스트 > 상세 > 세금계산서 요청버튼 > 
 * <pre>
 * </pre>
 *
 * @title MngMaintBillController
 * @desc 
 * @programID MngMaintBillController.java
 * @cdate 2021. 8. 31.
 * @version 1.0
 * @author aranghoo
 * @see 
 *
 */
@Controller
public class MngMaintBillController {
	private static final Logger logger = LoggerFactory.getLogger(MngMaintBillController.class);
	
	@Resource(name="mtContractService")
	private MtContractService mtContractService;
	
	@Resource(name="mtAmountService")
	private MtAmountService mtAmountService;
	
	@Resource(name="mngMaintBillService")
	private MngMaintBillService service;
	
	//첨부파일 관련.
	@Resource(name="fileMngService")
	private FileMngService fileMngService;
	
	@Value("#{comProps['maxFileCnt']}")
	private String maxFileCnt;	// 허용 파일 개수
	
	@Value("#{comProps['maxFileSize']}")
	private String maxFileSize;	// 허용 파일 사이즈
	
	@Value("#{comProps['fileExtn']}")
	private String fileExtn;		// 허용 파일 확장자
	
	@RequestMapping(value="/mngMaint/bill/list.do")
	public String selectBill(MngMaintBillVO billVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "mngMaint/bill/list";
	}
	
	/**
	 * 세금계산서 요청 좌측메뉴
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 5:16:01
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/bill/detail/main.do")
	public String billDetailView(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		
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
		
		return "mngMaint/bill/detail/main";
	}
	
	/**
	 * 세금계산서 요청 조회 메뉴 우측 메뉴
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 5:16:22
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/bill/detail/billForm.do")
	public String billFromView(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		
		try{
			logger.debug("searchVO.getBillNo()     : {}", searchVO.getBillNo());
			logger.debug("searchVO.getPjKey()      : {}", searchVO.getPjKey());
			logger.debug("searchVO.getBillTurnNo() : {}", searchVO.getBillTurnNo());
			logger.debug("searchVO.getTotalTurn() : {}", searchVO.getTotalTurn());
//			logger.debug("searchVO.getBillTurnNo() : {}", searchVO.getBillTurnNo());
			logger.debug("searchVO.getAcKey() : {}", searchVO.getAcKey());
			
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			//회차  정보 조회
			model.addAttribute("collectTurn", searchVO.getTotalTurn());
			
			//현재 계산서 정보 조회
			model.addAttribute("billInfo", service.selectBillDetailInfo(searchVO));
			
			//고객사 키 전달
//			model.addAttribute("billAcKey", searchVO.getAcKey()); 
			
			//고객 담당자 조회
//			AccountSearchVO accoutSearchVO = new AccountSearchVO();
//			accoutSearchVO.setAcKey(searchVO.getAcKey());
//			
//			model.addAttribute("directorList", mtContractService.selectAcDirectorList(searchVO.getAcKey()));
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "mngMaint/bill/detail/billForm";
	}
	
	/**
	 * 세금계산서 요청 등록/수정 메뉴
	 * MT_SD_BILLING_OP_TB 세금계산서 정보 등록
	 * MT_SALES_DETAIL_TB.SALES_STATUS_CD='R' 업데이트. 
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @param request
	 * @param respons
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 31. 오전 11:13:48
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/bill/detail/writeBillReqeust.do")
	@ResponseBody
	public Map<String, Object> writeBillReqeust(@ModelAttribute("mngMaintBillVO") MngMaintBillVO mngMaintBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		String billCallKey = null;
		logger.debug("=============== write ======================");
		logger.debug("=== mngMaintBillVO.getPjKey()             = {}", mngMaintBillVO.getPjKey());
		logger.debug("=== mngMaintBillVO.getBillCtFkKey()       = {}", mngMaintBillVO.getBillCtFkKey());
		logger.debug("=== mngMaintBillVO.getBillAcKey()         = {}", mngMaintBillVO.getBillAcKey());
		logger.debug("=== mngMaintBillVO.getBillCallKey()       = {}", mngMaintBillVO.getBillCallKey());
		logger.debug("=== mngMaintBillVO.getBillIssueType()     = {}", mngMaintBillVO.getBillIssueType());
		logger.debug("=== mngMaintBillVO.getBillTurnNo()        = {}", mngMaintBillVO.getBillTurnNo());
		logger.debug("=== mngMaintBillVO.getBillAmount()        = {}", mngMaintBillVO.getBillAmount());
		logger.debug("=== mngMaintBillVO.getBillTaxYn()         = {}", mngMaintBillVO.getBillTaxYn());
		logger.debug("=== mngMaintBillVO.getBillAcDirectorKey() = {}", mngMaintBillVO.getBillAcDirectorKey());
		logger.debug("=== mngMaintBillVO.getBillAcDirectorTel() = {}", mngMaintBillVO.getBillAcDirectorTel());
		logger.debug("=== mngMaintBillVO.getBillRequestDt()     = {}", mngMaintBillVO.getBillRequestDt());
		logger.debug("=== mngMaintBillVO.getRemark()            = {}", mngMaintBillVO.getRemark());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
						
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngMaintBillVO.setRegEmpKey(sessionMap.get("empKey"));
			mngMaintBillVO.setModEmpKey(sessionMap.get("empKey"));
			
			if("".equals(CepStringUtil.getDefaultValue(mngMaintBillVO.getBillTaxYn(), ""))) {
				mngMaintBillVO.setBillTaxYn("N");
			}
			if("".equals(CepStringUtil.getDefaultValue(mngMaintBillVO.getBillCallKey(), ""))) {
				//계산서 요청 관리키가 없는 경우 등록
				billCallKey = service.insertBillRequest(mngMaintBillVO);
			} else {
				//계산서 요청 관리키가 있는 경우 수정
				service.updateBillRequest(mngMaintBillVO);
			}
			logger.debug("=== billCallKey            = {}", billCallKey);
			
			
			returnMap.put("billCallKey", billCallKey);
			returnMap.put("billIssueStatus", "R");
			returnMap.put("successYN", "Y");
		}catch(Exception e){
			returnMap.put("successYN", "N");
			logger.error("{}", e);
			//throw e;
		}		
		return returnMap;
	}
	
	/**
	 * MT_SD_BILLING_OP_TB.BILL_CALL_KEY를 이용하여 MT_SD_BILLING_OP_TB.DELETE_YN='Y'처리
	 * MT_SALES_DETAIL_TB.SALES_KEY를 이용하여  MT_SALES_DETAIL_TB의 값 SALES_STATUS_CD = null처리
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @param request
	 * @param respons
	 * @return
	 * @throws Exception
	 * @cdate 2021. 9. 3. 오후 4:55:40
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/bill/detail/deleteBillReqeust.do")
	@ResponseBody
	public Map<String, Object> deleteBillReqeust(@ModelAttribute("mngMaintBillVO") MngMaintBillVO mngMaintBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== deleteBillReqeust ======================");
		logger.debug("=== mngMaintBillVO.getBillCallKey()       = {}", mngMaintBillVO.getBillCallKey());
		logger.debug("=== mngMaintBillVO.getSalesKey     ()     = {}", mngMaintBillVO.getSalesKey());
		logger.debug("=== mngMaintBillVO.getBillCtFkKey)        = {}", mngMaintBillVO.getBillCtFkKey());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
						
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
//			mngMaintBillVO.setRegEmpKey(sessionMap.get("empKey"));
			mngMaintBillVO.setModEmpKey(sessionMap.get("empKey"));
			service.deleteBillRequest(mngMaintBillVO);			
			
			
			returnMap.put("billIssueStatus", null);
			returnMap.put("successYN", "Y");
		}catch(Exception e){
			returnMap.put("successYN", "N");
			logger.error("{}", e);
			//throw e;
		}		
		return returnMap;
	}
	
	/**
	 * 세금계산서 발행 완료 처리
	 * 프로젝트 writeBillComplate() 메서드와 같은 기능
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @param request
	 * @param respons
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 31. 오후 2:01:29
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/bill/detail/updateBillIssueStatus.do")
	@ResponseBody
	public Map<String, Object> updateBillIssueStatus(@ModelAttribute("mngMaintBillVO") MngMaintBillVO mngMaintBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== updateBillIssueStatus ======================");
		logger.debug("=== mngMaintBillVO.getBillCallKey()       = {}", mngMaintBillVO.getBillCallKey());
		logger.debug("=== mngMaintBillVO.getBillIssueStatus()   = {}", mngMaintBillVO.getBillIssueStatus());
//		logger.debug("=== mngMaintBillVO.getBillTurnNo()        = {}", mngMaintBillVO.getBillTurnNo());
//		logger.debug("=== mngMaintBillVO.getBillAmount()        = {}", mngMaintBillVO.getBillAmount());
//		logger.debug("=== mngMaintBillVO.getBillTaxYn()         = {}", mngMaintBillVO.getBillTaxYn());
//		logger.debug("=== mngMaintBillVO.getBillAcDirectorKey() = {}", mngMaintBillVO.getBillAcDirectorKey());
//		logger.debug("=== mngMaintBillVO.getBillAcDirectorTel() = {}", mngMaintBillVO.getBillAcDirectorTel());
//		logger.debug("=== mngMaintBillVO.getBillRequestDt()     = {}", mngMaintBillVO.getBillRequestDt());
//		logger.debug("=== mngMaintBillVO.getRemark()            = {}", mngMaintBillVO.getRemark());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngMaintBillVO.setRegEmpKey(sessionMap.get("empKey"));
			mngMaintBillVO.setModEmpKey(sessionMap.get("empKey"));
			service.updateBillIssueStatus(mngMaintBillVO);
			
			returnMap.put("successYN", "Y");
		}catch(Exception e){
			returnMap.put("successYN", "N");
			logger.error("{}", e);
			throw e;
		}
		
		
		return returnMap;
	}
	
	/**
	 * 기존세금계산서 정보 조회 
	 * 유지보수 리스트 > 상세 > 세금계산서 요청버튼 > 우측 기존세금계산서 정보조회 탭 클릭
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 31. 오전 11:22:49
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/bill/detail/preBillList.do")
	public String preBillListView(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		
		try{
			logger.debug("searchVO.getPjKey()      : {}", searchVO.getPjKey());
			logger.debug("searchVO.getAcKey()      : {}", searchVO.getAcKey());
			logger.debug("searchVO.getAcKey()      : {}", searchVO.getBillTurnNo());
			logger.debug("searchVO.getTotalTurn()  : {}", searchVO.getTotalTurn());
			
			
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			model.addAttribute("pjKey", searchVO.getPjKey());
			model.addAttribute("acKey", searchVO.getAcKey());
			model.addAttribute("billTurnNo", searchVO.getBillTurnNo());
			model.addAttribute("totalTurn", searchVO.getTotalTurn());
			//전체목록을 조회하기 위해 searchVO에서 billCtFkKey값을 지워준다.
			searchVO.setBillCtFkKey(null);
			//계산서 목록 조회
			model.addAttribute("prePaymentList", service.selectBillList(searchVO));
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "mngMaint/bill/detail/preBillList";
	}
	
	

	@RequestMapping(value="/mngMaint/bill/popup/viewWriteSdBilling.do")
	public String viewWriteSdBilling(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		logger.debug("================= viewWriteSdBilling ====================");
		logger.debug("getBillCtFkKey       : {}", searchVO.getBillCtFkKey());		
		List<EgovMap> billMapList = null;
		//첨부파일 관련
		FileVO fileVO = new FileVO();
		List<?> fileResult = null;
		try {
			billMapList = service.selectBillList(searchVO);
			
			model.addAttribute("billingOpInfo", billMapList.get(0));
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			fileVO.setFileCtKey(searchVO.getBillCtFkKey());
			fileVO.setFileWorkClass("mtSdBill");
			
			fileResult = fileMngService.selectFileList(fileVO);
			
			//첨부파일 관련
			model.addAttribute("fileList", fileResult);
			model.addAttribute("maxFileCnt", maxFileCnt);
			model.addAttribute("fileExtn", fileExtn);		
			model.addAttribute("maxFileSize", maxFileSize);	
		} catch(Exception e) {
			logger.error("{}", e);
			throw e;
		}
		
		
		return "/mngMaint/bill/popup/writeSdBilling";
		
	}
	
	/**
	 * 세금계산서 발행처리 완료
	 * <pre>
	 * </pre>
	 * 
	 * @param billingVO
	 * @param request
	 * @return
	 * @throws Exception
	 * @cdate 2021. 9. 2. 오후 2:32:36
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/bill/saveXmlBilling.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveXmlBilling(@ModelAttribute("mngMaintBillVO") MngMaintBillVO mngMaintBillVO, HttpServletRequest request) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			
			logger.debug("============ insertXmlBilling ================");
			logger.debug("billingVO.getBillCtFkKey() : {}", mngMaintBillVO.getBillCtFkKey());
			logger.debug("mngMaintBillVO.getBillNo() : {}", mngMaintBillVO.getBillNo());
			logger.debug("billingVO.getBillIssueDt() : {}", mngMaintBillVO.getBillIssueDt());
			
			////////////////////////////////////////////
//			logger.debug("billingVO.getAcKey()       : {}", mngMaintBillVO.getAcKey());
//			logger.debug("billingVO.getBillAmount()  : {}", mngMaintBillVO.getBillAmount());
//			logger.debug("billingVO.getRemark()      : {}", mngMaintBillVO.getRemark());
			
			HashMap<String, String> sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngMaintBillVO.setModEmpKey(sessionMap.get("empKey"));
			
			service.insertSdBillingXml(mngMaintBillVO);
			
			
			returnMap.put("successYN", "Y");
			
		} catch(Exception e) {
			returnMap.put("successYN", "N");
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
		
	}
	
	/**
	 * 수금완료처리와 수금취소 처리.
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @param request
	 * @param respons
	 * @return
	 * @throws Exception
	 * @cdate 2021. 9. 3. 오후 3:28:50
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/bill/detail/updateSdPaymentStatus.do")
	@ResponseBody
	public Map<String, Object> updateSdPaymentStatus(@ModelAttribute("mngMaintBillVO") MngMaintBillVO mngMaintBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== updatePaymentsComplate ======================");
		logger.debug("=== mngMaintBillVO.getPjKey()             = {}", mngMaintBillVO.getPjKey());
		logger.debug("=== mngMaintBillVO.getBillCallKey()       = {}", mngMaintBillVO.getBillCallKey());
		logger.debug("=== mngMaintBillVO.getSalesKey()          = {}", mngMaintBillVO.getSalesKey());
		logger.debug("=== mngMaintBillVO.getSalesKey()          = {}", mngMaintBillVO.getSalesKey());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
									
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngMaintBillVO.setModEmpKey(sessionMap.get("empKey"));
			
			service.updateSdPaymentStatus(mngMaintBillVO);
			
			returnMap.put("successYN", "Y");
		}catch(Exception e){
			returnMap.put("successYN", "N");
			logger.error("{}", e);
			throw e;
		}
		
		
		
		return returnMap;
	}
	
}
