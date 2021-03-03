package com.cep.project.service.impl;

import java.util.List;
import java.util.Map;

import com.cep.example.vo.SampleDefaultVO;
import com.cep.project.vo.ProjectBiddingFileVO;
import com.cep.project.vo.ProjectBiddingVO;
import com.cep.project.vo.ProjectBuildVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectContractVO;
import com.cep.project.vo.ProjectGuarantyBondVO;
import com.cep.project.vo.ProjectOrderProductVO;
import com.cep.project.vo.ProjectOrderVO;
import com.cep.project.vo.ProjectPaymentVO;
import com.cep.project.vo.ProjectPurchaseVO;
import com.cep.project.vo.ProjectVO;
import com.cep.project.vo.ProjectWorkVO;
import com.cmm.vo.FileVO;
import com.cmm.vo.OrderVO;
import com.cmm.vo.PurchaseVO;

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
	 * @param projectVO - 삭제할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public Map<String, Object> deleteProject(ProjectVO projectVO);
	
	/**
	 * 프로젝트 입찰 상세정보를 조회한다.
	 * @param projectVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 입찰 상세 정보
	 * @exception
	 */
	public ProjectBiddingVO selectBiddingDetail(ProjectBiddingVO projectBiddingVO);
	
	/**
	 * 프로젝트 입찰 파일 정보를 조회한다.
	 * @param projectBiddingFileVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 입찰 파일 정보
	 * @exception
	 */
	public List<?> selectBiddingFileList(ProjectBiddingFileVO projectBiddingFileVO);
	
	/**
	 * 프로젝트 입찰 정보를 등록한다.
	 * @param projectBiddingVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public void insertBiddingInfo(ProjectBiddingVO projectBiddingVO);
	
	/**
	 * 프로젝트 입찰 정보를 수정한다.
	 * @param projectBiddingVO - 수정할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public void updateBiddingInfo(ProjectBiddingVO projectBiddingVO);
	
	/**
	 * 프로젝트 입찰 파일 정보를 등록한다.
	 * @param insertParam - 등록할 정보가 담긴 map
	 * @return 
	 * @exception
	 */
	public void insertBiddingFileInfo(Map<String, Object> insertParam) throws Exception;
	
	/**
	 * 프로젝트 입찰 파일 정보를 수정한다.
	 * @param insertParam - 수정할 정보가 담긴 map
	 * @return 
	 * @exception
	 */
	public void updateBiddingFileInfo(Map<String, Object> updateParam) throws Exception;
	
	/**
	 * 프로젝트 계약 정보를 등록한다.
	 * @param insertParam
	 * @return 
	 * @exception
	 */
	public int insertContractInfo(ProjectContractSalesVO projectContractSalesVO) throws Exception;
	
	/**
	 * 프로젝트 매출 리스트를 조회한다.
	 * @param pjKey
	 * @return 
	 * @exception
	 */
	public List<?> selectSalesList(String pjKey);
	
	/**
	 * 프로젝트 매입 리스트를 조회한다.
	 * @param pjKey
	 * @return 
	 * @exception
	 */
	public List<?> selectPurchaseList(String pjKey);
	
	/**
	 * 프로젝트 계약 정보를 수정한다.
	 * @param updateParam
	 * @return 
	 * @exception
	 */
	public void updateContractInfo(ProjectContractSalesVO projectContractSalesVO);
	
	/**
	 * 프로젝트 매출 정보를 등록한다.
	 * @param insertParam
	 * @return 
	 * @exception
	 */
	public void insertSalesInfo(Map<String, Object> insertParam) throws Exception;
	
	/**
	 * 프로젝트 매출 정보를 수정한다.
	 * @param updateParam
	 * @return 
	 * @exception
	 */
	public int updateSalesInfo(Map<String, Object> updateParam);
	
	/**
	 * 프로젝트 계약 보증 증권 정보를 등록한다.
	 * @param guarantyBondVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int insertGuarantyInfo(ProjectGuarantyBondVO guarantyBondVO);
	
	/**
	 * 프로젝트 계약 보증 증권 정보를 수정한다.
	 * @param guarantyBondVO - 수정할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int updateGuarantyInfo(ProjectGuarantyBondVO guarantyBondVO);
	
	/**
	 * 프로젝트 계약 보증 증권 정보를 삭제한다.
	 * @param guarantyBondVO - 삭제할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int deleteGuarantyInfo(ProjectGuarantyBondVO guarantyBondVO);
	
	/**
	 * 프로젝트 발주 리스트 정보를 조회한다.
	 * @param OrderVO - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public List<?> selectOrderInfo(OrderVO orderVO);
	
	/**
	 * 프로젝트 발주 메인 정보를 등록한다.
	 * @param OrderVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public void insertOrderInfo(ProjectOrderVO orderVO);
	
	/**
	 * 프로젝트 발주 메인 정보를 수정한다.
	 * @param OrderVO - 수정할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public void updateOrderInfo(ProjectOrderVO orderVO);
	
	/**
	 * 프로젝트 발주 제품 리스트를 등록한다.
	 * @param insertParam - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int insertOrderProductInfo(Map<String, Object> insertParam);
	
	/**
	 * 프로젝트 발주 제품 리스트를 수정한다.
	 * @param updateParam - 수정할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public void updateOrderProductInfo(Map<String, Object> updateParam);
	
	/**
	 * 프로젝트 발주 제품 리스트를 삭제한다.
	 * @param deleteParam - 삭제할 정보가 담긴 map
	 * @return 
	 * @exception
	 */
	public void deleteOrderProductInfo(Map<String, Object> deleteParam);
	
	/**
	 * 프로젝트 매입 정보를 등록한다.
	 * @param purchaseVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public void insertPurchaseInfo(ProjectPurchaseVO purchaseVO);
	
	/**
	 * 프로젝트 매입 정보를 수정한다.
	 * @param purchaseVO - 수정할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public void updatePurchaseInfo(ProjectPurchaseVO purchaseVO);
	
	/**
	* 
	* @Method Name : deletePurchaseInfo
	* @Cdate       : 2021. 01. 29.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매입 정보 삭제
	* @param purchaseVO
	* @return
	* @throws Exception
	*/
	public void deletePurchaseInfo(ProjectPurchaseVO purchaseVO) throws Exception;
	
	/**
	* 
	* @Method Name : deletePaymentAllInfo
	* @Cdate       : 2021. 02. 10.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매입별 지급 정보 전체 삭제
	* @param buyKey
	* @return
	* @throws Exception
	*/
	public void deletePaymentAllInfo(ProjectPaymentVO paymentVO) throws Exception;
	
	/**
	 * 프로젝트 계약 상세 정보를 조회한다.
	 * @param pjKey - 조회할 정보의 key
	 * @return 프로젝트 상세 정보
	 * @exception
	 */
	public ProjectContractVO selectContractDetail(String pjKey);
	
	/**
	 * 프로젝트 보증 증권 리스트를 조회한다.
	 * @param pjKey - 조회할 정보의 key
	 * @return 프로젝트 보증 증권 리스트
	 * @exception
	 */
	public List<?> selectGuarantyList(String pjKey);
	
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
	public ProjectOrderVO selectOrderDetail(String orderKey);
	
	/**
	 * 프로젝트 계약별 매입 상세조회
	 * @param purchaseVO
	 * @return 
	 * @exception
	 */
	public ProjectPurchaseVO selectPurchaseDetail(ProjectPurchaseVO purchaseVO);
	
	/**
	 * 프로젝트 계약별 발주 제품목록 상세조회
	 * @param orderKey
	 * @return 
	 * @exception
	 */
	public List<ProjectOrderProductVO> selectOrderProductList(String orderKey);
	
	/**
	 * 프로젝트 계약별 발주 삭제
	 * @param orderVO
	 * @return 
	 * @exception
	 */
	public void deleteOrderInfo(ProjectOrderVO orderVO);
	
	/**
	 * 프로젝트 계약별 발주 제품 삭제
	 * @param orderVO
	 * @return 
	 * @exception
	 */
	public void deleteOrderProductAll(Map<String, Object> deleteParam);
	
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
	 * 프로젝트 설치구축 정보를 수정한다.
	 * @param buildVO - 수정할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int updateBuildInfo(ProjectBuildVO buildVO);
	
	/**
	 * 프로젝트 설치 및 구축 상세 정보를 조회한다..
	 * @param pjKey - 조회할 정보의 key
	 * @return 프로젝트 설치 및 구축 상세 정보
	 * @exception
	 */
	public List<?> selectBuildDetail(ProjectBuildVO buildVO);
	
	/**
	 * 프로젝트 수행 정보를 등록한다.
	 * @param workVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int insertWorkInfo(ProjectWorkVO workVO);
	
	/**
	 * 프로젝트 수행 정보를 수정한다.
	 * @param workVO - 수정할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public int updateWorkInfo(ProjectWorkVO workVO);
	
	/**
	 * 프로젝트 수행 상세 정보를 조회한다..
	 * @param workVO - 조회할 정보
	 * @return 프로젝트 수행 상세 정보
	 * @exception
	 */
	public List<?> selectWorkDetail(ProjectWorkVO workVO);


}
