package com.cep.maintenance.web;

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
import org.springframework.web.servlet.ModelAndView;

import com.cep.maintenance.service.MaintenanceService;
import com.cep.maintenance.vo.MaintenanceDefaultVO;
import com.cep.maintenance.vo.MtContractVO;
import com.cep.maintenance.vo.MtWorkVO;
import com.cep.project.vo.ProjectVO;
import com.cmm.util.StringUtil;

@Controller
@RequestMapping("/maintenance")
public class MaintenanceController {
	private static final Logger logger = LoggerFactory.getLogger(MaintenanceController.class);
	@Resource(name="maintenanceService")
	private MaintenanceService service;
	
//	/**
//	 * 
//	  * @Method Name : selectMtList
//	  * @Cdate       : 2020. 11. 4.
//	  * @Author      : aranghoo
//	  * @Modification: 
//	  * @Method Description :유지보수 목록을 조회한다.
//	  * @return
//	  * @throws Exception
//	 */
//	@RequestMapping(value="/mtContractList.do", method = RequestMethod.GET)
//	public String selectMtContractList() throws Exception {
//		
//		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
//		System.out.println("11111111111111");
//		return "maintenance/mtContractList";
//	}
//	
//	@ResponseBody
	@RequestMapping(value="/mtContractList.do")
	public String selectMtContractList(@ModelAttribute("searchVO") MaintenanceDefaultVO searchVO, ModelMap model) throws Exception {
		
		List<?> mtList = null;
		List<?> empList = null;
		try {			
			if(!"".equals(StringUtil.getDefaultValue(searchVO.getFromDate(), ""))){
				searchVO.setFromDate(searchVO.getFromDate().replace("-", ""));
			}
			
			if(!"".equals(StringUtil.getDefaultValue(searchVO.getToDate(), ""))){
				searchVO.setFromDate(searchVO.getToDate().replace("-", ""));
			}
			
			System.out.println("searchVO.getFromDate()===>"+searchVO.getFromDate());
			System.out.println("searchVO.getSearchSaleEmpKey()===>"+searchVO.getSearchSaleEmpKey());
			System.out.println("searchVO.getSearchMtName()===>"+searchVO.getSearchMtName());
			System.out.println("searchVO.getBtnOption()===>"+searchVO.getBtnOption());
			System.out.println("searchVO.getSelectKey()===>"+searchVO.getSelectKey());
			mtList = service.selectMtContractList(searchVO);
			/*System.out.println("mtList.size()=====>"+mtList.size());
			for (int i = 0; i < mtList.size(); i++) {
				MtContractVO vo = (MtContractVO)mtList.get(i);
				System.out.println("vo.getMtAcNm()===>"+vo.getMtAcNm());
			}*/
			empList = service.selectEmployeeList();
			model.put("resultList", mtList);
			model.put("empList", empList);
			model.put("resultCode", "SUCC");
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
			logger.error("mtContractList error", e);
		}
		
		return "maintenance/mtContractList";
	}
	
