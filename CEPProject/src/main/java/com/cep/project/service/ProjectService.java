package com.cep.project.service;

import java.util.List;

import com.cep.example.vo.SampleDefaultVO;

public interface ProjectService {
	/**
	 * 프로젝트 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 목록
	 * @exception Exception
	 */
	List<?> selectProjectList(SampleDefaultVO searchVO) throws Exception;
	/**
	 * 프로젝트 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 총 갯수
	 * @exception
	 */
	int selectProjectListTotCnt(SampleDefaultVO searchVO);
}
