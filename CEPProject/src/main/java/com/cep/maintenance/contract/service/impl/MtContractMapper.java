package com.cep.maintenance.contract.service.impl;

import java.util.List;
import java.util.Map;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.contract.vo.MtBackOrderProductVO;
import com.cep.maintenance.contract.vo.MtBackOrderVO;
import com.cep.maintenance.contract.vo.MtContractProductVO;
import com.cep.maintenance.contract.vo.MtContractVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mtContractMapper")
public interface MtContractMapper {
	
	/**
	 * 
	  * @Method Name : writeContractBasic
	  * @Cdate       : 2020. 11. 20.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 계약 기본정보 등록.
	  * @param deleteVo
	  * @throws Exception
	 */
	public void writeContractBasic(MtContractVO writeVo) throws Exception;
	
	
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
	public void updateMtContractBasic(MtContractVO updateVo) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtBasicDetail
	  * @Cdate       : 2020. 11. 20.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 계약 기본정보 상세조회
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	public MtContractVO selectMtBasicDetail(String mtIntegrateKey)  throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtContractList
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 계약정보 리스트
	  * @param searchVO
	  * @return
	  * @throws Exception
	 */
	public List<MtContractVO> selectMtContractList(MtDefaultVO searchVO) throws Exception;
	

	/**
	 * 
	  * @Method Name : deleteMtContract
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 계약 삭제
	  * @param deleteVo
	  * @throws Exception
	 */
	public void deleteMtContract(MtContractVO deleteVo) throws Exception;
	
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
	public  Map<String, Object> selectMtContractCount(String mtIntegrateKey)  throws Exception;
	
	/* ============================== 유지보수계약 제품  ======================================*/
	
