package com.cep.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cep.example.vo.SampleDefaultVO;
import com.cep.project.service.ProjectService;
import com.cep.project.vo.ProjectContractVO;
import com.cep.project.vo.ProjectVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.service.ComService;
import com.cmm.service.FileMngService;
import com.cmm.vo.FileVO;


@Service("projectService")
public class ProjectServiceImpl implements ProjectService {
	
	@Resource(name="projectMapper")
	private ProjectMapper mapper;
	
	@Resource(name="fileMngService")
	private FileMngService fileMngService;
	
	@Resource(name="comService")
	private ComService comService;
	
	/**
	 * 프로젝트 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectProjectList(ProjectVO searchVO) throws Exception {
		return mapper.selectProjectList(searchVO);
	}
	
	@Override
	public int selectProjectListTotCnt(SampleDefaultVO searchVO) throws Exception {
		return mapper.selectProjectListTotCnt(searchVO);
	}
	
	@Override
	public List<?> selectProjectDetail(String pjKey) throws Exception {
		return mapper.selectProjectDetail(pjKey);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertBasicInfo(HttpServletRequest request, ProjectVO projectVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		
		int result = 0;
		
		String pjKey = comService.makePrimaryKey(PrimaryKeyType.PROJECT);
		projectVO.setPjKey(pjKey);
		
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		projectVO.setRegEmpKey(session.get("empKey"));
		
	    result = mapper.insertBasicInfo(projectVO);
	    
	    if(result > 0){
        	returnMap.put("successYN", "Y");
        	returnMap.put("pjKey", pjKey);
		}
		
		return returnMap;		
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertContractInfo(HttpServletRequest request, ProjectContractVO projectContractVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		
		int result = 0;
		
		String ctKey = comService.makePrimaryKey(PrimaryKeyType.PROJECT_CONTRACT);
		projectContractVO.setCtKey(ctKey);
		
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		projectContractVO.setRegEmpKey(session.get("empKey"));
		
	    result = mapper.insertContractInfo(projectContractVO);
	    
	    if(result > 0){
        	returnMap.put("successYN", "Y");
        	returnMap.put("pjKey", projectContractVO.getPjKey());
		}
		
		return returnMap;		
	}
	
	@Override
	public Map<String, Object> selectBiddingDetail(ProjectVO projectVO) throws Exception {
		return mapper.selectBiddingDetail(projectVO);
	}
	
	@Override
	public Map<String, Object> selectFileList(ProjectVO projectVO) throws Exception {
		return mapper.selectFileList(projectVO);
	}
	
	@Override
	public Map<String, Object> updateBiddingInfo(MultipartHttpServletRequest multiRequest, Map<String, Object> param) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		ProjectVO projectVO = new ProjectVO();
		FileVO fileVO = new FileVO();
		int result = 0;
		
		fileMngService.insertFile(multiRequest, param);
		
	    /*driverInfoVo.setDriverId(StringUtil.nullToString(param.get("driverId")));
	    driverInfoVo.setName(StringUtil.nullToString(param.get("name")));
	    driverInfoVo.setDept(StringUtil.nullToString(param.get("dept")));
    	driverInfoVo.setEmpTitle(StringUtil.nullToString(param.get("empTitle")));
    	driverInfoVo.setEmpPosition(StringUtil.nullToString(param.get("empPosition")));
    	driverInfoVo.setEmail(StringUtil.nullToString(param.get("email")));
    	driverInfoVo.setMobileNo1(StringUtil.nullToString(param.get("mobileNo1")));
    	driverInfoVo.setWorkType(StringUtil.nullToString(param.get("workType")));
    	driverInfoVo.setWorkStatus(StringUtil.nullToString(param.get("workStatus")));
    	driverInfoVo.setDescription(StringUtil.nullToString(param.get("description")));
    	driverInfoVo.setPassword(ChaahnEncryptUtility.PASSWORD(StringUtil.nullToString(param.get("password"))));
    	driverInfoVo.setLogInId(StringUtil.nullToString(param.get("logInId")));
    	driverInfoVo.setUserId(user.getUserId());
    	driverInfoVo.setCreateBy(user.getId());
    	driverInfoVo.setModifyBy(user.getId());
				
	    result = corpMapper.updateDriverDetail(driverInfoVo);*/
	    
	    
		
		return returnMap;	
	}
}
