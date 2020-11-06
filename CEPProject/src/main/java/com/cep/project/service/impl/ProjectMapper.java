package com.cep.project.service.impl;

import java.util.List;

import com.cep.example.vo.SampleDefaultVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 프로젝트에 관한 데이터처리 매퍼 클래스
 *
 * @author  sylim
 * @since 2020.11.05
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2020.11.05        sylim          최초 생성
 *
 * </pre>
 */
@Mapper("projectMapper")
public interface ProjectMapper {
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
