package com.cep.project.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cep.forecast.service.ForecastService;
import com.cep.forecast.vo.ForecastVO;
import com.cep.main.service.MainService;
import com.cep.mngProject.bill.service.MngProjectBillService;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.project.service.ProjectService;
import com.cep.project.vo.ProjectBiddingFileVO;
import com.cep.project.vo.ProjectBiddingVO;
import com.cep.project.vo.ProjectBuildVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectContractVO;
import com.cep.project.vo.ProjectGuarantyBondVO;
import com.cep.project.vo.ProjectOrderVO;
import com.cep.project.vo.ProjectPurchaseVO;
import com.cep.project.vo.ProjectVO;
import com.cep.project.vo.ProjectWorkVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.service.ComService;
import com.cmm.service.FileMngService;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.FileVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
@RequestMapping("/project")
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Resource(name="projectService")
	private ProjectService service;
	
	@Resource(name="comService")
	private ComService comService;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name="forecastService")
	private ForecastService forecastService;
	
	@Resource(name="mngProjectBillService")
	private MngProjectBillService mngProjectBillService;
	
	@Resource(name="fileMngService")
	private FileMngService fileMngService;
	
	@Value("#{comProps['maxFileCnt']}")
	private String maxFileCnt;	// 허용 파일 개수
	
	@Value("#{comProps['maxFileSize']}")
	private String maxFileSize;	// 허용 파일 사이즈
	
	@Value("#{comProps['fileExtn']}")
	private String fileExtn;		// 허용 파일 확장자
	
	@RequestMapping(value="/list.do", method={RequestMethod.GET, RequestMethod.POST})
	public String selectProject(@ModelAttribute("searchVO") ProjectVO searchVO, ModelMap model) throws Exception {
		
		String toDay = null;
		
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		// 검색 정보 저장.
		model.addAttribute("searchVO", searchVO);
		
		toDay = CepDateUtil.getToday(null);		
		if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getSearchFromDt(), ""))){
			searchVO.setSearchFromDt(searchVO.getSearchFromDt().replace("-", ""));
		} else {
			searchVO.setSearchFromDt(CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6));
		}
		
		if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getSearchToDt(), ""))){
			searchVO.setSearchToDt(searchVO.getSearchToDt().replace("-", ""));
		} else {
			searchVO.setSearchToDt(toDay);
		}
		
		List<?> projectList = service.selectProjectList(searchVO);
		model.addAttribute("resultList", projectList);
		
		int totCnt = service.selectProjectListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		model.put("searchFromDt", CepDateUtil.convertDisplayFormat(searchVO.getSearchFromDt(), null, null));
		model.put("searchToDt", CepDateUtil.convertDisplayFormat(searchVO.getSearchToDt(), null, null));
		
		model.put("displayUtil", new CepDisplayUtil());
		
		return "project/list";
	}
	
	@RequestMapping(value = "/searchList.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectProjectList(@RequestBody ProjectVO searchVO, ModelMap model) throws Exception {
		
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<?> projectList = service.selectProjectList(searchVO);
		returnMap.put("resultList", projectList);
		
		int totCnt = service.selectProjectListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		returnMap.put("paginationInfo", paginationInfo);

		returnMap.put("successYN", "Y");
		
		model.put("displayUtil", new CepDisplayUtil());
		
		return returnMap;
	}
	
	
	@RequestMapping(value="/detail/bidding.do", method={RequestMethod.GET, RequestMethod.POST})
	@Transactional
	public String selectProjectDetailBd(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model) throws Exception {
		/*Map<String, Object> result = null;
		Map<String, Object> fileResult = null;
		FileVO fileVO = new FileVO();
		
		try {
			result = service.selectBiddingDetail(projectVO);
			
			// 프로젝트 관리키. 추후 수정 필요
			fileVO.setFileCtKey("PJ210065");
			fileVO.setFileCtKey(projectVO.getPjKey());
			fileResult = service.selectFileList(fileVO);
			if(fileResult == null) {
				fileResult = new HashMap<String, Object>();
				fileResult.put("atchFileCnt", 0);
			}
			
			model.addAttribute("resultList", result);
			model.addAttribute("fileList", fileResult);
			model.addAttribute("maxFileCnt", maxFileCnt);
			model.addAttribute("fileExtn", fileExtn);		
			model.addAttribute("maxFileSize", maxFileSize);	
			model.put("successYN", "Y");
		} catch(Exception e) {
			model.put("successYN", "N");
			logger.error("project error", e);
		}*/
		
		return "project/detail/bidding";
	}
	
	@RequestMapping(value="/detail/contract.do")
	public String selectProjectDetailCt(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/detail/contract";
	}
	
	@RequestMapping(value="/detail/order.do")
	public String selectProjectDetailOd(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/detail/order";
	}
	
	@RequestMapping(value="/write/project.do")
	public String addProject(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/write/project";
	}
	
	@RequestMapping(value="/write/basicInfo.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewAddBasicInfo(HttpServletRequest request, ProjectVO projectVO, ModelMap model) throws Exception {
		FileVO fileVO = new FileVO();
		List<?> fileResult = null;
		
		String pjKey = projectVO.getPjKey();
		model.addAttribute("pjKey", pjKey);
		
		List<?> projectList = service.selectProjectDetail(pjKey);
		model.addAttribute("resultList", projectList);
		
		List<?> empList = comService.selectEmployeeList();
		model.addAttribute("empList", empList);
		
		model.put("displayUtil", new CepDisplayUtil());
		
		fileVO.setFileCtKey(projectVO.getPjKey());
		fileVO.setFileWorkClass(projectVO.getWorkClass());
		
		fileResult = fileMngService.selectFileList(fileVO);
		
		model.addAttribute("projectVO", projectVO);
		model.addAttribute("fileList", fileResult);
		model.addAttribute("maxFileCnt", maxFileCnt);
		model.addAttribute("fileExtn", fileExtn);		
		model.addAttribute("maxFileSize", maxFileSize);	
		
		return "project/write/basicInfo";
	}
	
	@RequestMapping(value="/insert/basicInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addBasicInfo(HttpServletRequest request, @RequestBody ProjectVO projectVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.insertBasicInfo(request, projectVO);
		
		return returnMap;
	}
	
	@RequestMapping(value="/update/basicInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateBasicInfo(HttpServletRequest request, @RequestBody ProjectVO projectVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.updateBasicInfo(request, projectVO);
		
		return returnMap;
	}
	
	@RequestMapping(value="/deleteProject.do", method=RequestMethod.POST)
	public String deleteProject(HttpServletRequest request, @ModelAttribute("searchVO") ProjectVO searchVO, ModelMap model) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.deleteProject(request, searchVO);
		
		model.put("resultMap", returnMap);
		
		return "project/list";
	}
	
	@RequestMapping(value="/write/biddingInfo.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewAddBiddingInfo(HttpServletRequest request, ProjectBiddingFileVO projectBiddingFileVO, ModelMap model) throws Exception {
		
		List<?> biddingFileList = null;
		List<?> fileResult = null;
		FileVO fileVO = new FileVO();
		
		String pjKey = projectBiddingFileVO.getPjKey();
		model.addAttribute("pjKey", pjKey);
		
		ProjectBiddingVO biddingVO = service.selectBiddingDetail(projectBiddingFileVO);
		model.addAttribute("biddingVO", biddingVO);
		
		if(biddingVO != null) {
			projectBiddingFileVO.setBdKey(biddingVO.getBdKey());
			biddingFileList = service.selectBiddingFileList(projectBiddingFileVO);
		}
		model.addAttribute("biddingFileList", biddingFileList);
		
		fileVO.setFileCtKey(pjKey);
		fileVO.setFileWorkClass(projectBiddingFileVO.getWorkClass());
		
		fileResult = fileMngService.selectFileList(fileVO);
		
		model.put("displayUtil", new CepDisplayUtil());
		model.addAttribute("fileList", fileResult);
		model.addAttribute("maxFileCnt", maxFileCnt);
		model.addAttribute("fileExtn", fileExtn);		
		model.addAttribute("maxFileSize", maxFileSize);	
		
		return "project/write/biddingInfo";
	}
	
	@RequestMapping(value = "/insert/biddingInfo.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> addBiddingInfo(HttpServletRequest request, @RequestBody ProjectBiddingVO projectBiddingVO) throws Exception {
		Map<String, Object> returnMap = null;
		returnMap = service.insertBiddingInfo(request, projectBiddingVO);
		
	   	return returnMap;
	}
	
	@RequestMapping(value = "/update/biddingInfo.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateBiddingInfo(MultipartHttpServletRequest multiRequest) throws Exception {
		Map<String, Object> returnMap = null;
		returnMap = service.updateBiddingInfo(multiRequest);
		
	   	return returnMap;
	}
	
	@RequestMapping(value="/insert/contractInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addContractInfo(HttpServletRequest request, @RequestBody ProjectContractSalesVO projectContractSalesVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int listCnt = projectContractSalesVO.getProjectContractSalesVOList().size();
		
		for(int i = 0; i < listCnt; i++) {
			if("".equals(CepStringUtil.getDefaultValue(projectContractSalesVO.getProjectContractSalesVOList().get(i).getSalesKey(), ""))) {
				projectContractSalesVO.getProjectContractSalesVOList().get(i).setSalesKey(comService.makePrimaryKey(PrimaryKeyType.SALES_DETAIL));
			} 
		}
		
		if("".equals(CepStringUtil.getDefaultValue(projectContractSalesVO.getCtKey(), ""))) {
			projectContractSalesVO.setCtKey(comService.makePrimaryKey(PrimaryKeyType.PROJECT_CONTRACT));
		}
		
		returnMap = service.insertContractInfo(request, projectContractSalesVO);
		
		return returnMap;
	}
	
	@RequestMapping(value="/write/contractInfo.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewAddContractInfo(HttpServletRequest request, ProjectContractSalesVO projectContractSalesVO, ModelMap model) throws Exception {
		
		model.addAttribute("pjKey", projectContractSalesVO.getPjKey());
		
		ProjectContractVO contractVO = service.selectContractDetail(projectContractSalesVO.getPjKey());
		model.addAttribute("contractVO", contractVO);
		
		List<?> salesList = service.selectSalesList(projectContractSalesVO.getPjKey());
		model.addAttribute("salesList", salesList);
		
		MngProjectBillSearchVO mngProjectBillSearchVO = new MngProjectBillSearchVO();
		mngProjectBillSearchVO.setPjKey(projectContractSalesVO.getPjKey());
		List<EgovMap> sdBillList = mngProjectBillService.selectSdBillList(mngProjectBillSearchVO);
		model.addAttribute("sdBillList", sdBillList);
		
		model.put("displayUtil", new CepDisplayUtil());
		
		return "project/write/contractInfo";
	}
	
	@RequestMapping(value="/insert/guarantyInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addGuarantyInfo(HttpServletRequest request, @RequestBody ProjectGuarantyBondVO guarantyBondVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.insertGuarantyInfo(request, guarantyBondVO);
		
		return returnMap;
	}
	
	@RequestMapping(value="/write/guarantyInfo.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewAddGuarnatyInfo(HttpServletRequest request, ProjectVO projectVO, ModelMap model) throws Exception {
		
		ProjectContractVO ctVO = service.selectContractDetail(projectVO.getPjKey());
		List<?> salesList = service.selectSalesList(projectVO.getPjKey());
		List<?> guarantyList = service.selectGuarantyList(projectVO.getPjKey());
		
		model.addAttribute("pjKey", projectVO.getPjKey());
		model.addAttribute("ctVO", ctVO);
		model.addAttribute("salesList", salesList);
		model.addAttribute("guarantyList", guarantyList);
		
		model.put("displayUtil", new CepDisplayUtil());
		
		return "project/write/guarantyInfo";
	}
	
	// 보증 증권 등록 ajax 방식
	/*@RequestMapping(value="/select/guarantyInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public List<SalesVO> selectGuarantyInfo(@RequestParam(value="salesKeyList[]") List<String> salesKeyList) throws Exception {
		
		List<SalesVO> salesList = new ArrayList<SalesVO>();
		
		for(String salesKey : salesKeyList) {
			SalesVO salesVO = new SalesVO();
			salesVO = comService.selectSalesGuarantyDetail(salesKey);
			
			salesList.add(salesVO);
        }
		
		return salesList;
	}*/
	
	@RequestMapping(value="/write/orderInfo.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewAddOrderInfo(HttpServletRequest request, ProjectOrderVO orderVO, ModelMap model) throws Exception {
		
		ProjectOrderVO returnVO = null;
		
		List<?> orderSelectBox = null;
		List<?> acDirectorList = null;
		int listCount = 0;
		List salesList = null;
		List<Map<String, Object>> listMap = null;
		ProjectPurchaseVO purchaseVO = new ProjectPurchaseVO();
		
		orderVO.setOrderCtFkKey(orderVO.getPjKey());
		
		salesList = service.selectSalesList(orderVO.getPjKey());
		listMap = salesList;
		
		orderSelectBox = service.selectOrderSelectBoxList(orderVO.getOrderCtFkKey());			
		if(orderSelectBox != null){
			orderVO.setSaveCnt(orderSelectBox.size());
		}
		
		//발주 정보를 조회한다.
		if(!"".equals(CepStringUtil.getDefaultValue(orderVO.getSelectKey(), ""))){
			returnVO = service.selectOrderDetail(orderVO.getSelectKey());
			purchaseVO.setBuyOrderFkKey(orderVO.getSelectKey());
			purchaseVO = service.selectPurchaseDetail(purchaseVO);
			
			if(null != returnVO){
				returnVO.setSelectKey(orderVO.getSelectKey());
				if(returnVO.getOrderProductVOList()!=null && returnVO.getOrderProductVOList().size()>1){
					listCount = returnVO.getOrderProductVOList().size();
				}
				acDirectorList =service.selectAcDirectorList(returnVO.getOrderAcKey());
			}
		} else {
			returnVO = orderVO;
		}
		
		model.put("pjKey", orderVO.getPjKey());
		model.put("orderSelectBoxList", orderSelectBox);
		model.put("displayUtil", new CepDisplayUtil());
		model.put("orderVO", returnVO);
		model.put("purchaseVO", purchaseVO);
		model.put("listCount", listCount);
		model.put("acDirectorList", acDirectorList);
		
		return "project/write/orderInfo";
	}
	
	/**
	 * 
	  * @Method Name : addOrderInfo
	  * @Cdate       : 2021. 01. 22.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :프로젝트 발주정보 등록, 수정
	  * @param request
	  * @param orderVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/insert/orderInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addOrderInfo(HttpServletRequest request, @RequestBody ProjectOrderVO orderVO, ModelMap model) throws Exception {
		Map<String, Object> returnMap = new HashMap<>();
		String orderKey = null;
		
		try {
			orderKey = service.insertOrderInfo(request, orderVO);
			
			returnMap.put("successYN", "Y");
			returnMap.put("orderKey", orderKey);
		} catch (Exception e) {
			returnMap.put("successYN", "N");
			logger.error(null, e);
		}
		
		return returnMap;
	}
	
	/**
	 * 
	  * @Method Name : selectOrderInfo
	  * @Cdate       : 2021. 01. 28.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :프로젝트 발주정보 상세 정보 조회
	  * @param request
	  * @param orderVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/select/orderDetail.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectOrderInfo(HttpServletRequest request, @RequestBody ProjectOrderVO orderVO) throws Exception {
		ProjectOrderVO returnVO = null;
		List < ? > acDirector = null;
		Map<String, Object> returnMap = new HashMap<>();
		
		try {
			//발주 정보를 조회한다.
			if(!"".equals(CepStringUtil.getDefaultValue(orderVO.getSelectKey(), ""))){
				returnVO = service. selectOrderDetail(orderVO.getSelectKey());
				if(null != returnVO){
					returnVO.setSelectKey(orderVO.getSelectKey());
					acDirector =service.selectAcDirector(Integer.parseInt(returnVO.getOrderAcDirectorKey()));
				}
			} else {
				returnVO = orderVO;
			}
			
			returnMap.put("orderVO", returnVO);
			returnMap.put("acDirector", acDirector);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		
		return returnMap;
	}
	
	/**
	 * 
	  * @Method Name : deleteOrderInfo
	  * @Cdate       : 2021. 02. 10.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :프로젝트 발주정보 거래처별 삭제
	  * @param orderVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/delete/orderInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteOrderInfo(HttpServletRequest request, @RequestBody ProjectOrderVO orderVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			returnMap = service.deleteOrderInfo(request, orderVO);
			returnMap.put("pjKey", orderVO.getOrderCtFkKey());
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;
	}
	
	/**
	 * 
	  * @Method Name : selectAcDirectorList
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :거래처 담당자 정보 조회(Selectbox용)
	  * @param request
	  * @param response
	  * @param acKey
	  * @return
	  * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/selectAcDirectorList.do", method=RequestMethod.POST)
	public Map<String, Object>  selectAcDirectorList(HttpServletRequest request , HttpServletResponse response , @RequestBody String acKey) throws Exception {
      
	     List < ? > acDirectorList = null;
	     Map<String, Object> modelAndView = null;
	     try {
	         modelAndView = new HashMap<String, Object>();
	         acDirectorList =service.selectAcDirectorList(acKey);
	         modelAndView.put("acDirectorList", acDirectorList);
		} catch (Exception e) {
			logger.error("selectAcDirectorList error", e);
		}
	     return modelAndView; 
	}
	
	@RequestMapping(value="/write/buildInfo.do")
	public String viewAddBuildInfo(HttpServletRequest request, ProjectBuildVO buildVO, ModelMap model) throws Exception {
		
		String pjKey = buildVO.getPjKey();
		int inbSeq = buildVO.getInbSeq();
		
		List<?> buildInfo = service.selectBuildDetail(buildVO);
		
		model.addAttribute("pjKey", pjKey);
		model.addAttribute("resultList", buildInfo);
		
		model.put("displayUtil", new CepDisplayUtil());
		
		return "project/write/buildInfo";
	}
	
	@RequestMapping(value="/insert/buildInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addBuildInfo(HttpServletRequest request, @RequestBody ProjectBuildVO buildVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.insertBuildInfo(request, buildVO);
		
		return returnMap;
	}
	
	@RequestMapping(value="/write/workInfo.do")
	public String viewAddWorkInfo(HttpServletRequest request, ProjectWorkVO workVO, ModelMap model) throws Exception {
		
		String pjKey = workVO.getPjKey();
		int workSeq = workVO.getPjWorkSeq();
		
		List<?> workInfo = service.selectWorkDetail(workVO);
		
		model.addAttribute("pjKey", pjKey);
		model.addAttribute("resultList", workInfo);
		
		model.put("displayUtil", new CepDisplayUtil());
		
		return "project/write/workInfo";
	}
	
	@RequestMapping(value="/insert/workInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addWorkInfo(HttpServletRequest request, @RequestBody ProjectWorkVO workVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.insertWorkInfo(request, workVO);
		
		return returnMap;
	}
	
	@RequestMapping(value="/write/finishInfo.do")
	public String addFinishInfo(HttpServletRequest request, ProjectVO projectVO, ModelMap model) throws Exception {
		
		List<?> finishInfo = service.selectProjectDetail(projectVO.getPjKey());
		model.addAttribute("resultList", finishInfo);
		
		model.addAttribute("pjKey", projectVO.getPjKey());
		model.put("displayUtil", new CepDisplayUtil());
		
		return "project/write/finishInfo";
	}
	
	@RequestMapping(value="/write/loseInfo.do")
	public String addLoseInfo(HttpServletRequest request, ProjectVO projectVO, ModelMap model) throws Exception {
		
		List<?> pjInfo = service.selectProjectDetail(projectVO.getPjKey());
		model.addAttribute("pjKey", projectVO.getPjKey());
		model.addAttribute("resultList", pjInfo);
		
		return "project/write/loseInfo";
	}
	
	@RequestMapping(value="/detail/requestBill.do")
	public String selectBillInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/detail/requestBill";
	}
	
	@Transactional
	@RequestMapping(value="/viewApproval.do")
	public String selectApproval(ProjectVO projectVO, ModelMap model) throws Exception {
		
		model.addAttribute("pjKey", projectVO.getPjKey());
		
		List<?> pjInfo = service.selectProjectDetail(projectVO.getPjKey());
		model.addAttribute("pjInfo", pjInfo);
		
		List<?> salesList = service.selectSalesList(projectVO.getPjKey());
		model.addAttribute("salesList", salesList);
		
		List<?> purchaseList = service.selectPurchaseList(projectVO.getPjKey());
		model.addAttribute("purchaseList", purchaseList);
		
		List<?> guarantyList = service.selectGuarantyList(projectVO.getPjKey());
		model.addAttribute("guarantyList", guarantyList);
		
		ProjectBiddingVO biddingVO = new ProjectBiddingVO();
		biddingVO.setPjKey(projectVO.getPjKey());
		
		biddingVO = service.selectBiddingDetail(biddingVO);
		model.addAttribute("biddingVO", biddingVO);
				
		model.put("displayUtil", new CepDisplayUtil());
		
		return "project/viewApproval";
	}
	
	/**
	 * 
	  * @Method Name : selectForecastMappingInfo
	  * @Cdate       : 2021. 8. 02.
	  * @Author      : sylim
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