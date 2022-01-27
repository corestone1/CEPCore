package com.cep.maintenance.amount.service.impl;


import java.util.List;
import java.util.Map;

import com.cep.maintenance.amount.vo.MtPaymentPlanVO;
import com.cep.maintenance.amount.vo.MtPurchaseVO;
import com.cep.maintenance.amount.vo.MtSalesPlanVO;
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
	
	
	///////////////////////////////// 유지보수 매출 관리 /////////////////////////////////////////////
	
	/**
	 * 유지보수 매출 수금계획 데이타 입력
	 * <pre>
	 * </pre>
	 * 
	 * @param insertParam
	 * @throws Exception
	 * @cdate 2021. 8. 24. 오후 8:21:50
	 * @author aranghoo
	 */
	public void writeMtSalesPlanList(Map<String, Object> insertParam) throws Exception;
	
	/**
	 * 유지보수 매출 수금계획 테이타 수정
	 * <pre>
	 * </pre>
	 * 
	 * @param updateParam
	 * @throws Exception
	 * @cdate 2021. 8. 24. 오후 8:22:43
	 * @author aranghoo
	 */
	public void updateMtSalesPlanList(Map<String, Object> updateParam)throws Exception;
	
	/**
	 * 유지보수 매출 계산서계획 데이타를 조회한다.
	 * salesCtFkKey : 유지보수 키를 이용하여 해당 유지보수에 대한 데이타 전체조회.
	 * salesKey : salesKey에 해당하는 한건만 조회.
	 * <pre>
	 * </pre>
	 * 
	 * @param salesPlanVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 24. 오후 8:31:54
	 * @author aranghoo
	 */
	public List<MtSalesPlanVO> selectMtSalesPlanList(MtSalesPlanVO salesPlanVO) throws Exception;  
	
	/**
	 * 유지보수 매출 수금계획데이타를 삭제한다.
	 * salesCtFkKey : 유지보수 키를 이용하여 해당 유지보수에 대한 데이타 전체삭제.
	 * salesKey : salesKey에 해당하는 한건만 삭제.
	 * <pre>
	 * </pre>
	 * 
	 * @param salesPlanVO
	 * @throws Exception
	 * @cdate 2021. 8. 24. 오후 8:38:07
	 * @author aranghoo
	 */
	public void deleteMtSalesPlan(MtSalesPlanVO salesPlanVO) throws Exception;  
	
	
	/**
	 * 계산서 계획정보 등록(or 수정)시 MT_CONTRACT_TB.BILL_ISSUE_RULE정보를 업데이트 한다.
	 * BILL_ISSUE_RULE:계산서 발행규칙(BF:이전평일, BD:계산서일자, AF:이후평일)
	 * <pre>
	 * </pre>
	 * 
	 * @param salesPlanVO
	 * @throws Exception
	 * @cdate 2021. 11. 1. 오후 4:44:28
	 * @author aranghoo
	 */
	public void updateBillIssueRule(MtSalesPlanVO salesPlanVO) throws Exception;  
	
	/**
	 * 유지보수 매입 지급계획 데이타를 조회한다.
	 * mtIntegrateKey : 유지보수 키를 이용하여 해당 유지보수에 대한 데이타 전체조회.
	 * mtOrderKey : 백계약에 대한 데이타 조회
	 * paymentKey : paymentKey에 해당하는 한건만 조회.
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentPlanVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 12. 9. 오후 2:09:43
	 * @author aranghoo
	 */
	public List<MtPaymentPlanVO> selectMtPaymentPlanList(MtPaymentPlanVO mtPaymentPlanVO) throws Exception;
	
	/**
	 * 유지보수 매입 지급계획 데이타 입력
	 * <pre>
	 * </pre>
	 * 
	 * @param insertParam
	 * @throws Exception
	 * @cdate 2021. 12. 10. 오후 8:21:50
	 * @author aranghoo
	 */
	public void writeMtPaymentPlanList(Map<String, Object> insertParam) throws Exception;
	
	/**
	 * 유지보수 매입 지급계획 테이타 수정
	 * <pre>
	 * </pre>
	 * 
	 * @param updateParam
	 * @throws Exception
	 * @cdate 2021. 12. 10. 오후 8:21:50
	 * @author aranghoo
	 */
	public void updateMtPaymentPlanList(Map<String, Object> updateParam)throws Exception;
	
	/**
	 * 유지보수 매입 지급계획데이타를 삭제한다.
	 * mtIntegrateKey : 유지보수 키를 이용하여 해당 유지보수에 대한 데이타 전체삭제.
	 * paymentKey : paymentKey에 해당하는 한건만 삭제.
	 * <pre>
	 * </pre>
	 * 
	 * @param salesPlanVO
	 * @throws Exception
	 * @cdate 2021. 12. 10. 오후 8:21:50
	 * @author aranghoo
	 */
	public void deleteMtPaymentPlan(MtPaymentPlanVO mtPaymentPlanVO) throws Exception;  
}
