/**
 * 
 */
package com.cep.maintenance.amount.service;

import java.util.List;
import java.util.Map;

import com.cep.maintenance.amount.vo.MtPaymentPlanVO;
import com.cep.maintenance.amount.vo.MtPurchaseVO;
import com.cep.maintenance.amount.vo.MtSalesPlanVO;
import com.cep.project.vo.ProjectPurchaseVO;

/**
 * @File Name : MtAmountService.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2021. 3. 11.
 * @version   : 1.0
 * @Description : 유지보수 금액관련 interface(매입/매출/계산서)
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 3. 11.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public interface MtAmountService {
	
	/**
	 * 
	  * @Method Name : writePurchaseInfo
	  * @Cdate       : 2021. 3. 11.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 매입정보를 입력하고 매입키를 return한다.
	  * @param purchaseVO
	  * @return
	  * @throws Exception
	 */
	String writeMtPurchaseInfo(MtPurchaseVO purchaseVO) throws Exception; 
	
	
	/**
	 * 
	  * @Method Name : updateMtWorkPurchaseInfo
	  * @Cdate       : 2021. 3. 31.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 작업별 발주연계 매입데이타 수정.
	  *                      donePaymentAmount 0인경우 가능
	  *                      selectMtPurchaseInfoList()를 조회해서 BUY_AMOUNT 값이 다른경우 업데이트.
	  * @param purchaseVO
	  * @return
	  * @throws Exception
	 */
	int updateMtWorkPurchaseInfo(ProjectPurchaseVO purchaseVO) throws Exception; 
	
	/**
	 * 
	  * @Method Name : deleteMtWorkOrderPurchaseInfo
	  * @Cdate       : 2021. 3. 31.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업별 발주 삭제시 해당 매입정보 삭제.(발주키로 삭제)
	  *                       donePaymentAmount 0인경우 가능
	  *                       buyOrderFkKey(발주키) 를 이용하여 삭제처리
	  * @param deleteParam
	  * @return
	  * @throws Exception
	 */
	int deleteMtWorkOrderPurchaseInfo(Map<String, Object> deleteParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtWorkPurchaseInfoAll
	  * @Cdate       : 2021. 3. 31.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업이 삭제되는 경우 해당 매입정보 삭제처리.
	  *                       donePaymentAmount 0인경우 가능
	  *                       buyFkPjKey(=mtWorkKey:유지보수작업 관리키) 를 이용하여 삭제처리
	  *                       삭제전 selectMtDonePaymetAmount를 호출하여 값이 0인 경우에만 실행.
	  * @param deleteParam
	  * @return
	  * @throws Exception
	 */
	int deleteMtWorkPurchaseInfoAll(Map<String, Object> deleteParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtPurchaseInfoList
	  * @Cdate       : 2021. 3. 31.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 매입정보 조회
	  * @param purchaseVO
	  * @return
	  * @throws Exception
	 */
	List<ProjectPurchaseVO> selectMtPurchaseInfoList(ProjectPurchaseVO purchaseVO) throws Exception; 
	
	/**
	 * 
	  * @Method Name : selectMtDonePaymetAmount
	  * @Cdate       : 2021. 3. 31.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 매입정보 지금금액 조회.(업데이트 또는 삭제시 지급금액이 없어야 가능)
	  * @param purchaseVO
	  * @return
	  * @throws Exception
	 */
	int selectMtDonePaymentAmount(ProjectPurchaseVO purchaseVO) throws Exception;
	
	
	void requestMtSalesPlanList(MtSalesPlanVO mtSalesPlanVO) throws Exception;
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
	void writeMtSalesPlanList(Map<String, Object> insertParam) throws Exception;
	
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
	void updateMtSalesPlanList(Map<String, Object> updateParam)throws Exception;
	
	/**
	 * 유지보수 매출 계산서계획(수금계획) 데이타를 조회한다.
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
	List<MtSalesPlanVO> selectMtSalesPlanList(MtSalesPlanVO salesPlanVO) throws Exception;  
	
	/**
	 * 유지보수 매출 계산서계획(수금계획)데이타를 삭제한다.
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
	void deleteMtSalesPlan(MtSalesPlanVO salesPlanVO) throws Exception;  
	
	
	/**
	 * 유지보수 매입 지급계획정보를 조회한다.
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentPlanVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 12. 9. 오후 1:55:21
	 * @author aranghoo
	 */
	List<MtPaymentPlanVO> selectMtPaymentPlanList(MtPaymentPlanVO mtPaymentPlanVO) throws Exception;  
	
	
	/**
	 * 유지보수 매입 지급계획 데이타 입력/업데이트.
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentPlanVO
	 * @throws Exception
	 * @cdate 2021. 12. 10. 오후 3:30:50
	 * @author aranghoo
	 */
	void writeMtPaymentPlanList(MtPaymentPlanVO mtPaymentPlanVO) throws Exception;
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
	void writeMtPaymentPlanList(Map<String, Object> insertParam) throws Exception;
	
	/**
	 * 유지보수  매입 지급계획 테이타 수정
	 * <pre>
	 * </pre>
	 * 
	 * @param updateParam
	 * @throws Exception
	 * @cdate 2021. 12. 10. 오후 8:22:43
	 * @author aranghoo
	 */
	void updateMtPaymentPlanList(Map<String, Object> updateParam)throws Exception;
}