	@RequestMapping(value="/deleteMtContract.do")
	public String deleteMtContract(@ModelAttribute("searchVO") MaintenanceDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		List<?> mtList = null;
		List<?> empList = null;
		MtContractVO deleteVo = null;
		HashMap<String, String> sessionMap = null;
		try {			
			if(!"".equals(StringUtil.getDefaultValue(searchVO.getFromDate(), ""))){
				searchVO.setFromDate(searchVO.getFromDate().replace("-", ""));
			}
			
			if(!"".equals(StringUtil.getDefaultValue(searchVO.getToDate(), ""))){
				searchVO.setFromDate(searchVO.getToDate().replace("-", ""));
			}
			
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
			
			deleteVo = new MtContractVO();
			deleteVo.setModEmpKey(sessionMap.get("empKey"));
			deleteVo.setMtIntegrateKey(Integer.parseInt(searchVO.getSelectKey()));
			service.deleteMtContract(deleteVo);
			/*System.out.println("mtList.size()=====>"+mtList.size());
			for (int i = 0; i < mtList.size(); i++) {
				MtContractVO vo = (MtContractVO)mtList.get(i);
				System.out.println("vo.getMtAcNm()===>"+vo.getMtAcNm());
			}*/
			mtList = service.selectMtContractList(searchVO);
			empList = service.selectEmployeeList();
			model.put("resultList", mtList);
			model.put("empList", empList);
			model.put("resultCode", "SUCC");
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
			logger.error("mtMainList error", e);
		}
		
		return "maintenance/mtContractList";
	}	
	
	
	@RequestMapping(value="/writeMtBasicInfoView.do")
	public String writeMtBasicInfoView(MtContractVO mtContractVO, ModelMap model) throws Exception {

		List<?> empList = null;
		System.out.println("writeMtBasicInfoView=====");
		try {
			
			
			empList = service.selectEmployeeList();
			model.put("empList", empList);
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
			logger.error("addBasicInfo error", e);
		}
		
		return "maintenance/writeMtBasicInfo";
	}
	
	
	@RequestMapping(value="/writeMtBasicInfo.do", method=RequestMethod.POST)
	public void writeMtBasicInfo(MtContractVO mtContractVO, HttpServletRequest request) {

		HashMap<String, String> sessionMap = null;
		try {
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
			
			mtContractVO.setRegEmpKey(sessionMap.get("empKey"));
		} catch (Exception e) {
			logger.error(null, e);
		}
			/*@ModelAttribute("mtContractVO") MtContractVO mtContractVO, ModelMap model) throws Exception {*/
		System.out.println("writeMtBasicInfo=====");
//		System.out.println("mtContractVO.getMtNm()====="+mtContractVO.getMtNm());
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
	
	
	@RequestMapping(value="/writeMtBackOrderInfoView.do")
	public String writeBackOrderInfoView(MtContractVO mtContractVO, ModelMap model) throws Exception {

		List<?> empList = null;
		System.out.println("writeMtBackOrderInfoView=====");
		try {
			
			
			empList = service.selectEmployeeList();
			model.put("empList", empList);
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
			logger.error("writeBackOrderInfoView error", e);
		}
		
		return "maintenance/writeMtBackOrderInfo";
	}
	
	
	@RequestMapping(value="/writeMtBackOrderInfo.do", method=RequestMethod.POST)
	public void writeMtBackOrderInfo(MtContractVO mtContractVO, HttpServletRequest request) {

		HashMap<String, String> sessionMap = null;
		try {
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
			
			mtContractVO.setRegEmpKey(sessionMap.get("empKey"));
		} catch (Exception e) {
			logger.error(null, e);
		}
			/*@ModelAttribute("mtContractVO") MtContractVO mtContractVO, ModelMap model) throws Exception {*/
		System.out.println("writeMtBasicInfo=====");
//		System.out.println("mtContractVO.getMtNm()====="+mtContractVO.getMtNm());
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
	
	
	@RequestMapping(value="/writeMtPurchaseAmountView.do")
	public String writeMtPurchaseAmountView(MtContractVO mtContractVO, ModelMap model) throws Exception {

		List<?> empList = null;
		System.out.println("writeMtPurchaseAmountView=====");
		try {
			
			
			empList = service.selectEmployeeList();
			model.put("empList", empList);
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
			logger.error("writeBackOrderInfoView error", e);
		}
		
		return "maintenance/writeMtPurchaseAmount";
	}
	
	
	@RequestMapping(value="/writeMtPurchaseAmount.do", method=RequestMethod.POST)
	public void writeMtPurchaseAmount(MtContractVO mtContractVO, HttpServletRequest request) {

		HashMap<String, String> sessionMap = null;
		try {
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
			
			mtContractVO.setRegEmpKey(sessionMap.get("empKey"));
		} catch (Exception e) {
			logger.error(null, e);
		}
			/*@ModelAttribute("mtContractVO") MtContractVO mtContractVO, ModelMap model) throws Exception {*/
		System.out.println("writeMtPurchaseAmount=====");
//		System.out.println("mtContractVO.getMtNm()====="+mtContractVO.getMtNm());
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
	
	@RequestMapping(value="/mtWorkList.do")
	public String selectMtWorkList(@ModelAttribute("searchVO") MaintenanceDefaultVO searchVO, ModelMap model) throws Exception {
		
		List<?> mtList = null;
		List<?> empList = null;
		try {			
			
			if(!"".equals(StringUtil.getDefaultValue(searchVO.getFromDate(), ""))){
				searchVO.setFromDate(searchVO.getFromDate().replace("-", ""));
			}
			
			if(!"".equals(StringUtil.getDefaultValue(searchVO.getToDate(), ""))){
				searchVO.setFromDate(searchVO.getToDate().replace("-", ""));
			}
			
			System.out.println("searchVO.getFromDate()===>"+searchVO.getFromDate());
			System.out.println("searchVO.getToDate()===>"+searchVO.getToDate());
			System.out.println("searchVO.getSearchWorkEmpKey()===>"+searchVO.getSearchWorkEmpKey());
			System.out.println("searchVO.getSearchWorkResult()===>"+searchVO.getSearchWorkResult());
			System.out.println("searchVO.getSearchMtName()===>"+searchVO.getSearchMtName());
			
			
			mtList = service.selectMtWorkList(searchVO);
			System.out.println("mtList.size()=====>"+mtList.size());
			/*for (int i = 0; i < mtList.size(); i++) {
				MtWorkVO vo = (MtWorkVO)mtList.get(i);
				System.out.println("vo.getMtNm()===>"+vo.getMtNm()+"/"+vo.getMtWorkCont());
			}*/
			empList = service.selectEmployeeList();
			model.put("resultList", mtList);
			model.put("empList", empList);
			model.put("resultCode", "SUCC");
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
			logger.error("mtMainList error", e);
		}
		return "maintenance/mtWorkList";
	}
	
	@RequestMapping(value="/deleteMtWork.do")
	public String deleteMtWork(@ModelAttribute("searchVO") MaintenanceDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		List<?> mtList = null;
		List<?> empList = null;
		MtWorkVO deleteVo = null;
		HashMap<String, String> sessionMap = null;
		try {			
			
			if(!"".equals(StringUtil.getDefaultValue(searchVO.getFromDate(), ""))){
				searchVO.setFromDate(searchVO.getFromDate().replace("-", ""));
			}
			
			if(!"".equals(StringUtil.getDefaultValue(searchVO.getToDate(), ""))){
				searchVO.setFromDate(searchVO.getToDate().replace("-", ""));
			}
			
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
			
			deleteVo = new MtWorkVO();
			deleteVo.setModEmpKey(sessionMap.get("empKey"));
			deleteVo.setMtWorkKey(Integer.parseInt(searchVO.getSelectKey()));
			service.deleteMtWork(deleteVo);
			/*System.out.println("mtList.size()=====>"+mtList.size());
			for (int i = 0; i < mtList.size(); i++) {
				MtContractVO vo = (MtContractVO)mtList.get(i);
				System.out.println("vo.getMtAcNm()===>"+vo.getMtAcNm());
			}*/
			mtList = service.selectMtWorkList(searchVO);
			empList = service.selectEmployeeList();
			model.put("resultList", mtList);
			model.put("empList", empList);
			model.put("resultCode", "SUCC");
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
			logger.error("mtMainList error", e);
		}
		
		return "maintenance/mtWorkList";
	}
	
	@RequestMapping(value="/writeMtWorkInfoView.do")
	public String writeMtWorkInfoView(MtWorkVO mtWorkVO,ModelMap model) throws Exception {

		List<?> empList = null;
		System.out.println("writeMtWorkInfoView=====");
		try {
			empList = service.selectEmployeeList();
			model.put("empList", empList);
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
			logger.error("addBasicInfo error", e);
		}
		
		return "maintenance/writeMtWorkInfo";
	}
	
	
	@RequestMapping(value="/writeMtWorkInfo.do", method=RequestMethod.POST)
	public void writeMtWorkInfo(@ModelAttribute("mtContractVO") MtContractVO mtContractVO, ModelMap model) throws Exception {
		System.out.println("writeMtWorkInfo=====");
	}

	@RequestMapping(value="/writeMtWorkOrderInfoView.do")
	public String writeMtWorkOrderInfoView(MtWorkVO mtWorkVO,ModelMap model) throws Exception {

		List<?> empList = null;
		System.out.println("writeMtWorkInfoView=====");
		try {
			empList = service.selectEmployeeList();
			model.put("empList", empList);
		} catch (Exception e) {
			model.put("resultCode", "FAIL");
			logger.error("addBasicInfo error", e);
		}
		
		return "maintenance/writeMtWorkOrderInfo";
	}
	
	
	@RequestMapping(value="/writeMtWorkOrderInfo.do", method=RequestMethod.POST)
	public void writeMtWorkOrderInfo(@ModelAttribute("mtContractVO") MtContractVO mtContractVO, ModelMap model) throws Exception {
		System.out.println("writeMtWorkInfo=====");
	}
	
	
	//////////////////////////////////////////////////////
	@ResponseBody
	@RequestMapping(value = "/selectAcDirectorList.do", method=RequestMethod.POST)
	public Map<String, Object>  selectAcDirectorList(HttpServletRequest request , HttpServletResponse response , @RequestBody String mtAcKey) throws Exception {
      
     String acKey = null;
     List < ? > acDirectorList = null;
     Map<String, Object> modelAndView = null;
     try {
    	 
//    	 acKey = request.getParameter("mtAcKey");
//    	 System.out.println("acKey===>"+acKey);
//    	 System.out.println("mtAcKey===>"+mtAcKey);
//    	
//    	 acKey="1098620738";
         /* Ajax List 리턴을 위해서는 ModelAndView 로 세팅해야함 */
         modelAndView = new HashMap<String, Object>();
     
         acDirectorList =service.selectAcDirectorList(mtAcKey);
         
         System.out.println("acDirectorList.size=====>"+acDirectorList.size());
//         modelAndView.setViewName("jsonView");
         modelAndView.put("result", acDirectorList);
	} catch (Exception e) {
		logger.error("selectAcDirectorList error", e);
	}

    
     return modelAndView; 
	}
	
	@RequestMapping(value="/detail/prodInfo.do")
	public String selectMtDetailProdInfo(MtContractVO mtContractVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "maintenance/detail/prodInfo";
	}
}
