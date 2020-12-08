package com.cep.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;
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
	public List<?> selectProjectList(SampleDefaultVO searchVO) throws Exception {
		return mapper.selectProjectList(searchVO);
	}
	
	@Override
	public int selectProjectListTotCnt(SampleDefaultVO searchVO) throws Exception {
		return mapper.selectProjectListTotCnt(searchVO);
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
