package com.cep.project.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import com.cep.project.service.ProjectService;
import com.cep.project.vo.ProjectContractVO;
import com.cep.project.vo.ProjectVO;
import com.cmm.service.ComService;

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
		
		return returnMap;
	}
	
	@RequestMapping(value="/popup/list.do")
	public String selectPopupProject(@ModelAttribute("searchVO") ProjectVO searchVO, ModelMap model) throws Exception {
		
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<?> projectList = service.selectProjectList(searchVO);
		model.addAttribute("resultList", projectList);
		
		int totCnt = service.selectProjectListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "project/popup/forecastList";
	}
	
	@RequestMapping(value="/detail/bidding.do", method={RequestMethod.GET, RequestMethod.POST})
	public String selectProjectDetailBd(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model) throws Exception {
		Map<String, Object> result = null;
		Map<String, Object> fileResult = null;
		
		try {
			result = service.selectBiddingDetail(projectVO);
			
			if(result != null) {
				fileResult = service.selectFileList(projectVO);
				if(fileResult == null) {
					fileResult = new HashMap<String, Object>();
					fileResult.put("atchFileCnt", 0);
				}
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
		
		return "project/write/basicInfo";
	}
	
	@RequestMapping(value="/insert/basicInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addBasicInfo(HttpServletRequest request, @RequestBody ProjectVO projectVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.insertBasicInfo(request, projectVO);
		
		return returnMap;
	}
	
	@RequestMapping(value="/insert/contractInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addContractInfo(HttpServletRequest request, @RequestBody ProjectContractVO projectContractVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.insertContractInfo(request, projectContractVO);
		
		return returnMap;
	}
	
	@RequestMapping(value="/write/contractInfo.do")
	public String viewAddContractInfo(HttpServletRequest request, ProjectVO projectVO, ModelMap model) throws Exception {
		
		model.addAttribute("pjKey", request.getParameter("pjKey"));
		
		return "project/write/contractInfo";
	}
	
	
	@RequestMapping(value="/write/biddingInfo.do")
	public String addBiddingInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/write/biddingInfo";
	}
	
	
	@RequestMapping(value = "/update/biddingInfo.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateDriverDetail(MultipartHttpServletRequest multiRequest, @RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> returnMap = null;
		returnMap = service.updateBiddingInfo(multiRequest, param);
		
	   	return returnMap;
	}
	
	
	@RequestMapping(value="/write/buildInfo.do")
	public String addBuildInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/write/buildInfo";
	}
	
	
	@RequestMapping(value="/write/workInfo.do")
	public String addWorkInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/write/workInfo";
	}
	
	@RequestMapping(value="/write/finishInfo.do")
	public String addFinishInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/write/finishInfo";
	}
	
	@RequestMapping(value="/write/loseInfo.do")
	public String addLoseInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/write/loseInfo";
	}
	
	@RequestMapping(value="/requestBill.do")
	public String selectBillInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/requestBill";
	}
	
	@RequestMapping(value="/requestPurchase.do")
	public String selectPurchaseInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/requestPurchase";
	}
	
	@RequestMapping(value="/viewApproval.do")
	public String selectApproval(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/viewApproval";
	}
}