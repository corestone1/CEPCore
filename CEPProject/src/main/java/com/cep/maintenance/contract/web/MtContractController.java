package com.cep.maintenance.contract.web;

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

import com.cep.forecast.service.ForecastService;
import com.cep.forecast.vo.ForecastVO;
import com.cep.maintenance.contract.service.MtContractService;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.contract.vo.MtSaleAmountListVO;
import com.cep.maintenance.contract.vo.MtSalesAmountVO;
import com.cep.maintenance.contract.vo.MtBackOrderProductVO;
import com.cep.maintenance.contract.vo.MtBackOrderVO;
import com.cep.maintenance.contract.vo.MtBuyAmountListVO;
import com.cep.maintenance.contract.vo.MtBuyAmountVO;
import com.cep.maintenance.contract.vo.MtContractLinkVO;
import com.cep.maintenance.contract.vo.MtContractProductVO;
import com.cep.maintenance.contract.vo.MtContractVO;
import com.cmm.service.FileMngService;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.FileVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;


@Controller
@RequestMapping("/maintenance/contract")
public class MtContractController {
	private static final Logger logger = LoggerFactory.getLogger(MtContractController.class);

	
	@Resource(name="mtContractService")
	private MtContractService service;
	
	@Resource(name="forecastService")
	private ForecastService forecastService;
	
	//첨부파일 관련.
	@Resource(name="fileMngService")
	private FileMngService fileMngService;
	
	@Value("#{comProps['maxFileCnt']}")
	private String maxFileCnt;	// 허용 파일 개수
	
	@Value("#{comProps['maxFileSize']}")
	private String maxFileSize;	// 허용 파일 사이즈
	
	@Value("#{comProps['fileExtn']}")
	private String fileExtn;		// 허용 파일 확장자

	/**
	 * 
	  * @Method Name : selectContractList
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 목록 조회
	  * @param searchVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/contractList.do")
	public String selectContractList(@ModelAttribute("searchVO") MtDefaultVO searchVO, ModelMap model) throws Exception {
		
		List<?> mtList = null;
//		List<?> empList = null;
		String toDay = null;		
//		String fromDate = null;
		Map<String, String> searchParam = null;
		try {			
			toDay = CepDateUtil.getToday(null);		
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getFromDate(), ""))){
				searchVO.setFromDate(searchVO.getFromDate().replace("-", ""));
			} else {
				searchVO.setFromDate(CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6));
			}
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getToDate(), ""))){
				searchVO.setToDate(searchVO.getToDate().replace("-", ""));
			} else {
				searchVO.setToDate(toDay);
			}
			
//			if("".equals(CepStringUtil.getDefaultValue(searchVO.getFromDate(), "")) && "".equals(CepStringUtil.getDefaultValue(searchVO.getToDate(), ""))){
//				toDay = CepDateUtil.getToday(null);
//				/*
//				 * 6개월 날짜 계산.
//				 */
//				fromDate = CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6);
//				
//				searchVO.setFromDate(fromDate);
//				searchVO.setToDate(toDay);				
//			}
			searchParam = new HashMap<>();
			searchParam.put("fromDate", CepDateUtil.convertDisplayFormat(searchVO.getFromDate(), null, null));
			searchParam.put("toDate", CepDateUtil.convertDisplayFormat(searchVO.getToDate(), null, null));
			
			logger.debug("searchVO.getFromDate()===>"+searchVO.getFromDate());
			logger.debug("searchVO.getSearchSaleEmpKey()===>"+searchVO.getSearchSaleEmpKey());
			logger.debug("searchVO.getSearchMtName()===>"+searchVO.getSearchMtName());
			logger.debug("searchVO.getBtnOption()===>"+searchVO.getBtnOption());
			logger.debug("searchVO.getSelectKey()===>"+searchVO.getSelectKey());
			mtList = service.selectContractList(searchVO);
			/*logger.debug("mtList.size()=====>"+mtList.size());
			for (int i = 0; i < mtList.size(); i++) {
				MtContractVO vo = (MtContractVO)mtList.get(i);
				logger.debug("vo.getMtAcNm()===>"+vo.getMtAcNm());
			}*/
//			empList = service.selectEmployeeList();
			model.put("resultList", mtList);
//			model.put("empList", empList);
			model.put("searchParam", searchParam);
			model.put("displayUtil", new CepDisplayUtil());
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error("mtContractList error", e);
		}
		
		return "maintenance/contract/contractList";
	}
	
	/**
	 * 
	  * @Method Name : selectPopupContractList
	  * @Cdate       : 2021. 1. 20.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 목록 조회 팝업
	  * @param searchVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/popup/contractList.do")
	public String selectPopupContractList(@ModelAttribute("searchVO") MtDefaultVO searchVO, ModelMap model) throws Exception {
		
		List<?> mtList = null;
		List<?> empList = null;
		String toDay = null;		
		String fromDate = null;
		Map<String, String> searchParam = null;
		try {			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getFromDate(), ""))){
				searchVO.setFromDate(searchVO.getFromDate().replace("-", ""));
			}
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getToDate(), ""))){
				searchVO.setToDate(searchVO.getToDate().replace("-", ""));
			}
			
			if("".equals(CepStringUtil.getDefaultValue(searchVO.getFromDate(), "")) && "".equals(CepStringUtil.getDefaultValue(searchVO.getToDate(), ""))){
				toDay = CepDateUtil.getToday(null);
				/*
				 * 6개월 날짜 계산.
				 */
				fromDate = CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6);
				
				searchVO.setFromDate(fromDate);
				searchVO.setToDate(toDay);				
			}
			logger.debug("searchGubun====>"+searchVO.getSearchGubun());
			searchParam = new HashMap<>();
			searchParam.put("fromDate", CepDateUtil.convertDisplayFormat(searchVO.getFromDate(), null, null));
			searchParam.put("toDate", CepDateUtil.convertDisplayFormat(searchVO.getToDate(), null, null));
			searchParam.put("codeId", searchVO.getCodeId()); //계약관리키가 입력될 필드명
			searchParam.put("nameId", searchVO.getNameId()); //계약명이 입력될 필드명

			
			
			
			mtList = service.selectContractList(searchVO);
			/*logger.debug("mtList.size()=====>"+mtList.size());
			for (int i = 0; i < mtList.size(); i++) {
				MtContractVO vo = (MtContractVO)mtList.get(i);
				logger.debug("vo.getMtAcNm()===>"+vo.getMtAcNm());
			}*/
			empList = service.selectEmployeeList();
			model.put("resultList", mtList);
			model.put("empList", empList);
			model.put("searchParam", searchParam);
			model.put("displayUtil", new CepDisplayUtil());
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error("selectPopupContractList error", e);
		}
		return "maintenance/popup/mtContractListPopup";
	}
	
	/**
	 * 
	  * @Method Name : deleteContract
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 삭제.
	  * @param searchVO
	  * @param model
	  * @param request
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/deleteContract.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Map<String, String> deleteContract(@RequestBody MtDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
//		List<?> mtList = null;
//		List<?> empList = null;
//		String toDay = null;		
//		String fromDate = null;

		MtContractVO deleteVo = null;
		HashMap<String, String> sessionMap = null;
		Map<String, String> returnMap = new HashMap<>();
		try {			
//			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getFromDate(), ""))){
//				searchVO.setFromDate(searchVO.getFromDate().replace("-", ""));
//			}
//			
//			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getToDate(), ""))){
//				searchVO.setToDate(searchVO.getToDate().replace("-", ""));
//			}
//			
//			if("".equals(CepStringUtil.getDefaultValue(searchVO.getFromDate(), "")) && "".equals(CepStringUtil.getDefaultValue(searchVO.getToDate(), ""))){
//				toDay = CepDateUtil.getToday(null);
//				/*
//				 * 6개월 날짜 계산.
//				 */
//				fromDate = CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6);
//				
//				searchVO.setFromDate(fromDate);
//				searchVO.setToDate(toDay);				
//			}
			logger.debug("searchVO.getSelectKey()========>"+searchVO.getSelectKey());
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getSelectKey(), ""))) {
				sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
				
				deleteVo = new MtContractVO();
				deleteVo.setModEmpKey(sessionMap.get("empKey"));
				deleteVo.setMtIntegrateKey(searchVO.getSelectKey());
				service.deleteContract(deleteVo);
				returnMap.put("successYN", "Y");
			} else {
				returnMap.put("successYN", "N");
			}
			
			/*logger.debug("mtList.size()=====>"+mtList.size());
			for (int i = 0; i < mtList.size(); i++) {
				MtContractVO vo = (MtContractVO)mtList.get(i);
				logger.debug("vo.getMtAcNm()===>"+vo.getMtAcNm());
			}*/