	/**
	 * 
	  * @Method Name : writeContractProductList
	  * @Cdate       : 2020. 12. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품 등록
	  * @param insertParam
	  * @throws Exception
	 */
	public void writeMtContractProductList(Map<String, Object> insertParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtContractProduct
	  * @Cdate       : 2020. 12. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품 상제
	  * @param deleteParam
	  * @throws Exception
	 */
	public void deleteMtContractProductList(Map<String, Object> deleteParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtContractProductAll
	  * @Cdate       : 2020. 12. 31.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :해당 유지보수계약에 포함된 모든 제품을 삭제한다.
	  * @param deleteParam
	  * @throws Exception
	 */
	public void deleteMtContractProductAll(Map<String, Object> deleteParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : updateMtContractProductList
	  * @Cdate       : 2020. 12. 22.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 해당 유지보수계약에 포함된  제품정보를 수정한다.
	  * @param updateParam
	  * @throws Exception
	 */
	public void updateMtContractProductList(Map<String, Object> updateParam)throws Exception;
	
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
	public List<?> selectMtContractProductList(MtDefaultVO searchVO)  throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtContractProductList
	  * @Cdate       : 2021. 1. 6.
	  * @Author      : aranghoo
	  * @Modification: 유지보수계약 제품 총금액을 가져온다.
	  * @Method Description : 
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	public int selectMtPmTotalAmount(String mtIntegrateKey) throws Exception;
	/* ============================== 유지보수계약 매출  ======================================*/

	/**
	 * 
	  * @Method Name : selectContractAmountInfo
	  * @Cdate       : 2020. 12. 8.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 매출등록화면에서 보여줄 계약 금액정보를 조회한다.
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	public Map<String, Object> selectContractAmountInfo(String mtIntegrateKey) throws Exception;
	
	
	/**
	 * 
	  * @Method Name : selectMtSalesTotalAmount
	  * @Cdate       : 2021. 1. 8.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 매출총금액
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	public int selectMtSalesTotalAmount(String mtIntegrateKey) throws Exception;
	
	
	/**
	 * 
	  * @Method Name : writeMtContractSalesAmountList
	  * @Cdate       : 2020. 12. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 매출정보 등록.
	  * @param insertParam
	  * @throws Exception
	 */
	public void writeMtContractSalesAmountList(Map<String, Object> insertParam) throws Exception;
	
	
	/**
	 * 
	  * @Method Name : selectMtContractSalesAmountList
	  * @Cdate       : 2021. 1. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 매출정보 목록조회
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	public List<?> selectMtContractSalesAmountList(String mtIntegrateKey)  throws Exception;
	
	/**
	 * 
	  * @Method Name : updateMtContractSalesAmountList
	  * @Cdate       : 2021. 1. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약별 매출목록 정보수정
	  * @param updateParam
	  * @throws Exception
	 */
	public void updateMtContractSalesAmountList(Map<String, Object> updateParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtContractSalesAmountAll
	  * @Cdate       : 2021. 1. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약별 매출목록 전체삭제
	  * @param deleteParam
	  * @throws Exception
	 */
	public void deleteMtContractSalesAmountAll(Map<String, Object> deleteParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtContractSalesAmountList
	  * @Cdate       : 2021. 1. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약별  매출목록 리스트삭제
	  * @param deleteParam
	  * @throws Exception
	 */
	public void deleteMtContractSalesAmountList(Map<String, Object> deleteParam) throws Exception;
	
	/* ============================== 유지보수계약 백계약  ======================================*/
	
	/**
	 *
	  * @Method Name : writeContractBackOrder
	  * @Cdate       : 2020. 12. 14.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 백계약 내용을 등록한다.
	  * @param mtBackOrderVO
	  * @throws Exception
	 */
	public void writeContractBackOrder(MtBackOrderVO mtBackOrderVO) throws Exception;
	
	/**
	 * 
	  * @Method Name : writeContractBackOrderProduct
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :백계약 품목 리스트를 등록한다.
	  * @param insertParam
	  * @throws Exception
	 */
	public void writeContractBackOrderProduct(Map<String, Object> insertParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectBackOrderSelectBoxList
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약별 백계약 거래처 selectBox목록 조회
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	public List<EgovMap> selectBackOrderSelectBoxList(String mtIntegrateKey) throws Exception;
	
	
	/**
	 * 
	  * @Method Name : selectBackOrderDetail
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약별 백계약 메인 상세조회.
	  * @param mtOrderKey
	  * @return
	  * @throws Exception
	 */
	public MtBackOrderVO selectBackOrderDetail(String mtOrderKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectBackOrderList
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약별 백계약 메인 목록조회.
	  * @param mtIntegrateKey
	  * @return
	  * @throws Exception
	 */
	public List<MtBackOrderVO> selectBackOrderList(String mtIntegrateKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectBackOrderProductList
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약별 백계약별 제품목록 조회. 
	  * @param mtOrderKey
	  * @return
	  * @throws Exception
	 */
	public List<MtBackOrderProductVO> selectBackOrderProductList(String mtOrderKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteBackOrder
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약별 백계약 삭제
	  * @param modEmpKey
	  * @param mtOrderKey
	  * @throws Exception
	 */
//	public void deleteBackOrder(String modEmpKey, String mtOrderKey) throws Exception;
	public void deleteBackOrder(Map<String, Object> deleteParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteBackOrderProductAll
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약별 백계약별 제품목록 전체삭제.
	  * @param modEmpKey
	  * @param mtOrderKey
	  * @throws Exception
	 */
//	public void deleteBackOrderProductAll(String modEmpKey, String mtOrderKey) throws Exception;
	public void deleteBackOrderProductAll(Map<String, Object> deleteParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteBackOrderProductList
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약별 백계약별 제품목록 리스트 삭제.
	  * @param modEmpKey
	  * @param deleteKeyList
	  * @throws Exception
	 */
//	public void deleteBackOrderProductList(String modEmpKey, String[] deleteKeyList) throws Exception;
	public void deleteBackOrderProductList(Map<String, Object> deleteParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : updateBackOrder
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약별 백계약 메인 정보수정
	  * @param mtBackOrderVO
	  * @throws Exception
	 */
	public void updateBackOrder(MtBackOrderVO mtBackOrderVO) throws Exception;
	
	/**
	 * 
	  * @Method Name : updateBackOrderProductList
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 백계약 제품리스트 정보수정
	  * @param insertParam
	  * @throws Exception
	 */
	public void updateBackOrderProductList(Map<String, Object> updateParam)throws Exception;
	
	/* ============================== 유지보수계약 매입  ======================================*/
	
	/**
	 * 
	  * @Method Name : selectMtBuyAmountRefer
	  * @Cdate       : 2020. 12. 22.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 매입등록화면에서 상단에 보여지는 유지보수 금액정보
	  * @param selectParam
	  * @return
	  * @throws Exception
	 */
	public Map<String, Object> selectMtBuyAmountRefer(Map<String, Object> selectParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtBuyTotalAmount
	  * @Cdate       : 2020. 12. 23.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :mtOrderKey에 대한 매입전체 금액을 조회한
	  * @param mtOrderKey
	  * @return
	  * @throws Exception
	 */
	public int selectMtBuyTotalAmount(Map<String, Object> selectParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : writeMtContractBuyAmountList
	  * @Cdate       : 2020. 12. 22.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 매입금액 정보 등록.
	  * @param insertParam
	  * @throws Exception
	 */
	public void writeMtContractBuyAmountList(Map<String, Object> insertParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : updateMtContractBuyAmountList
	  * @Cdate       : 2020. 12. 23.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 년도별 매입금액 목록 수정
	  * @param updateParam
	  * @throws Exception
	 */
	public void updateMtContractBuyAmountList(Map<String, Object> updateParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtContractBuyAmountList
	  * @Cdate       : 2020. 12. 23.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 년도별 매입금액 목록 삭제
	  * @param deleteParam
	  * @throws Exception
	 */
	public void deleteMtContractBuyAmountList(Map<String, Object> deleteParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtContractBuyAmountAll
	  * @Cdate       : 2020. 12. 23.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 거래처별 매입금액 전체삭제.
	  * @param deleteParam
	  * @throws Exception
	 */
	public void deleteMtContractBuyAmountAll(Map<String, Object> deleteParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtContractBuyAmountList
	  * @Cdate       : 2020. 12. 23.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 년도별 매입금액 목록 조회.
	  * @param selectParam
	  * @return
	  * @throws Exception
	 */
	public List<?> selectMtContractBuyAmountList(Map<String, Object> selectParam) throws Exception;
	
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 
	  * @Method Name : selectAcDirectorList
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 고객 담당자정보 조회
	  * @param acKey : 고객정보 관리키
	  * @return
	  * @throws Exception
	 */
	public List<?> selectAcDirectorList(String acKey)  throws Exception;
	
	/**
	 * 직원정보 조회
	  * @Method Name : selectEmployeeList
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :
	  * @return
	  * @throws Exception
	 */
	public List<?> selectEmployeeList() throws Exception;
	
	/**
	 * 
	  * @Method Name : makePrimaryKey
	  * @Cdate       : 2020. 11. 20.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :
	  * @param keyType : 업무구분(유지보수 :MT, 프로젝트 :PJ)
	  * @return
	  * @throws Exception
	 */
	public String makePrimaryKey(String keyType) throws Exception;
	
	
	
}
