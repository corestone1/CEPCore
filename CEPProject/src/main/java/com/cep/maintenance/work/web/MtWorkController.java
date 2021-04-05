package com.cep.maintenance.work.web;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.maintenance.contract.service.MtContractService;
import com.cep.maintenance.contract.vo.MtBackOrderProductVO;
import com.cep.maintenance.contract.vo.MtBackOrderVO;
import com.cep.maintenance.contract.vo.MtContractProductVO;
import com.cep.maintenance.contract.vo.MtContractVO;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.work.service.MtWorkService;
import com.cep.maintenance.work.vo.MtOrderProductVO;
import com.cep.maintenance.work.vo.MtOrderVO;
import com.cep.maintenance.work.vo.MtWorkProductVO;
import com.cep.maintenance.work.vo.MtWorkVO;
import com.cep.mngCommon.code.service.CodeService;
import com.cep.mngCommon.code.vo.CodeSearchVO;
import com.cep.mngCommon.code.vo.CodeVO;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping("/maintenance/work")
public class MtWorkController {
	private static final Logger logger = LoggerFactory.getLogger(MtWorkController.class);
	
	@Resource(name="mtWorkService")
	private MtWorkService mtwService;

	@Resource(name="mtContractService")
	private MtContractService mtcService;
	
	@Resource(name="codeService")
	private CodeService codeService;
	/**
	 * 
	  * @Method Name : selectMtWorkList
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 목록을 조회한다.
	  * @param searchVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/workList.do")
	public String selectMtWorkList(@ModelAttribute("searchVO") MtDefaultVO searchVO, ModelMap model) throws Exception {
		
		List<MtWorkVO> mtList = null;
//		List<?> empList = null;
		String toDay = null;		
//		String fromDate = null;
		Map<String, String> searchParam = null;
		try {			
			
			//날짜에서 -를 빼준다. 
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
			
			
			logger.debug("searchVO.getFromDate()===>"+searchVO.getFromDate());
			logger.debug("searchVO.getToDate()===>"+searchVO.getToDate());
			logger.debug("searchVO.getSearchWorkEmpNm()===>"+searchVO.getSearchWorkEmpNm());
			logger.debug("searchVO.getSearchWorkResult()===>"+searchVO.getSearchWorkResult());
			logger.debug("searchVO.getSearchMtName()===>"+searchVO.getSearchGubun());
			logger.debug("searchVO.getSearchMtName()===>"+searchVO.getSearchWord());			
			
			mtList = mtwService.selectMtWorkList(searchVO);
			logger.debug("mtList.size()=====>"+mtList.size());
						
			
			searchParam = new HashMap<>();
			searchParam.put("fromDate", CepDateUtil.convertDisplayFormat(searchVO.getFromDate(), null, null));
			searchParam.put("toDate", CepDateUtil.convertDisplayFormat(searchVO.getToDate(), null, null));
			
//			empList = mtcService.selectEmployeeList();
			model.put("resultList", mtList);
//			model.put("empList", empList);
			model.put("searchParam", searchParam);
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error("selectMtWorkList error", e);
		}
		return "maintenance/work/workList";
	}
	/**
	 * 
	  * @Method Name : basicDetailInfo
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업 기본정보 상세보기
	  * @param mtWorkVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/detail/basicInfo.do")
	public String basicDetailInfo(@ModelAttribute("searchVO") MtWorkVO mtWorkVO, ModelMap model) throws Exception {

		MtContractVO basicContractInfo = null;
		MtWorkVO basicWorkInfo = null;
		List<?> empList = null;
		List <?> acDirectorList = null;
		String mtWorkKey = null;
		String mtIntegrateKey = null;
		try {
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtWorkVO.getMtIntegrateKey(), ""))){
				mtIntegrateKey = mtWorkVO.getMtIntegrateKey();
			} else {
				mtIntegrateKey = mtWorkVO.getSelectIntegrateKey();
			}
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtWorkVO.getMtWorkKey(), ""))){
				mtWorkKey = mtWorkVO.getMtWorkKey();
			} else {
				mtWorkKey = mtWorkVO.getSelectWorkKey();
			}
			//유지보수 계약 기본정보 조회
//			basicContractInfo = mtcService.selectContractBasicDetail(mtWorkVO.getMtIntegrateKey());
			basicContractInfo = mtcService.selectContractBasicDetail(mtIntegrateKey);
			
			//유지보수 작업 기본정보조회
			basicWorkInfo = mtwService.selectWorkDetail(mtWorkKey);

			// 고객정보
			acDirectorList = mtcService.selectAcDirectorList(basicContractInfo.getMtAcKey());
			
			//직원정보 조회
			empList = mtcService.selectEmployeeList();
			
			model.put("basicContractInfo", basicContractInfo);
			model.put("basicWorkInfo", basicWorkInfo);			
			model.put("acDirectorList", acDirectorList);	
			model.put("empList", empList);
			model.put("displayUtil", new CepDisplayUtil());
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error("basicDetailInfo error", e);
		}
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		logger.debug("mtIntegrateKey===>"+mtWorkKey);
		logger.debug("mtWorkKey===>"+mtWorkKey);
		
		return "maintenance/work/detail/basicInfo";
	}
	
	@RequestMapping(value="/edit/basicInfo.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Map<String, String> editBasicInfo(HttpServletRequest request, @RequestBody MtWorkVO mtWorkVO, ModelMap model) throws Exception {
		
		HashMap<String, String> sessionMap = null;
//		MtContractVO basicContractInfo = null;
//		MtWorkVO basicWorkInfo = null;
//		List<?> empList = null;
//		List <?> acDirectorList = null;
		Map<String, String> returnMap = new HashMap<>();

		try {
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			mtWorkVO.setModEmpKey(sessionMap.get("empKey"));
			
			mtWorkVO.setMtWorkStartDt(mtWorkVO.getMtWorkStartDt().replace("-", ""));
			mtWorkVO.setMtWorkStartTm(mtWorkVO.getMtWorkStartTm().replace(":", ""));
			mtWorkVO.setMtWorkEndDt(mtWorkVO.getMtWorkEndDt().replace("-", ""));
			mtWorkVO.setMtWorkEndTm(mtWorkVO.getMtWorkEndTm().replace(":", ""));
			
			mtwService.updateWorkBasic(mtWorkVO);
			//유지보수 계약 기본정보 조회
//			basicContractInfo = mtcService.selectContractBasicDetail(mtWorkVO.getMtIntegrateKey());
//			
//			//유지보수 작업 기본정보조회
//			basicWorkInfo = mtwService.selectWorkDetail(mtWorkVO.getMtWorkKey());
//
//			// 고객정보
//			acDirectorList = mtcService.selectAcDirectorList(basicContractInfo.getMtAcKey());
//			
//			//직원정보 조회
//			empList = mtcService.selectEmployeeList();
//			
//			model.put("basicContractInfo", basicContractInfo);
//			model.put("basicWorkInfo", basicWorkInfo);			
//			model.put("acDirectorList", acDirectorList);	
//			model.put("empList", empList);
			logger.debug("mtWorkVO.getMtWorkPmYn()=====>"+mtWorkVO.getMtWorkPmYn());
			logger.debug("mtWorkVO.getMtWorkOrderYn()=====>"+mtWorkVO.getMtWorkOrderYn());
			logger.debug("mtWorkVO.getMtWorkKey()=====>"+mtWorkVO.getMtWorkKey());
			
			
			returnMap.put("mtIntegrateKey", mtWorkVO.getMtIntegrateKey());
			returnMap.put("mtWorkKey", mtWorkVO.getMtWorkKey());
			returnMap.put("mtWorkPmYn", mtWorkVO.getMtWorkPmYn());
			returnMap.put("mtWorkOrderYn", mtWorkVO.getMtWorkOrderYn());
			returnMap.put("successYN", "Y");
			
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error("ERROR", e);
		}
//		return "maintenance/work/detail/basicInfo";
		return returnMap;
	}
	
	/**
	 * 
	  * @Method Name : deleteWork
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 삭제.
	  * @param searchVO
	  * @param model
	  * @param request
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/deleteWork.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
//	public String deleteWork(@ModelAttribute("searchVO") MtDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
	public  Map<String, String> deleteWork(@RequestBody MtDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
//		List<?> mtList = null;
//		List<?> empList = null;
		MtWorkVO deleteVo = null;
		HashMap<String, String> sessionMap = null;
//		String toDay = null;		
//		String fromDate = null;
//		Map<String, String> searchParam = null;
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
			logger.debug("searchVO.getSelectWorkKey()========>"+searchVO.getSelectWorkKey());
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getSelectWorkKey(), ""))) {
				sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
				
				deleteVo = new MtWorkVO();
				deleteVo.setModEmpKey(sessionMap.get("empKey"));
				deleteVo.setMtWorkKey(searchVO.getSelectWorkKey());
				
				mtwService.deleteMtWork(deleteVo);
				returnMap.put("successYN", "Y");
			} else {
				returnMap.put("successYN", "N");
			}
			
			
			
			/*logger.debug("mtList.size()=====>"+mtList.size());
			for (int i = 0; i < mtList.size(); i++) {
				MtContractVO vo = (MtContractVO)mtList.get(i);
				logger.debug("vo.getMtAcNm()===>"+vo.getMtAcNm());
			}*/
//			mtList = mtwService.selectMtWorkList(searchVO);
			
//			searchParam = new HashMap<>();
//			searchParam.put("fromDate", CepDateUtil.convertDisplayFormat(searchVO.getFromDate(), null, null));
//			searchParam.put("toDate", CepDateUtil.convertDisplayFormat(searchVO.getToDate(), null, null));
			
			
//			empList = mtcService.selectEmployeeList();
//			model.put("resultList", mtList);
//			model.put("empList", empList);
//			model.put("searchParam", searchParam);
			returnMap.put("successYN", "Y");
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error("mtMainList error", e);
		}
		
		return returnMap;
	}
	
	/**
	 * 
	  * @Method Name : writeBasicInfoView
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 기본정보 등록화면 이동.
	  * @param request
	  * @param mtWorkVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/basicInfoView.do")
	public String writeBasicInfoView(HttpServletRequest request,MtWorkVO mtWorkVO,ModelMap model) throws Exception {
		MtWorkVO basicWorkInfo = null;
		List<?> empList = null;
		List < ? > acDirectorList = null; // 고객사 담당자 리스트.
		try {
						
			logger.debug("mtWorkVO.getMtWorkKey()=====>"+mtWorkVO.getMtWorkKey());
			//테스트 위해서 임시적으로 적용
			//mtWorkVO.setMtWorkKey("MW210011");
			
			
			//WorkKey가 존재하면 수정화면으로 저장된 기본 정보를 조회한다.
			if(!"".equals(CepStringUtil.getDefaultValue(mtWorkVO.getMtWorkKey(), ""))) {
				basicWorkInfo = mtwService.selectWorkDetail(mtWorkVO.getMtWorkKey());
				if(null != basicWorkInfo) {
					logger.debug("basicWorkInfo.getMtAcKey()== ===>"+basicWorkInfo.getMtAcKey());
					acDirectorList = mtcService.selectAcDirectorList(basicWorkInfo.getMtAcKey());
				}
			}

			empList = mtcService.selectEmployeeList();
			model.put("empList", empList);
			model.put("basicWorkInfo", basicWorkInfo);
			model.put("acDirectorList", acDirectorList);
			model.put("mtIntegrateKey", mtWorkVO.getMtIntegrateKey());
			model.put("displayUtil", new CepDisplayUtil());
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error("addBasicInfo error", e);
		}
		
		return "maintenance/work/write/basicInfo";
	}
	
	/**
	 * 
	  * @Method Name : writeBasicInfo
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 기본정보 등록
	  * @param request
	  * @param mtWorkVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/basicInfo.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Map<String, String> writeBasicInfo(HttpServletRequest request, @RequestBody MtWorkVO mtWorkVO, ModelMap model) throws Exception {
		
		HashMap<String, String> sessionMap = null;
		String mtWorkKey = null;
		Map<String, String> returnMap = new HashMap<>();
		try {
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			mtWorkVO.setRegEmpKey(sessionMap.get("empKey"));
			
//			logger.debug("mtWorkVO.getConvertWorkStartDt()===>"+mtWorkVO.getDbWorkStartDt()+" / "+mtWorkVO.getViewWorkStartDt()+" / "+mtWorkVO.getMtWorkStartDt());
//			logger.debug("mtWorkVO.getConvertWorkStartTm()===>"+mtWorkVO.getDbWorkStartTm()+" / "+mtWorkVO.getViewWorkStartTm()+" / "+mtWorkVO.getMtWorkStartTm());
//			logger.debug("mtWorkVO.getConvertWorkEndDt()===>"+mtWorkVO.getDbWorkEndDt()+" / "+mtWorkVO.getViewWorkEndDt()+" / "+mtWorkVO.getMtWorkEndDt());
//			logger.debug("mtWorkVO.getConvertWorkEndTm()===>"+mtWorkVO.getDbWorkEndTm()+" / "+mtWorkVO.getViewWorkEndTm()+" / "+mtWorkVO.getMtWorkEndTm());
//			logger.debug("mtWorkVO.getMtWorkPmYn()=====>"+mtWorkVO.getMtWorkPmYn());
//			logger.debug("mtWorkVO.getMtWorkOrderYn()=====>"+mtWorkVO.getMtWorkOrderYn());
//			logger.debug("mtWorkVO.getMtWorkKey()=====>"+mtWorkVO.getMtWorkKey());
			mtWorkKey = mtwService.writeWorkBasic(mtWorkVO);
			returnMap.put("mtIntegrateKey", mtWorkVO.getMtIntegrateKey());
			returnMap.put("mtWorkKey", mtWorkKey);
			returnMap.put("mtWorkPmYn", mtWorkVO.getMtWorkPmYn());
			returnMap.put("mtWorkOrderYn", mtWorkVO.getMtWorkOrderYn());
			returnMap.put("successYN", "Y");
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error("ERROR", e);
		}
		return returnMap;
	}
//	================================================================ 유지보수 작업 제품등록 =============================================
	/**
	 * 
	  * @Method Name : productDetailInfo
	  * @Cdate       : 2020. 11. 26.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 제품정보 상세보기.
	  * @param mtWorkVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/detail/productInfo.do")
	public String productDetailInfo(MtWorkVO mtWorkVO, ModelMap model) throws Exception {
		MtContractVO basicContractInfo = null;
		MtWorkVO basicWorkInfo = null;
		List<MtWorkProductVO> mtWorkProductList = null;
		
		try {
			logger.debug("mtIntegrateKey===>"+mtWorkVO.getMtIntegrateKey());
			logger.debug("mtWorkKey===>"+mtWorkVO.getMtWorkKey());
			//유지보수계약 기본정보를 가져온다.
			basicContractInfo = mtcService.selectContractBasicDetail(mtWorkVO.getMtIntegrateKey());		
			
			if(null !=basicContractInfo) {
				basicWorkInfo = mtwService.selectWorkDetail(mtWorkVO.getMtWorkKey());
				if(null != basicWorkInfo) {
					//유지보수작업 제품목록을 가져온다.
					mtWorkProductList = mtwService.selectWorkProductList(mtWorkVO.getMtWorkKey());
				}
				
			}
			
			
			model.put("basicContractInfo", basicContractInfo);
			model.put("basicWorkInfo", basicWorkInfo);
			model.put("mtWorkProductList", mtWorkProductList);
			model.put("mtWorkKey", mtWorkVO.getMtWorkKey());		
			model.put("displayUtil", new CepDisplayUtil());
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error("productDetailInfo error", e);
		}
		
		
		return "maintenance/work/detail/productInfo";
	}	
	
	/**
	 * 
	  * @Method Name : writeProductInfoView
	  * @Cdate       : 2021. 1. 28.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 제품등록 팝업 조회.
	  * @param request
	  * @param mtWorkProductVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/productInfoView.do")
	public String writeProductInfoView(HttpServletRequest request,MtWorkProductVO mtWorkProductVO,ModelMap model) throws Exception {
		MtWorkVO basicWorkInfo = null;
		List<MtWorkProductVO> mtWorkProductList = null;
		int listCount = 0;
		try {
						
			logger.debug("mtWorkProductVO.getMtWorkKey()=====>"+mtWorkProductVO.getMtWorkKey());
			//테스트 위해서 임시적으로 적용
//			mtWorkProductVO.setMtWorkKey("MW210011");
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtWorkProductVO.getMtWorkKey(), ""))) {
				basicWorkInfo = mtwService.selectWorkDetail(mtWorkProductVO.getMtWorkKey());
				if(null != basicWorkInfo) {
					//유지보수작업 제품목록을 가져온다.
					mtWorkProductList = mtwService.selectWorkProductList(mtWorkProductVO.getMtWorkKey());
					if(null !=mtWorkProductList && mtWorkProductList.size()>0) {
						listCount =mtWorkProductList.size();
					}
				}
			}
			logger.debug("listCount======>"+listCount);

			model.put("mtWorkProductList", mtWorkProductList);
			model.put("listCount", listCount);
			model.put("mtWorkKey", mtWorkProductVO.getMtWorkKey());
			model.put("mtIntegrateKey", basicWorkInfo.getMtIntegrateKey());

			model.put("mtWorkPmYn", basicWorkInfo.getMtWorkPmYn());
			model.put("mtWorkOrderYn", basicWorkInfo.getMtWorkOrderYn());
			//발주가 있는지 여부.
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error("writeProductInfoView error", e);
		}
		
		return "maintenance/work/write/productInfo";
	}
	
	/**
	 * 
	  * @Method Name : writeBasicInfo
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 제품정보 등록
	  * @param request
	  * @param mtWorkVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/productInfo.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Map<String, String> writeProductInfo(HttpServletRequest request,  @RequestBody MtWorkProductVO mtWorkProductVO, ModelMap model) throws Exception {
		
		HashMap<String, String> sessionMap = null;
		
		Map<String, String> returnMap = new HashMap<>();
		try {
			 
		     
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			mtWorkProductVO.setRegEmpKey(sessionMap.get("empKey"));
			mtWorkProductVO.setModEmpKey(sessionMap.get("empKey"));
//			mtWorkVO.setMtOption("w");
//			mtWorkKey = mtwService.writeWorkBasic(mtWorkVO);
//			returnMap.put("mtIntegrateKey", mtWorkVO.getMtIntegrateKey());
//			returnMap.put("mtWorkKey", mtWorkKey);
//			logger.debug("mtWorkProductVO.getMtIntegrateKey(1)====>"+mtWorkProductVO.getMtIntegrateKey());
//			logger.debug("mtWorkProductVO.getMtWorkKey(2)====>"+mtWorkProductVO.getMtWorkKey());
//			logger.debug("mtWorkProductVO.getMtPmWorkCont(2)====>"+mtWorkProductVO.getMtPmWorkCont());
//			logger.debug("mtListVO.getMtWorkProductVoList()==>"+mtWorkProductVO.getMtWorkProductVoList());
//			
//			for (int i = 0; i < mtWorkProductVO.getMtWorkProductVoList().size(); i++) {
//				logger.debug("getMtWorkKey====>"+mtWorkProductVO.getMtWorkProductVoList().get(i).getMtWorkKey());
//				logger.debug("getMtIntegrateKey====>"+mtWorkProductVO.getMtWorkProductVoList().get(i).getMtIntegrateKey());
//				logger.debug("getMtPmWorkCont====>"+mtWorkProductVO.getMtWorkProductVoList().get(i).getMtPmWorkCont());
//				logger.debug("getMtPmWorkCont====>"+mtWorkProductVO.getMtWorkProductVoList().get(i).getMtWorkProductVoList());
//			}
			
			
//			if(null !=mtWorkProductVO.getMtWorkProductVoList()){
//				logger.debug("mtListVO.getMtWorkProductVoList().size()==>"+mtWorkProductVO.getMtWorkProductVoList().size());
//			}
			mtwService.writeWorkProductList(mtWorkProductVO);
			returnMap.put("mtWorkKey", mtWorkProductVO.getMtWorkKey());
			returnMap.put("mtIntegrateKey", mtWorkProductVO.getMtIntegrateKey());
			
			returnMap.put("successYN", "Y");
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error("ERROR", e);
		}
		return returnMap;
	}
	
	@RequestMapping(value="/detail/deleteWorkProduct.do", method=RequestMethod.POST)
	@ResponseBody 
	@SuppressWarnings("unchecked")
	public Map<String, String> deleteProduct(HttpServletRequest request, @RequestBody MtWorkProductVO mtWorkProductVO) {

		HashMap<String, String> sessionMap = null;
		Map<String, String> returnMap = new HashMap<>();
		String[] deleteKeyList = null;
		try {
			logger.debug("mtWorkProductVO.getMtIntegrateKey()=====>"+mtWorkProductVO.getMtIntegrateKey() +" / "+mtWorkProductVO.getMtWorkKey()+" / "+mtWorkProductVO.getMtWorkSeq());
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");

			if(!"".equals(CepStringUtil.getDefaultValue(mtWorkProductVO.getMtWorkKey(), ""))
					&& !"".equals(CepStringUtil.getDefaultValue(mtWorkProductVO.getMtWorkSeq(), ""))) {
				
				deleteKeyList = new String[1];
				deleteKeyList[0] = String.valueOf(mtWorkProductVO.getMtWorkSeq());
				// 유지보수계약 관리키가 존재하므로 수정
				mtwService.deleteWorkProductList(sessionMap.get("empKey"),mtWorkProductVO.getMtWorkKey(), deleteKeyList);
				
				//logger.debug("deleteKeyList.length=====>"+deleteKeyList.length+" / "+deleteKeyList[0]);
				returnMap.put("successYN", "Y");
			} else {
				returnMap.put("successYN", "N");
				
			}			
			
			returnMap.put("mtIntegrateKey", mtWorkProductVO.getMtIntegrateKey());
			returnMap.put("mtWorkKey", mtWorkProductVO.getMtWorkKey());
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error(null, e);
		}		
		return returnMap;
	}	
	
	
	
	//=============================================== 유지보수 작업 발주 =============================================
	/**
	 * 
	  * @Method Name : writeOrderInfoView
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 발주등록 화면 이동
	  * @param mtWorkVO : MtOrderVO.getOrderCtFkKey() == MtWorkVO.getMtWorkKey()
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/orderInfoView.do")
	public String writeOrderInfoView(HttpServletRequest request, MtOrderVO mtOrderVO,ModelMap model) throws Exception {
		MtWorkVO basicWorkInfo = null;
		List<EgovMap> workOrderSelectBox = null;
		EgovMap map = null;
		List<?> empList = null;
		List < ? > acDirectorList = null;
		MtOrderVO returnVo = null;
		List<CodeVO> orderKindCodeList = null;
		CodeSearchVO searchVO = null;
		int listCount = 1;
		logger.debug("basicWorkInfo.getMtIntegrateKey()=====>"+mtOrderVO.getMtIntegrateKey()+" / "+mtOrderVO.getOrderCtFkKey());
		logger.debug("mtOrderVO.getSelectKey()=====>"+mtOrderVO.getSelectKey());
		try {
			
			mtOrderVO.setOrderDt(CepDateUtil.getToday("yyyyMMdd")); //등록일자 오늘날짜 셋팅.
			
			basicWorkInfo = mtwService.selectWorkDetail(mtOrderVO.getOrderCtFkKey()); //유지보수 작업키를 이용하여 기본정보 조회.
			
			//유지보수작업 키를 이용하여 유지보수 작업 발주 등록 거래처 목록을 가져온다.(selectBox에서 사용)
			workOrderSelectBox = mtwService.selectWorkOrderSelectBoxList(mtOrderVO.getOrderCtFkKey());
			
			if(null !=workOrderSelectBox && workOrderSelectBox.size()>0) {
				//발주등록된 거래처가 있는 경우
				//등록된 거래처 갯수를 체크한다.
				mtOrderVO.setMtSaveCnt(workOrderSelectBox.size());
				if("newOrder".equals(CepStringUtil.getDefaultValue(mtOrderVO.getBtnOption(), ""))){
					//신규저장
					returnVo = mtOrderVO;
				} else {
					//저장된 발주정보를 조회한다.
					if(!"".equals(CepStringUtil.getDefaultValue(mtOrderVO.getSelectKey(), ""))){
						//메인정보와 품목정보를 조회한다.
						returnVo = mtwService.selectWorkOrderDetail(mtOrderVO.getSelectKey());
					} else {
						//선택된 정보가 없는경우 첫번째 거래처 발주정보를 조회한다.
						map = workOrderSelectBox.get(0);
						returnVo = mtwService.selectWorkOrderDetail((String)map.get("mtOrderKey"));
						mtOrderVO.setSelectKey((String)map.get("mtOrderKey"));
						
					}
					
					if(null != returnVo){
						returnVo.setSelectKey(mtOrderVO.getSelectKey());
						returnVo.setMtSaveCnt(mtOrderVO.getMtSaveCnt());
						if(null !=returnVo.getMtOrderProductVoList() && returnVo.getMtOrderProductVoList().size()>1){
							listCount = returnVo.getMtOrderProductVoList().size();
						}
						logger.debug("returnVo.getOrderAcKey()=====>"+returnVo.getOrderAcKey());
						acDirectorList =mtcService.selectAcDirectorList(returnVo.getOrderAcKey());
						logger.debug("acDirectorList.size()=====>"+acDirectorList.size());
						
					}
				}
			} else {
				returnVo = mtOrderVO;
			}
			searchVO = new CodeSearchVO();
			searchVO.setCdUpCd("PRODUCT");
			orderKindCodeList = codeService.selectCodeList(searchVO);
			logger.debug("returnVo.getMtSaveCnt()=====>"+returnVo.getMtSaveCnt());
			logger.debug("returnVo.getSelectKey()=====>"+returnVo.getSelectKey());
//			empList = mtcService.selectEmployeeList();
			model.put("workOrderSelectBox", workOrderSelectBox);
			model.put("mtWorkOrderVO", returnVo);

			model.put("listCount", listCount);
			model.put("displayUtil", new CepDisplayUtil());
			model.put("acDirectorList", acDirectorList);
			
			model.put("orderCtFkKey", mtOrderVO.getOrderCtFkKey());
			
			model.put("mtIntegrateKey", basicWorkInfo.getMtIntegrateKey());

			model.put("mtWorkPmYn", basicWorkInfo.getMtWorkPmYn());
			model.put("mtWorkOrderYn", basicWorkInfo.getMtWorkOrderYn());
			model.put("selectKey", mtOrderVO.getSelectKey());		
			model.put("orderKindCodeList", orderKindCodeList);
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "Y");
			logger.error("addBasicInfo error", e);
		}
		
		return "maintenance/work/write/orderInfo";
	}	
	
	/**
	 * 
	  * @Method Name : writeOrderInfo
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 발주정보 등록
	  * @param mtWorkVO
	  * @param model
	  * @throws Exception
	 */
	@RequestMapping(value="/write/orderInfo.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Map<String, Object> writeOrderInfo(HttpServletRequest request, @RequestBody  MtOrderVO mtOrderVO, ModelMap model) throws Exception {
		HashMap<String, String> sessionMap = null;
		Map<String, Object> returnMap = new HashMap<>();
		String mtOrderKey = null;
		
		try {
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			mtOrderVO.setRegEmpKey(sessionMap.get("empKey"));
			mtOrderVO.setModEmpKey(sessionMap.get("empKey"));
			
//			if(null !=mtOrderVO.getMtOrderProductVoList()) {
//				System.out.println("size====>"+mtOrderVO.getMtOrderProductVoList().size());
//				for (int i = 0; i < mtOrderVO.getMtOrderProductVoList().size(); i++) {
//					System.out.println(mtOrderVO.getMtOrderProductVoList().get(i).getOrderPmFkNm());
//				}
//			}
			
			mtOrderKey = mtwService.writeMtWorkOrder(mtOrderVO);
			returnMap.put("successYN", "Y");
			returnMap.put("mtOrderKey", mtOrderKey);
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error("", e);
		}
		return returnMap;
	}
	
	

	
	

	
	/**
	 * 
	  * @Method Name : orderDetailInfo
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업 발주정보 상세보기.
	  * @param mtWorkVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/detail/orderInfo.do")
	public String orderDetailInfo(MtOrderVO mtOrderVO, ModelMap model) throws Exception {
		MtContractVO basicContractInfo = null;
		MtWorkVO basicWorkInfo = null;
		
		List<MtOrderVO> mtOrderList = null;
		List<MtOrderProductVO> mtOrderProductList = null;
		Map<String, Object> searchParam = null;
		String selectMtOrderAcKeyNm = null;
		try {
			
			logger.debug("basicWorkInfo.getMtIntegrateKey()=====>"+mtOrderVO.getMtIntegrateKey()+" / "+mtOrderVO.getOrderCtFkKey());
			logger.debug("mtOrderVO.getSelectKey()=====>"+mtOrderVO.getSelectKey());
			//유지보수계약 기본정보를 가져온다.
			basicContractInfo = mtcService.selectContractBasicDetail(mtOrderVO.getMtIntegrateKey());	
			if(null !=basicContractInfo) {
				
				//유지보수 작업 기본정보조회
				basicWorkInfo = mtwService.selectWorkDetail(mtOrderVO.getOrderCtFkKey());
				
				//유지보수 작업 발주거래처 정보 조회.
				searchParam = new HashMap<>();
				searchParam.put("orderCtFkKey", mtOrderVO.getOrderCtFkKey());
				
				mtOrderList = mtwService.selectWorkOrderList(searchParam);
				
				if(null != mtOrderList && mtOrderList.size()>0) {
					if("".equals(CepStringUtil.getDefaultValue(mtOrderVO.getSelectKey(), ""))) {
						//선택된 내용이 없으면 첫번째 거래처의 발주품목을 가져온다.
						mtOrderVO.setSelectKey(mtOrderList.get(0).getMtOrderKey());
						//발주거래처명
						selectMtOrderAcKeyNm = mtOrderList.get(0).getOrderAcKeyNm();
					}
					/*
					 * 선택한 거래처의 발주품목을 조회한다.
					 * mtOrderVO.getSelectKey() : mtOrderKey
					 */
					mtOrderProductList = mtwService.selectWorkOrderProductList(mtOrderVO.getSelectKey());
				}
				
			}
			model.put("basicContractInfo", basicContractInfo);
			model.put("basicWorkInfo", basicWorkInfo);			
			model.put("mtOrderList", mtOrderList);	
			model.put("mtOrderProductList", mtOrderProductList);	
			model.put("selectMtOrderAcKeyNm", selectMtOrderAcKeyNm);	
			model.put("selectKey", mtOrderVO.getSelectKey());	
			
			model.put("displayUtil", new CepDisplayUtil());
			model.put("successYN", "Y");
			
		} catch (Exception e) {
			model.put("successYN", "N");
			logger.error("orderDetailInfo error", e);
		}
		
		return "maintenance/work/detail/orderInfo";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/detail/selectWorkOrderProductList.do", method=RequestMethod.POST)
	public Map<String, Object>  selectWorkOrderProductList( @RequestBody String mtOrderKey) throws Exception {

		List<MtOrderProductVO> mtOrderProductList = null;	
		Map<String, Object> returnMap = new HashMap<String, Object>();
	     try {
	    	 
	    	 logger.debug("mtOrderKey=======>"+mtOrderKey);
	    	 if(!"".equals(CepStringUtil.getDefaultValue(mtOrderKey, ""))) {
	    		 returnMap = new HashMap<String, Object>();
	    	     
	    		 mtOrderProductList = mtwService.selectWorkOrderProductList(mtOrderKey);
		         
		         logger.debug("productList.size=====>"+mtOrderProductList.size());
		//         modelAndView.setViewName("jsonView");
		         returnMap.put("productList", mtOrderProductList);
		         returnMap.put("successYN", "Y");
	    	 } else {
	    		 returnMap.put("successYN", "N");
	    	 }
	    	
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error("selectWorkOrderProductList error", e);
		}
	    
	     return returnMap; 
	}
	
	
	@RequestMapping(value="/delete/workOrder.do", method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Map<String, Object> deleteWorkOrder(HttpServletRequest request, @RequestBody MtOrderVO mtOrderVO) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		try {		
			
//			model.put("toDay", CepDateUtil.getToday("yyyy-MM-dd"));
//			model.put("toDay", CepDateUtil.getToday("yyyyMMdd"));
//			mtOrderVO.setMtOrderDt(CepDateUtil.getToday("yyyyMMdd"));
			logger.debug("mtBackOrderVO.getMtIntegrateKey()===>"+mtOrderVO.getMtIntegrateKey());
			logger.debug("mtBackOrderVO.getSelectKey()===>"+mtOrderVO.getSelectKey());
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
//			service.deleteBackOrder(sessionMap.get("empKey"), mtOrderVO.getSelectKey(), mtOrderVO.getMtIntegrateKey());
			
			mtwService.deleteWorkOrder(sessionMap.get("empKey"), mtOrderVO.getSelectKey());
			
			returnMap.put("mtIntegrateKey", mtOrderVO.getMtIntegrateKey());
			returnMap.put("orderCtFkKey", mtOrderVO.getOrderCtFkKey());
			returnMap.put("successYN", "Y");
			
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error("error", e);
		}
		
		return returnMap;
	} 
	
	////////////////////////////////////////////유지보수 계약발주 끝.////////////////////////////////////////////////////////////
	/**
	 * 
	  * @Method Name : selectMtCustomerInfo
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업에서 유지보수 계약 key를 이용하여  유지보수 계약 기본정보와
	  *                       거래처 담당자 정보를 가져오는 메서드.
	  * @param request
	  * @param response
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/selectMtCustomerInfo.do", method=RequestMethod.POST)
	public Map<String, Object>  selectMtCustomerInfo(HttpServletRequest request , HttpServletResponse response , @RequestBody String mtIntegrateKey) throws Exception {
      
		List < ? > acDirectorList = null;
		Map<String, Object> modelAndView = null;
		MtContractVO basicContractInfo = null;
	    try {
	    	 
	//    	 acKey = request.getParameter("mtAcKey");
	//    	 logger.debug("acKey===>"+acKey);
	//    	 logger.debug("mtAcKey===>"+mtAcKey);
	//    	
	//    	 acKey="1098620738";
	         /* Ajax List 리턴을 위해서는 ModelAndView 로 세팅해야함 */
	    	 
	    	 logger.debug("mtIntegrateKey====>"+mtIntegrateKey);
	         modelAndView = new HashMap<String, Object>();
	     
	         basicContractInfo =mtcService.selectContractBasicDetail(mtIntegrateKey);
	         
	         acDirectorList =mtcService.selectAcDirectorList((String)basicContractInfo.getMtAcKey());
	         
	         logger.debug("mtAcKey.size=====>"+basicContractInfo.getMtAcKey());
	         logger.debug("acDirectorList.size=====>"+acDirectorList.size());
	         
	//         modelAndView.setViewName("jsonView");
	         modelAndView.put("acDirectorList", acDirectorList);
	         modelAndView.put("basicContractInfo", basicContractInfo);
		} catch (Exception e) {
			logger.error("selectAcDirectorList error", e);
		}
    
     return modelAndView; 
	}
	
}
