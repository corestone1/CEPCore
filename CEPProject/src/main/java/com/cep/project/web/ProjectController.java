package com.cep.project.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cep.main.service.MainService;
import com.cep.project.service.ProjectService;
import com.cep.project.vo.ProjectBuildVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectContractVO;
import com.cep.project.vo.ProjectVO;
import com.cep.project.vo.ProjectWorkVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.service.ComService;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.FileVO;
import com.cmm.vo.GuarantyBondVO;
import com.cmm.vo.OrderVO;
import com.cmm.vo.SalesVO;

import egovframework.rte.fdl.property.EgovPropertyService;
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
	
	@Value("#{comProps['maxFileCnt']}")
	private String maxFileCnt;	// 허용 파일 개수
	
	@Value("#{comProps['maxFileSize']}")
	private String maxFileSize;	// 허용 파일 사이즈
	
	@Value("#{comProps['fileExtn']}")
	private String fileExtn;		// 허용 파일 확장자
	
	@RequestMapping(value="/list.do", method={RequestMethod.GET, RequestMethod.POST})
	public String selectProject(@ModelAttribute("searchVO") ProjectVO searchVO, ModelMap model) throws Exception {
		
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
		
		List<?> projectList = service.selectProjectList(searchVO);
		model.addAttribute("resultList", projectList);
		
		int totCnt = service.selectProjectListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
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
		Map<String, Object> result = null;
		Map<String, Object> fileResult = null;
		FileVO fileVO = new FileVO();
		
		try {
			result = service.selectBiddingDetail(projectVO);
			
			// 프로젝트 관리키. 추후 수정 필요
			fileVO.setFileCtKey("PJ210065");
			/*fileVO.setFileCtKey(projectVO.getPjKey());*/
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
		}
		
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
		
		String pjKey = request.getParameter("pjKey");
		model.addAttribute("pjKey", pjKey);
		
		List<?> projectList = service.selectProjectDetail(pjKey);
		model.addAttribute("resultList", projectList);
		
		List<?> empList = comService.selectEmployeeList();
		model.addAttribute("empList", empList);
		
		model.put("displayUtil", new CepDisplayUtil());
		
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
	
	@RequestMapping(value="/insert/contractInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addContractInfo(HttpServletRequest request, @RequestBody ProjectContractSalesVO projectContractSalesVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int listCnt = projectContractSalesVO.getProjectContractSalesVOList().size();
		
		for(int i = 0; i < listCnt; i++) {
			projectContractSalesVO.getProjectContractSalesVOList().get(i).setCtKey(comService.makePrimaryKey(PrimaryKeyType.PROJECT_CONTRACT));
			projectContractSalesVO.getProjectContractSalesVOList().get(i).setSalesKey(comService.makePrimaryKey(PrimaryKeyType.SALES_DETAIL));
		}
		
		returnMap = service.insertContractInfo(request, projectContractSalesVO);
		
		return returnMap;
	}
	
	@RequestMapping(value="/write/contractInfo.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewAddContractInfo(HttpServletRequest request, ProjectContractVO projectContractVO, ModelMap model) throws Exception {
		Map<String, String> param = null;
		
		String pjKey = request.getParameter("pjKey");
		model.addAttribute("pjKey", pjKey);
		
		List<?> contractList = service.selectContractDetail(pjKey);
		model.addAttribute("resultList", contractList);
		
		model.put("displayUtil", new CepDisplayUtil());
		
		return "project/write/contractInfo";
	}
	
	@RequestMapping(value="/insert/biddingInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addBiddingInfo(HttpServletRequest request, @RequestBody GuarantyBondVO guarantyBondVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.insertBiddingInfo(request, guarantyBondVO);
		
		return returnMap;
	}
	
	@RequestMapping(value="/write/biddingInfo.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewAddBiddingInfo(HttpServletRequest request, ProjectVO projectVO, ModelMap model) throws Exception {
		
		String pjKey = request.getParameter("pjKey");
		model.addAttribute("pjKey", pjKey);
		
		String[] ctKey = request.getParameterValues("ctKey[]");
		model.addAttribute("ctKey", ctKey);
		
		String[] salesKey = request.getParameterValues("salesKey[]");
		model.addAttribute("salesKey", salesKey);
		
		
		return "project/write/biddingInfo";
	}
	
	@RequestMapping(value="/select/biddingInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public List<SalesVO> selectBiddingInfo(@RequestParam(value="salesKeyList[]") List<String> salesKeyList) throws Exception {
		
		List<SalesVO> salesList = new ArrayList<SalesVO>();
		
		for(String salesKey : salesKeyList) {
			SalesVO salesVO = new SalesVO();
			salesVO = comService.selectSalesGuarantyDetail(salesKey);
			
			salesList.add(salesVO);
        }
		
		return salesList;
	}
	
	
	@RequestMapping(value = "/update/biddingInfo.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateBiddingInfol(MultipartHttpServletRequest multiRequest, @RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> returnMap = null;
		returnMap = service.updateBiddingInfo(multiRequest, param);
		
	   	return returnMap;
	}
	
	@RequestMapping(value="/write/orderInfo.do", method={RequestMethod.GET, RequestMethod.POST})
	@SuppressWarnings("unchecked")
	public String viewAddOrderInfo(HttpServletRequest request, OrderVO orderVO, ModelMap model) throws Exception {
		
		OrderVO returnVO = null;
		String pjKey = request.getParameter("pjKey");
		model.addAttribute("pjKey", pjKey);
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		HashMap<String, String> sessionMap = null;
		sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
		String userName = "";
		
		userName = mainService.selectName(sessionMap);
		model.addAttribute("userName", userName);
		
		List<?> orderSelectBox = null;
		List<?> acDirectorList = null;
		
		orderVO.setOrderCtFkKey(pjKey);
		
		//발주 등록  거래처 목록을 가져온다.
		orderSelectBox = service.selectOrderSelectBoxList(orderVO.getOrderCtFkKey());			
		if(orderSelectBox != null){
			orderVO.setSaveCnt(orderSelectBox.size());
		}
		
		//발주 정보를 조회한다.
		if(!"".equals(CepStringUtil.getDefaultValue(orderVO.getSelectKey(), ""))){
			returnVO = service. selectOrderDetail(orderVO.getSelectKey());
			if(null != returnVO){
//				returnVO.setUpdateYn(orderVO.getUpdateYn());
				returnVO.setSelectKey(orderVO.getSelectKey());
//				returnVO.setMtSaveCnt(orderVO.getMtSaveCnt());
				/*if(returnVO.getOrderProductVOList()!=null && returnVO.getOrderProductVOList().size()>1){
					listCount = returnVo.getMtBackOrderProductVoList().size();
				}*/
				acDirectorList =service.selectAcDirectorList(returnVO.getOrderAcKey());
			}
		} else {
			returnVO = orderVO;
		}
		
		model.put("orderSelectBoxList", orderSelectBox);
		model.put("displayUtil", new CepDisplayUtil());
		model.put("orderVO", returnVO);
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
	public Map<String, Object> addOrderInfo(HttpServletRequest request, @RequestBody OrderVO orderVO, ModelMap model) throws Exception {
		Map<String, Object> returnMap = new HashMap<>();
		String orederKey = null;
		
		try {
			orederKey = service.insertOrderInfo(request, orderVO);
			returnMap.put("successYN", "Y");
			returnMap.put("orederKey", orederKey);
		} catch (Exception e) {
			model.put("successYN", "N");
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
	public Map<String, Object> selectOrderInfo(HttpServletRequest request, @RequestBody OrderVO orderVO) throws Exception {
		OrderVO returnVO = null;
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
		
		String pjKey = request.getParameter("pjKey");
		model.addAttribute("pjKey", pjKey);
		
		List<?> buildInfo = service.selectBuildDetail(pjKey);
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
		
		String pjKey = request.getParameter("pjKey");
		model.addAttribute("pjKey", pjKey);
		
		List<?> workInfo = service.selectWorkDetail(pjKey);
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
		
		String pjKey = request.getParameter("pjKey");
		model.addAttribute("pjKey", pjKey);
		
		List<?> finishInfo = service.selectProjectDetail(pjKey);
		model.addAttribute("resultList", finishInfo);
		
		model.put("displayUtil", new CepDisplayUtil());
		
		return "project/write/finishInfo";
	}
	
	@RequestMapping(value="/write/loseInfo.do")
	public String addLoseInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/write/loseInfo";
	}
	
	@RequestMapping(value="/detail/requestBill.do")
	public String selectBillInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/detail/requestBill";
	}
	
	@RequestMapping(value="/viewApproval.do")
	public String selectApproval(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/viewApproval";
	}
}