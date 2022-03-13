package com.cep.project.web;

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
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.forecast.service.ForecastService;
import com.cep.forecast.vo.ForecastBiddingFileVO;
import com.cep.forecast.vo.ForecastBiddingVO;
import com.cep.mngProject.order.vo.MngOrderSearchVO;
import com.cep.project.service.ProjectDetailService;
import com.cep.project.vo.ProjectBiddingVO;
import com.cep.project.vo.ProjectBuildVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectContractVO;
import com.cep.project.vo.ProjectGuarantyBondVO;
import com.cep.project.vo.ProjectOrderVO;
import com.cep.project.vo.ProjectVO;
import com.cep.project.vo.ProjectWorkVO;
import com.cmm.config.WorkClassInfo;
import com.cmm.service.ComService;
import com.cmm.service.FileMngService;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.FileVO;
import com.cmm.vo.GuarantyBondVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Controller
@RequestMapping(value="/project/detail")
public class ProjectDetailController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectDetailController.class);
	
	@Resource(name="projectDetailService")
	private ProjectDetailService service;
	
	@Resource(name="forecastService")
	private ForecastService forecastService;
	
	@Resource(name="comService")
	private ComService comService;
	
	@Resource(name="fileMngService")
	private FileMngService fileMngService;
	
	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Value("#{comProps['maxFileCnt']}")
	private String maxFileCnt;	// 허용 파일 개수
	
	@Value("#{comProps['maxFileSize']}")
	private String maxFileSize;	// 허용 파일 사이즈
	
	@Value("#{comProps['fileExtn']}")
	private String fileExtn;		// 허용 파일 확장자
	
	@RequestMapping(value="/main.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewDetailMain(@ModelAttribute("searchVO") ProjectVO projectVO, ModelMap model) throws Exception {
		logger.debug("== pkKey : {}", projectVO.getPjKey());
		List<?> fileResult = null;
		FileVO fileVO = new FileVO();
		
		try
		{
			fileVO.setFileCtKey(projectVO.getPjKey());
			fileVO.setFileWorkClass(WorkClassInfo.PROJECT.getValue().toString());
			
			model.put("pjKey", projectVO.getPjKey());
			
			EgovMap emProject = service.selectProjectDetail(projectVO);
			
			logger.debug("== emProject : {}", emProject);
			
			if(emProject != null)
			{
				//프로젝트 기본정보 조회
				model.put("projectVO", emProject);
			}
			
			//추후 EmployeeService로 이관
			logger.debug("== employee : {}", service.selectEmployeeList());
			model.put("employeeList", service.selectEmployeeList());
			
			fileResult = fileMngService.selectFileList(fileVO);
			model.addAttribute("fileList", fileResult);
			
			model.put("displayUtil", new CepDisplayUtil());
		}catch(Exception e)
		{
			logger.error("{}", e);
			throw e;
		}
		return "project/detail/main";
	}
	
	
	@RequestMapping(value="/updateBasicInfo.do")
	@ResponseBody
	public Map<String, Object> updateBasicInfo(@ModelAttribute("projectVO") ProjectVO projectVO, HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== writePopup ======================");
		logger.debug("== ProjectVO : {}", projectVO);
		logger.debug("====== pjKey : {}", request.getAttribute("pjKey"));
		
		try{
			service.updateBasicInfo(projectVO);
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
	}
	
	
	@RequestMapping(value="/getProjectInfo.do")
	@ResponseBody
	public Map<String, Object> selectProjectInfo(@ModelAttribute("projectVO") ProjectVO projectVO, HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== selectProjectInfo ======================");
		logger.debug("== ProjectVO : {}", projectVO);
		logger.debug("====== pjKey : {}", projectVO.getPjKey());
		
		try{
//			service.selectPjBasicInfo(projectVO);
			EgovMap emProject = service.selectProjectDetail(projectVO);
			logger.debug("{}", emProject);
			returnMap.put("projectVO", emProject);
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
	}
	
	@RequestMapping(value="/biddingMin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewDetailBidding(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*logger.debug("== pkKey : {}", projectVO.getPjKey());
		List<?> fileResult = null;
		FileVO fileVO = new FileVO();
		
		try {
			
			//입찰정보 조회
			EgovMap egmBidding = service.selectBiddingInfo(projectVO);
			
			if(!(egmBidding == null || egmBidding.isEmpty())) {
				projectVO.setBdKey((String)egmBidding.get("bdKey"));
				
				logger.debug("{}\n== bdKey : {}", egmBidding, egmBidding.get("bdKey"));
				
				model.addAttribute("biddingInfo", egmBidding);
			}
			
			//입찰 서류 정보 목록 조회
			model.addAttribute("biddingFileList", service.selectBiddingFileInfo(projectVO));
			
			fileVO.setFileCtKey(projectVO.getPjKey());
			fileVO.setFileWorkClass(projectVO.getWorkClass());
			
			fileResult = fileMngService.selectFileList(fileVO);
			
			//입찰 보증증권 정보 조회
			
			if(egmBidding != null && egmBidding.get("bdGbYn") != null && egmBidding.get("bdGbYn").equals("Y"))
			{
				model.addAttribute("biddingGbInfo", service.selectBiddingGbInfo(projectVO));
			}
			
			
			model.addAttribute("pjKey", projectVO.getPjKey());
			model.addAttribute("displayUtil", new CepDisplayUtil());
			model.addAttribute("fileList", fileResult);*/
			
			
		try {	
			
			List<?> biddingFileList = null;
			List<?> fileResult = null;
			FileVO fileVO = new FileVO();
			String spKey = "";
			
			ForecastBiddingFileVO forecastBiddingFileVO = new ForecastBiddingFileVO();
			
			if(!CepStringUtil.getDefaultValue(service.selectProjectDetail(projectVO).get("spKey").toString(), "").equals("")) {
				spKey = service.selectProjectDetail(projectVO).get("spKey").toString();
			}
			
			model.addAttribute("spKey", spKey);
			
			forecastBiddingFileVO.setSpKey(spKey);
			ForecastBiddingVO biddingVO = forecastService.selectBiddingDetail(forecastBiddingFileVO);
			model.addAttribute("biddingVO", biddingVO);
			
			if(biddingVO != null) {
				forecastBiddingFileVO.setBdKey(biddingVO.getBdKey());
				biddingFileList = forecastService.selectBiddingFileList(forecastBiddingFileVO);
			}
			model.addAttribute("biddingFileList", biddingFileList);
			
			fileVO.setFileCtKey(spKey);
			fileVO.setFileWorkClass(projectVO.getWorkClass());
			
			fileResult = fileMngService.selectFileList(fileVO);
			
			model.addAttribute("biddingInfo", forecastService.selectForecast(forecastBiddingFileVO));
			
			model.put("displayUtil", new CepDisplayUtil());
			model.addAttribute("fileList", fileResult);
			model.addAttribute("maxFileCnt", maxFileCnt);
			model.addAttribute("fileExtn", fileExtn);
			model.addAttribute("maxFileSize", maxFileSize);
			
		} catch(Exception e) {
//			model.put("successYN", "N");
			logger.error("project error", e);
		}
		         
		return "/project/detail/biddingMin";
	}
	
	
	@RequestMapping(value="/biddingDelete.do")
	@ResponseBody
	public Map<String, Object> deleteBidding(@ModelAttribute("projectBiddingVO") ProjectBiddingVO projectBiddingVO, HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug(" ======================= deleteBidding =============================");
		logger.debug(" projectBiddingVO.getPjKey() : {}", projectBiddingVO.getPjKey());
		logger.debug(" projectBiddingVO.getBdKey() : {}", projectBiddingVO.getBdKey());
		
		try {
			HashMap<String, String> sessionMap = null;
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			projectBiddingVO.setRegEmpKey(sessionMap.get("empKey"));
				
			service.deleteBidding(projectBiddingVO);
		
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e ;
		}
		
		return returnMap;
	}
	
	
	@RequestMapping(value="/contractDelete.do")
	@ResponseBody
	public Map<String, Object> deleteContract(@ModelAttribute("projectContractVO") ProjectContractVO projectContractVO, HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug(" ======================= deleteContract =============================");
		logger.debug(" projectContractVO.getPjKey() : {}", projectContractVO.getPjKey());
		logger.debug(" projectContractVO.getCtKey() : {}", projectContractVO.getCtKey());
		
		try {
			HashMap<String, String> sessionMap = null;
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			projectContractVO.setRegEmpKey(sessionMap.get("empKey"));
				
			service.deleteContract(projectContractVO);
		
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e ;
		}
		
		return returnMap;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/orderDelete.do")
	@ResponseBody
	public Map<String, Object> deleteOrder(@ModelAttribute("projectOrderVO") ProjectOrderVO projectOrderVO, HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int result = 0;
		
		logger.debug(" ======================= deleteOrder =============================");
		logger.debug(" projectOrderVO.getPjKey()      : {}", projectOrderVO.getPjKey());
		logger.debug(" projectOrderVO.getPjOrderKey() : {}", projectOrderVO.getPjOrderKey());
		
		try {
			HashMap<String, String> sessionMap = null;
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			projectOrderVO.setRegEmpKey(sessionMap.get("empKey"));
			result = service.isMappedOrder(projectOrderVO);
			if(result != 0) {
				returnMap.put("isMapped", "TRUE");
			} else {
				service.deleteOrder(projectOrderVO);
				returnMap.put("isMapped", "FALSE");
			}

			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			returnMap.put("successYN", "N");
			logger.error("{}", e);
			throw e ;
		}
		
		return returnMap;
	}
	
	
	
	@RequestMapping(value="/installBaseDelete.do")
	@ResponseBody
	public Map<String, Object> deleteInstallBase(@ModelAttribute("projectBuildVO") ProjectBuildVO projectBuildVO, HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug(" ======================= deleteInstallBase =============================");
		logger.debug(" projectBuildVO.getPjKey()  : {}", projectBuildVO.getPjKey());
		logger.debug(" projectBuildVO.getInbSeq() : {}", projectBuildVO.getInbSeq());
		
		try {
			HashMap<String, String> sessionMap = null;
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			projectBuildVO.setRegEmpKey(sessionMap.get("empKey"));
				
			service.deleteInstallBase(projectBuildVO);
		
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e ;
		}
		
		return returnMap;
	}
	
	@RequestMapping(value="/workDelete.do")
	@ResponseBody
	public Map<String, Object> deleteWork(@ModelAttribute("projectWorkVO") ProjectWorkVO projectWorkVO, HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug(" ======================= deleteWork =============================");
		logger.debug(" projectWorkVO.getPjKey()  : {}", projectWorkVO.getPjKey());
		logger.debug(" projectWorkVO.getPjWorkSeq() : {}", projectWorkVO.getPjWorkSeq());
		
		try {
			HashMap<String, String> sessionMap = null;
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			projectWorkVO.setRegEmpKey(sessionMap.get("empKey"));
				
			service.deleteWork(projectWorkVO);
		
			
		} catch(Exception e) {
			logger.error("{}", e);
			throw e ;
		}
		
		return returnMap;
	}
	
	
	@RequestMapping(value="/contractMin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewDetailContract(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model) throws Exception {
		
		logger.debug("=============== viewDetailContract ======================");
		logger.debug("== ProjectVO.getPjKey() : {}", projectVO.getPjKey());
				
		try{
			
			model.addAttribute("contractInfo", service.selectContractInfo(projectVO));
			model.addAttribute("displayUtil", new CepDisplayUtil());
			model.addAttribute("projectInfo", projectVO);
			model.addAttribute("salesList", service.selectSalesDetailList(projectVO));
			
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		
		return "/project/detail/contractMin";
	}
	
	@RequestMapping(value="/contractMin2.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewDetailContract2(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model) throws Exception {
		
		logger.debug("=============== viewDetailContract ======================");
		logger.debug("== ProjectVO.getPjKey() : {}", projectVO.getPjKey());
		
		try{
			
			model.addAttribute("projectInfo", projectVO);
			model.addAttribute("displayUtil", new CepDisplayUtil());
			
			//수금정보 조회
			model.addAttribute("salesList", service.selectSalesDetailList(projectVO));
		
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "/project/detail/contractMin2";
	}
	
	@RequestMapping(value="/orderMin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewDetailOrderMin(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model) throws Exception {
		
		logger.debug("=============== viewDetailOrderMin ======================");
		logger.debug("== ProjectVO : {}", projectVO);
		
		try{
			model.addAttribute("displayUtil", new CepDisplayUtil());
			model.addAttribute("orderList", service.selectOrderList(projectVO));
			model.addAttribute("projectInfo", projectVO);
			
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "/project/detail/orderMin";
	}
	
	@RequestMapping(value="/selectOrderProductList.do")
	@ResponseBody
	public  Map<String, Object> selectOrderProductList(@ModelAttribute("orderSearchVO")MngOrderSearchVO orderSearchVO , HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== viewDetailOrderMin ======================");
		logger.debug("== orderSearchVO.getOrderKey() : {}", orderSearchVO.getOrderKey() );
		
		try{
			
			returnMap.put("productList", service.selectOrderProductList(orderSearchVO));
			
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return returnMap;
	}
	
	
	@RequestMapping(value="/orderMin2.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewDetailOrderMin2(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model) throws Exception {
		
		logger.debug("=============== viewDetailOrderMin2 ======================");
		logger.debug("== ProjectVO : {}", projectVO);
				
		return "/project/detail/orderMin2";
	}
	
	@RequestMapping(value="/workingMin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewDetailWorkingMin(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model) throws Exception {
		
		logger.debug("=============== viewDetailWorkingMin ======================");
		logger.debug("== ProjectVO.getPjKey() : {}", projectVO.getPjKey());
		
		try{
			
			model.addAttribute("insertBaseList", service.selectInstallBaseList(projectVO));
			model.addAttribute("projectInfo", projectVO);
			
		}catch(Exception e){
			logger.error("{}", e);
		}
				
		return "/project/detail/workingMin";
	}
	
	@RequestMapping(value="/workingMin2.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewDetailWorkingMin2(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model) throws Exception {
		
		logger.debug("=============== viewDetailWorkingMin2 ======================");
		logger.debug("== ProjectVO.getPjKey() : {}", projectVO.getPjKey());
		
		try{
			
			model.addAttribute("displayUtil", new CepDisplayUtil());
			model.addAttribute("workList", service.selectWorkList(projectVO));
			model.addAttribute("projectInfo", projectVO);
			
		}catch(Exception e){
			logger.error("{}", e);
		}
				
		return "/project/detail/workingMin2";
	}
	
	@RequestMapping(value="/endMin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewDetailEndMin(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model) throws Exception {
		
		logger.debug("=============== viewDetailEndMin ======================");
		logger.debug("== ProjectVO.getPjKey() : {}", projectVO.getPjKey());
		
		List<?> fileResult = null;
		FileVO fileVO = new FileVO();
		
		try{
			
			fileVO.setFileCtKey(projectVO.getPjKey());
			fileVO.setFileWorkClass(projectVO.getWorkClass());
			
			fileResult = fileMngService.selectFileList(fileVO);
			
			model.addAttribute("fileList", fileResult);
			model.addAttribute("displayUtil", new CepDisplayUtil());
			model.addAttribute("detailInfo",  service.selectProjectDetail(projectVO));
			model.addAttribute("projectInfo", projectVO);
			
		}catch(Exception e){
			logger.error("{}", e);
		}
				
		return "/project/detail/endMin";
	}
	
	
	
	@RequestMapping(value="/selectGuarantyBondList.do")
	@ResponseBody
	public  Map<String, Object> selectGuarantyBondList(@ModelAttribute("projectContractSalesVO")ProjectContractSalesVO projectContractSalesVO , HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== selectGuarantyBondList ======================");
		logger.debug("== projectContractSalesVO.getSalesKey() : {}", projectContractSalesVO.getSalesKey() );
		
		try{
			returnMap.put("guarantyBondList", service.selectGuarantyBondList(projectContractSalesVO));
			
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return returnMap;
	}
	
	@RequestMapping(value="/viewStockPublishBD.do")
	public String viewStockPublishBD(@ModelAttribute("projectVO")ProjectVO projectVO , ModelMap model, HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		logger.debug("=============== viewStockPublishHJ ======================");
		logger.debug("== projectVO.getPjKey() : {}", projectVO.getPjKey() );
		
		try{
			//보증증권 정보 조회 - 고객사 명, 프로젝트 명, 계약금액
			model.addAttribute("displayUtil", new CepDisplayUtil());
			model.addAttribute("gbInfo",  service.selectBdGbInfo(projectVO));
			
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "/project/guaranty/stockPublishBD";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/requestBiddingGb.do")
	@ResponseBody
	public  Map<String, Object> requestBiddingGb(@ModelAttribute("projectBiddingVO")ProjectBiddingVO projectBiddingVO , HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== requestBiddingGb ======================");
		logger.debug("== projectBiddingVO.getBdKey()          : {}", projectBiddingVO.getBdKey());
		logger.debug("== projectBiddingVO.getBdGbBdAmount()   : {}", projectBiddingVO.getBdGbBdAmount());
		logger.debug("== projectBiddingVO.getBdGbDay()        : {}", projectBiddingVO.getBdGbDay());
		logger.debug("== projectBiddingVO.getBdGbRate()       : {}", projectBiddingVO.getBdGbRate());
		logger.debug("== projectBiddingVO.getBdGbAmount()     : {}", projectBiddingVO.getBdGbAmount());
		
		HashMap<String, String> sessionMap = null;
		
		try{
			
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			projectBiddingVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.requestBiddingGb(projectBiddingVO);
			
			returnMap.put("successYN", "Y");
			
		}catch(Exception e){
			logger.error("{}", e);
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/endBiddingGb.do")
	@ResponseBody
	public  Map<String, Object> endBiddingGb(@ModelAttribute("projectBiddingVO")ProjectBiddingVO projectBiddingVO , HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== endBiddingGb ======================");
		logger.debug("== projectBiddingVO.getBdKey()          : {}", projectBiddingVO.getBdKey());
		logger.debug("== projectBiddingVO.getBdGbBdAmount()   : {}", projectBiddingVO.getBdGbBdAmount());
		logger.debug("== projectBiddingVO.getBdGbDay()        : {}", projectBiddingVO.getBdGbDay());
		logger.debug("== projectBiddingVO.getBdGbRate()       : {}", projectBiddingVO.getBdGbRate());
		logger.debug("== projectBiddingVO.getBdGbBdAmount()   : {}", projectBiddingVO.getBdGbBdAmount());

		logger.debug("== projectBiddingVO.getBdGbFinishDt()   : {}", projectBiddingVO.getBdGbFinishDt());
		logger.debug("== projectBiddingVO.getBdGbAmount()     : {}", projectBiddingVO.getBdGbAmount());
		
		HashMap<String, String> sessionMap = null;
		
		try{
			
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			projectBiddingVO.setRegEmpKey(sessionMap.get("empKey"));
			
			returnMap = service.endBiddingGb(projectBiddingVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/modifyBiddingGb.do")
	@ResponseBody
	public  Map<String, Object> modifyBiddingGb(@ModelAttribute("projectBiddingVO")ProjectBiddingVO projectBiddingVO , HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== modifyBiddingGb ======================");
		logger.debug("== projectBiddingVO.getBdKey()          : {}", projectBiddingVO.getBdKey());
		logger.debug("== projectBiddingVO.getBdGbBdAmount()   : {}", projectBiddingVO.getBdGbBdAmount());
		logger.debug("== projectBiddingVO.getBdGbDay()        : {}", projectBiddingVO.getBdGbDay());
		logger.debug("== projectBiddingVO.getBdGbRate()       : {}", projectBiddingVO.getBdGbRate());
		logger.debug("== projectBiddingVO.getBdGbBdAmount()   : {}", projectBiddingVO.getBdGbBdAmount());

		logger.debug("== projectBiddingVO.getBdGbFinishDt()   : {}", projectBiddingVO.getBdGbFinishDt());
		logger.debug("== projectBiddingVO.getBdGbAmount()     : {}", projectBiddingVO.getBdGbAmount());
		
		HashMap<String, String> sessionMap = null;
		
		try{
			
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			projectBiddingVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.modifyBiddingGb(projectBiddingVO);
			
			returnMap.put("successYN", "Y");
			
		}catch(Exception e){
			logger.error("{}", e);
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	
	@RequestMapping(value="/viewStockPublishCT.do")
	public String viewStockPublishCT(@ModelAttribute("guarantyBondVO")GuarantyBondVO guarantyBondVO , ModelMap model, HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		logger.debug("=============== viewStockPublishCT ======================");
		logger.debug("== guarantyBondVO.getGbKey() : {}", guarantyBondVO.getGbKey() );
		
		try{
			//보증증권 정보 조회 - 고객사 명, 프로젝트 명, 계약금액
			model.addAttribute("displayUtil", new CepDisplayUtil());
			model.addAttribute("gbInfo",  service.selectGuarantyBondInfo(guarantyBondVO));
			
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		return "/project/guaranty/stockPublishCT";
	}
	
	@RequestMapping(value="/viewStockPublishHJ.do")
	public String viewStockPublishHJ(@ModelAttribute("guarantyBondVO")GuarantyBondVO guarantyBondVO , ModelMap model, HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		logger.debug("=============== viewStockPublishHJ ======================");
		logger.debug("== guarantyBondVO.getGbKey() : {}", guarantyBondVO.getGbKey() );
		
		try{
			//보증증권 정보 조회 - 고객사 명, 프로젝트 명, 계약금액
			model.addAttribute("displayUtil", new CepDisplayUtil());
			model.addAttribute("gbInfo",  service.selectGuarantyBondInfo(guarantyBondVO));
			
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		return "/project/guaranty/stockPublishHJ";
	}
	

	@RequestMapping(value="/viewStockPublishSK.do")
	public String viewStockPublishSK(@ModelAttribute("guarantyBondVO")GuarantyBondVO guarantyBondVO , ModelMap model, HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		logger.debug("=============== viewStockPublishHJ ======================");
		logger.debug("== guarantyBondVO.getGbKey() : {}", guarantyBondVO.getGbKey() );
		
		try{
			//보증증권 정보 조회 - 고객사 명, 프로젝트 명, 계약금액
			model.addAttribute("displayUtil", new CepDisplayUtil());
			model.addAttribute("gbInfo",  service.selectGuarantyBondInfo(guarantyBondVO));
			
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		
		return "/project/guaranty/stockPublishSK";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/requestGuarantyBond.do")
	@ResponseBody
	public  Map<String, Object> requestGuarantyBond(@ModelAttribute("guarantyBondVO")ProjectGuarantyBondVO guarantyBondVO , HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== requestGuarantyBondp ======================");
		logger.debug("== guarantyBondVO.getGbKey()     : {}", guarantyBondVO.getGbKey());
		logger.debug("== guarantyBondVO.getGbStartDt() : {}", guarantyBondVO.getGbStartDt());
		logger.debug("== guarantyBondVO.getGbEndDt()   : {}", guarantyBondVO.getGbEndDt());
		
		HashMap<String, String> sessionMap = null;
		
		try{
			
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			guarantyBondVO.setRegEmpKey(sessionMap.get("empKey"));
			
			returnMap = service.requestGuarantyBond(request, guarantyBondVO);
			
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return returnMap;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/endGuarantyBond.do")
	@ResponseBody
	public  Map<String, Object> endGuarantyBond(@ModelAttribute("guarantyBondVO")ProjectGuarantyBondVO guarantyBondVO , HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== endGuarantyBond ======================");
		logger.debug("== guarantyBondVO.getGbKey()       : {}", guarantyBondVO.getGbKey());
		logger.debug("== guarantyBondVO.getGbPublishDt() : {}", guarantyBondVO.getGbPublishDt());
		logger.debug("== guarantyBondVO.getGbAmount()    : {}", guarantyBondVO.getGbAmount());
		
		HashMap<String, String> sessionMap = null;
		
		try {
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			guarantyBondVO.setRegEmpKey(sessionMap.get("empKey"));
			
			returnMap = service.endGuarantyBond(request, guarantyBondVO);
			
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return returnMap;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/modifyGuarantyBond.do")
	@ResponseBody
	public  Map<String, Object> modifyGuarantyBond(@ModelAttribute("guarantyBondVO")GuarantyBondVO guarantyBondVO , HttpServletRequest request, HttpServletResponse respone) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== modifyGuarantyBond ======================");
		logger.debug("== guarantyBondVO.getGbKey()       : {}", guarantyBondVO.getGbKey());
		logger.debug("== guarantyBondVO.getGbPublishDt() : {}", guarantyBondVO.getGbPublishDt());
		logger.debug("== guarantyBondVO.getGbAmount()    : {}", guarantyBondVO.getGbAmount());
		
		HashMap<String, String> sessionMap = null;
		
		try{
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			guarantyBondVO.setRegEmpKey(sessionMap.get("empKey"));
			
			service.modifyGuarantyBond(guarantyBondVO);
			
			returnMap.put("successYN", "Y");
			
		}catch(Exception e){
			logger.error("{}", e);
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
}