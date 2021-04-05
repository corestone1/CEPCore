package com.cep.maintenance.amount.service.impl;


import java.util.List;
import java.util.Map;

import com.cep.maintenance.amount.vo.MtPurchaseVO;
import com.cep.project.vo.ProjectPurchaseVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mtAmountMapper")
public interface MtAmountMapper {

	
	/**
	 * 
	  * @Method Name : writeMtPurchaseInfo
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업 발주연계 매입데이타 등록. 
	  * @param purchaseVO
	  * @throws Exception
	 */
	public int writeMtPurchaseInfo(MtPurchaseVO purchaseVO) throws Exception; 
	
	/**
	 * 
	  * @Method Name : updateMtWorkPurchaseInfo
	  * @Cdate       : 2021. 3. 30.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업별 발주연계 매입데이타 수정.
	  *                       donePaymentAmount 0인경우 가능
	  *                       selectMtPurchaseInfoList()를 조회해서 BUY_AMOUNT 값이 다른경우 업데이트.
	  * @param purchaseVO
	  * @throws Exception
	 */
	public int updateMtWorkPurchaseInfo(ProjectPurchaseVO purchaseVO) throws Exception; 
	
	/**
	 * 
	  * @Method Name : deleteMtWorkOrderPurchaseInfo
	  * @Cdate       : 2021. 3. 30.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업별 발주 삭제시 해당 매입정보 삭제.(발주키로 삭제)
	  *                       donePaymentAmount 0인경우 가능
	  *                       buyOrderFkKey(발주키) 를 이용하여 삭제처리
	  * @param deleteParam
	  * @throws Exception
	 */
	public int deleteMtWorkOrderPurchaseInfo(Map<String, Object> deleteParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtWorkPurchaseInfoAll
	  * @Cdate       : 2021. 3. 30.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업이 삭제되는 경우 해당 매입정보 삭제처리.
	  *                       donePaymentAmount 0인경우 가능
	  *                       buyFkPjKey(=mtWorkKey:유지보수작업 관리키) 를 이용하여 삭제처리
	  *                       삭제전 selectMtDonePaymetAmount를 호출하여 값이 0인 경우에만 실행.
	  * @param deleteParam
	  * @throws Exception
	 */
	public int deleteMtWorkPurchaseInfoAll(Map<String, Object> deleteParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtPurchaseInfoList
	  * @Cdate       : 2021. 3. 30.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 매입정보 조회
	  * @param purchaseVO
	  * @return
	  * @throws Exception
	 */
	public List<ProjectPurchaseVO> selectMtPurchaseInfoList(ProjectPurchaseVO purchaseVO) throws Exception; 
	
	/**
	 * 
	  * @Method Name : selectMtDonePaymetAmount
	  * @Cdate       : 2021. 3. 30.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 매입정보 지금금액 조회.(업데이트 또는 삭제시 지급금액이 없어야 가능)
	  * @param purchaseVO
	  * @return
	  * @throws Exception
	 */
	public int selectMtDonePaymentAmount(ProjectPurchaseVO purchaseVO) throws Exception;
	
	
	
	
}
