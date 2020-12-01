package com.cep.project.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.example.vo.SampleDefaultVO;
import com.cep.project.service.ProjectService;
import com.cep.project.vo.ProjectVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Resource(name="projectService")
	private ProjectService service;
	
	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping(value="/list.do")
	public String selectProject(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		
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
		
		return "project/list";
	}
	
	@RequestMapping(value="/popup/list.do")
	public String selectPopupProject(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		
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
		
		return "project/popup/samplePopup";
	}
	
	@RequestMapping(value="/detail/bidding.do")
	public String selectProjectDetailBd(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
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
	
	@RequestMapping(value="/write/basicInfo.do")
	public String addBasicInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/write/basicInfo";
	}
	
	
	@RequestMapping(value="/write/amountInfo.do")
	public String addAmountnfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/write/amountInfo";
	}
	
	
	@RequestMapping(value="/write/biddingInfo.do")
	public String addBiddingInfo(ProjectVO projectVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "project/write/biddingInfo";
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