package com.cep.maintenance.contract.service;

import java.util.List;
import java.util.Map;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.contract.vo.MtSaleAmountListVO;
import com.cep.maintenance.contract.vo.MtSalesAmountVO;
import com.cmm.config.PrimaryKeyType;

import egovframework.rte.psl.dataaccess.util.EgovMap;

import com.cep.maintenance.contract.vo.MtBackOrderProductVO;
import com.cep.maintenance.contract.vo.MtBackOrderVO;
import com.cep.maintenance.contract.vo.MtBuyAmountListVO;
import com.cep.maintenance.contract.vo.MtContractProductVO;
import com.cep.maintenance.contract.vo.MtContractVO;



public interface MtContractService {
	
	/**
	 * 
	  * @Method Name : writeMtFirestContractBasic
	  * @Cdate       : 2020. 11. 20.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수를 처음 등록하고 키값을 return한다. 
	  * @param writeVo
	  * @return
	  * @throws Exception
	 */
	 String writeFirestContractBasic(MtContractVO writeVo) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : updateMtContractBasic
	   * @Cdate       : 2020. 12. 30.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description : 유지보수계약 기본정보를 수정한다.
	   * @param updateVo
	   * @throws Exception
	  */
	 void updateMtContractBasic(MtContractVO updateVo) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : writeContractBasic
	   * @Cdate       : 2020. 11. 23.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description : 이전에 등록한 유지보수를 연장하여 계약하는 경우.
	   * @param writeVo
	   * @return
	   * @throws Exception
	  */
	 String writeContractBasic(MtContractVO writeVo) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtContractList
	  * @Cdate       : 2020. 11. 4.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 목록을 조회한다.
	  * @param searchVO
	  * @return
	  * @throws Exception
	 */
	List<MtContractVO> selectContractList(MtDefaultVO searchVO) throws Exception;
	
	
	/**
	 * 
	  * @Method Name : selectMtContractBasicDetail
	  * @Cdate       : 2020. 11. 23.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 기본정보 상세조회.
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	MtContractVO selectContractBasicDetail(String mtIntegrateKey)  throws Exception;
	
	
	/**
	 * 
	  * @Method Name : deleteMtContract
	  * @Cdate       : 2020. 11. 4.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 계약 삭제(update)
	  * @param deleteVo
	  * @throws Exception
	 */
	void deleteContract(MtContractVO deleteVo) throws Exception;	
	
	/**
	 * 
	  * @Method Name : selectMtContractCount
	  * @Cdate       : 2021. 1. 5.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 단계별 등록 갯수 조회
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	 Map<String, Object> selectMtContractCount(String mtIntegrateKey)  throws Exception;
	
	/* ============================== 유지보수계약 제품  ======================================*/
	
