package com.cep.maintenance.work.web;

import java.util.Enumeration;
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
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.work.service.MtWorkService;
import com.cep.maintenance.work.vo.MtWorkVO;
import com.cmm.util.CepDateUtil;
import com.cmm.util.StringUtil;

@Controller
@RequestMapping("/maintenance/work")
public class MtWorkController {
	private static final Logger logger = LoggerFactory.getLogger(MtWorkController.class);
	
	@Resource(name="mtWorkService")
	private MtWorkService mtwService;

	@Resource(name="mtContractService")
	private MtContractService mtcService;
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
		
		List<?> mtList = null;
		List<?> empList = null;
		String toDay = null;		
		String fromDate = null;
		Map<String, String> searchParam = null;
		try {			
			
			//날짜에서 -를 빼준다.
						
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
			
			
			logger.info("searchVO.getFromDate()===>"+searchVO.getFromDate());
			logger.info("searchVO.getToDate()===>"+searchVO.getToDate());
			logger.info("searchVO.getSearchWorkEmpKey()===>"+searchVO.getSearchWorkEmpKey());
			logger.info("searchVO.getSearchWorkResult()===>"+searchVO.getSearchWorkResult());
			logger.info("searchVO.getSearchMtName()===>"+searchVO.getSearchMtName());
			
			
			mtList = mtwService.selectMtWorkList(searchVO);
//			logger.debug("mtList.size()=====>"+mtList.size());
			
			
			searchParam = new HashMap<>();
			searchParam.put("fromDate", CepDateUtil.convertDisplayFormat(searchVO.getFromDate(), null, null));
			searchParam.put("toDate", CepDateUtil.convertDisplayFormat(searchVO.getToDate(), null, null));
			
			empList = mtcService.selectEmployeeList();
			model.put("resultList", mtList);
			model.put("empList", empList);
			model.put("searchParam", searchParam);
			model.put("resultCode", "SUCC");
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
			logger.error("mtMainList error", e);
		}
		return "maintenance/work/workList";
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
	@RequestMapping(value="/deleteWork.do")
	public String deleteWork(@ModelAttribute("searchVO") MtDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		List<?> mtList = null;
		List<?> empList = null;
		MtWorkVO deleteVo = null;
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
			
			deleteVo = new MtWorkVO();
			deleteVo.setModEmpKey(sessionMap.get("empKey"));
			deleteVo.setMtWorkKey(searchVO.getSelectKey());
			mtwService.deleteMtWork(deleteVo);
			/*logger.debug("mtList.size()=====>"+mtList.size());
			for (int i = 0; i < mtList.size(); i++) {
				MtContractVO vo = (MtContractVO)mtList.get(i);
				logger.debug("vo.getMtAcNm()===>"+vo.getMtAcNm());
			}*/
			mtList = mtwService.selectMtWorkList(searchVO);
			empList = mtcService.selectEmployeeList();
			model.put("resultList", mtList);
			model.put("empList", empList);
			model.put("resultCode", "SUCC");
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
			logger.error("mtMainList error", e);
		}
		
		return "maintenance/work/workList";
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

		List<?> empList = null;
//		logger.info("writeMtWorkInfoView=====");
		Enumeration<String> attrNames = request.getAttributeNames();
		try {
			
			


			 System.out.println("mtWorkKey===>"+request.getAttribute("mtWorkKey"));
			empList = mtcService.selectEmployeeList();
			model.put("empList", empList);
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
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
	public Map<String, String> writeBasicInfo(HttpServletRequest request, @RequestBody MtWorkVO mtWorkVO, ModelMap model) throws Exception {
		
		HashMap<String, String> sessionMap = null;
		String mtWorkKey = "mtWorkKey12324";
		Map<String, String> returnMap = new HashMap<>();
		try {
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
			mtWorkVO.setRegEmpKey(sessionMap.get("empKey"));
			returnMap.put("mtWorkKey", "mtWorkKey12324");
			returnMap.put("successYN", "Y");
		} catch (Exception e) {
			logger.error("ERROR", e);
		}
		return returnMap;
	}

	/**
	 * 
	  * @Method Name : writeOrderInfoView
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 발주등록 화면 이동
	  * @param mtWorkVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/orderInfoView.do")
	public String writeOrderInfoView(MtWorkVO mtWorkVO,ModelMap model) throws Exception {

		List<?> empList = null;
		logger.debug("writeMtWorkInfoView=====");
		try {
			empList = mtcService.selectEmployeeList();
			model.put("empList", empList);
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
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
	public void writeOrderInfo(@ModelAttribute("mtWorkVO") MtWorkVO mtWorkVO, ModelMap model) throws Exception {
		logger.info("writeMtWorkInfo=====");
	}
	
	
	/**
	 * 
	  * @Method Name : basicDetail
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
	public String basicDetail(MtWorkVO mtWorkVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "maintenance/work/detail/basicInfo";
	}
	
	/**
	 * 
	  * @Method Name : orderDetail
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
	public String orderDetail(MtWorkVO mtWorkVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "maintenance/work/detail/orderInfo";
	}
	
	//////////////////////////////////////////////////////
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
	 Map<Object, Object> basicContractInfo = null;
     try {
    	 
//    	 acKey = request.getParameter("mtAcKey");
//    	 logger.debug("acKey===>"+acKey);
//    	 logger.debug("mtAcKey===>"+mtAcKey);
//    	
//    	 acKey="1098620738";
         /* Ajax List 리턴을 위해서는 ModelAndView 로 세팅해야함 */
    	 
    	 logger.info("mtIntegrateKey====>"+mtIntegrateKey);
         modelAndView = new HashMap<String, Object>();
     
         basicContractInfo =mtcService.selectContractBasicDetail(mtIntegrateKey);
         
         acDirectorList =mtcService.selectAcDirectorList((String)basicContractInfo.get("mtAcKey"));
         
         logger.info("mtAcKey.size=====>"+(String)basicContractInfo.get("mtAcKey"));
         logger.info("acDirectorList.size=====>"+acDirectorList.size());
         
//         modelAndView.setViewName("jsonView");
         modelAndView.put("acDirectorList", acDirectorList);
         modelAndView.put("basicContractInfo", basicContractInfo);
	} catch (Exception e) {
		logger.error("selectAcDirectorList error", e);
	}
    
     return modelAndView; 
	}
	
}
