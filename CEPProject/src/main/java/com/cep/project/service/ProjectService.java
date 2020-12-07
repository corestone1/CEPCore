package com.cep.project.service;

import java.util.List;
import java.util.Map;

import com.cep.example.vo.SampleDefaultVO;
import com.cep.project.vo.ProjectVO;

public interface ProjectService {
	/**
	 * 프로젝트 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 목록
	 * @exception Exception
	 */
	public List<?> selectProjectList(SampleDefaultVO searchVO) throws Exception;
	/**
	 * 프로젝트 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 총 갯수
	 * @exception
	 */
	public int selectProjectListTotCnt(SampleDefaultVO searchVO) throws Exception;
	/**
	 * 프로젝트 상세 정보를 조회한다.
	 * @param projectVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 상세 정보
	 * @exception
	 */
	public Map<String, Object> selectProjectDetail(ProjectVO projectVO) throws Exception;
}
