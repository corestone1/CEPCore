package com.cep.maintenance.contract.web;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.maintenance.contract.service.MtContractService;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.contract.vo.MtSalesAmountVO;
import com.cep.maintenance.contract.vo.MtContractProductVO;
import com.cep.maintenance.contract.vo.MtContractVO;
import com.cmm.util.CepDateUtil;
import com.cmm.util.StringUtil;

@Controller
@RequestMapping("/maintenance/contract")
public class MtContractController {
	private static final Logger logger = LoggerFactory.getLogger(MtContractController.class);
	@Resource(name="mtContractService")
	private MtContractService service;
	

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
		List<?> empList = null;
		String toDay = null;		
		String fromDate = null;
		Map<String, String> searchParam = null;
		try {			
			if(!"".equals(StringUtil.getDefaultValue(searchVO.getFromDate(), ""))){
				searchVO.setFromDate(searchVO.getFromDate().replace("-", ""));
			}
			
			if(!"".equals(StringUtil.getDefaultValue(searchVO.getToDate(), ""))){
				searchVO.setToDate(searchVO.getToDate().replace("-", ""));
			}
			
			if("".equals(StringUtil.getDefaultValue(searchVO.getFromDate(), "")) && "".equals(StringUtil.getDefaultValue(searchVO.getToDate(), ""))){
				toDay = CepDateUtil.getToday(null);
				/*
				 * 6개월 날짜 계산.
				 */
				fromDate = CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6);
				
				searchVO.setFromDate(fromDate);
				searchVO.setToDate(toDay);				
			}
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
			empList = service.selectEmployeeList();
			model.put("resultList", mtList);
			model.put("empList", empList);
			model.put("searchParam", searchParam);
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error("mtContractList error", e);
		}
		
		return "maintenance/contract/contractList";
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
	@RequestMapping(value="/deleteContract.do")
	public String deleteContract(@ModelAttribute("searchVO") MtDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		List<?> mtList = null;
		List<?> empList = null;
		MtContractVO deleteVo = null;
		HashMap<String, String> sessionMap = null;
		String toDay = null;		
		String fromDate = null;
		try {			
			if(!"".equals(StringUtil.getDefaultValue(searchVO.getFromDate(), ""))){
				searchVO.setFromDate(searchVO.getFromDate().replace("-", ""));
			}
			
			if(!"".equals(StringUtil.getDefaultValue(searchVO.getToDate(), ""))){
				searchVO.setToDate(searchVO.getToDate().replace("-", ""));
			}
			
			if("".equals(StringUtil.getDefaultValue(searchVO.getFromDate(), "")) && "".equals(StringUtil.getDefaultValue(searchVO.getToDate(), ""))){
				toDay = CepDateUtil.getToday(null);
				/*
				 * 6개월 날짜 계산.
				 */
				fromDate = CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6);
				
				searchVO.setFromDate(fromDate);
				searchVO.setToDate(toDay);				
			}
			
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
			
			deleteVo = new MtContractVO();
			deleteVo.setModEmpKey(sessionMap.get("empKey"));
			deleteVo.setMtIntegrateKey(searchVO.getSelectKey());
			service.deleteContract(deleteVo);
			/*logger.debug("mtList.size()=====>"+mtList.size());
			for (int i = 0; i < mtList.size(); i++) {
				MtContractVO vo = (MtContractVO)mtList.get(i);
				logger.debug("vo.getMtAcNm()===>"+vo.getMtAcNm());
			}*/
			mtList = service.selectContractList(searchVO);
			empList = service.selectEmployeeList();
			model.put("resultList", mtList);
			model.put("empList", empList);
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error("mtMainList error", e);
		}
		
		return "maintenance/contract/contractList";
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

		List<?> empList = null;
		try {			
			
			empList = service.selectEmployeeList();
			model.put("empList", empList);
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
	public Map<String, String> writeBasicInfo(HttpServletRequest request, @RequestBody MtContractVO mtContractVO) {

		HashMap<String, String> sessionMap = null;
		Map<String, String> returnMap = null;
		String mtIntegrateKey = null;
		try {
//			logger.debug("mtContractVO.mtAcKey())=====>"+mtContractVO.getMtAcKey());
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
//			logger.debug("mtContractVO.getCtDt(1))=====>"+mtContractVO.getCtDt());
			
//			mtContractVO.setMtOption("w");//등록옵션 저장.
			mtContractVO.setRegEmpKey(sessionMap.get("empKey"));

			logger.debug("mtContractVO.getDbAmount(2))=====>"+mtContractVO.getDbAmount());
			
			mtIntegrateKey = service.writeFirestContractBasic(mtContractVO);			
			
			returnMap = new HashMap<>();
			returnMap.put("updateYn", "N");
			returnMap.put("mtIntegrateKey", mtIntegrateKey);
			returnMap.put("parmMtSbCtYn", mtContractVO.getMtSbCtYn()); //백계약여부.
//			logger.debug("mtIntegrateKey===>"+mtIntegrateKey);

			returnMap.put("successYN", "Y");
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error(null, e);
		}		
		return returnMap;
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
				
		try {
						
//			model.put("mtIntegrateKey", productVO.getMtIntegrateKey());		
//			model.put("parmMtSbCtYn", productVO.getParmMtSbCtYn()); //백계약여부.
			model.put("updateYn", productVO.getUpdateYn());	
			model.put("mtIntegrateKey", "MA200024");	
			model.put("parmMtSbCtYn", "Y"); //백계약여부.
			
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
	  * @Method Description :유지보수계약 제품정보를 등록.
	  * @param request
	  * @param mtContractVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/productInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> writeProductInfo(HttpServletRequest request, @RequestBody MtContractProductVO productVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		
		try {			
			logger.debug("mtIntegrateKey===>"+productVO.getMtIntegrateKey());
			logger.debug("parmMtSbCtYn===>"+productVO.getParmMtSbCtYn());
			
			logger.debug("size=>"+productVO.getMtContractProductVoList().size());
			for (int i = 0; i < productVO.getMtContractProductVoList().size(); i++) {
				logger.debug("getMtPmFkKey ===>"+productVO.getMtContractProductVoList().get(i).getMtPmFkKey());
			}
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
			
			service.writeMtContractProductList(productVO.getMtIntegrateKey(), sessionMap.get("empKey"), productVO.getMtContractProductVoList());
			
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
	public Map<String, Object> updateProductInfo(HttpServletRequest request, @RequestBody MtContractProductVO productVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {			
			logger.debug("mtIntegrateKey===>"+productVO.getMtIntegrateKey());
			logger.debug("parmMtSbCtYn===>"+productVO.getParmMtSbCtYn());
			
			logger.debug("size=>"+productVO.getMtContractProductVoList().size());
			for (int i = 0; i < productVO.getMtContractProductVoList().size(); i++) {
				logger.debug("getMtPmFkKey ===>"+productVO.getMtContractProductVoList().get(i).getMtPmFkKey());
			}
			returnMap.put("mtIntegrateKey", productVO.getMtIntegrateKey());
			returnMap.put("parmMtSbCtYn", productVO.getParmMtSbCtYn()); //백계약여부.
			returnMap.put("successYN", "Y");
		} catch (Exception e) {
			returnMap.put("successYN", "N");
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
		
		try {			
			logger.debug("mtIntegrateKey===>"+mtSalesAmountVO.getMtIntegrateKey());
			logger.debug("parmMtSbCtYn===>"+mtSalesAmountVO.getParmMtSbCtYn());
			
			model.put("updateYn", mtSalesAmountVO.getUpdateYn());	
			model.put("mtIntegrateKey", mtSalesAmountVO.getMtIntegrateKey());			
			model.put("parmMtSbCtYn", mtSalesAmountVO.getParmMtSbCtYn()); //백계약여부.
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
		}
		
		return "maintenance/contract/write/salesInfo";
	}	
	
	@RequestMapping(value="/write/salesInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> writeMtSalesInfo(HttpServletRequest request, @RequestBody MtSalesAmountVO mtSalesAmountVO, ModelMap model) throws Exception {
		
		HashMap<String, String> sessionMap = null;
		Map<String, String> returnMap = null;
		String mtIntegrateKey = null;
		try {
//			logger.debug("mtContractVO.mtAcKey())=====>"+mtContractVO.getMtAcKey());
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
			
			mtSalesAmountVO.setRegEmpKey(sessionMap.get("empKey"));

//			logger.debug("mtContractVO.getCtDt(2))=====>"+mtContractVO.getCtDt());
			
//			mtIntegrateKey = service.writeFirestContractBasic(mtContractVO);			
			
			returnMap = new HashMap<>();
			returnMap.put("parmMtSbCtYn", mtSalesAmountVO.getParmMtSbCtYn()); //백계약여부.
			returnMap.put("mtIntegrateKey", mtIntegrateKey);
//			logger.debug("mtIntegrateKey===>"+mtIntegrateKey);
			returnMap.put("updateYn", "N");
			returnMap.put("successYN", "Y");
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error(null, e);
		}		
		return returnMap;
	}	
	@RequestMapping(value="/detail/backOrderInfo.do")
	public String backOrderDetail(MtContractVO mtContractVO, ModelMap model) throws Exception {

		List<?> empList = null;
		MtContractVO basicContractInfo = null;
		List<?> backOrderList = null;
		try {
			//기본정보 조회
			basicContractInfo = service.selectContractBasicDetail(mtContractVO.getSelectKey());
			
			//백계약 품목 조회
			backOrderList = null;
			
			//직원정보 조회
			empList = service.selectEmployeeList();
			
			model.put("basicContractInfo", basicContractInfo);
			model.put("backOrderList", backOrderList);			
			model.put("empList", empList);
		} catch (Exception e) {
			
			logger.error("writeBackOrderInfoView error", e);
		}
		
		return "maintenance/contract/detail/backOrderInfo";
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
	public String writeBackOrderInfoView(MtContractVO mtContractVO, ModelMap model) throws Exception {

		List<?> empList = null;
//		logger.debug("writeMtBackOrderInfoView=====");
		try {
			
			
			empList = service.selectEmployeeList();
			model.put("empList", empList);
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
	public void writeBackOrderInfo(MtContractVO mtContractVO, HttpServletRequest request, ModelMap model) {

		HashMap<String, String> sessionMap = null;
		try {
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
			
			mtContractVO.setRegEmpKey(sessionMap.get("empKey"));
//			returnMap.put("updateYn", "N");
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
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
		
		/*return "maintenance/mtContractList";*/
	}
	
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
	public String writePurchaseAmountView(MtContractVO mtContractVO, ModelMap model) throws Exception {

		List<?> empList = null;
		try {			
			
			empList = service.selectEmployeeList();
			

			model.put("empList", empList);
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
	public void writePurchaseAmount(MtContractVO mtContractVO, HttpServletRequest request, ModelMap model) {

		HashMap<String, String> sessionMap = null;
		try {
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
			
			mtContractVO.setRegEmpKey(sessionMap.get("empKey"));
//			returnMap.put("updateYn", "N");
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error(null, e);
		}
		
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
	public String mtPurchaseAmountDetail(MtContractVO mtContractVO, ModelMap model) throws Exception {
		
		List<?> purchaseAmountList = null;
		List<?> empList = null;
		MtContractVO basicContractInfo = null;
		try {
			
			//기본정보 조회
			basicContractInfo = service.selectContractBasicDetail(mtContractVO.getSelectKey());
			
			//매입금액 리스트  조회
			
			
			
			//직원정보 조회
			empList = service.selectEmployeeList();
			
			model.put("basicContractInfo", basicContractInfo);
						
			model.put("empList", empList);
		} catch (Exception e) {
			logger.error("purchaseAmountInfo error", e);
		}
		
		return "maintenance/contract/detail/purchaseAmountInfo";
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
	public String selectMtDetailProductInfo(@ModelAttribute("searchVO") MtContractVO mtContractVO, ModelMap model) throws Exception {
		
		List<?> prodList = null;
		List<?> empList = null;
		MtContractVO basicContractInfo = null;
		try {
			
			//기본정보 조회
			basicContractInfo = service.selectContractBasicDetail(mtContractVO.getSelectKey());
			
			//제품정보 조회
			prodList = null;
			
			//직원정보 조회
			empList = service.selectEmployeeList();
			
			model.put("basicContractInfo", basicContractInfo);
			model.put("prodList", prodList);			
			model.put("empList", empList);
		} catch (Exception e) {
			logger.error("selectMtDetailProductInfo error", e);
		}
		logger.debug("getSelectKey==>"+mtContractVO.getSelectKey());
		
		return "maintenance/contract/detail/productInfo";
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
      
     String acKey = null;
     List < ? > acDirectorList = null;
     Map<String, Object> modelAndView = null;
     try {
    	 
//    	 acKey = request.getParameter("mtAcKey");
//    	 logger.debug("acKey===>"+acKey);
//    	 logger.debug("mtAcKey===>"+mtAcKey);
//    	
//    	 acKey="1098620738";
         /* Ajax List 리턴을 위해서는 ModelAndView 로 세팅해야함 */
         modelAndView = new HashMap<String, Object>();
     
         acDirectorList =service.selectAcDirectorList(mtAcKey);
         
         logger.debug("acDirectorList.size=====>"+acDirectorList.size());
//         modelAndView.setViewName("jsonView");
         modelAndView.put("result", acDirectorList);
	} catch (Exception e) {
		logger.error("selectAcDirectorList error", e);
	}

    
     return modelAndView; 
	}
	
}