	/**
	 * 
	  * @Method Name : writeMtContractProductList
	  * @Cdate       : 2020. 12. 30.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :
	  * @param productVO
	  * @throws Exception
	 */
	void writeMtContractProductList(MtContractProductVO productVO) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtContractProductList
	  * @Cdate       : 2020. 12. 31.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품목록 삭제
	  * @param modEmpKey
	  * @param deleteKeyList
	  * @throws Exception
	 */
	void deleteMtContractProductList(String modEmpKey, String[] deleteKeyList) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtContractProductAll
	  * @Cdate       : 2020. 12. 31.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :해당 유지보수계약에 포함된 모든 제품을 삭제한다.
	  * @param modEmpKey
	  * @param mtIntegrateKey
	  * @throws Exception
	 */
	void deleteMtContractProductAll(String modEmpKey, String mtIntegrateKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtContractProductList
	  * @Cdate       : 2020. 12. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품목록을 가져온다.
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	List<?> selectMtContractProductList(MtDefaultVO searchVO)  throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtPmTotalAmount
	  * @Cdate       : 2021. 1. 6.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품 총금액을 가져온다.
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	int selectMtPmTotalAmount(String mtIntegrateKey) throws Exception;
	/* ============================== 유지보수계약 매출  ======================================*/
	
	/**
	 * 
	  * @Method Name : selectContractAmountInfo
	  * @Cdate       : 2020. 12. 8.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :매출등록화며에서 보여줄 계약 금액정보를 조회한다.
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	 Map<String, Object> selectContractAmountInfo(String mtIntegrateKey) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : writeMtContractSalesAmountList
	   * @Cdate       : 2020. 12. 10.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수계약 매출정보 등록.
	   * @param mtSalesAmountVO
	   * @throws Exception
	  */
	 void writeMtContractSalesAmountList(MtSaleAmountListVO mtSalesAmountVO) throws Exception;
	 
	 
		
	/* ============================== 유지보수계약 백계약  ======================================*/
		
	/**
	 * 
	  * @Method Name : writeContractBackOrder
	  * @Cdate       : 2020. 12. 14.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :백계약 내용을 등록한다.
	  * @param mtBackOrderVO
	  * @throws Exception
	 */
	 String writeContractBackOrder(MtBackOrderVO mtBackOrderVO) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : selectBackOrderSelectBoxList
	   * @Cdate       : 2020. 12. 16.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수계약별 백계약 등록 selectBox리스트회
	   * @param mtIntegrateKey
	   * @return
	   * @throws Exception
	  */
	 List<EgovMap> selectBackOrderSelectBoxList(String mtIntegrateKey) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : selectBackOrderDetail
	   * @Cdate       : 2020. 12. 16.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수계약별 백계약 메인상세 
	   * @param mtOrderKey
	   * @return
	   * @throws Exception
	  */
	 MtBackOrderVO selectBackOrderDetail(String mtOrderKey) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : selectBackOrderList
	   * @Cdate       : 2020. 12. 16.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description : 유지보수계약별 백계약 목록조회
	   * @param mtIntegrateKey
	   * @return
	   * @throws Exception
	  */
	 List<MtBackOrderVO> selectBackOrderList(String mtIntegrateKey) throws Exception;
	 
	 
	 /**
	  * 
	   * @Method Name : selectBackOrderProductList
	   * @Cdate       : 2020. 12. 16.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수계약별 백계약 제품목록 조회
	   * @param mtOrderKey
	   * @return
	   * @throws Exception
	  */
	 List<MtBackOrderProductVO> selectBackOrderProductList(String mtOrderKey) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : deleteBackOrder
	   * @Cdate       : 2020. 12. 16.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description : 유지보수계약별 백계약 메인과 백계약 품목을 삭제한다.
	   *                       deleteBackOrderProductAll, deleteBackOrder 수행
	   * @param modEmpKey :수정자
	   * @param mtOrderKey : 수정키
	   * @throws Exception
	  */
	 void deleteBackOrder(String modEmpKey, String mtOrderKey)  throws Exception;
	 
	 /**
	  * 
	   * @Method Name : updateBackOrder
	   * @Cdate       : 2020. 12. 16.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수계약별 백계약 정보수정 
	   *         deleteBackOrderProductList, updateBackOrderProductList, updateBackOrder 수행
	   * @param mtBackOrderVO
	   * @throws Exception
	  */
	 void updateBackOrder(MtBackOrderVO mtBackOrderVO) throws Exception;
	 
	 
		
	/* ============================== 유지보수계약 매입  ======================================*/
	 /**
	  * 
	   * @Method Name : selectMtBuyAmountRefer
	   * @Cdate       : 2020. 12. 23.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수계약 매입등록화면에서 상단에 보여지는 유지보수 금액정보 조회 with selectMtBuyTotalAmount
	   * @param mtIntegrateKey
	   * @return
	   * @throws Exception
	  */
	 Map<String, Object> selectMtBuyAmountRefer(String mtIntegrateKey, String mtOrderKey) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : selectMtContractBuyAmountList
	   * @Cdate       : 2020. 12. 23.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description : 유지보수계약 년도별 매입금액 목록 조회
	   * @param mtOrderKey
	   * @return
	   * @throws Exception
	  */
	 List<?> selectMtContractBuyAmountList(String mtOrderKey) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : selectMtContractBuyAmountDetail
	   * @Cdate       : 2020. 12. 23.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description : 유지보수계약 매입상세조회
	   * @param mtOrderKey
	   * @param mtBuyKey
	   * @return
	   * @throws Exception
	  */
	 Map<String, Object> selectMtContractBuyAmountDetail(String mtOrderKey, String mtBuyKey) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : writeMtContractBuyAmountList
	   * @Cdate       : 2020. 12. 23.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수계약 매입금액 정보 등록.
	   * @param mtBuyAmountListVO
	   * @throws Exception
	  */
	 void writeMtContractBuyAmountList(MtBuyAmountListVO mtBuyAmountListVO) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : updateMtContractBuyAmountList
	   * @Cdate       : 2020. 12. 23.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수계약 년도별 매입금액 목록 수정
	   * 						deleteMtContractBuyAmountList, updateMtContractBuyAmountList 수행
	   * @param mtBuyAmountListVO
	   * @throws Exception
	  */
	 void updateMtContractBuyAmountList(MtBuyAmountListVO mtBuyAmountListVO)throws Exception;
	 
	 /**
	  * 
	   * @Method Name : deleteMtContractBuyAmountAll
	   * @Cdate       : 2020. 12. 23.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수계약 거래처별 매입금액 전체삭제
	   * @param modEmpKey
	   * @param mtOrderKey
	   * @throws Exception
	  */
	 void deleteMtContractBuyAmountAll(String modEmpKey, String mtOrderKey) throws Exception;
	
	///////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * selectbox용 직원 리스트
	  * @Method Name : selectEmployeeList
	  * @Cdate       : 2020. 11. 4.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :
	  * @return
	  * @throws Exception
	 */
	List<?> selectEmployeeList() throws Exception;


	
	/**
	 * 
	  * @Method Name : selectAcDirectorList
	  * @Cdate       : 2020. 11. 6.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 사업자코드(업체관리코드)를 이용하여 담당직원 목록을 조회한다.
	  * @param acKey
	  * @return
	  * @throws Exception
	 */
	List<?> selectAcDirectorList(String acKey)  throws Exception;

	/**
	 * 
	  * @Method Name : makePrimaryKey
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 관리키를 생성하는 메서드
	  * @param keyType
	  * @return
	  * @throws Exception
	 */
	public String makePrimaryKey(PrimaryKeyType keyType) throws Exception;
}
