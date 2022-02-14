package com.cep.mngMaint.mapping.service;

import java.util.List;

import com.cep.mngMaint.bill.vo.MtPaymentVO;
import com.cep.mngMaint.mapping.vo.MtOrderBillVO;

public interface MngMaintMappingService {
	/**
	  * @Method Name : selectOrderBillList
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주 계산서 맵핑 정보 조회
	  * @param orderBillVO
	  * @return
	  * @throws Exception
	  */
	public List<?> selectOrderBillList(MtOrderBillVO orderBillVO) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * </pre>
	 * 
	 * @param orderBillVO
	 * @return
	 * @throws Exception
	 * @cdate 2022. 1. 26. 오후 2:14:25
	 * @author aranghoo
	 */
	public MtOrderBillVO selectMtOrderBillDetail(MtOrderBillVO orderBillVO) throws Exception;
	
	/**
	  * @Method Name : selectMappingBillList
	  * @Cdate       : 2022. 1. 26.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 계산서 맵핑 정보 조회
	  * @param orderBillVO
	  * @return
	  * @throws Exception
	  */
	public List<?> selectMappingBillList(MtOrderBillVO orderBillVO) throws Exception;
	
	
	/**
	 * 발주-계산서 매핑에서 계산서 매핑 등록
	 * 유지보수관리 >> 발주-계산서 매핑 >> 팝업에서 매핑.
	 * com.cep.mngMaint.bill.service.impl.writePaymentRequestInfo 참조.
	 * 1) MT_PC_BILLING_OP_TB에 계산서 매핑정보 등록
	 * 2) CMM_PC_BILLING_TB 계산서 매핑정보 업데이트 (MngMaintBillMapper.updatePaymentRequestBill)
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentVO
	 * @return
	 * @throws Exception
	 * @cdate 2022. 2. 4. 오전 10:40:22
	 * @author aranghoo
	 */
	public String writePaymentBillMapping(MtPaymentVO mtPaymentVO) throws Exception;
}
