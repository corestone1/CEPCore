package com.cep.project.service.impl;

import java.util.List;
import java.util.Map;

import com.cep.example.vo.SampleDefaultVO;
import com.cep.project.vo.ProjectBuildVO;
import com.cep.project.vo.ProjectVO;
import com.cep.project.vo.ProjectWorkVO;
import com.cmm.vo.FileVO;
import com.cmm.vo.GuarantyBondVO;
import com.cmm.vo.OrderProductVO;
import com.cmm.vo.OrderVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

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
	public List<?> selectProjectList(ProjectVO searchVO);
	
	/**
	 * 프로젝트 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 총 갯수
	 * @exception
	 */
	public int selectProjectListTotCnt(SampleDefaultVO searchVO);
	
	/**
	 * 프로젝트 상세 정보를 조회한다..
	 * @param pjKey - 조회할 정보의 key
	 * @return 프로젝트 상세 정보
	 * @exception
	 */
	public List<?> selectProjectDetail(String pjKey);
	
	
	/**
	 * 프로젝트 입찰 상세정보를 조회한다.
	 * @param projectVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 상세 정보
	 * @exception
	 */
	public Map<String, Object> selectBiddingDetail(ProjectVO projectVO);
	
	/**
	 * 프로젝트 기본 정보를 등록한다.
	 * @param projectVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int insertBasicInfo(ProjectVO projectVO);
	
	/**
	 * 프로젝트 기본 정보를 수정한다.
	 * @param projectVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int updateBasicInfo(ProjectVO projectVO);
	
	/**
	 * 프로젝트 기본 정보를 삭제한다.
	 * @param projectVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public Map<String, Object> deleteProject(ProjectVO projectVO);
	
	/**
	 * 프로젝트 계약 정보를 등록한다.
	 * @param projectVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int insertContractInfo(Map<String, Object> insertParam);
	
	/**
	 * 프로젝트 계약 보증 증권 정보를 등록한다.
	 * @param guarantyBondVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int insertBiddingInfo(GuarantyBondVO guarantyBondVO);
	
	/**
	 * 프로젝트 발주 정보를 등록한다.
	 * @param OrderVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public void insertOrderInfo(OrderVO orderVO);
	
	/**
	 * 프로젝트 발주 품목 리스트를 등록한다.
	 * @param ProjectOrderProductVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int insertOrderProductInfo(Map<String, Object> insertParam);
	
	/**
	 * 프로젝트 계약 상세 정보를 조회한다.
	 * @param pjKey - 조회할 정보의 key
	 * @return 프로젝트 상세 정보
	 * @exception
	 */
	public List<?> selectContractDetail(String pjKey);
	
	/**
	 * 프로젝트 계약 회차를 조회한다.
	 * @param pjKey - 조회할 정보의 key
	 * @return 프로젝트 계약 회차
	 * @exception
	 */
	public int selectMaxAndSum(String pjKey);
	
	/**
	 * 입찰 첨부 파일을 조회한다.
	 * @param fileVO - 조회할 정보가 담긴 VO
	 * @return 입찰 첨부 파일
	 * @exception
	 */
	public Map<String, Object> selectFileList(FileVO fileVO);
	
	public Map<String, Object> updateBiddingInfo(ProjectVO projectVO);
	
	public String makePrimaryKey(String keyType) throws Exception;
	
	/**
	 * 프로젝트 상태를 변경한다.
	 * @param pjKey - 변경할 정보의 key
	 * @return 
	 * @exception
	 */
	public int updateStatusCd(String pjKey, String pjStatusCd);
	
	/**
	 * 프로젝트 계약별 거래처 selectBox목록 조회
	 * @param pjKey - 변경할 정보의 key
	 * @return 
	 * @exception
	 */
	public List<EgovMap> selectOrderSelectBoxList(String key);
	
	/**
	 * 프로젝트 계약별 발주 메인 상세조회
	 * @param orderKey
	 * @return 
	 * @exception
	 */
	public OrderVO selectOrderDetail(String orderKey);
	
	/**
	 * 프로젝트 계약별 발주 제품목록 상세조회
	 * @param orderKey
	 * @return 
	 * @exception
	 */
	public List<OrderProductVO> selectOrderProductList(String orderKey);
	
	public List<?> selectAcDirector(int acDirectorKey);
	
	public List<?> selectAcDirectorList(String acKey);
	
	/**
	 * 프로젝트 설치구축 정보를 등록한다.
	 * @param buildVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int insertBuildInfo(ProjectBuildVO buildVO);
	
	/**
	 * 프로젝트 설치 및 구축 상세 정보를 조회한다..
	 * @param pjKey - 조회할 정보의 key
	 * @return 프로젝트 설치 및 구축 상세 정보
	 * @exception
	 */
	public List<?> selectBuildDetail(String pjKey);
	
	/**
	 * 프로젝트 수행 정보를 등록한다.
	 * @param workVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int insertWorkInfo(ProjectWorkVO workVO);
	
	/**
	 * 프로젝트 수행 상세 정보를 조회한다..
	 * @param pjKey - 조회할 정보의 key
	 * @return 프로젝트 수행 상세 정보
	 * @exception
	 */
	public List<?> selectWorkDetail(String pjKey);
}
