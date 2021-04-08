package com.cep.maintenance.work.service.impl;

import java.util.List;
import java.util.Map;

import com.cep.maintenance.contract.vo.MtBackOrderProductVO;
import com.cep.maintenance.contract.vo.MtBackOrderVO;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.work.vo.MtOrderProductVO;
import com.cep.maintenance.work.vo.MtOrderVO;
import com.cep.maintenance.work.vo.MtWorkProductVO;
import com.cep.maintenance.work.vo.MtWorkVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mtWorkMapper")
public interface MtWorkMapper {

	
	/**
	 * 
	  * @Method Name : writeWorkBasic
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 작업 등록
	  * @param mtWorkVO
	  * @throws Exception
	 */
	public void writeWorkBasic(MtWorkVO mtWorkVO) throws Exception; 
	
	
	/**
	 * 
	  * @Method Name : updateWorkBasic
	  * @Cdate       : 2020. 11. 30.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 기본정보 수정
	  * @param mtWorkVO
	  * @throws Exception
	 */
	public void updateWorkBasic(MtWorkVO mtWorkVO) throws Exception; 
	
	/**
	 * 
	  * @Method Name : selectWorkDetail
	  * @Cdate       : 2020. 11. 25.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업 상세화면 조회
	  * @param mtWorkKey
	  * @throws Exception
	 */
	public MtWorkVO selectWorkDetail(String mtWorkKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtWorkList
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업 목록 조회
	  * @param searchVO
	  * @return
	  * @throws Exception
	 */
	public List<MtWorkVO> selectWorkList(MtDefaultVO searchVO) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtWork
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업 삭제
	  * @param deleteVo
	  * @throws Exception
	 */
	public void deleteMtWork(MtWorkVO deleteVo) throws Exception;
	
	/**
	 * 
	  * @Method Name : writeWorkProductList
	  * @Cdate       : 2020. 12. 1.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 제품을 등록한다.
	  * @param insertParam
	  * @throws Exception
	 */
	public void writeWorkProductList(Map<String, Object> insertParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : selectWorkProductList
	  * @Cdate       : 2020. 12. 2.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 제품목록을 조회한다.
	  * @param mtWorkKey
	  * @return
	  * @throws Exception
	 */
	public List<MtWorkProductVO> selectWorkProductList(String mtWorkKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : updateWorkProductList
	  * @Cdate       : 2021. 1. 28.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 제품목록를 수정한다.
	  * @param updateParam
	  * @throws Exception
	 */
	public void updateWorkProductList(Map<String, Object> updateParam)throws Exception;
	
	
	/**
	 * 
	  * @Method Name : deleteWorkProductList
	  * @Cdate       : 2021. 1. 28.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 제품목록을 삭제한다.
	  * @param deleteParam
	  * @throws Exception
	 */
	public void deleteWorkProductList(Map<String, Object> deleteParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteWorkProductAll
	  * @Cdate       : 2021. 1. 28.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 작업별 제품정보 전체삭제
	  * @param deleteVo
	  * @throws Exception
	 */
	public void deleteWorkProductAll(MtWorkVO deleteVo)throws Exception;
	
	
	// ===================================== 유지보수작업 발주 ===========================================
	
	/**
	 * 
	  * @Method Name : writeMtWorkOrder
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업 발주 메인  등록
	  * @param mtOrderVO
	  * @throws Exception
	 */
	public void writeMtWorkOrder(MtOrderVO mtOrderVO) throws Exception;
	
	/**
	 * 
	  * @Method Name : writeMtWorkOrderProductList
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업 발주 제품등록
	  * @param insertParam(mtOrderKey, regEmpKey, mtOrderProductVoList)
	  * @throws Exception
	 */
	public void writeMtWorkOrderProductList(Map<String, Object> insertParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : selectWorkOrderSelectBoxList
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업별 발주메인 등록 SELECT_BOX 리스트조회 
	  * @param orderCtFkKey
	  * @return
	  * @throws Exception
	 */
	public List<EgovMap> selectWorkOrderSelectBoxList(String orderCtFkKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectWorkOrderDetail
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업 발주 메인상세
	  * @param mtOrderKey
	  * @return
	  * @throws Exception
	 */
	public MtOrderVO selectWorkOrderDetail(String mtOrderKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectWorkOrderList
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :
	  * @param searchParam ({mtIntegrateKey}, {orderCtFkKey}) 조건검색.
	  * @return
	  * @throws Exception
	 */
	public List<MtOrderVO> selectWorkOrderList(Map<String, Object> searchParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectWorkOrderProductList
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업별 발주별 제품목록
	  * @param mtOrderKey
	  * @return
	  * @throws Exception
	 */
	public List<MtOrderProductVO> selectWorkOrderProductList(String mtOrderKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteWorkOrder
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업별 거래처별 발주메인 삭제
	  * @param deleteParam({modEmpKey},{mtOrderKey})
	  * @throws Exception
	 */
	public void deleteWorkOrder(Map<String, Object> deleteParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteWorkOrderProductAll
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업별 거래처별 발주제품목록 전체삭제
	  * @param deleteParam({modEmpKey},{mtOrderKey})
	  * @throws Exception
	 */
	public void deleteWorkOrderProduct(Map<String, Object> deleteParam) throws Exception;
	
	
	/**
	 * 
	  * @Method Name : deleteWorkOrderAll
	  * @Cdate       : 2021. 3. 15.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업별 전체 발주삭제 삭제(유지보수 작업 삭제시 호출)
	  * @param deleteParam : ({modEmpKey},{orderCtFkKey:유지보수 계약키})
	  * @throws Exception
	 */
	public void deleteWorkOrderAll(Map<String, Object> deleteParam) throws Exception;
	/**
	 * 
	  * @Method Name : deleteWorkOrderProductAll
	  * @Cdate       : 2021. 3. 15.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업에 대한 전체 백계약 제품목록 전체삭제(유지보수작업이 삭제되는 경우 호출됨)
	  * @param deleteParam : ({modEmpKey},{orderCtFkKey:유지보수 계약키})
	  * @throws Exception
	 */
	public void deleteWorkOrderProductAll(Map<String, Object> deleteParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteContractWorkOrderAll
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약별 전체 유지보수작업 발주삭제 삭제(유지보수계약 작업 삭제시 호출)
	  * @param deleteParam({modEmpKey},{mtIntegrateKey})
	  * @throws Exception
	 */
	public void deleteContractWorkOrderAll(Map<String, Object> deleteParam) throws Exception;
	
	
	/**
	 * 
	  * @Method Name : deleteContractWorkOrderProductAll
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약에 대한 전체 유지보수작업 제품목록 전체삭제(유지보수계약이 삭제되는 경우 호출됨)
	  * @param deleteParam
	  * @throws Exception
	 */
	public void deleteContractWorkOrderProductAll(Map<String, Object> deleteParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteWorkOrderProductList
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업별 거래처별 제품목록 리스트 선택하여 삭제
	  * @param deleteParam({modEmpKey},{mtOrderKey}, deleteKeyList(ORDER_SEQ))
	  * @throws Exception
	 */
	public void deleteWorkOrderProductList(Map<String, Object> deleteParam) throws Exception;
	
	/**
	 * 
	  * @Method Name : updateWorkOrder
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업별 발주 메인정보수정
	  * @param mtOrderVO
	  * @throws Exception
	 */
	public void updateWorkOrder(MtOrderVO mtOrderVO) throws Exception;
	
	/**
	 * 
	  * @Method Name : updateWorkOrderMappingNum
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업별 발주 계산서 맵핑회수 수정
	  * @param updateParam
	  * @throws Exception
	 */
	public void updateWorkOrderMappingNum(Map<String, Object> updateParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : updateWorkOrderProductList
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업 발주 제품리스트 정보수정
	  * @param updateParam
	  * @throws Exception
	 */
	public void updateWorkOrderProductList(Map<String, Object> updateParam)throws Exception;
}
