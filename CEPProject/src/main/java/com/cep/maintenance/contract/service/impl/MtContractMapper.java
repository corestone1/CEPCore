package com.cep.maintenance.contract.service.impl;

import java.util.List;
import java.util.Map;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.contract.vo.MtContractProductVO;
import com.cep.maintenance.contract.vo.MtContractVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

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
	  * @param mtPmKey
	  * @throws Exception
	 */
	public void deleteMtContractProduct(String mtPmKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtContractProductAll
	  * @Cdate       : 2020. 12. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 해당 유지보수계약에 포함된 모든 제품을 삭제한다.
	  * @param mtIntegrateKey
	  * @throws Exception
	 */
	public void deleteMtContractProductAll(String mtIntegrateKey) throws Exception;
	
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
	public List<MtContractProductVO> selectMtContractProductList(String mtIntegrateKey)  throws Exception;

	
	///////////////////////////////////////////////////////
	
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
