package com.cep.project.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cep.example.vo.SampleDefaultVO;
import com.cep.project.vo.ProjectBiddingFileVO;
import com.cep.project.vo.ProjectBiddingVO;
import com.cep.project.vo.ProjectBuildVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectContractVO;
import com.cep.project.vo.ProjectOrderProductVO;
import com.cep.project.vo.ProjectOrderVO;
import com.cep.project.vo.ProjectVO;
import com.cep.project.vo.ProjectWorkVO;
import com.cmm.vo.FileVO;
import com.cmm.vo.GuarantyBondVO;
import com.cmm.vo.OrderVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

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
	 * 프로젝트 상세 정보를 조회한다.
	 * @param pjKey - 조회할 정보의 key
	 * @return 프로젝트 상세 정보
	 * @exception
	 */
	public List<?> selectProjectDetail(String pjKey) throws Exception;
	
	/**
	 * 프로젝트 기본 정보를 등록한다.
	 * @param 
	 * @return Map
	 * @exception
	 */
	public Map<String, Object> insertBasicInfo(HttpServletRequest request, ProjectVO projectVO) throws Exception;
	
	/**
	 * 프로젝트 기본 정보를 수정한다.
	 * @param 
	 * @return Map
	 * @exception
	 */
	public Map<String, Object> updateBasicInfo(HttpServletRequest request, ProjectVO projectVO) throws Exception;
	
	/**
	 * 프로젝트 기본 정보를 삭제한다.
	 * @param 
	 * @return Map
	 * @exception
	 */
	public Map<String, Object> deleteProject(HttpServletRequest request, ProjectVO projectVO) throws Exception;
	
	/**
	 * 프로젝트 계약 정보를 등록한다.
	 * @param 
	 * @return Map
	 * @exception
	 */
	public Map<String, Object> insertContractInfo(HttpServletRequest request, ProjectContractSalesVO projectContractSalesVO) throws Exception;
	
	/**
	 * 프로젝트 계약 보증 증권 정보를 등록한다.
	 * @param 
	 * @return Map
	 * @exception
	 */
	public Map<String, Object> insertGuarantyInfo(HttpServletRequest request, GuarantyBondVO guarantyBondVO) throws Exception;
	
	/**
	 * 프로젝트 계약 상세 정보를 조회한다.
	 * @param pjKey - 조회할 정보의 key
	 * @return 프로젝트 계약 상세 정보
	 * @exception
	 */
	public ProjectContractVO selectContractDetail(String pjKey) throws Exception;
	
	/**
	 * 프로젝트 보증 증권 리스트를 조회한다.
	 * @param pjKey - 조회할 정보의 key
	 * @return 프로젝트 보증 증권 리스트
	 * @exception
	 */
	public List<?> selectGuarantyList(String pjKey) throws Exception;
	
	/**
	 * 프로젝트 매출 리스트를 조회한다.
	 * @param pjKey - 조회할 정보의 key
	 * @return 매출 리스트
	 * @exception
	 */
	public List<?> selectSalesList(String pjKey) throws Exception;
	
	/**
	 * 프로젝트 매입 리스트를 조회한다.
	 * @param pjKey - 조회할 정보의 key
	 * @return 매입 리스트
	 * @exception
	 */
	public List<?> selectPurchaseList(String pjKey) throws Exception;
	
	/**
	 * 프로젝트 입찰 상세 정보를 조회한다.
	 * @param projectVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 상세 정보
	 * @exception
	 */
	public ProjectBiddingVO selectBiddingDetail(ProjectBiddingVO projectBiddingVO) throws Exception;
	
	/**
	 * 프로젝트 입찰 상세 정보를 조회한다.
	 * @param projectVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 상세 정보
	 * @exception
	 */
	public List<?> selectBiddingFileList(ProjectBiddingFileVO projectBiddingFileVO) throws Exception;
	
	/**
	 * 프로젝트 입찰 정보를 등록한다.
	 * @param projectBiddingVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public Map<String, Object> insertBiddingInfo(HttpServletRequest request, ProjectBiddingVO projectBiddingVO) throws Exception;
	
	/**
	 * 파일 정보를 조회한다.
	 * @param projectVO - 조회할 정보가 담긴 VO
	 * @return 파일 정보
	 * @exception
	 */
	public Map<String, Object> selectFileList(FileVO fileVO) throws Exception;
	
	public Map<String, Object> updateBiddingInfo(MultipartHttpServletRequest multiRequest) throws Exception;

	/**
	 * 프로젝트 발주 정보를 등록한다.
	 * @param 
	 * @return Map
	 * @exception
	 */
	public String insertOrderInfo(HttpServletRequest request, OrderVO orderVO) throws Exception;
	
	/**
	 * 프로젝트 발주 정보를 조회한다.
	 * @param 
	 * @return orderKey
	 * @exception
	 */
	public ProjectOrderVO selectOrderDetail(String orderKey) throws Exception;
	
	/**
	 * 프로젝트 발주 정보를 삭제한다.
	 * @param 
	 * @return orderVO
	 * @exception
	 */
	public Map<String, Object> deleteOrderInfo(HttpServletRequest request, OrderVO orderVO) throws Exception;
	
	/**
	 * 프로젝트 계약별 발주 제품목록 조회
	 * @param 
	 * @return orderKey
	 * @exception
	 */
	public List<ProjectOrderProductVO> selectOrderProductList(String orderKey) throws Exception;
	
	public List<EgovMap> selectOrderSelectBoxList(String key) throws Exception;
	
	public List<?> selectAcDirector(int acDirectorKey) throws Exception;
	
	public List<?> selectAcDirectorList(String acKey) throws Exception;
	
	/**
	 * 프로젝트 설치 및 구축 정보를 등록한다.
	 * @param 
	 * @return Map
	 * @exception
	 */
	public Map<String, Object> insertBuildInfo(HttpServletRequest request, ProjectBuildVO buildVO) throws Exception;
	
	/**
	 * 프로젝트 설치 및 구축 상세정보를 조회한다.
	 * @param pjKey - 조회할 정보의 key
	 * @return 프로젝트 설치 및 구축 상세 정보
	 * @exception
	 */
	public List<?> selectBuildDetail(ProjectBuildVO buildVO) throws Exception;
	
	/**
	 * 프로젝트 수행 정보를 등록한다.
	 * @param 
	 * @return Map
	 * @exception
	 */
	public Map<String, Object> insertWorkInfo(HttpServletRequest request, ProjectWorkVO workVO) throws Exception;
	
	/**
	 * 프로젝트 수행 상세정보를 조회한다.
	 * @param workVO - 조회할 정보
	 * @return 프로젝트 수행 상세 정보
	 * @exception
	 */
	public List<?> selectWorkDetail(ProjectWorkVO workVO) throws Exception;
	
	
}