//			mtList = service.selectContractList(searchVO);
//			empList = service.selectEmployeeList();
//			model.put("resultList", mtList);
//			model.put("empList", empList);
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error("deleteContract error", e);
		}
		
		return returnMap;
	}	
	
	/**
	 * 
	  * @Method Name : writeBasicInfoView
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 등록화면 이동
	  * @param mtContractVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/basicInfoView.do")
	public String writeBasicInfoView(MtContractVO mtContractVO, ModelMap model) throws Exception {
		MtContractVO basicContractInfo = null; //유지보수 기본정보
		List<?> empList = null; // 사용자 selectBox
		List < ? > acDirectorList = null; // 고객사 담당자 리스트.
		Map<String, Object> mtContractCountInfo = null; // 유지보수계약 단계별 등록 갯수 조회.
		
		//첨부파일 관련
		FileVO fileVO = new FileVO();
		List<?> fileResult = null;
		try {			
			
			logger.debug("mtContractVO.getMtIntegrateKey()====>"+mtContractVO.getMtIntegrateKey());
//			if("".equals(CepStringUtil.getDefaultValue(mtContractVO.getMtIntegrateKey(), ""))) {
//				//테스트
//				mtContractVO.setMtIntegrateKey("MA200024");
//			}
			
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtContractVO.getMtIntegrateKey(), ""))){
				//기본정보 조회
				basicContractInfo = service.selectContractBasicDetail(mtContractVO.getMtIntegrateKey());
				
				if(null !=basicContractInfo){
					acDirectorList = service.selectAcDirectorList(basicContractInfo.getMtAcKey());
					
					mtContractCountInfo = service.selectMtContractCount(mtContractVO.getMtIntegrateKey());
					
					

//					logger.debug("mmtContractVO.getWorkClass()====>"+mtContractVO.getWorkClass());
					fileVO.setFileCtKey(mtContractVO.getMtIntegrateKey());
					fileVO.setFileWorkClass("mtContract");
					
					fileResult = fileMngService.selectFileList(fileVO);
				}
			}		
			
			empList = service.selectEmployeeList();
			
			
			
			
			model.put("empList", empList);
			model.put("basicContractInfo", basicContractInfo);
			model.put("acDirectorList", acDirectorList);
			model.put("mtContractCountInfo", mtContractCountInfo);
			model.put("displayUtil", new CepDisplayUtil());
			
			//첨부파일 관련
			model.addAttribute("fileList", fileResult);
			model.addAttribute("maxFileCnt", maxFileCnt);
			model.addAttribute("fileExtn", fileExtn);		
			model.addAttribute("maxFileSize", maxFileSize);	
		} catch (Exception e) {
			
			logger.error("addBasicInfo error", e);
		}
		
		return "maintenance/contract/write/basicInfo";
	}
	
	/**
	 * 
	  * @Method Name : writeBasicInfo
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 등록
	  * @param request
	  * @param mtContractVO
	  * @param model
	 */
	@RequestMapping(value="/write/basicInfo.do", method=RequestMethod.POST)
	@ResponseBody 
	@SuppressWarnings("unchecked")
	public Map<String, String> writeBasicInfo(HttpServletRequest request, @RequestBody MtContractVO mtContractVO) {

		HashMap<String, String> sessionMap = null;
		Map<String, String> returnMap = new HashMap<>();
		String mtIntegrateKey = null;
		try {
//			logger.debug("mtContractVO.mtAcKey())=====>"+mtContractVO.getMtAcKey());
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
//			logger.debug("mtContractVO.getCtDt(1))=====>"+mtContractVO.getCtDt());
			
//			mtContractVO.setMtOption("w");//등록옵션 저장.
			mtContractVO.setRegEmpKey(sessionMap.get("empKey"));
			mtContractVO.setModEmpKey(sessionMap.get("empKey"));
			
			logger.debug("mtContractVO.getMtIntegrateKey()=====>"+mtContractVO.getMtIntegrateKey());
			
			

			
			if(!"".equals(CepStringUtil.getDefaultValue(mtContractVO.getMtIntegrateKey(), ""))) {
				// 유지보수계약 관리키가 존재하므로 수정
				service.updateMtContractBasic(mtContractVO);
				
				mtIntegrateKey = mtContractVO.getMtIntegrateKey();
			} else {
				//유지보수계약 관리키가 없으므로 등록
				if(mtContractVO.getMtSeq()>0) {
					//연장등록.
					mtIntegrateKey = service.writeContractBasic(mtContractVO);
				} else {
					//신규등록.
					mtIntegrateKey = service.writeFirestContractBasic(mtContractVO);
				}
				
			}
			
			
			returnMap.put("mtIntegrateKey", mtIntegrateKey);
			returnMap.put("parmMtSbCtYn", mtContractVO.getMtSbCtYn()); //백계약여부.
			returnMap.put("successYN", "Y");
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error(null, e);
		}		
		return returnMap;
	}	
	
	//========================================== 유지보수계약 제품정보 ===============================================================
	
	/**
	 * 
	  * @Method Name : selectPopupMtProductList
	  * @Cdate       : 2021. 2. 19.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업등록에서 유지보수 제품목록 조회 팝업
	  * @param searchVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/popup/mtProductList.do")
	public String selectPopupMtProductList(@ModelAttribute("searchVO") MtDefaultVO searchVO, ModelMap model) throws Exception {
		
		
		List<?> mtProductList = null;
		try {
			
			logger.debug("searchVO.getSelectIntegrateKey()===>"+searchVO.getSelectIntegrateKey());
			logger.debug("searchVO.getWhereNum()=====>"+searchVO.getWhereNum());
			logger.debug("searchVO.getSearchPmNmCd()=====>"+searchVO.getSearchPmNmCd());
			logger.debug("searchVO.getSearchSerialNum()=====>"+searchVO.getSearchSerialNum());
			logger.debug("searchVO.getSearchGubun()=====>"+searchVO.getSearchGubun());
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getSelectIntegrateKey(), ""))) {
//				mtProductList = service.selectMtContractProductList(searchVO.getSelectIntegrateKey());
				mtProductList = service.selectMtContractProductList(searchVO);
			}
			
			model.put("mtProductList", mtProductList);
			model.put("searchGubun", searchVO.getSearchGubun());
			model.addAttribute("whereNum", searchVO.getWhereNum());
			model.put("selectIntegrateKey", searchVO.getSelectIntegrateKey());
			model.put("displayUtil", new CepDisplayUtil());
		} catch (Exception e) {
			logger.error(null, e);
		}		
		return "maintenance/popup/mtProductPopup";
	}
	
	
	/**
	 * 
	  * @Method Name : selectPopupPjProductList
	  * @Cdate       : 2021. 2. 19.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품등록에서 프로젝트 제품목록 팝업.
	  * @param searchVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/popup/pjProductList.do")
	public String selectPopupPjProductList(@ModelAttribute("searchVO") MtDefaultVO searchVO, ModelMap model) throws Exception {
		
		
		List<?> mtProductList = null;
		try {
			
			logger.debug("searchVO.getSelectIntegrateKey()===>"+searchVO.getSelectIntegrateKey());
			logger.debug("searchVO.getWhereNum()=====>"+searchVO.getWhereNum());
			logger.debug("searchVO.getSearchPmNmCd()=====>"+searchVO.getSearchPmNmCd());
			logger.debug("searchVO.getSearchSerialNum()=====>"+searchVO.getSearchSerialNum());
			logger.debug("searchVO.getSearchGubun()=====>"+searchVO.getSearchGubun());
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getSelectIntegrateKey(), ""))) {
//				mtProductList = service.selectMtContractProductList(searchVO.getSelectIntegrateKey());
				mtProductList = service.selectPjContractProductList(searchVO);
			}
			
			model.put("mtProductList", mtProductList);
			model.put("searchGubun", searchVO.getSearchGubun());
			model.addAttribute("whereNum", searchVO.getWhereNum());
			model.put("selectIntegrateKey", searchVO.getSelectIntegrateKey());
			model.put("displayUtil", new CepDisplayUtil());
		} catch (Exception e) {
			logger.error(null, e);
		}		
		return "maintenance/popup/pjProductPopup";
	}
	/**
	 * 
	  * @Method Name : writeProductInfo
	  * @Cdate       : 2020. 11. 25.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품정보를 등록하는 화면으로 이동
	  * @param request
	  * @param mtContractVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/productInfoView.do")
	public String writeProductInfoView(HttpServletRequest request, MtContractProductVO productVO, ModelMap model) throws Exception {
		List<?> mtProductList = null;		
		MtDefaultVO searchVO = null;
		int listCount = 0;
		Map<String, Object> mtContractCountInfo = null; // 유지보수계약 단계별 등록 갯수 조회.
		MtContractVO basicContractInfo = null; //유지보수 기본정보
		try {
			//테스트
//			productVO.setMtIntegrateKey("MA200024");
//			productVO.setParmMtSbCtYn("Y");
//			if("".equals(CepStringUtil.getDefaultValue(productVO.getMtIntegrateKey(), ""))) {
//				//테스트
//				productVO.setMtIntegrateKey("MA200024");
//			}
			logger.debug("mtIntegrateKey===>"+productVO.getMtIntegrateKey());
			logger.debug("parmMtSbCtYn===>"+productVO.getParmMtSbCtYn());
			
			if(!"".equals(CepStringUtil.getDefaultValue(productVO.getMtIntegrateKey(), ""))) {
				//기본정보 조회
				basicContractInfo = service.selectContractBasicDetail(productVO.getMtIntegrateKey());
				if(null != basicContractInfo) {
					searchVO = new MtDefaultVO();
					searchVO.setSelectIntegrateKey(productVO.getMtIntegrateKey());
					//제품조회
					mtProductList = service.selectMtContractProductList(searchVO);
					if(null != mtProductList && mtProductList.size()>0) {
						listCount = mtProductList.size();
					}
					mtContractCountInfo = service.selectMtContractCount(productVO.getMtIntegrateKey());
				}
				
			}
			
			model.put("mtIntegrateKey", productVO.getMtIntegrateKey());		
//			model.put("parmMtSbCtYn", productVO.getParmMtSbCtYn()); //백계약여부.
			
			model.put("parmMtSbCtYn", basicContractInfo.getMtSbCtYn()); //백계약여부.
			model.put("mtContFromDate", basicContractInfo.getMtStartDt()); //유지보수 계약 시작일자.
			model.put("mtContEndDate", basicContractInfo.getMtEndDt()); //유지보수 계약 종료일자.
			model.put("basicContractInfo", basicContractInfo); //유지보수 계약 종료일자.
			model.put("mtProductList", mtProductList);
			model.put("mtContractCountInfo", mtContractCountInfo);
			model.put("displayUtil", new CepDisplayUtil());
			model.put("listCount", listCount);
//			model.put("mtIntegrateKey", "MA200024");	
//			model.put("parmMtSbCtYn", "Y"); //백계약여부.
			
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
		}
		
		return "maintenance/contract/write/productInfo";
	}
	
	/**
	 * 
	  * @Method Name : writeProductInfo
	  * @Cdate       : 2020. 12. 3.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 제품정보를 등록, 수정.
	  * @param request
	  * @param mtContractVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/productInfo.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Map<String, Object> writeProductInfo(HttpServletRequest request, @RequestBody MtContractProductVO productVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
//		MtSaleAmountListVO mtSalesAmountListVO = null;
		try {			
			logger.debug("mtIntegrateKey===>"+productVO.getMtIntegrateKey());
			logger.debug("parmMtSbCtYn===>"+productVO.getParmMtSbCtYn());
			
			logger.debug("size=>"+productVO.getMtContractProductVoList().size());
			logger.debug("rowNum=>"+productVO.getRowNum());
			logger.debug("getUpdateYn=>"+productVO.getUpdateYn());
//			for (int i = 0; i < productVO.getMtContractProductVoList().size(); i++) {
//				logger.debug("getMtPmFkKey ===>"+productVO.getMtContractProductVoList().get(i).getMtPmFkKey());
//			}
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			productVO.setRegEmpKey(sessionMap.get("empKey"));
			productVO.setModEmpKey(sessionMap.get("empKey"));
			service.writeMtContractProductList(productVO);
			
			
//			//매출정보를 자동생성한다.
//			mtSalesAmountListVO = new MtSaleAmountListVO();
//			mtSalesAmountListVO.setMtIntegrateKey(productVO.getMtIntegrateKey());
//			mtSalesAmountListVO.setRegEmpKey(sessionMap.get("empKey"));
//			mtSalesAmountListVO.setModEmpKey(sessionMap.get("empKey"));
			
			
			returnMap.put("mtIntegrateKey", productVO.getMtIntegrateKey());
			returnMap.put("parmMtSbCtYn", productVO.getParmMtSbCtYn()); //백계약여부.
			returnMap.put("updateYn", "N");
			returnMap.put("successYN", "Y");
		} catch (Exception e) {
			logger.error("",e);
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	/**
	 * 
	  * @Method Name : selectMtDetailProductInfo
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품정보 상세
	  * @param mtContractVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/detail/productInfo.do")
//	public String selectMtDetailProductInfo(@ModelAttribute("searchVO") MtContractVO mtContractVO, ModelMap model) throws Exception {
	public String selectMtDetailProductInfo(MtContractVO mtContractVO, ModelMap model) throws Exception {
		List<?> empList = null;
		List <?> acDirectorList = null; // 고객사 담당자 리스트.
		Map<String, Object> mtContractCountInfo = null; // 유지보수계약 단계별 등록 갯수 조회.
		MtContractVO basicContractInfo = null;
		
		
		List<?> productList = null;
		MtDefaultVO searchVO = null;
		int mtPmTotalAmount = 0;
		
		//첨부파일 관련
		FileVO fileVO = new FileVO();
		List<?> fileResult = null;
		try {
			logger.debug("mtContractVO.getSelectKey()====>"+mtContractVO.getSelectKey());
			if("".equals(CepStringUtil.getDefaultValue(mtContractVO.getMtIntegrateKey(), "")) && 
					!"".equals(CepStringUtil.getDefaultValue(mtContractVO.getSelectKey(), ""))) {
				mtContractVO.setMtIntegrateKey(mtContractVO.getSelectKey());
			}
			
			//기본정보 조회
			//basicContractInfo = service.selectContractBasicDetail(mtContractVO.getSelectKey());
			basicContractInfo = service.selectContractBasicDetail(mtContractVO.getMtIntegrateKey());
			if(null != basicContractInfo) {
				searchVO = new MtDefaultVO();
				searchVO.setSelectIntegrateKey(mtContractVO.getMtIntegrateKey());
				//제품정보 조회
				productList = service.selectMtContractProductList(searchVO);
				
				//직원정보 조회
				empList = service.selectEmployeeList();
				// 거래처 직원정보 조회
				acDirectorList = service.selectAcDirectorList(basicContractInfo.getMtAcKey());
				
				mtContractCountInfo = service.selectMtContractCount(mtContractVO.getMtIntegrateKey());
				
				mtPmTotalAmount = service.selectMtPmTotalAmount(mtContractVO.getMtIntegrateKey());
				
				//첨부파일
				fileVO.setFileCtKey(mtContractVO.getMtIntegrateKey());
				fileVO.setFileWorkClass("mtContract");
				
				fileResult = fileMngService.selectFileList(fileVO);
			}
			

			
			model.put("basicContractInfo", basicContractInfo);
			model.put("acDirectorList", acDirectorList);
			model.put("parmMtSbCtYn", basicContractInfo.getMtSbCtYn()); //백계약여부.
			model.put("empList", empList);
			
			model.put("mtContractCountInfo", mtContractCountInfo);
			model.put("productList", productList);
			model.put("mtPmTotalAmount", mtPmTotalAmount);
			
			model.put("displayUtil", new CepDisplayUtil());
			
			//첨부파일 관련
			model.addAttribute("fileList", fileResult);
		} catch (Exception e) {
			logger.error("selectMtDetailProductInfo error", e);
		}
		
		
		return "maintenance/contract/detail/productInfo";
	}
	
	
	@RequestMapping(value="/detail/deleteMtProduct.do", method=RequestMethod.POST)
	@ResponseBody 
	@SuppressWarnings("unchecked")
	public Map<String, String> deleteProduct(HttpServletRequest request, @RequestBody MtContractProductVO productVO) {

		HashMap<String, String> sessionMap = null;
		Map<String, String> returnMap = new HashMap<>();
		String[] deleteKeyList = null;
		try {
//			logger.debug("mtContractVO.mtAcKey())=====>"+mtContractVO.getMtAcKey());
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
//			logger.debug("mtContractVO.getCtDt(1))=====>"+mtContractVO.getCtDt());
			
//			productVO.setModEmpKey(sessionMap.get("empKey"));
			
			//logger.debug("productVO.getMtIntegrateKey()=====>"+productVO.getMtIntegrateKey()+"/"+productVO.getMtPmKey());
			
			if(!"".equals(CepStringUtil.getDefaultValue(productVO.getMtPmKey(), ""))) {
				
				deleteKeyList = new String[1];
				deleteKeyList[0] = String.valueOf(productVO.getMtPmKey());
				// 유지보수계약 관리키가 존재하므로 수정
				service.deleteMtContractProductList(sessionMap.get("empKey"), deleteKeyList);
				
				//logger.debug("deleteKeyList.length=====>"+deleteKeyList.length+" / "+deleteKeyList[0]);
				returnMap.put("successYN", "Y");
			} else {
				returnMap.put("successYN", "N");
				
			}			
			
			returnMap.put("mtIntegrateKey", productVO.getMtIntegrateKey());
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error(null, e);
		}		
		return returnMap;
	}	
	

	
	/**
	 * 
	  * @Method Name : updateProductInfo
	  * @Cdate       : 2020. 12. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품을 업데이트한다.
	  * @param request
	  * @param productVO
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/updateProductInfo.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateProductInfo(HttpServletRequest request, @RequestBody MtContractProductVO productVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		try {			
			logger.debug("mtIntegrateKey===>"+productVO.getMtIntegrateKey());
			logger.debug("parmMtSbCtYn===>"+productVO.getParmMtSbCtYn());
			
			logger.debug("size=>"+productVO.getMtContractProductVoList().size());
			for (int i = 0; i < productVO.getMtContractProductVoList().size(); i++) {
				logger.debug("getMtPmFkKey ===>"+productVO.getMtContractProductVoList().get(i).getMtPmFkKey());
			}
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			productVO.setRegEmpKey(sessionMap.get("empKey"));
			productVO.setModEmpKey(sessionMap.get("empKey"));
			returnMap.put("mtIntegrateKey", productVO.getMtIntegrateKey());
			returnMap.put("parmMtSbCtYn", productVO.getParmMtSbCtYn()); //백계약여부.
			
			returnMap.put("updateYn", "N");
			returnMap.put("successYN", "Y");
		} catch (Exception e) {
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	//==========================================================  매출 =======================================================
	
	/**
	 * 
	  * @Method Name : salesInfoDetail
	  * @Cdate       : 2021. 1. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 매출정보 상세조회
	  * @param mtSalesAmountVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/detail/salesInfo.do")
	public String salesInfoDetail(MtSalesAmountVO mtSalesAmountVO, ModelMap model) throws Exception {

		MtContractVO basicContractInfo = null;
		List<?> empList = null;
		List<?> mtSalesAmountList = null;
		List <?> acDirectorList = null; // 고객사 담당자 리스트.
		Map<String, Object> mtContractCountInfo = null; // 유지보수계약 단계별 등록 갯수 조회.
		int mtSalesTotalAmount = 0;
		
		//첨부파일 관련
		FileVO fileVO = new FileVO();
		List<?> fileResult = null;
		
		try {
			//기본정보 조회
			basicContractInfo = service.selectContractBasicDetail(mtSalesAmountVO.getMtIntegrateKey());
			if(null != basicContractInfo) {
				// 조회
				mtSalesAmountList = service.selectMtContractSalesAmountList(mtSalesAmountVO.getMtIntegrateKey());
				//직원정보 조회
				empList = service.selectEmployeeList();
				// 거래처 직원정보 조회
				acDirectorList = service.selectAcDirectorList(basicContractInfo.getMtAcKey());
				
				mtContractCountInfo = service.selectMtContractCount(mtSalesAmountVO.getMtIntegrateKey());
				
				//매출 총 금액
				mtSalesTotalAmount = service.selectMtSalesTotalAmount(mtSalesAmountVO.getMtIntegrateKey());
				
				//첨부파일
				fileVO.setFileCtKey(mtSalesAmountVO.getMtIntegrateKey());
				fileVO.setFileWorkClass("mtContract");
				
				fileResult = fileMngService.selectFileList(fileVO);
			}
			

			
			model.put("basicContractInfo", basicContractInfo);
			model.put("acDirectorList", acDirectorList);
			model.put("parmMtSbCtYn", basicContractInfo.getMtSbCtYn()); //백계약여부.
			model.put("mtContractCountInfo", mtContractCountInfo);	
			model.put("empList", empList);
			
			model.put("mtSalesAmountList", mtSalesAmountList);		
			model.put("mtSalesTotalAmount", mtSalesTotalAmount);	
			
			model.put("displayUtil", new CepDisplayUtil());
			
			//첨부파일 관련
			model.addAttribute("fileList", fileResult);
			
		} catch (Exception e) {
			
			logger.error("error", e);
		}
		
		return "maintenance/contract/detail/salesInfo";
	}
	
	/**
	 * 
	  * @Method Name : deleteSalesAmountYear
	  * @Cdate       : 2021. 1. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 매출정보 상세조회에서 매출년도 삭제.
	  * @param request
	  * @param productVO
	  * @return
	 */
	@RequestMapping(value="/detail/deleteSalesAmountYear.do", method=RequestMethod.POST)
	@ResponseBody 
	@SuppressWarnings("unchecked")
	public Map<String, String> deleteSalesAmountYear(HttpServletRequest request, @RequestBody MtSalesAmountVO mtSalesAmountVO) {

		HashMap<String, String> sessionMap = null;
		Map<String, String> returnMap = new HashMap<>();
		String[] deleteKeyList = null;
		try {
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtSalesAmountVO.getMtSalesKey(), ""))) {
				
				deleteKeyList = new String[1];
				deleteKeyList[0] = String.valueOf(mtSalesAmountVO.getMtSalesKey());
				
				service.deleteMtContractSalesAmountList(sessionMap.get("empKey"), mtSalesAmountVO.getMtIntegrateKey(), deleteKeyList);
				
				returnMap.put("successYN", "Y");
			} else {
				returnMap.put("successYN", "N");
				
			}			
			
			returnMap.put("mtIntegrateKey", mtSalesAmountVO.getMtIntegrateKey());
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error(null, e);
		}		
		return returnMap;
	}	
	
	/**
	 * 
	  * @Method Name : writeMtSalesInfo
	  * @Cdate       : 2020. 11. 25.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 매출정보 입력하는 화면으로 이동.
	  * @param request
	  * @param mtContractVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/salesInfoView.do")
	public String writeMtSalesInfoView(HttpServletRequest request, MtSalesAmountVO mtSalesAmountVO, ModelMap model) throws Exception {
		 Map<String, Object> contractAmountInfo = null;
		 List<?> mtSalesAmountList = null;
		 int listCount = 0;
		 int mtSalesTotalAmount = 0;
		 Map<String, Object> mtContractCountInfo = null; // 유지보수계약 단계별 등록 갯수 조회.
		 
		try {		
			
//			if("".equals(CepStringUtil.getDefaultValue(mtSalesAmountVO.getMtIntegrateKey(), ""))){
//				//테스트
//				mtSalesAmountVO.setMtIntegrateKey("MA200024");
//				mtSalesAmountVO.setParmMtSbCtYn("Y");
//			}
			
			
			logger.debug("mtIntegrateKey===>"+mtSalesAmountVO.getMtIntegrateKey());
			logger.debug("parmMtSbCtYn===>"+mtSalesAmountVO.getParmMtSbCtYn());
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtSalesAmountVO.getMtIntegrateKey(), ""))) {
				contractAmountInfo = service.selectContractAmountInfo(mtSalesAmountVO.getMtIntegrateKey());
				
				mtSalesAmountList = service.selectMtContractSalesAmountList(mtSalesAmountVO.getMtIntegrateKey());
				if(null !=mtSalesAmountList && mtSalesAmountList.size()>0) {
					listCount = mtSalesAmountList.size();					
					//매출 총 금액
					mtSalesTotalAmount = service.selectMtSalesTotalAmount(mtSalesAmountVO.getMtIntegrateKey());
				}
				mtContractCountInfo = service.selectMtContractCount(mtSalesAmountVO.getMtIntegrateKey());
			}
						
			
//			model.put("updateYn", mtSalesAmountVO.getUpdateYn());	
//			model.put("mtIntegrateKey", mtSalesAmountVO.getMtIntegrateKey());		
//			model.put("yearList", CepDateUtil.makeYear(-5, 5));	
//			model.put("nowYear", CepDateUtil.getToday("yyyy"));
			model.put("mtIntegrateKey", mtSalesAmountVO.getMtIntegrateKey());	
			model.put("parmMtSbCtYn", mtSalesAmountVO.getParmMtSbCtYn()); //백계약여부.
			model.put("contractAmountInfo",contractAmountInfo);
			model.put("mtSalesAmountList",mtSalesAmountList);
			model.put("mtContractCountInfo", mtContractCountInfo);
			model.put("mtSalesTotalAmount",mtSalesTotalAmount);
			
			
			model.put("displayUtil", new CepDisplayUtil());
			model.put("listCount", listCount);
			model.put("successYN", "Y");
			
		} catch (Exception e) {
			logger.error("",e);
			model.put("successYN", "N");
		}
		
		return "maintenance/contract/write/salesInfo";
	}	
	
	/**
	 * 
	  * @Method Name : writeMtSalesInfo
	  * @Cdate       : 2020. 12. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 매출정보 등록, 수정
	  * @param request
	  * @param deleteKeys
	  * @param mtSalesAmountVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/salesInfo.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
//	public Map<String, String> writeMtSalesInfo(HttpServletRequest request, @RequestParam("deleteKeys") String deleteKeys, @RequestBody MtSalesAmountVO mtSalesAmountVO, ModelMap model) throws Exception {
	public Map<String, String> writeMtSalesInfo(HttpServletRequest request, @RequestBody MtSaleAmountListVO mtSalesAmountVO, ModelMap model) throws Exception {	
		HashMap<String, String> sessionMap = null;
		Map<String, String> returnMap = null;
//		String mtIntegrateKey = null;
		try {
			logger.debug("deleteKeys================>"+mtSalesAmountVO.getDeleteListKeys());
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mtSalesAmountVO.setRegEmpKey(sessionMap.get("empKey"));
			mtSalesAmountVO.setModEmpKey(sessionMap.get("empKey"));
			
			//매출정보를 등록한다.
			service.writeMtContractSalesAmountList(mtSalesAmountVO);
			
			returnMap = new HashMap<>();
			returnMap.put("parmMtSbCtYn", mtSalesAmountVO.getParmMtSbCtYn()); //백계약여부.
			returnMap.put("mtIntegrateKey", mtSalesAmountVO.getMtIntegrateKey());
//			logger.debug("mtIntegrateKey===>"+mtIntegrateKey);
//			returnMap.put("updateYn", "N");
			returnMap.put("successYN", "Y");
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error(null, e);
		}		
		return returnMap;
	}	
	
	
	//=============================================== 백계약 =============================================
	/**
	 * 
	  * @Method Name : backOrderDetail
	  * @Cdate       : 2021. 1. 8.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 백계약 상세조회
	  *                       1. 유지보수계약 기본정보 조회
	  *                       2. 백계약 거래처 목록 조회
	  *                       3. 백계약 첫번째 거래처 첫번째 백계약 조회
	  * @param mtBackOrderVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/detail/backOrderInfo.do")
	public String backOrderDetail(MtBackOrderVO mtBackOrderVO, ModelMap model) throws Exception {
		
		//기본정보 관련 
		List <?> acDirectorList = null; // 고객사 담당자 리스트.
		List<?> empList = null;
		Map<String, Object> mtContractCountInfo = null; // 유지보수계약 단계별 등록 갯수 조회.
		MtContractVO basicContractInfo = null;
		
		List<MtBackOrderVO> backOrderList = null;
		List<MtBackOrderProductVO> backOrderProductList = null;		
		String selectMtOrderAcKeyNm = null;
		int backOrderListCnt = 0;
		MtBackOrderVO vo = null;
		
		//첨부파일 관련
		FileVO fileVO = new FileVO();
		List<?> fileResult = null;
		try {
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtBackOrderVO.getMtIntegrateKey(), ""))) {
				//기본정보 조회
				basicContractInfo = service.selectContractBasicDetail(mtBackOrderVO.getMtIntegrateKey());
				
				if(null !=basicContractInfo) {
					// 백계약 거래처 정보 조회
					backOrderList = service.selectBackOrderList(mtBackOrderVO.getMtIntegrateKey());
					
					
					if(null != backOrderList && backOrderList.size()>0) {
						backOrderListCnt = backOrderList.size();
						if("".equals(CepStringUtil.getDefaultValue(mtBackOrderVO.getSelectKey(), ""))) {
							/*
							 * 선택한 거래처의 백계약 품목 조회
							 * getSelectKey : backorder key (mtOrderKey)
							 */
