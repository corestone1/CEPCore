package com.cep.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cep.example.vo.SampleDefaultVO;
import com.cep.project.service.ProjectService;
import com.cep.project.vo.ProjectVO;
import com.cmm.service.FileMngService;
import com.cmm.util.StringUtil;
import com.cmm.vo.FileVO;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {
	
	@Resource(name="projectMapper")
	private ProjectMapper mapper;
	
	@Resource(name="fileMngService")
	private FileMngService fileMngService;
	
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
	
	public Map<String, Object> insertBasicInfo(HttpServletRequest request, Map<String, Object> param) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		ProjectVO projectVO = new ProjectVO();
		int result = 0;

		projectVO.setPjKey("PJ200003");
		projectVO.setAcKey(StringUtil.nullToString(param.get("acKey")));
		projectVO.setPjSaleEmpKey(StringUtil.nullToString(param.get("pjSaleEmpKey")));
		projectVO.setPjSupportEmpKey(StringUtil.nullToString(param.get("pjSupportEmpKey")));
		projectVO.setAcDirectorKey(StringUtil.nullToString(param.get("acDirectorKey")));
		projectVO.setPjStartDt(StringUtil.nullToString(param.get("pjStartDt")));
		projectVO.setPjEndDt(StringUtil.nullToString(param.get("pjEndDt")));
		
		result = mapper.insertBasicInfo(projectVO);
		
		if(result > 0) {
			returnMap.put("resultCode", "successYN");
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
