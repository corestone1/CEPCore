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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.maintenance.amount.service.MtAmountService;
import com.cep.maintenance.contract.service.MtContractService;
import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngMaint.bill.service.MngMaintBillService;
import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;
import com.cep.mngMaint.bill.vo.MngMaintBillVO;
import com.cep.mngMaint.bill.vo.MtPaymentVO;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;
import com.cep.project.vo.ProjectOrderVO;
import com.cep.project.vo.ProjectPurchaseVO;
import com.cep.project.vo.ProjectVO;
import com.cmm.service.ComService;
import com.cmm.service.FileMngService;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.FileVO;
import com.cmm.vo.PaymentVO;

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
	
	@Resource(name="comService")
	private ComService comService;
	
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
	public String selectBill(@ModelAttribute("searchVO")MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		String toDay = null;
		Map<String, String> searchParam = null;
		try {
			logger.debug("searchVO.getSearchBillGroup() : {}", searchVO.getSearchBillGroup()); //매입/매출 구분
			logger.debug("searchVO.getSearchAcNm() : {}", searchVO.getSearchAcNm()); //매입/매출처 검색어
			logger.debug("searchVO.getSearchFromDate() : {}", searchVO.getSearchFromDate()); //계산서발행일
			logger.debug("searchVO.getSearchToDate() : {}", searchVO.getSearchToDate()); //계산서발행일
			logger.debug("searchVO.getSearchGubun() : {}", searchVO.getSearchGubun());//검색구분
			logger.debug("searchVO.getSearchWord() : {}", searchVO.getSearchWord());//검색어
			
			toDay = CepDateUtil.getToday(null);		
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getSearchFromDate(), ""))){
				searchVO.setSearchFromDate(searchVO.getSearchFromDate().replace("-", ""));
			} else {
				searchVO.setSearchFromDate(CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6));
			}
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getSearchToDate(), ""))){
				searchVO.setSearchToDate(searchVO.getSearchToDate().replace("-", ""));
			} else {
				searchVO.setSearchToDate(toDay);
			}
			
			searchParam = new HashMap<>();
			searchParam.put("searchFromDate", CepDateUtil.convertDisplayFormat(searchVO.getSearchFromDate(), null, null));
			searchParam.put("searchToDate", CepDateUtil.convertDisplayFormat(searchVO.getSearchToDate(), null, null));
			
			model.addAttribute("billList", service.selectBillList(searchVO));
			model.addAttribute("searchParam", searchParam);			
			model.addAttribute("displayUtil", new CepDisplayUtil());
		} catch (Exception e) {
			logger.error("{}", e);
		}
		
		
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
		StringBuffer iframUrl = new StringBuffer();
		EgovMap billBasicInfo = null;
		String billTurnNo = null;
		try{
			logger.debug("searchVO.getPjKey()  : {}", searchVO.getPjKey());
			logger.debug("searchVO.getBillNo() : {}", searchVO.getBillNo());
			logger.debug("searchVO.getBillTurnNo() : {}", searchVO.getBillTurnNo());
			logger.debug("searchVO.getMtSalesOrderKey() : {}", searchVO.getMtSalesOrderKey());
			logger.debug("searchVO.getIframGubun() : {}", searchVO.getIframGubun());
//			logger.debug("searchVO.getMtSalesAcKey() : {}", searchVO.getMtSalesAcKey());
//			logger.debug("searchVO.getMtSalesAcNm() : {}", searchVO.getMtSalesAcNm());
			billBasicInfo =service.selectBillBasicInfo(searchVO);
			//기본정보 조회
			model.addAttribute("basicInfo", billBasicInfo);
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			//해당 구분값이 없는 경우 list로 보여준다.
			if("list".equals(CepStringUtil.getDefaultValue(searchVO.getIframGubun(), "list").toLowerCase())) {
				iframUrl.append("/mngMaint/bill/detail/preBillList.do");
				iframUrl.append("?pjKey=");
				iframUrl.append(searchVO.getPjKey());
				iframUrl.append("&mtSalesOrderKey=");
				iframUrl.append(searchVO.getMtSalesOrderKey());
				iframUrl.append("&acKey=");
				iframUrl.append(billBasicInfo.get("mtAcKey"));
				iframUrl.append("&billTurnNo=");
				iframUrl.append(billBasicInfo.get("proceedTurn"));
				iframUrl.append("&totalTurn=");
				iframUrl.append(billBasicInfo.get("totalTurn"));
				billTurnNo = String.valueOf(billBasicInfo.get("proceedTurn"));
			} else if(!"list".equals(CepStringUtil.getDefaultValue(searchVO.getIframGubun(), "list").toLowerCase())
					&& 0 != searchVO.getBillTurnNo()) {
				iframUrl.append("/mngMaint/bill/detail/billForm.do");
				iframUrl.append("?pjKey=");
				iframUrl.append(searchVO.getPjKey());
				iframUrl.append("&mtSalesOrderKey=");
				iframUrl.append(searchVO.getMtSalesOrderKey());
				iframUrl.append("&acKey=");
				iframUrl.append(billBasicInfo.get("mtAcKey"));
				iframUrl.append("&billTurnNo=");
				iframUrl.append(searchVO.getBillTurnNo());
				iframUrl.append("&totalTurn=");
				iframUrl.append(billBasicInfo.get("totalTurn"));
				billTurnNo = String.valueOf(searchVO.getBillTurnNo());
			} else {
				iframUrl.append("/mngMaint/bill/detail/preBillList.do");
				iframUrl.append("?pjKey=");
				iframUrl.append(searchVO.getPjKey());
				iframUrl.append("&mtSalesOrderKey=");
				iframUrl.append(searchVO.getMtSalesOrderKey());
				iframUrl.append("&acKey=");
				iframUrl.append(billBasicInfo.get("mtAcKey"));
				iframUrl.append("&billTurnNo=");
				iframUrl.append(billBasicInfo.get("proceedTurn"));
				iframUrl.append("&totalTurn=");
				iframUrl.append(billBasicInfo.get("totalTurn"));
				billTurnNo = String.valueOf(billBasicInfo.get("proceedTurn"));
			}
			//ifram의 url주소
			model.addAttribute("iframUrl", iframUrl.toString());
			model.addAttribute("pjKey", searchVO.getPjKey());
			model.addAttribute("mtSalesOrderKey", searchVO.getMtSalesOrderKey());
			model.addAttribute("billTurnNo", billTurnNo);
//			model.addAttribute("mtSalesAcKey", searchVO.getMtSalesAcKey());
//			model.addAttribute("mtSalesAcNm", searchVO.getMtSalesAcNm());
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
			logger.debug("searchVO.getMtSalesOrderKey()      : {}", searchVO.getMtSalesOrderKey());
			logger.debug("searchVO.getBillTurnNo() : {}", searchVO.getBillTurnNo());
			logger.debug("searchVO.getTotalTurn() : {}", searchVO.getTotalTurn());
//			logger.debug("searchVO.getBillTurnNo() : {}", searchVO.getBillTurnNo());
			logger.debug("searchVO.getAcKey() : {}", searchVO.getAcKey());
//			logger.debug("searchVO.getMtSalesAcKey() : {}", searchVO.getMtSalesAcKey());
//			logger.debug("searchVO.getMtSalesAcNm() : {}", searchVO.getMtSalesAcNm());
			
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			//회차  정보 조회
			model.addAttribute("collectTurn", searchVO.getTotalTurn());
			
			//현재 계산서 정보 조회
			model.addAttribute("billInfo", service.selectBillDetailInfo(searchVO));
			
			model.addAttribute("pjKey", searchVO.getPjKey());
			model.addAttribute("mtSalesOrderKey", searchVO.getMtSalesOrderKey());
			model.addAttribute("acKey", searchVO.getAcKey());
			model.addAttribute("billTurnNo", searchVO.getBillTurnNo());
			model.addAttribute("totalTurn", searchVO.getTotalTurn());

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
		logger.debug("=============== writeBillReqeust write ======================");
//		logger.debug("=== mngMaintBillVO.getPjKey()             = {}", mngMaintBillVO.getPjKey());
//		logger.debug("=== mngMaintBillVO.getBillCtFkKey()       = {}", mngMaintBillVO.getBillCtFkKey());
//		logger.debug("=== mngMaintBillVO.getBillAcKey()         = {}", mngMaintBillVO.getBillAcKey());
//		logger.debug("=== mngMaintBillVO.getBillCallKey()       = {}", mngMaintBillVO.getBillCallKey());
//		logger.debug("=== mngMaintBillVO.getBillIssueType()     = {}", mngMaintBillVO.getBillIssueType());
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
		logger.debug("=== mngMaintBillVO.getPjKey()       = {}", mngMaintBillVO.getPjKey());
		logger.debug("=== mngMaintBillVO.getMtSalesOrderKey()       = {}", mngMaintBillVO.getMtSalesOrderKey());
		logger.debug("=== mngMaintBillVO.getBillCallKey()       = {}", mngMaintBillVO.getBillCallKey());
		logger.debug("=== mngMaintBillVO.getSalesKey     ()     = {}", mngMaintBillVO.getSalesKey());
		logger.debug("=== mngMaintBillVO.getBillCtFkKey        = {}", mngMaintBillVO.getBillCtFkKey());
		logger.debug("=== mngMaintBillVO.getBillMappingYn        = {}", mngMaintBillVO.getBillMappingYn());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
						
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngMaintBillVO.setRegEmpKey(sessionMap.get("empKey"));
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
	 * 영업지원에서 세금계산서 발행완료 처리
	 * 유지보수관리 >> 매출계획목록 >> 발행완료 처리.
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @param request
	 * @param respons
	 * @return
	 * @throws Exception
	 * @cdate 2021. 11. 23. 오전 10:39:57
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/bill/detail/writeBillIssue.do")
	@ResponseBody
	public Map<String, Object> writeBillIssue(@ModelAttribute("mngMaintBillVO") MngMaintBillVO mngMaintBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		String billCallKey = null;
		logger.debug("=============== writeBillIssue write ======================");
//		logger.debug("=== mngMaintBillVO.getPjKey()             = {}", mngMaintBillVO.getPjKey());
//		logger.debug("=== mngMaintBillVO.getBillCtFkKey()       = {}", mngMaintBillVO.getBillCtFkKey());
//		logger.debug("=== mngMaintBillVO.getBillAcKey()         = {}", mngMaintBillVO.getBillAcKey());
//		logger.debug("=== mngMaintBillVO.getBillCallKey()       = {}", mngMaintBillVO.getBillCallKey());
//		logger.debug("=== mngMaintBillVO.getBillIssueType()     = {}", mngMaintBillVO.getBillIssueType());
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
			
			if("".equals(CepStringUtil.getDefaultValue(mngMaintBillVO.getBillTaxYn(), ""))) {
				mngMaintBillVO.setBillTaxYn("N");
			}
			
			if("".equals(CepStringUtil.getDefaultValue(mngMaintBillVO.getBillCallKey(), ""))) {
				//계산서 요청 관리키가 없는 경우 등록
				billCallKey = service.insertBillIssue(mngMaintBillVO);
			} else {
				//계산서 요청 관리키가 있는 경우 수정
				service.updateBillIssue(mngMaintBillVO);
				
				billCallKey = mngMaintBillVO.getBillCallKey();
			}
			logger.debug("=== billCallKey            = {}", billCallKey);
			
			
			returnMap.put("billCallKey", billCallKey);
			returnMap.put("billIssueStatus", "I");
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
		List<EgovMap> sdBillList = null;
		try{
			logger.debug("searchVO.getPjKey()      : {}", searchVO.getPjKey());
			logger.debug("searchVO.getMtSalesOrderKey()      : {}", searchVO.getMtSalesOrderKey());
			logger.debug("searchVO.getAcKey()      : {}", searchVO.getAcKey());
			logger.debug("searchVO.getBillTurnNo()      : {}", searchVO.getBillTurnNo());
			logger.debug("searchVO.getTotalTurn()  : {}", searchVO.getTotalTurn());
			
			
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			model.addAttribute("pjKey", searchVO.getPjKey());
			model.addAttribute("acKey", searchVO.getAcKey());
			model.addAttribute("billTurnNo", searchVO.getBillTurnNo());
			model.addAttribute("totalTurn", searchVO.getTotalTurn());
			//전체목록을 조회하기 위해 searchVO에서 billCtFkKey값을 지워준다.
			searchVO.setBillCtFkKey(null);
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getPjKey(), ""))) {
				sdBillList = service.selectSdBillList(searchVO);
			}
			//계산서 목록 조회
			model.addAttribute("prePaymentList", sdBillList);
			
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
			billMapList = service.selectSdBillList(searchVO);
			
			model.addAttribute("billingOpInfo", billMapList.get(0));
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			fileVO.setFileCtKey(searchVO.getBillCtFkKey());
			fileVO.setFileWorkClass("mtSdBill");
			
			fileResult = fileMngService.selectFileList(fileVO);
			
			model.addAttribute("pjKey", searchVO.getPjKey());
			model.addAttribute("acKey", searchVO.getAcKey());
			model.addAttribute("billTurnNo", searchVO.getBillTurnNo());
			model.addAttribute("totalTurn", searchVO.getTotalTurn());
			
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
	 * 세금계산서 매핑(발행)처리 완료
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
	@RequestMapping(value="/mngMaint/bill/detail/cancelSdBillMapping.do")
	@ResponseBody
	public Map<String, Object> cancelSdBillMapping(@ModelAttribute("mngMaintBillVO") MngMaintBillVO mngMaintBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== updatePaymentsComplate ======================");
		logger.debug("=== mngMaintBillVO.getPjKey()             = {}", mngMaintBillVO.getPjKey());
		logger.debug("=== mngMaintBillVO.getBillCallKey()       = {}", mngMaintBillVO.getBillCallKey());
		logger.debug("=== mngMaintBillVO.getBillCtFkKey()       = {}", mngMaintBillVO.getBillCtFkKey());
		logger.debug("=== mngMaintBillVO.getBillIssueStatus()   = {}", mngMaintBillVO.getBillIssueStatus());
		logger.debug("=== mngMaintBillVO.getBillMappingYn()     = {}", mngMaintBillVO.getBillMappingYn());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
									
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngMaintBillVO.setModEmpKey(sessionMap.get("empKey"));
			
			service.cancelSdBillMapping(mngMaintBillVO);
			
			returnMap.put("successYN", "Y");
		}catch(Exception e){
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
	@RequestMapping(value="/mngMaint/bill/detail/updateSdCollectStatus.do")
	@ResponseBody
	public Map<String, Object> updateSdCollectStatus(@ModelAttribute("mngMaintBillVO") MngMaintBillVO mngMaintBillVO, HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		logger.debug("=============== updatePaymentsComplate ======================");
		logger.debug("=== mngMaintBillVO.getPjKey()             = {}", mngMaintBillVO.getPjKey());
		logger.debug("=== mngMaintBillVO.getBillCallKey()       = {}", mngMaintBillVO.getBillCallKey());
		logger.debug("=== mngMaintBillVO.getSalesKey()          = {}", mngMaintBillVO.getSalesKey());
		logger.debug("=== mngMaintBillVO.getBillIssueStatus()   = {}", mngMaintBillVO.getBillIssueStatus());
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
		try {
									
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mngMaintBillVO.setModEmpKey(sessionMap.get("empKey"));
			
			service.updateSdCollectStatus(mngMaintBillVO);
			
			returnMap.put("successYN", "Y");
		}catch(Exception e){
			returnMap.put("successYN", "N");
			logger.error("{}", e);
			throw e;
		}		
		
		return returnMap;
	}
	
	
	//매입금 지급 처리===========================================================
	
	/**
	 * 매입금지금 기본정보 조회(왼쪽화면)
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 6. 오후 3:34:16
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/payment/detail/main.do")
	public String paymentDetailView(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		EgovMap paymentBasicInfo = null;
		StringBuffer iframUrl = new StringBuffer();
		try{
			logger.debug("searchVO.getPaymentKey() : {}", searchVO.getPaymentKey());
			logger.debug("searchVO.getMtOrderType() : {}", searchVO.getMtOrderType());
			logger.debug("searchVO.getMtIntegrateKey() : {}", searchVO.getMtIntegrateKey());
			logger.debug("searchVO.getMtWorkKey() : {}", searchVO.getMtWorkKey()); //유지보수 작업에만 존재함(mtOrderType:PO)
			logger.debug("searchVO.getMtOrderKey()  : {}", searchVO.getMtOrderKey());
			logger.debug("searchVO.getIframGubun()  : {}", searchVO.getIframGubun());
			logger.debug("searchVO.getProceedTurn() : {}", searchVO.getProceedTurn());
			
			paymentBasicInfo = service.selectPaymentBasicInfo(searchVO);
			
			if(null != paymentBasicInfo) {
				
				//기본정보 조회
				model.addAttribute("basicInfo", paymentBasicInfo);
				
				
				model.addAttribute("displayUtil", new CepDisplayUtil());				
				
				model.addAttribute("mtOrderType", searchVO.getMtOrderType());
				//유지보수 key
				model.addAttribute("mtIntegrateKey", searchVO.getMtIntegrateKey());
				
				//유지보수 작업관리키
				model.addAttribute("mtWorkKey", searchVO.getMtWorkKey());
				//발주관리키.
				model.addAttribute("mtOrderKey", searchVO.getMtOrderKey());
				

				
				//해당 구분값이 없는 경우 list로 보여준다.
				if("list".equals(CepStringUtil.getDefaultValue(searchVO.getIframGubun(), "list").toLowerCase())) {
					iframUrl.append("/mngMaint/payment/detail/prePaymentList.do");
					iframUrl.append("?mtOrderType=");
					iframUrl.append(searchVO.getMtOrderType());
					iframUrl.append("&mtIntegrateKey=");
					iframUrl.append(searchVO.getMtIntegrateKey());
					iframUrl.append("&mtWorkKey=");
					iframUrl.append(searchVO.getMtWorkKey());
					iframUrl.append("&mtOrderKey=");
					iframUrl.append(searchVO.getMtOrderKey());
					iframUrl.append("&billAcKey=");
					iframUrl.append(paymentBasicInfo.get("orderAcKey"));
					iframUrl.append("&proceedTurn=");
					iframUrl.append(paymentBasicInfo.get("proceedTurn"));
					iframUrl.append("&totalTurn=");
					iframUrl.append(paymentBasicInfo.get("totalTurn"));
				} else {

					iframUrl.append("/mngMaint/payment/detail/paymentForm.do");
					iframUrl.append("?mtOrderType=");
					iframUrl.append(searchVO.getMtOrderType());
					iframUrl.append("&mtIntegrateKey=");
					iframUrl.append(searchVO.getMtIntegrateKey());
					iframUrl.append("&mtWorkKey=");
					iframUrl.append(searchVO.getMtWorkKey());
					iframUrl.append("&mtOrderKey=");
					iframUrl.append(searchVO.getMtOrderKey());
					iframUrl.append("&billAcKey=");
					iframUrl.append(paymentBasicInfo.get("orderAcKey"));
					iframUrl.append("&paymentKey=");
					iframUrl.append(searchVO.getPaymentKey());
					iframUrl.append("&proceedTurn=");
					if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getProceedTurn(), ""))) {
						iframUrl.append(searchVO.getProceedTurn());
					} else {
						iframUrl.append(paymentBasicInfo.get("proceedTurn"));
					}
					
					iframUrl.append("&totalTurn=");
					iframUrl.append(paymentBasicInfo.get("totalTurn"));
				}

				
				model.addAttribute("totalTurn", paymentBasicInfo.get("totalTurn"));
				//ifram의 url주소
				model.addAttribute("iframUrl", iframUrl.toString());
			}
			
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "mngMaint/payment/detail/main";
	}
	
	
	@RequestMapping(value="/mngMaint/payment/detail/prePaymentList.do")
	public String prePaymentList(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		List<EgovMap> paymentRequestList = null;
		
//		EgovMap orderAmountInfo = null;
		try{
			logger.debug("searchVO.getMtOrderType() : {}", searchVO.getMtOrderType());
			logger.debug("searchVO.getMtIntegrateKey() : {}", searchVO.getMtIntegrateKey());
			logger.debug("searchVO.getMtWorkKey() : {}", searchVO.getMtWorkKey()); //유지보수 작업에만 존재함(mtOrderType:PO)
			logger.debug("searchVO.getMtOrderKey()  : {}", searchVO.getMtOrderKey()); //발주키 
			logger.debug("searchVO.getBillAcKey()  : {}", searchVO.getBillAcKey()); //매입사업자번호.
			logger.debug("searchVO.getProceedTurn()  : {}", searchVO.getProceedTurn()); //진행회차.
			logger.debug("searchVO.getTotalTurn()  : {}", searchVO.getTotalTurn()); //전체회차.
			
			paymentRequestList = service.selectPaymentRequestList(searchVO);
			
//			if("BO".equals(searchVO.getMtOrderType())) {
//				orderAmountInfo = service.selectMtBackOrderAmountInfo(searchVO.getMtOrderKey());
//			} else if("BO".equals(searchVO.getMtOrderType())) {
//				orderAmountInfo = service.selectMtOrderAmountInfo(searchVO.getMtOrderKey());
//			}
			
//			model.addAttribute("orderAmountInfo", orderAmountInfo);
			
			
			//계산서 목록 조회
			model.addAttribute("prePaymentList", paymentRequestList);
			
			model.addAttribute("displayUtil", new CepDisplayUtil());				
			
			model.addAttribute("mtOrderType", searchVO.getMtOrderType());
			//유지보수 key
			model.addAttribute("mtIntegrateKey", searchVO.getMtIntegrateKey());
			
			//유지보수 작업관리키
			model.addAttribute("mtWorkKey", searchVO.getMtWorkKey());
			//발주관리키.
			model.addAttribute("mtOrderKey", searchVO.getMtOrderKey());
			
			//사업자번호(매입처관리키)
			model.addAttribute("billAcKey", searchVO.getBillAcKey());
			model.addAttribute("proceedTurn", searchVO.getProceedTurn());
			model.addAttribute("totalTurn", searchVO.getTotalTurn());
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "mngMaint/payment/detail/prePaymentList";
	}
	
	@RequestMapping(value="/mngMaint/payment/popup/popBillMappingList.do")
	public String popBillMappingList(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		List<EgovMap> billMappingList = null;
		try{
			
			logger.debug("searchVO.getBillAcKey()  : {}", searchVO.getBillAcKey()); //매입사업자번호.
			
			billMappingList = service.selectMappingBillList(searchVO);
			
			
			//계산서 목록 조회
			model.addAttribute("billMappingList", billMappingList);
			model.put("billAcKey", searchVO.getBillAcKey());
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			model.put("returnType", searchVO.getReturnType());
			model.put("returnBillNo", searchVO.getReturnBillNo());
			model.put("returnAmount", searchVO.getReturnAmount());
			model.put("returnFunctionNm", searchVO.getReturnFunctionNm());
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "/mngMaint/payment/popup/billMappingList";
	}
	
	
	/**
	 * 지급정보 추가 화면 리스트
	 * <pre>
	 * </pre>
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 * @cdate 2021. 9. 30. 오후 8:08:08
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/payment/detail/paymentForm.do")
	public String viewPaymentForm(@ModelAttribute("searchVO") MngMaintBillSearchVO searchVO, ModelMap model) throws Exception {
		EgovMap paymentRequestInfo = null;
		List<?> depositList = null; //지급계좌정보
		EgovMap orderAmountInfo = null;
		try {
			logger.debug("searchVO.getMtOrderType() : {}", searchVO.getMtOrderType());
			logger.debug("searchVO.getPaymentDtFkKey() : {}", searchVO.getPaymentDtFkKey());
			logger.debug("searchVO.getMtIntegrateKey() : {}", searchVO.getMtIntegrateKey());
			logger.debug("searchVO.getMtWorkKey() : {}", searchVO.getMtWorkKey()); //유지보수 작업에만 존재함(mtOrderType:PO)
			logger.debug("searchVO.getMtOrderKey()  : {}", searchVO.getMtOrderKey()); //발주키
			logger.debug("searchVO.getBillAcKey()  : {}", searchVO.getBillAcKey()); //매입사업자번호.
			logger.debug("searchVO.getPaymentKey()  : {}", searchVO.getPaymentKey()); //지급관리키.
			logger.debug("searchVO.getProceedTurn()  : {}", searchVO.getProceedTurn()); //진행회차.
			logger.debug("searchVO.getTotalTurn()  : {}", searchVO.getTotalTurn()); //전체회차.		
			
			//paymentKey가 있는 경우 상세조회, 없는 경우는 등록화면.
//			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getPaymentKey(), ""))) {
//				paymentRequestInfo = service.selectPaymentRequestInfo(searchVO);
//			} else {
//				paymentRequestInfo = new EgovMap();
//				
//			}
			
			paymentRequestInfo = service.selectPaymentRequestInfo(searchVO);
			
			//해당매입처의 계좌정보를 조회한다.
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getBillAcKey(), ""))) {
				depositList = comService.selectDepositList(searchVO.getBillAcKey());
			}
			
			if("BO".equals(searchVO.getMtOrderType())) {
				orderAmountInfo = service.selectMtBackOrderAmountInfo(searchVO.getMtOrderKey());
			} else if("PO".equals(searchVO.getMtOrderType())) {
				orderAmountInfo = service.selectMtOrderAmountInfo(searchVO.getMtOrderKey());
			}
			
			model.addAttribute("orderAmountInfo", orderAmountInfo);
			
			
			paymentRequestInfo.put("mtOrderType", searchVO.getMtOrderType());
			paymentRequestInfo.put("mtIntegrateKey", searchVO.getMtIntegrateKey());
			
			//유지보수 작업관리키
			paymentRequestInfo.put("mtWorkKey", searchVO.getMtWorkKey());
			//발주관리키.(paymentBuyFkKey= mtOrderKey)
			paymentRequestInfo.put("paymentBuyFkKey", searchVO.getMtOrderKey());
			paymentRequestInfo.put("paymentAcFkKey", searchVO.getBillAcKey());
			
			
			//계산서 목록 조회
			model.addAttribute("paymentRequestInfo", paymentRequestInfo);
			
			//지급계좌정보
			model.addAttribute("depositList", depositList); 
			
			model.addAttribute("displayUtil", new CepDisplayUtil());				
			

			model.addAttribute("proceedTurn", searchVO.getProceedTurn());
			model.addAttribute("totalTurn", searchVO.getTotalTurn());
//			model.addAttribute("mtOrderType", searchVO.getMtOrderType());
//			//유지보수 key
//			model.addAttribute("mtIntegrateKey", searchVO.getMtIntegrateKey());
//			
//			//유지보수 작업관리키
//			model.addAttribute("mtWorkKey", searchVO.getMtWorkKey());
//			//발주관리키.(paymentBuyFkKey= mtOrderKey)
//			model.addAttribute("paymentBuyFkKey", searchVO.getMtOrderKey());
//			
//			//사업자번호(매입처관리키)
//			model.addAttribute("paymentAcFkKey", searchVO.getBillAcKey());
//			model.addAttribute("billAcKey", searchVO.getBillAcKey());
			
			
//			orderVO = service.selectOrderDetail(mtOrderKey);
//			model.addAttribute("orderVO", orderVO);
//			
//			purchaseVO = reqService.selectPurchaseDetail(orderKey);
//			acKey = orderVO.getOrderAcKey();
//			depositList = comService.selectDepositList(acKey);
//			paymentList = reqService.selectPaymentList(purchaseVO.getBuyKey());
//			prePaymentList = reqService.selectPrePaymentList(purchaseVO.getBuyKey());
//			
//			model.addAttribute("mainKey", key);
//			model.addAttribute("orderKey", orderKey);
//			model.addAttribute("purchaseVO", purchaseVO);
//			model.addAttribute("depositList", depositList); 
//			model.addAttribute("paymentList", paymentList);
//			model.addAttribute("prePaymentList", prePaymentList);
//			model.put("displayUtil", new CepDisplayUtil());
//			model.put("pmNm", request.getParameter("pmNm"));
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return "mngMaint/payment/detail/paymentForm";
	}
	
	/**
	 * 
	 * <pre>
	 * </pre>
	 * 
	 * @param request
	 * @param mtPaymentVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 12. 13. 오후 9:33:26
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/payment/detail/writePaymentComplete.do")
	@ResponseBody
	public Map<String, Object> writePaymentComplete(HttpServletRequest request, @ModelAttribute("mtPaymentVO")  MtPaymentVO mtPaymentVO) throws Exception {
		String paymentKey = null;
		logger.debug("=============== writePaymentComplete ======================");

		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
//		EgovMap paymentRequestInfo = null;
//		String paymentStatusCdNm = null;
		try {
			logger.debug("mtPaymentVO.getPaymentKey() : {}", mtPaymentVO.getPaymentKey());
			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
			logger.debug("mtPaymentVO.getPaymentBuyFkKey()  : {}", mtPaymentVO.getPaymentBuyFkKey()); //발주키
			logger.debug("mtPaymentVO.getMtOrderKey()  : {}", mtPaymentVO.getMtOrderKey()); //발주키
			logger.debug("mtPaymentVO.getMtOrderType() : {}", mtPaymentVO.getMtOrderType());
			logger.debug("mtPaymentVO.getPaymentDtFkKey() : {}", mtPaymentVO.getPaymentDtFkKey());
			logger.debug("mtPaymentVO.getPaymentStatusCd() : {}", mtPaymentVO.getPaymentStatusCd());
			logger.debug("mtPaymentVO.getPaymentTurn() : {}", mtPaymentVO.getPaymentTurn());
			logger.debug("mtPaymentVO.getPaymentCallDt() : {}", mtPaymentVO.getPaymentCallDt());
			logger.debug("mtPaymentVO.getPaymentDt() : {}", mtPaymentVO.getPaymentDt());
			logger.debug("mtPaymentVO.getCallAmount() : {}", mtPaymentVO.getCallAmount());
			logger.debug("mtPaymentVO.getPaymentAcFkKey()  : {}", mtPaymentVO.getPaymentAcFkKey()); //매입사업자번호.
			logger.debug("mtPaymentVO.getBillAcKey()  : {}", mtPaymentVO.getBillAcKey()); //매입사업자번호.
			logger.debug("mtPaymentVO.getPaymentYearMonth()  : {}", mtPaymentVO.getPaymentYearMonth()); 
			
			logger.debug("mtPaymentVO.getBillFkKey() : {}", mtPaymentVO.getBillFkKey()); 			
			logger.debug("mtPaymentVO.getMtWorkKey() : {}", mtPaymentVO.getMtWorkKey()); //유지보수 작업에만 존재함(mtOrderType:PO)
			
			
						
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mtPaymentVO.setRegEmpKey(sessionMap.get("empKey"));
			mtPaymentVO.setModEmpKey(sessionMap.get("empKey"));
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getMtOrderType(), ""))) {
				if("".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getPaymentKey(), ""))) {
					logger.debug("writePaymentComplete insert===========>");
					//계산서 요청 관리키가 없는 경우 등록
					paymentKey = service.writePaymentRequestInfo(mtPaymentVO);
					
					
				} else {
					logger.debug("writePaymentComplete update===========>");
					//계산서 요청 관리키가 있는 경우 수정 
					service.updatePaymentRequestInfo(mtPaymentVO);
					paymentKey = mtPaymentVO.getPaymentKey();
									
				}
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
//	@RequestMapping(value="/mngMaint/payment/detail/writePaymentComplete.do", method=RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> writePaymentComplete(HttpServletRequest request, @RequestBody MtPaymentVO mtPaymentVO) throws Exception {
//		String paymentKey = null;
//		logger.debug("=============== writePaymentComplete ======================");
//
//		
//		Map<String, Object> returnMap = new HashMap<String, Object>();
//		
//		HashMap<String, String> sessionMap = null;
//		
////		EgovMap paymentRequestInfo = null;
////		String paymentStatusCdNm = null;
//		try {
//			logger.debug("mtPaymentVO.getPaymentKey() : {}", mtPaymentVO.getPaymentKey());
//			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
//			logger.debug("mtPaymentVO.getPaymentBuyFkKey()  : {}", mtPaymentVO.getPaymentBuyFkKey()); //발주키
//			logger.debug("mtPaymentVO.getMtOrderKey()  : {}", mtPaymentVO.getMtOrderKey()); //발주키
//			logger.debug("mtPaymentVO.getMtOrderType() : {}", mtPaymentVO.getMtOrderType());
//			logger.debug("mtPaymentVO.getPaymentStatusCd() : {}", mtPaymentVO.getPaymentStatusCd());
//			
//			
//			logger.debug("mtPaymentVO.getBillFkKey() : {}", mtPaymentVO.getBillFkKey()); 			
//			logger.debug("mtPaymentVO.getMtWorkKey() : {}", mtPaymentVO.getMtWorkKey()); //유지보수 작업에만 존재함(mtOrderType:PO)
//			
//			logger.debug("mtPaymentVO.getBillAcKey()  : {}", mtPaymentVO.getBillAcKey()); //매입사업자번호.
//			logger.debug("mtPaymentVO.getPaymentAcFkKey()  : {}", mtPaymentVO.getPaymentAcFkKey()); //매입사업자번호.
//			logger.debug("mtPaymentVO.getPaymentYearMonth()  : {}", mtPaymentVO.getPaymentYearMonth()); 
//						
//			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
//			
//			mtPaymentVO.setRegEmpKey(sessionMap.get("empKey"));
//			mtPaymentVO.setModEmpKey(sessionMap.get("empKey"));
//			
//			if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getMtOrderType(), ""))) {
//				if("".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getPaymentKey(), ""))) {
//					//계산서 요청 관리키가 없는 경우 등록
//					//paymentKey = service.writePaymentRequestInfo(mtPaymentVO);
//					
////					mtPaymentVO.setPaymentKey(paymentKey);
////					paymentRequestInfo = service.selectPaymentRequestInfo(mtPaymentVO);
////					paymentStatusCdNm = (String)paymentRequestInfo.get("paymentRequestInfo");
//				} else {
//					//계산서 요청 관리키가 있는 경우 수정
//					service.updatePaymentRequestInfo(mtPaymentVO);
//					paymentKey = mtPaymentVO.getPaymentKey();
//									
//				}
//				returnMap.put("successYN", "Y");
//			} else {
//				returnMap.put("successYN", "N");
//			}
//						
//			
//			returnMap.put("mtOrderType", mtPaymentVO.getMtOrderType());
//			//유지보수 key
//			returnMap.put("mtIntegrateKey", mtPaymentVO.getMtIntegrateKey());
//			
//			//유지보수 작업관리키
//			returnMap.put("mtWorkKey", mtPaymentVO.getMtWorkKey());
//			//발주관리키.
//			returnMap.put("paymentBuyFkKey", mtPaymentVO.getPaymentBuyFkKey());
//			
//			//사업자번호(매입처관리키)
//			returnMap.put("paymentAcFkKey", mtPaymentVO.getPaymentAcFkKey());
//			
//			returnMap.put("paymentKey", paymentKey);
//			
//		}catch(Exception e){
//			returnMap.put("successYN", "N");
//			logger.error("{}", e);
//			//throw e;
//		}		
//		return returnMap;
//	}
	
	/**
	 * 매입지급요청 등록.
	 * <pre>
	 * </pre>
	 * 
	 * @param request
	 * @param mtPaymentVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 12. 오후 2:51:32
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/payment/detail/writePaymentRequestInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> writePaymentRequestInfo(HttpServletRequest request, @RequestBody MtPaymentVO mtPaymentVO) throws Exception {
		String paymentKey = null;
		logger.debug("=============== writePaymentForm ======================");

		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
//		EgovMap paymentRequestInfo = null;
//		String paymentStatusCdNm = null;
		try {
			logger.debug("mtPaymentVO.getPaymentKey() : {}", mtPaymentVO.getPaymentKey());
			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
			logger.debug("mtPaymentVO.getMtWorkKey() : {}", mtPaymentVO.getBillFkKey()); 
			
			logger.debug("mtPaymentVO.getMtOrderType() : {}", mtPaymentVO.getMtOrderType());
			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
			logger.debug("mtPaymentVO.getMtWorkKey() : {}", mtPaymentVO.getMtWorkKey()); //유지보수 작업에만 존재함(mtOrderType:PO)
			logger.debug("mtPaymentVO.getMtOrderKey()  : {}", mtPaymentVO.getMtOrderKey()); //발주키
			logger.debug("mtPaymentVO.getPaymentBuyFkKey()  : {}", mtPaymentVO.getPaymentBuyFkKey()); //발주키
			logger.debug("mtPaymentVO.getBillAcKey()  : {}", mtPaymentVO.getBillAcKey()); //매입사업자번호.
			logger.debug("mtPaymentVO.getPaymentAcFkKey()  : {}", mtPaymentVO.getPaymentAcFkKey()); //매입사업자번호.
			logger.debug("mtPaymentVO.getPaymentKey()  : {}", mtPaymentVO.getPaymentKey()); //지급관리키.
						
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mtPaymentVO.setRegEmpKey(sessionMap.get("empKey"));
			mtPaymentVO.setModEmpKey(sessionMap.get("empKey"));
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getMtOrderType(), ""))) {
				if("".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getPaymentKey(), ""))) {
					//계산서 요청 관리키가 없는 경우 등록
					paymentKey = service.writePaymentRequestInfo(mtPaymentVO);
					
//					mtPaymentVO.setPaymentKey(paymentKey);
//					paymentRequestInfo = service.selectPaymentRequestInfo(mtPaymentVO);
//					paymentStatusCdNm = (String)paymentRequestInfo.get("paymentRequestInfo");
				} else {
					//계산서 요청 관리키가 있는 경우 수정 
					service.updatePaymentRequestInfo(mtPaymentVO);
					paymentKey = mtPaymentVO.getPaymentKey();
									
				}
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
	
	/**
	 * 매입지급요청 삭제
	 * <pre>
	 * </pre>
	 * 
	 * @param request
	 * @param mtPaymentVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 12. 오후 2:54:28
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/payment/detail/deletePaymentRequestInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deletePaymentRequestInfo(HttpServletRequest request, @RequestBody MtPaymentVO mtPaymentVO) throws Exception {
		logger.debug("=============== deletePaymentForm ======================");

		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
//		EgovMap paymentRequestInfo = null;
//		String paymentStatusCdNm = null;
		try {
			logger.debug("mtPaymentVO.getPaymentKey() : {}", mtPaymentVO.getPaymentKey());
			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
			logger.debug("mtPaymentVO.getMtWorkKey() : {}", mtPaymentVO.getBillFkKey()); 
			
			logger.debug("mtPaymentVO.getMtOrderType() : {}", mtPaymentVO.getMtOrderType());
			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
			logger.debug("mtPaymentVO.getMtWorkKey() : {}", mtPaymentVO.getMtWorkKey()); //유지보수 작업에만 존재함(mtOrderType:PO)
			logger.debug("mtPaymentVO.getMtOrderKey()  : {}", mtPaymentVO.getMtOrderKey()); //발주키
			logger.debug("mtPaymentVO.getPaymentBuyFkKey()  : {}", mtPaymentVO.getPaymentBuyFkKey()); //발주키
			logger.debug("mtPaymentVO.getBillAcKey()  : {}", mtPaymentVO.getBillAcKey()); //매입사업자번호.
			logger.debug("mtPaymentVO.getPaymentAcFkKey()  : {}", mtPaymentVO.getPaymentAcFkKey()); //매입사업자번호.
			logger.debug("mtPaymentVO.getPaymentKey()  : {}", mtPaymentVO.getPaymentKey()); //지급관리키.
						
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mtPaymentVO.setRegEmpKey(sessionMap.get("empKey"));
			mtPaymentVO.setModEmpKey(sessionMap.get("empKey"));
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getPaymentKey(), ""))) {
				service.deletePaymentRequest(mtPaymentVO);
				
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
			
		
			
		}catch(Exception e){
			returnMap.put("successYN", "N");
			logger.error("{}", e);
			//throw e;
		}		
		return returnMap;
	}
	
//	/**
//	 * 매입지급요청 수정
//	 * <pre>
//	 * </pre>
//	 * 
//	 * @param request
//	 * @param mtPaymentVO
//	 * @return
//	 * @throws Exception
//	 * @cdate 2021. 10. 12. 오후 2:58:06
//	 * @author aranghoo
//	 */
//	@RequestMapping(value="/mngMaint/payment/detail/updatePaymentRequestInfo.do", method=RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> updatePaymentRequestInfo(HttpServletRequest request, @RequestBody MtPaymentVO mtPaymentVO) throws Exception {
//		
//		logger.debug("=============== updatePaymentRequestInfo ======================");
//
//		
//		Map<String, Object> returnMap = new HashMap<String, Object>();
//		
//		HashMap<String, String> sessionMap = null;
//		
////		EgovMap paymentRequestInfo = null;
////		String paymentStatusCdNm = null;
//		try {
//			logger.debug("mtPaymentVO.getPaymentKey() : {}", mtPaymentVO.getPaymentKey());
//			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
//			logger.debug("mtPaymentVO.getMtWorkKey() : {}", mtPaymentVO.getBillFkKey()); 
//			
//			logger.debug("mtPaymentVO.getMtOrderType() : {}", mtPaymentVO.getMtOrderType());
//			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
//			logger.debug("mtPaymentVO.getMtWorkKey() : {}", mtPaymentVO.getMtWorkKey()); //유지보수 작업에만 존재함(mtOrderType:PO)
//			logger.debug("mtPaymentVO.getMtOrderKey()  : {}", mtPaymentVO.getMtOrderKey()); //발주키
//			logger.debug("mtPaymentVO.getPaymentBuyFkKey()  : {}", mtPaymentVO.getPaymentBuyFkKey()); //발주키
//			logger.debug("mtPaymentVO.getBillAcKey()  : {}", mtPaymentVO.getBillAcKey()); //매입사업자번호.
//			logger.debug("mtPaymentVO.getPaymentAcFkKey()  : {}", mtPaymentVO.getPaymentAcFkKey()); //매입사업자번호.
//			logger.debug("mtPaymentVO.getPaymentKey()  : {}", mtPaymentVO.getPaymentKey()); //지급관리키.
//						
//			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
//			
//			mtPaymentVO.setRegEmpKey(sessionMap.get("empKey"));
//			mtPaymentVO.setModEmpKey(sessionMap.get("empKey"));
//			
//			if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getPaymentKey(), ""))) {
//
//				service.updatePaymentRequestInfo(mtPaymentVO);
//				
//				returnMap.put("successYN", "Y");
//			} else {
//				returnMap.put("successYN", "N");
//			}
//						
//			
//			returnMap.put("mtOrderType", mtPaymentVO.getMtOrderType());
//			
//			//유지보수 key
//			returnMap.put("mtIntegrateKey", mtPaymentVO.getMtIntegrateKey());
//			
//			//유지보수 작업관리키
//			returnMap.put("mtWorkKey", mtPaymentVO.getMtWorkKey());
//			//발주관리키.
//			returnMap.put("paymentBuyFkKey", mtPaymentVO.getPaymentBuyFkKey());
//			
//			//사업자번호(매입처관리키)
//			returnMap.put("paymentAcFkKey", mtPaymentVO.getPaymentAcFkKey());
//						
//			
//		}catch(Exception e){
//			returnMap.put("successYN", "N");
//			logger.error("{}", e);
//			//throw e;
//		}		
//		return returnMap;
//	}
	
	/**
	 * 매입지급요청 상태를 변경한다.
	 * 1. 확인 
	 * 2. 확인취소
	 * 3. 지급완료
	 * 4. 지급완료 취소.
	 * <pre>
	 * </pre>
	 * 
	 * @param request
	 * @param mtPaymentVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 12. 오후 2:58:49
	 * @author aranghoo
	 */
	@RequestMapping(value="/mngMaint/payment/detail/updatePaymentRequestStatus.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updatePaymentRequestStatus(HttpServletRequest request, @RequestBody MtPaymentVO mtPaymentVO) throws Exception {
		
		logger.debug("=============== updatePaymentRequestInfo ======================");

		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
//		EgovMap paymentRequestInfo = null;
//		String paymentStatusCdNm = null;
		String successYN = "N";
		try {
			logger.debug("mtPaymentVO.getPaymentKey() : {}", mtPaymentVO.getPaymentKey());
			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
			logger.debug("mtPaymentVO.getBillFkKey() : {}", mtPaymentVO.getBillFkKey()); 
			
			logger.debug("mtPaymentVO.getMtOrderType() : {}", mtPaymentVO.getMtOrderType());
			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
			logger.debug("mtPaymentVO.getMtWorkKey() : {}", mtPaymentVO.getMtWorkKey()); //유지보수 작업에만 존재함(mtOrderType:PO)
			logger.debug("mtPaymentVO.getMtOrderKey()  : {}", mtPaymentVO.getMtOrderKey()); //발주키
			logger.debug("mtPaymentVO.getPaymentBuyFkKey()  : {}", mtPaymentVO.getPaymentBuyFkKey()); //발주키
			logger.debug("mtPaymentVO.getBillAcKey()  : {}", mtPaymentVO.getBillAcKey()); //매입사업자번호.
			logger.debug("mtPaymentVO.getPaymentAcFkKey()  : {}", mtPaymentVO.getPaymentAcFkKey()); //매입사업자번호.
			logger.debug("mtPaymentVO.getPaymentKey()  : {}", mtPaymentVO.getPaymentKey()); //지급관리키.
			
			logger.debug("mtPaymentVO.getCurrentStatus()  : {}", mtPaymentVO.getCurrentStatus()); //현재 요청상태
			logger.debug("mtPaymentVO.getRequestStatus()  : {}", mtPaymentVO.getRequestStatus()); //변경할 요청상태.
						
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mtPaymentVO.setRegEmpKey(sessionMap.get("empKey"));
			mtPaymentVO.setModEmpKey(sessionMap.get("empKey"));
			
			
			successYN = updatePaymentRequestStatusCode(mtPaymentVO);
			returnMap.put("successYN", successYN);
			
//			if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getPaymentKey(), ""))) {
//				if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getCurrentStatus(), ""))
//						&& !"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getRequestStatus(), ""))) {
//					
//					if("R".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getRequestStatus(), ""))) {
//						//요청에 대한 승인(확인) 취소
//						service.cancelPaymentRequestConfirm(mtPaymentVO);
//					} else if("C".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getRequestStatus(), ""))) {
//						//요청 승인(확인)과 지급취소가 있음
//						if("R".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getCurrentStatus(), ""))) {
//							//요청승인(확인)
//							service.updatePaymentRequestConfirm(mtPaymentVO);
//						} else if("E".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getCurrentStatus(), ""))) {
//							//지급취소
//							service.cancelPaymentRequestFinish(mtPaymentVO);
//						}
//					} else if("E".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getRequestStatus(), ""))) {
//						//지급확인.
//						if("".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getPaymentDt(), ""))) {
//							mtPaymentVO.setPaymentDt(CepDateUtil.getToday("yyyyMMdd"));
//						}
//						service.updatePaymentRequestFinish(mtPaymentVO);
//					}
//
//					returnMap.put("successYN", "Y");
//				}else {
//					returnMap.put("successYN", "N");
//				}
//
//				
//				
//				
//			} else {
//				returnMap.put("successYN", "N");
//			}
						
			
			returnMap.put("mtOrderType", mtPaymentVO.getMtOrderType());
			
			//유지보수 key
			returnMap.put("mtIntegrateKey", mtPaymentVO.getMtIntegrateKey());
			
			//유지보수 작업관리키
			returnMap.put("mtWorkKey", mtPaymentVO.getMtWorkKey());
			//발주관리키.
			returnMap.put("paymentBuyFkKey", mtPaymentVO.getPaymentBuyFkKey());
			
			//사업자번호(매입처관리키)
			returnMap.put("paymentAcFkKey", mtPaymentVO.getPaymentAcFkKey());
						
			
		}catch(Exception e){
			returnMap.put("successYN", "N");
			logger.error("{}", e);
			//throw e;
		}		
		return returnMap;
	}
	
	
	@RequestMapping(value="/mngMaint/payment/detail/updatePaymentRequestStatus2.do")
	@ResponseBody
	public Map<String, Object> updatePaymentRequestStatus2(HttpServletRequest request, @ModelAttribute("mtPaymentVO") MtPaymentVO mtPaymentVO) throws Exception {
		
		logger.debug("=============== updatePaymentRequestInfo ======================");

		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> sessionMap = null;
		
//		EgovMap paymentRequestInfo = null;
//		String paymentStatusCdNm = null;
		String successYN = "N";
		try {
			logger.debug("mtPaymentVO.getPaymentKey() : {}", mtPaymentVO.getPaymentKey());
			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
			logger.debug("mtPaymentVO.getBillFkKey() : {}", mtPaymentVO.getBillFkKey()); 
			
			logger.debug("mtPaymentVO.getMtOrderType() : {}", mtPaymentVO.getMtOrderType());
			logger.debug("mtPaymentVO.getMtIntegrateKey() : {}", mtPaymentVO.getMtIntegrateKey());
			logger.debug("mtPaymentVO.getMtWorkKey() : {}", mtPaymentVO.getMtWorkKey()); //유지보수 작업에만 존재함(mtOrderType:PO)
			logger.debug("mtPaymentVO.getMtOrderKey()  : {}", mtPaymentVO.getMtOrderKey()); //발주키
			logger.debug("mtPaymentVO.getPaymentBuyFkKey()  : {}", mtPaymentVO.getPaymentBuyFkKey()); //발주키
			logger.debug("mtPaymentVO.getBillAcKey()  : {}", mtPaymentVO.getBillAcKey()); //매입사업자번호.
			logger.debug("mtPaymentVO.getPaymentAcFkKey()  : {}", mtPaymentVO.getPaymentAcFkKey()); //매입사업자번호.
			logger.debug("mtPaymentVO.getPaymentKey()  : {}", mtPaymentVO.getPaymentKey()); //지급관리키.			
			logger.debug("mtPaymentVO.getCurrentStatus()  : {}", mtPaymentVO.getCurrentStatus()); //현재 요청상태
			logger.debug("mtPaymentVO.getRequestStatus()  : {}", mtPaymentVO.getRequestStatus()); //변경할 요청상태.
						
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mtPaymentVO.setRegEmpKey(sessionMap.get("empKey"));
			mtPaymentVO.setModEmpKey(sessionMap.get("empKey"));
			
			successYN = updatePaymentRequestStatusCode(mtPaymentVO);
			returnMap.put("successYN", successYN);
			
//			if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getPaymentKey(), ""))) {
//				if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getCurrentStatus(), ""))
//						&& !"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getRequestStatus(), ""))) {
//					
//					if("R".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getRequestStatus(), ""))) {
//						//요청에 대한 승인(확인) 취소
//						service.cancelPaymentRequestConfirm(mtPaymentVO);
//					} else if("C".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getRequestStatus(), ""))) {
//						//요청 승인(확인)과 지급취소가 있음
//						if("R".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getCurrentStatus(), ""))) {
//							//요청승인(확인)
//							service.updatePaymentRequestConfirm(mtPaymentVO);
//						} else if("E".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getCurrentStatus(), ""))) {
//							//지급취소
//							service.cancelPaymentRequestFinish(mtPaymentVO);
//						}
//					} else if("E".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getRequestStatus(), ""))) {
//						//지급확인.
//						if("".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getPaymentDt(), ""))) {
//							mtPaymentVO.setPaymentDt(CepDateUtil.getToday("yyyyMMdd"));
//						}
//						service.updatePaymentRequestFinish(mtPaymentVO);
//					}
//					
//					
//					returnMap.put("successYN", "Y");
//				}else {
//					returnMap.put("successYN", "N");
//				}
//
//				
//				
//				
//			} else {
//				returnMap.put("successYN", "N");
//			}
						
			
			returnMap.put("mtOrderType", mtPaymentVO.getMtOrderType());
			
			//유지보수 key
			returnMap.put("mtIntegrateKey", mtPaymentVO.getMtIntegrateKey());
			
			//유지보수 작업관리키
			returnMap.put("mtWorkKey", mtPaymentVO.getMtWorkKey());
			//발주관리키.
			returnMap.put("paymentBuyFkKey", mtPaymentVO.getPaymentBuyFkKey());
			
			//사업자번호(매입처관리키)
			returnMap.put("paymentAcFkKey", mtPaymentVO.getPaymentAcFkKey());
						
			
		}catch(Exception e){
			returnMap.put("successYN", "N");
			logger.error("{}", e);
			//throw e;
		}		
		return returnMap;
	}
	
	private String updatePaymentRequestStatusCode(MtPaymentVO mtPaymentVO) throws Exception{
		String successYN = "N";
		try {
			if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getPaymentKey(), ""))) {
				if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getCurrentStatus(), ""))
						&& !"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getRequestStatus(), ""))) {
					
					if("R".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getRequestStatus(), ""))) {
						//요청에 대한 승인(확인) 취소
						service.cancelPaymentRequestConfirm(mtPaymentVO);
					} else if("C".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getRequestStatus(), ""))) {
						//요청 승인(확인)과 지급취소가 있음
						if("R".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getCurrentStatus(), ""))) {
							//요청승인(확인)
							service.updatePaymentRequestConfirm(mtPaymentVO);
						} else if("E".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getCurrentStatus(), ""))) {
							//지급취소
							service.cancelPaymentRequestFinish(mtPaymentVO);
						}
					} else if("E".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getRequestStatus(), ""))) {
						//지급확인.
						if("".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getPaymentDt(), ""))) {
							mtPaymentVO.setPaymentDt(CepDateUtil.getToday("yyyyMMdd"));
						}
						service.updatePaymentRequestFinish(mtPaymentVO);
					}					
					successYN = "Y";
				}
				
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return successYN;
	}
}