//							backOrderProductList = service.selectBackOrderProductList(mtBackOrderVO.getSelectKey());
							//선택되지 않은경우 초기 상세화면을 콜한경우 첫번째값을 선택.
							mtBackOrderVO.setSelectKey(backOrderList.get(0).getMtOrderKey());
							selectMtOrderAcKeyNm = backOrderList.get(0).getMtOrderAcKeyNm();
						}
						/*
						 * 선택한 거래처의 백계약 품목 조회
						 * getSelectKey : backorder key (mtOrderKey)
						 */
						backOrderProductList = service.selectBackOrderProductList(mtBackOrderVO.getSelectKey());
						
//						for (int i = 0; i < backOrderListCnt; i++) {
//							vo = backOrderList.get(i);
//							if(mtBackOrderVO.getSelectKey()==vo.getMtOrderKey()){
//								selectMtOrderAcKeyNm = vo.getMtOrderAcKeyNm();
//							}
//						}
						
					}
					
					
					//직원정보 조회
					empList = service.selectEmployeeList();
					// 거래처 직원정보 조회
					acDirectorList = service.selectAcDirectorList(basicContractInfo.getMtAcKey());
					
					mtContractCountInfo = service.selectMtContractCount(mtBackOrderVO.getMtIntegrateKey());
					
					//첨부파일
					fileVO.setFileCtKey(mtBackOrderVO.getMtIntegrateKey());
					fileVO.setFileWorkClass("mtContract");
					
					fileResult = fileMngService.selectFileList(fileVO);
					
				}
			}
			
			model.put("basicContractInfo", basicContractInfo);
			model.put("acDirectorList", acDirectorList);
			model.put("parmMtSbCtYn", basicContractInfo.getMtSbCtYn()); //백계약여부.
			model.put("mtContractCountInfo", mtContractCountInfo);
			model.put("empList", empList);
			
			model.put("selectMtOrderAcKeyNm", selectMtOrderAcKeyNm);
			model.put("backOrderList", backOrderList);
			model.put("selectKey", mtBackOrderVO.getSelectKey());			
			model.put("backOrderProductList", backOrderProductList);			
			model.put("displayUtil", new CepDisplayUtil());
