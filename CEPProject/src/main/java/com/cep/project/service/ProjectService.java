package com.cep.project.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cep.example.vo.SampleDefaultVO;
import com.cep.project.vo.ProjectVO;

public interface ProjectService {
	/**
	 * 프로젝트 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 목록
	 * @exception Exception
	 */
	public List<?> selectProjectList(ProjectVO searchVO) throws Exception;
	/**
	 * 프로젝트 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 총 갯수
	 * @exception
	 */
	public int selectProjectListTotCnt(SampleDefaultVO searchVO) throws Exception;
	
	/**
	 * 프로젝트 기본 정보를 등록한다.
	 * @param 
	 * @return Map
	 * @exception
	 */
	public Map<String, Object> insertBasicInfo(HttpServletRequest request, Map<String, Object> param) throws Exception;
	
	/**
	 * 프로젝트 입찰 상세 정보를 조회한다.
	 * @param projectVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 상세 정보
	 * @exception
	 */
	public Map<String, Object> selectBiddingDetail(ProjectVO projectVO) throws Exception;
	
	/**
	 * 파일 정보를 조회한다.
	 * @param projectVO - 조회할 정보가 담긴 VO
	 * @return 파일 정보
	 * @exception
	 */
	public Map<String, Object> selectFileList(ProjectVO projectVO) throws Exception;
	
	public Map<String, Object> updateBiddingInfo(MultipartHttpServletRequest multiRequest, Map<String, Object> param) throws Exception;

}