//			model.put("empList", empList);
			
			//첨부파일 관련
			model.addAttribute("fileList", fileResult);
		} catch (Exception e) {
			
			logger.error("backOrderDetail error", e);
		}
		
		return "maintenance/contract/detail/backOrderInfo";
	}
	
	@ResponseBody
	@RequestMapping(value="/detail/selectBackOrderProductList.do", method=RequestMethod.POST)
	public Map<String, Object>  selectBackOrderProductList( @RequestBody String mtOrderKey) throws Exception {

		List<MtBackOrderProductVO> backOrderProductList = null;	
		Map<String, Object> returnMap = new HashMap<String, Object>();
	     try {
	    	 
	    	 logger.debug("mtOrderKey=======>"+mtOrderKey);
	    	 if(!"".equals(CepStringUtil.getDefaultValue(mtOrderKey, ""))) {
	    		 returnMap = new HashMap<String, Object>();
	    	     
		         backOrderProductList = service.selectBackOrderProductList(mtOrderKey);
		         
		         logger.debug("productList.size=====>"+backOrderProductList.size());
		//         modelAndView.setViewName("jsonView");
		         returnMap.put("productList", backOrderProductList);
		         returnMap.put("successYN", "Y");
	    	 } else {
	    		 returnMap.put("successYN", "N");
	    	 }
	    	
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error("selectBackOrderProductList error", e);
		}
	    
	     return returnMap; 
	}
	
	/**
	 * 
	  * @Method Name : writeBackOrderInfoView
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 백계약 등록화면 이동
	  * @param mtContractVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/backOrderInfoView.do")
	public String writeBackOrderInfoView(MtBackOrderVO mtBackOrderVO, ModelMap model) throws Exception {

		List<EgovMap> backOrderSelectBox = null;
		EgovMap map = null;
		MtBackOrderVO returnVo = null;
		List < ? > acDirectorList = null;
//		List < ? > backOrderBoxList = null;
		int listCount = 1;
		Map<String, Object> mtContractCountInfo = null; // 유지보수계약 단계별 등록 갯수 조회.
//		MtContractVO basicContractInfo = null; //유지보수 기본정보
		try {		
			
//			model.put("toDay", CepDateUtil.getToday("yyyy-MM-dd"));
//			model.put("toDay", CepDateUtil.getToday("yyyyMMdd"));
			mtBackOrderVO.setMtOrderDt(CepDateUtil.getToday("yyyyMMdd"));
			logger.debug("mtBackOrderVO.getMtIntegrateKey()===>"+mtBackOrderVO.getMtIntegrateKey());
			logger.debug("mtBackOrderVO.getSelectKey()===>"+mtBackOrderVO.getSelectKey());
			logger.debug("mtBackOrderVO.getBtnOption()===>"+mtBackOrderVO.getBtnOption());
//			if("".equals(CepStringUtil.getDefaultValue(mtBackOrderVO.getMtIntegrateKey(), ""))){
//				mtBackOrderVO.setMtIntegrateKey("MA200024");//파라메터로 받아서 처리하는것으로 추후 바꿔야함.
//			}
//			if("".equals(CepStringUtil.getDefaultValue(mtBackOrderVO.getSelectKey(), ""))){
//				mtBackOrderVO.setSelectKey("MB200002");//파라메터로 받아서 처리하는것으로 추후 바꿔야함.
//			}
//			mtBackOrderVO.setUpdateYn("N");//파라메터로 받아서 처리하는것으로 추후 바꿔야함.			
			
			//기본정보 조회
//			basicContractInfo = service.selectContractBasicDetail(mtBackOrderVO.getMtIntegrateKey());
//			
//			if(null != basicContractInfo) {
//				mtContractCountInfo = service.selectMtContractCount(mtBackOrderVO.getMtIntegrateKey());
////				logger.debug("mtContractCountInfo.mtSalesAmountCnt==>"+mtContractCountInfo.get("mtSalesAmountCnt"));
//				//백계약 등록  거래처 목록을 가져온다.
//				backOrderSelectBox = service.selectBackOrderSelectBoxList(mtBackOrderVO.getMtIntegrateKey());			
//				if(null !=backOrderSelectBox && backOrderSelectBox.size()>0){
//					mtBackOrderVO.setMtSaveCnt(backOrderSelectBox.size());
//					if("newOrder".equals(CepStringUtil.getDefaultValue(mtBackOrderVO.getBtnOption(), ""))){
//						//신규저장
//						returnVo = mtBackOrderVO;
//					} else {
//						//백계약 정보를 조회한다.
//						if(!"".equals(CepStringUtil.getDefaultValue(mtBackOrderVO.getSelectKey(), ""))){
//							returnVo = service.selectBackOrderDetail(mtBackOrderVO.getSelectKey());
//							
//						} else {
//							map = backOrderSelectBox.get(0);
//							returnVo = service.selectBackOrderDetail((String)map.get("mtOrderKey"));
//							mtBackOrderVO.setSelectKey((String)map.get("mtOrderKey"));
//						}
//						if(null != returnVo){
////							returnVo.setUpdateYn(mtBackOrderVO.getUpdateYn());
//							returnVo.setSelectKey(mtBackOrderVO.getSelectKey());
//							returnVo.setMtSaveCnt(mtBackOrderVO.getMtSaveCnt());
//							if(null !=returnVo.getMtBackOrderProductVoList() && returnVo.getMtBackOrderProductVoList().size()>1){
//								listCount = returnVo.getMtBackOrderProductVoList().size();
//							}
//							acDirectorList =service.selectAcDirectorList(returnVo.getMtOrderAcKey());
//							
////							backOrderBoxList = service.selectBackOrderSelectBoxList(returnVo.getMtIntegrateKey());
//							
//						}
//					}
////					mtBackOrderVO.setMtSaveCnt(backOrderSelectBox.size());//파라메터로 받아서 처리하는것으로 추후 바꿔야함.
//					
//				} else {
//					returnVo = mtBackOrderVO;
//				}
//			}
			
			
			//백계약 정보를 조회한다.
//			if(!"".equals(CepStringUtil.getDefaultValue(mtBackOrderVO.getSelectKey(), ""))){
//				returnVo = service. selectBackOrderDetail(mtBackOrderVO.getSelectKey());
//				if(null != returnVo){
//					returnVo.setUpdateYn(mtBackOrderVO.getUpdateYn());
//					returnVo.setSelectKey(mtBackOrderVO.getSelectKey());
//					returnVo.setMtSaveCnt(mtBackOrderVO.getMtSaveCnt());
//					if(null !=returnVo.getMtBackOrderProductVoList() && returnVo.getMtBackOrderProductVoList().size()>1){
//						listCount = returnVo.getMtBackOrderProductVoList().size();
//					}
//					acDirectorList =service.selectAcDirectorList(returnVo.getMtOrderAcKey());
//					
////					backOrderBoxList = service.selectBackOrderSelectBoxList(returnVo.getMtIntegrateKey());
//					
//				}
//			} else {
//				returnVo = mtBackOrderVO;
//			}
			
			mtContractCountInfo = service.selectMtContractCount(mtBackOrderVO.getMtIntegrateKey());
//			logger.debug("mtContractCountInfo.mtSalesAmountCnt==>"+mtContractCountInfo.get("mtSalesAmountCnt"));
			//백계약 등록  거래처 목록을 가져온다.
			backOrderSelectBox = service.selectBackOrderSelectBoxList(mtBackOrderVO.getMtIntegrateKey());			
			if(null !=backOrderSelectBox && backOrderSelectBox.size()>0){
				mtBackOrderVO.setMtSaveCnt(backOrderSelectBox.size());
				if("newOrder".equals(CepStringUtil.getDefaultValue(mtBackOrderVO.getBtnOption(), ""))){
					//신규저장
					returnVo = mtBackOrderVO;
				} else {
					//백계약 정보를 조회한다.
					if(!"".equals(CepStringUtil.getDefaultValue(mtBackOrderVO.getSelectKey(), ""))){
						returnVo = service.selectBackOrderDetail(mtBackOrderVO.getSelectKey());
						
					} else {
						map = backOrderSelectBox.get(0);
						returnVo = service.selectBackOrderDetail((String)map.get("mtOrderKey"));
						mtBackOrderVO.setSelectKey((String)map.get("mtOrderKey"));
					}
					if(null != returnVo){
//						returnVo.setUpdateYn(mtBackOrderVO.getUpdateYn());
						returnVo.setSelectKey(mtBackOrderVO.getSelectKey());
						returnVo.setMtSaveCnt(mtBackOrderVO.getMtSaveCnt());
						if(null !=returnVo.getMtBackOrderProductVoList() && returnVo.getMtBackOrderProductVoList().size()>1){
							listCount = returnVo.getMtBackOrderProductVoList().size();
						}
						acDirectorList =service.selectAcDirectorList(returnVo.getMtOrderAcKey());
						
//						backOrderBoxList = service.selectBackOrderSelectBoxList(returnVo.getMtIntegrateKey());
						
					}
				}
//				mtBackOrderVO.setMtSaveCnt(backOrderSelectBox.size());//파라메터로 받아서 처리하는것으로 추후 바꿔야함.
				
			} else {
				returnVo = mtBackOrderVO;
			}
			
			logger.debug("mtBackOrderVO.getMtOrderAcKeyNm()====>"+returnVo.getMtOrderAcKeyNm());
//			logger.debug("backOrderSelectBox.size()====>"+backOrderSelectBox.size());
//			logger.debug("getMtBackOrderProductVoList.size()====>"+returnVo.getMtBackOrderProductVoList().size());
			
			model.put("backOrderBoxList", backOrderSelectBox);
			model.put("mtBackOrderVO", returnVo);
			model.put("listCount", listCount);
			model.put("mtContractCountInfo", mtContractCountInfo);

//			model.put("mtContFromDate", basicContractInfo.getMtStartDt()); //유지보수 계약 시작일자.
//			model.put("mtContEndDate", basicContractInfo.getMtEndDt()); //유지보수 계약 종료일자.
			
			model.put("displayUtil", new CepDisplayUtil());
			model.put("acDirectorList", acDirectorList);
//			model.put("backOrderBoxList", backOrderBoxList);
//			model.put("backOrderBoxList", null);
		} catch (Exception e) {
			logger.error("writeBackOrderInfoView error", e);
		}
		
		return "maintenance/contract/write/backOrderInfo";
	}
	
	/**
	 * 
	  * @Method Name : writeBackOrderInfo
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 백계약 등록
	  * @param mtContractVO
	  * @param request
	 */
	@RequestMapping(value="/write/backOrderInfo.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Map<String, Object> writeBackOrderInfo(HttpServletRequest request, @RequestBody MtBackOrderVO mtBackOrderVO, ModelMap model) {

		HashMap<String, String> sessionMap = null;
		Map<String, Object> returnMap = new HashMap<>();
		MtBackOrderProductVO checkVo = null;
		
		String mtOrderKey = null;
		try {
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mtBackOrderVO.setRegEmpKey(sessionMap.get("empKey"));
			mtBackOrderVO.setModEmpKey(sessionMap.get("empKey"));
			logger.debug("mtBackOrderVO.getMtIntegrateKey()=====>"+mtBackOrderVO.getMtIntegrateKey());
			logger.debug("mtBackOrderVO.getMtBackOrderProductVoList().size()=====>"+mtBackOrderVO.getMtBackOrderProductVoList().size());
			
//			if(null != mtBackOrderVO.getMtBackOrderProductVoList() && mtBackOrderVO.getMtBackOrderProductVoList().size()>0) {
//				logger.debug("=======================================================================================>");
//				for (int i = 0; i < mtBackOrderVO.getMtBackOrderProductVoList().size(); i++) {
//					checkVo = mtBackOrderVO.getMtBackOrderProductVoList().get(i);
//					logger.debug("checkVo.getMtPmKey()=====>"+checkVo.getMtPmKey());
//					logger.debug("checkVo.getMtOrderPmQuantity()=====>"+checkVo.getMtOrderPmQuantity());
//					logger.debug("checkVo.getMtOrderPmUprice()=====>"+checkVo.getMtOrderPmUprice());
//					logger.debug("checkVo.getMtStartDt()=====>"+checkVo.getMtStartDt());
//					logger.debug("checkVo.getMtEndDt()=====>"+checkVo.getMtEndDt());
//					logger.debug("=======================================================================================>");
//				}
//			}
			
			//update list 수집
			
			
			mtOrderKey = service.writeContractBackOrder(mtBackOrderVO);
//			returnMap.put("updateYn", "N");
//			returnMap.put("mtBackOrderVO", mtBackOrderVO);
			returnMap.put("successYN", "Y");
			returnMap.put("mtOrderKey", mtOrderKey);
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error(null, e);
		}
//		logger.debug("writeMtBasicInfo=====");
//		logger.debug("mtContractVO.getMtNm()====="+mtContractVO.getMtNm());
//		List<?> empList = null;
//		try {
//			empList = service.selectEmployeeList();
//			model.put("empList", empList);
//		} catch (Exception e) {
//			model.put("resultCode", "FAIL");
//			logger.error("addBasicInfo error", e);
//		}
		
		return returnMap;
	}
	
	
	
	/**
	 * 
	  * @Method Name : deleteBackOrderAll
	  * @Cdate       : 2020. 12. 21.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 해당 거래처의 백계약 정보를 삭제한다.
	  * @param mtBackOrderVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/delete/backOrder.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Map<String, Object> deleteBackOrder(HttpServletRequest request, @RequestBody MtBackOrderVO mtBackOrderVO) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		try {		
			
//			model.put("toDay", CepDateUtil.getToday("yyyy-MM-dd"));
//			model.put("toDay", CepDateUtil.getToday("yyyyMMdd"));
			mtBackOrderVO.setMtOrderDt(CepDateUtil.getToday("yyyyMMdd"));
			logger.debug("mtBackOrderVO.getMtIntegrateKey()===>"+mtBackOrderVO.getMtIntegrateKey());
			logger.debug("mtBackOrderVO.getSelectKey()===>"+mtBackOrderVO.getSelectKey());
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			service.deleteBackOrder(sessionMap.get("empKey"), mtBackOrderVO.getSelectKey(), mtBackOrderVO.getMtIntegrateKey());
			
			returnMap.put("mtIntegrateKey", mtBackOrderVO.getMtIntegrateKey());
			returnMap.put("successYN", "Y");
			
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error("error", e);
		}
		
		return returnMap;
	}
	
	
	//============================================== 매입정보 ====================================================
	
	/**
	 * 
	  * @Method Name : writePurchaseAmountView
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 매입정보 등록화면 이동
	  * @param mtContractVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/purchaseAmountView.do")
	public String writePurchaseAmountView(MtBuyAmountListVO mtBuyAmountListVO, ModelMap model) throws Exception {
		List<EgovMap> backOrderSelectBox = null;
		Map<String, Object> buyAmountRefer = null;
		List<?> purchaseAmountList = null;
		EgovMap map = null;
		String mtOrderKey = null;
		int listCount = 1;
		int purchaseAmountSize = 0;
//		Map<String, Object> mtContractCountInfo = null; // 유지보수계약 단계별 등록 갯수 조회.
		try {			
			//테스트를 위해서.
//			if("".equals(CepStringUtil.getDefaultValue(mtBuyAmountListVO.getMtIntegrateKey(), ""))){
//				mtBuyAmountListVO.setMtIntegrateKey("MA200024");//파라메터로 받아서 처리하는것으로 추후 바꿔야함.
//			}
			
			///////////////////////////////////////////////////////////////////////////////////
			
			
			//1. 매입 대상 거래처 목록을 가져온다.
			backOrderSelectBox = service.selectBackOrderSelectBoxList(mtBuyAmountListVO.getMtIntegrateKey());
			if(null !=backOrderSelectBox && backOrderSelectBox.size()>0) {
				if(!"".equals(CepStringUtil.getDefaultValue(mtBuyAmountListVO.getMtOrderKey(), ""))){
					// 매입정보 팝업에서 거래처를 선택한경우.
					mtOrderKey = mtBuyAmountListVO.getMtOrderKey();
				} else {
					//매입정보 팝업을 처음 호출한 경우
					map =backOrderSelectBox.get(0);
					mtOrderKey = (String)map.get("mtOrderKey");
				}
				
				
				//2. 첫번째  거래처의 상단 매입정보를 가져온다.
				buyAmountRefer = service.selectMtBuyAmountRefer(mtBuyAmountListVO.getMtIntegrateKey(), mtOrderKey);
				
				//3. 첫번째 매입처의 년도별 매입정보 목록을 가져온다.
				purchaseAmountList = service.selectMtContractBuyAmountList(mtBuyAmountListVO.getMtIntegrateKey(), mtOrderKey);
								
				if(null !=purchaseAmountList) {
					purchaseAmountSize = purchaseAmountList.size();
					if(purchaseAmountList.size()>1) {
						listCount = purchaseAmountList.size();
					}
				}				
			}

			model.put("backOrderSelectBox", backOrderSelectBox);
			model.put("buyAmountRefer", buyAmountRefer);
			model.put("purchaseAmountList", purchaseAmountList);
			model.put("purchaseInitCnt", purchaseAmountSize);
			model.put("listCount", listCount);
			model.put("mtOrderKey", mtOrderKey);
			model.put("mtIntegrateKey", mtBuyAmountListVO.getMtIntegrateKey());
			model.put("displayUtil", new CepDisplayUtil());
		} catch (Exception e) {
			logger.error("writePurchaseAmountView error", e);
		}
		
		return "maintenance/contract/write/purchaseAmountInfo";
	}
	
	/**
	 * 
	  * @Method Name : writePurchaseAmount
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 매입정보 등록
	  * @param mtContractVO
	  * @param request
	 */
	@RequestMapping(value="/write/purchaseAmount.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Map<String, Object> writePurchaseAmount(HttpServletRequest request, @RequestBody MtBuyAmountListVO mtBuyAmountListVO, ModelMap model) {

		HashMap<String, String> sessionMap = null;
		Map<String, Object> returnMap = new HashMap<>();
		try {
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			mtBuyAmountListVO.setRegEmpKey(sessionMap.get("empKey"));
			mtBuyAmountListVO.setModEmpKey(sessionMap.get("empKey"));
			
			if(mtBuyAmountListVO.getPurchaseInitCnt()>0){
				//update 
				service.updateMtContractBuyAmountList(mtBuyAmountListVO);
			} else {
				//신규등록
				service.writeMtContractBuyAmountList(mtBuyAmountListVO);
			}
			
			returnMap.put("successYN", "Y");
			returnMap.put("mtOrderKey", mtBuyAmountListVO.getMtOrderKey());
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error(null, e);
		}
		return returnMap;
	}

	/**
	 * 
	  * @Method Name : mtPurchaseAmountDetail
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 매입정보 상세
	  * @param mtContractVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/detail/purchaseAmountInfo.do")
	public String mtPurchaseAmountDetail(MtBuyAmountVO mtBuyAmountVO, ModelMap model) throws Exception {
		
		//기본정보 관련 
		List <?> acDirectorList = null; // 고객사 담당자 리스트.
		List<?> empList = null;
		Map<String, Object> mtContractCountInfo = null; // 유지보수계약 단계별 등록 갯수 조회.
		MtContractVO basicContractInfo = null;
		
		//매입정보
		List<?> purchaseAmountList = null;
		List<EgovMap> backOrderSelectBox = null;

		EgovMap map = null;
		String mtOrderKey = null;

		int mtPurchaseTotalAmount = 0;
		
		//첨부파일 관련
		FileVO fileVO = new FileVO();
		List<?> fileResult = null;
		try {
			logger.debug("mtBuyAmountVO.getMtIntegrateKey()===>"+mtBuyAmountVO.getMtIntegrateKey());
			//기본정보 조회
			basicContractInfo = service.selectContractBasicDetail(mtBuyAmountVO.getMtIntegrateKey());
			
			if(null !=basicContractInfo) {
				backOrderSelectBox = service.selectBackOrderSelectBoxList(mtBuyAmountVO.getMtIntegrateKey());
				if(null !=backOrderSelectBox && backOrderSelectBox.size()>0) {
//					if(!"".equals(CepStringUtil.getDefaultValue(mtBuyAmountVO.getMtOrderKey(), ""))){
//						mtOrderKey = mtBuyAmountVO.getMtOrderKey();
//					} else {
//						//매입정보 팝업을 처음 호출한 경우
//						map =backOrderSelectBox.get(0);
//						mtOrderKey = (String)map.get("mtOrderKey");
//					}
					//매입금액 리스트  조회
					purchaseAmountList = service.selectMtContractBuyAmountList(mtBuyAmountVO.getMtIntegrateKey(), mtBuyAmountVO.getMtOrderKey());
					
					if(null != purchaseAmountList && purchaseAmountList.size()>0) {
						//매입금액 총액 조회.
						mtPurchaseTotalAmount = service.selectMtBuyTotalAmount(mtBuyAmountVO.getMtIntegrateKey(), mtBuyAmountVO.getMtOrderKey());
					}
				}		
				
				//첨부파일
				fileVO.setFileCtKey(mtBuyAmountVO.getMtIntegrateKey());
				fileVO.setFileWorkClass("mtContract");
				
				fileResult = fileMngService.selectFileList(fileVO);		
			}
			
			//직원정보 조회
			empList = service.selectEmployeeList();
			// 거래처 직원정보 조회
			acDirectorList = service.selectAcDirectorList(basicContractInfo.getMtAcKey());
			
			mtContractCountInfo = service.selectMtContractCount(mtBuyAmountVO.getMtIntegrateKey());
			
			model.put("basicContractInfo", basicContractInfo);
			model.put("mtContractCountInfo", mtContractCountInfo);
			model.put("parmMtSbCtYn", basicContractInfo.getMtSbCtYn()); //백계약여부.
			model.put("acDirectorList", acDirectorList);
			model.put("empList", empList);
			model.put("displayUtil", new CepDisplayUtil());
			

			model.put("selectKey", mtBuyAmountVO.getSelectKey());//매입거래처 관리키
			model.put("purchaseAmountList", purchaseAmountList);
			model.put("backOrderSelectBox", backOrderSelectBox);
			model.put("mtPurchaseTotalAmount", mtPurchaseTotalAmount);
			
			//첨부파일 관련
			model.addAttribute("fileList", fileResult);

		} catch (Exception e) {
			logger.error("purchaseAmountInfo error", e);
		}
		
		return "maintenance/contract/detail/purchaseAmountInfo";
	}
	
	@ResponseBody
	@RequestMapping(value="/detail/selectPurchaseAmountListWithOderKey.do", method=RequestMethod.POST)
	public Map<String, Object>  selectPurchaseAmountListWithOderKey( @RequestBody MtBuyAmountVO mtBuyAmountVO) throws Exception {

		List<?> purchaseAmountList = null;
		int mtPurchaseTotalAmount = 0;
		Map<String, Object> returnMap = new HashMap<String, Object>();
	     try {
	    	 logger.debug("mtOrderKey=======>"+mtBuyAmountVO.getMtIntegrateKey());
	    	 logger.debug("mtOrderKey=======>"+mtBuyAmountVO.getMtOrderKey());
	    	 if(!"".equals(CepStringUtil.getDefaultValue(mtBuyAmountVO.getMtIntegrateKey(), "")) ) {
	    		 returnMap = new HashMap<String, Object>();
	    	     
	    		 purchaseAmountList = service.selectMtContractBuyAmountList(mtBuyAmountVO.getMtIntegrateKey(), mtBuyAmountVO.getMtOrderKey());
	    		 if(null != purchaseAmountList && purchaseAmountList.size()>0) {
					//매입금액 총액 조회.
					mtPurchaseTotalAmount = service.selectMtBuyTotalAmount(mtBuyAmountVO.getMtIntegrateKey(), mtBuyAmountVO.getMtOrderKey());
	    		 }
		         
		         logger.debug("purchaseAmountList.size=====>"+purchaseAmountList.size());
		//         modelAndView.setViewName("jsonView");
		         returnMap.put("purchaseAmountList", purchaseAmountList);
		         returnMap.put("mtPurchaseTotalAmount", mtPurchaseTotalAmount);
		         returnMap.put("successYN", "Y");
	    	 } else {
	    		 returnMap.put("successYN", "N");
	    	 }
	    	
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error("selectPurchaseAmountListWithOderKey error", e);
		}
	    
	     return returnMap; 
	}
	
	@RequestMapping(value="/detail/deletePurchaseAmountYear.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Map<String, Object> deletePurchaseAmountYear(HttpServletRequest request, @RequestBody MtBuyAmountVO mtBuyAmountVO) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		String[] deleteKeyList = new String[1];
		try {		
			
			logger.debug("mtBuyAmountVO.getMtIntegrateKey()===>"+mtBuyAmountVO.getMtIntegrateKey());
			logger.debug("mtBuyAmountVO.getMtOrderKey()===>"+mtBuyAmountVO.getMtOrderKey());
			logger.debug("mtBuyAmountVO.getDeleteListKeys()===>"+mtBuyAmountVO.getDeleteListKeys());
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			if(!"".equals(CepStringUtil.getDefaultValue(mtBuyAmountVO.getMtOrderKey(), ""))
					&& !"".equals(CepStringUtil.getDefaultValue(mtBuyAmountVO.getDeleteListKeys(), ""))) {
				deleteKeyList[0] = mtBuyAmountVO.getDeleteListKeys();
				service.deleteMtContractBuyAmountList(sessionMap.get("empKey"),mtBuyAmountVO.getMtOrderKey()
						, deleteKeyList);
				
//				returnMap.put("mtIntegrateKey", mtBuyAmountVO.getMtIntegrateKey());
				returnMap.put("successYN", "Y");
			} else {
				returnMap.put("successYN", "N");
			}
			
			
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error("error", e);
		}
		
		return returnMap;
	}	
	///////////////////////////////////////////////////////////////////////////////////
	
	
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
      
//     String acKey = null;
     List < ? > acDirectorList = null;
     Map<String, Object> modelAndView = new HashMap<String, Object>();
     try {
    	 
//    	 acKey = request.getParameter("mtAcKey");
//    	 logger.debug("acKey===>"+acKey);
//    	 logger.debug("mtAcKey===>"+mtAcKey);
//    	
//    	 acKey="1098620738";
         /* Ajax List 리턴을 위해서는 ModelAndView 로 세팅해야함 */
     
         acDirectorList =service.selectAcDirectorList(mtAcKey);
         
         logger.debug("acDirectorList.size=====>"+acDirectorList.size());
//         modelAndView.setViewName("jsonView");
         modelAndView.put("acDirectorList", acDirectorList);
         modelAndView.put("successYN", "Y");
	} catch (Exception e) {
		modelAndView.put("successYN", "N");
		logger.error("selectAcDirectorList error", e);
	}

    
     return modelAndView; 
	}
	
	
	/**
	 * 
	  * @Method Name : selectForecastMappingInfo
	  * @Cdate       : 2021. 2. 18.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : Forecast 거래처 및 해당 거래처 담당자 정보 조회(Selectbox용)
	  * @param request
	  * @param response
	  * @param spKey(SP_MAIN_TB(ForecastTable key)
	  * @return
	  * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/selectForecastMappingInfo.do", method=RequestMethod.POST)
	public Map<String, Object>  selectForecastMappingInfo(HttpServletRequest request , HttpServletResponse response , @RequestBody String spKey) throws Exception {

     List < ? > acDirectorList = null;
     Map<String, Object> modelAndView = new HashMap<String, Object>();
    
     ForecastVO searchVO = null;
     ForecastVO forecastVO = null;
     try {

    	 if(!"".equals(CepStringUtil.getDefaultValue(spKey, ""))) {
    		 
    		 searchVO = new ForecastVO();
    		 searchVO.setSpKey(spKey);
    		 forecastVO = forecastService.selectForecast(searchVO);
    		 
    		 if(null != forecastVO && !"".equals(CepStringUtil.getDefaultValue(forecastVO.getAcKey(), ""))) {
    			 
    			 modelAndView.put("forecastVO", forecastVO);
    			 
    			 acDirectorList =service.selectAcDirectorList(forecastVO.getAcKey());                 
                 
                 modelAndView.put("acDirectorList", acDirectorList);
                 
                 modelAndView.put("successYN", "Y");
    		 } else {
    			 modelAndView.put("successYN", "N");
    			 logger.error("selectFocastMappingInfo :: {}", "FORCAST테이블(SP_MAIN_TB)에 "+spKey+" 관리키에 대한 거래처 정보가 존재하지 않습니다.");
    		 }
    		 
    	 } else {
    		 modelAndView.put("successYN", "N");
    		 logger.error("selectFocastMappingInfo :: {}", "FORCAST테이블(SP_MAIN_TB)에  대한 관리키 parameter가 null입니다.");
    	 }
        
	} catch (Exception e) {
		modelAndView.put("successYN", "N");
		logger.error("selectFocastMappingInfo :: {}", e);
	}

    
     return modelAndView; 
	}
	
}
