package com.cep.mngMaint.bill.service;


import java.util.List;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;
import com.cep.mngMaint.bill.vo.MngMaintBillVO;
import com.cep.mngMaint.bill.vo.MtPaymentVO;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngMaintBillService {
	
	/**
	 * 유지보수 매출 계산서 요청 기본정보(좌측) 조회
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 7:33:17
	 * @author aranghoo
	 */
	public EgovMap selectBillBasicInfo(MngMaintBillSearchVO searchVO) throws Exception;

	/**
	 * 계산서 요청 정보조회(우측 첫번째)
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 7:33:48
	 * @author aranghoo
	 */
	public EgovMap selectBillDetailInfo(MngMaintBillSearchVO searchVO) throws Exception;
	
	/**
	 * 유지보수 매출 계산서 요청 정보 등록
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 9:48:41
	 * @author aranghoo
	 */
	public String insertBillRequest(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	/**
	 * 유지보수 매출 계산서요청정보 수정.
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 9:49:18
	 * @author aranghoo
	 */
	public void updateBillRequest(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	/**
	 * 유지보수 매출 계산서 요청 취소
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 9. 3. 오후 5:05:25
	 * @author aranghoo
	 */
	public void deleteBillRequest(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	/**
	 * 영업지원에서 세금계산서 발행완료 처리
	 * 1. 매출세금계산서 테이블(MT_SD_BILLING_OP_TB)에 계산서 발행정보등록
	 * 2. MT_SALES_DETAIL_TB.SALES_STATUS_CD 상태 업데이트.
	 * 3. MT_SALES_AMOUNT_TB의 월별 상태코드를 업데이트 한다.
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 11. 23. 오전 10:41:54
	 * @author aranghoo
	 */
	public String insertBillIssue(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 11. 23. 오후 1:08:22
	 * @author aranghoo
	 */
	public void updateBillIssue(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	/**
	 *유지보수 매출  계산서 요청 수정.
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 9:50:54
	 * @author aranghoo
	 */
	public void updateBillIssueStatus(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	/**
	 * 유지보수 매출/매입 세금계산서  정보 조회.
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 31. 오전 11:29:06
	 * @author aranghoo
	 */
	public List<EgovMap> selectBillList(MngMaintBillSearchVO searchVO ) throws Exception;
	
	/**
	 * 유지보수 매출 세금계산서 요청 우측메뉴에서 기존 계산서 정보 조회.
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 31. 오전 11:29:06
	 * @author aranghoo
	 */
	public List<EgovMap> selectSdBillList(MngMaintBillSearchVO searchVO ) throws Exception;
	
	
	/**
	 * 유지보수 매출 세금계산서 매핑(발급) 처리
	 * 1. MT_SD_BILLING_OP_TB 세금계산서 요청 정보 업데이트(계산서 번호, 발행일자, 요청상태)
	 * 2. 유지보수 매출(수금) 정보 상태를 업데이트(매핑) 한다.
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 9. 2. 오후 2:36:29
	 * @author aranghoo
	 */
	public void insertSdBillingXml(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	/**
	 * 유지보수 매출 세금계산서 매핑(발급) 취소 처리
	 * 1. MT_SD_BILLING_OP_TB 세금계산서 요청 정보 업데이트(계산서 번호, 발행일자, 요청상태)
	 * 2. 유지보수 매출(수금) 정보 상태를 업데이트(요청) 한다.
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 10. 27. 오전 10:19:23
	 * @author aranghoo
	 */
	public void cancelSdBillMapping(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	/**
	 * 수금완료처리.
	 * 수금완료일자와 계산서 상태 수금완료(E) 업데이트
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 9. 3. 오전 11:34:56
	 * @author aranghoo
	 */
	public void updateSdCollectStatus(MngMaintBillVO mngMaintBillVO) throws Exception;
	
//	//////////////////////////////// 매입관련  //////////////////////////////////////////////
	
	/**
	 * 매입지급요청 왼쪽 기본정보.
	 * mtOrderType을 이용하여 백계약 or 작업발주에서 정보를 가져온다.
	 *  - mtOrderType=BO : 백계약 정보조회
	 *  - mtOrderType=PO : 작업발주 정보조회
	 * MT_ORDER_KEY = paymentBuyFkKey 를 이용하여 상세정보를 조회한다.
	 * 
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 6. 오전 11:48:02
	 * @author aranghoo
	 */
	public EgovMap selectPaymentBasicInfo(MngMaintBillSearchVO searchVO) throws Exception;
	
	/**
	 * 지급요청정보 리스트
	 * 세금계산서와 맵핑이 된 목록 정보를 조회한다.
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 6. 오전 10:54:34
	 * @author aranghoo
	 */
	public List<EgovMap> selectPaymentRequestList(MngMaintBillSearchVO searchVO) throws Exception;
	
	
	/**
	 * 지급정보 상세화면
	 * 등록된 지급요청정보를 조회한다.
	 * 조회된 지급정보 상세에서 상태(PAYMENT_STATUS_CD)에 따라 수정, 확인, 완료가 가능하다.
	 *  - PAYMENT_STATUS_CD=PYST2000(요청) 상태 : 수정버튼, 요청취소, 확인
	 *  - PAYMENT_STATUS_CD=PYST3000(확인) 상태 : 확인취소, 완료
	 *  - PAYMENT_STATUS_CD=PYST4000(완료) 상태 : 완료취소
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 6. 오전 11:02:49
	 * @author aranghoo
	 */
	public EgovMap selectPaymentRequestInfo(MngMaintBillSearchVO searchVO) throws Exception;
	
	/**
	 * 세금계산서 맵핑목록을 가져온다.
	 * 매입금 지금요청등록화면에서 사용.
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 7. 오후 5:00:33
	 * @author aranghoo
	 */
	public List<EgovMap> selectMappingBillList(MngMaintBillSearchVO searchVO) throws Exception;
	
	
	/**
	 * 매입지급요청 정보 등록
	 *  - 매입지금요청 정보 생성 후 세금계산서 매핑저보 업데이트 수행.
	 *  1. writePaymentRequestInfo
	 *  2. updatePaymentRequestBill
	 *  paymentKey를 return한다.
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 6. 오전 11:08:13
	 * @author aranghoo
	 */
	public String writePaymentRequestInfo(MtPaymentVO mtPaymentVO) throws Exception;
	
	
	/**
	 * 매핑정보 수정(확인전까지 수정가능) 
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentVO
	 * @throws Exception
	 * @cdate 2021. 10. 6. 오전 11:10:53
	 * @author aranghoo
	 */
	public void updatePaymentRequestInfo(MtPaymentVO mtPaymentVO) throws Exception;
	
	
	/**
	 * 요청(매핑)취소 (상태가 요청(PYST2000)일때만 가능함)
		1.1 MT_PAYMENT_TB 삭제처리.(deletePaymentRequest)
		1.2 CMM_PC_BILLING_TB 매핑취소처리.(deletePaymentRequestBill)
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentVO
	 * @throws Exception
	 * @cdate 2021. 10. 6. 오전 11:11:35
	 * @author aranghoo
	 */
	public void deletePaymentRequest(MtPaymentVO mtPaymentVO) throws Exception;
	
	/**
	 * 지급요청 확인 처리
	 * PAYMENT_STATUS_CD=PYST2000 ==>PYST3000
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentVO
	 * @throws Exception
	 * @cdate 2021. 10. 6. 오전 11:17:51
	 * @author aranghoo
	 */
	public void updatePaymentRequestConfirm(MtPaymentVO mtPaymentVO) throws Exception;
	
	/**
	 * 지급요청 확인 취소처리.
	 * PAYMENT_STATUS_CD=PYST3000 ==>PYST2000
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentVO
	 * @throws Exception
	 * @cdate 2021. 10. 6. 오전 11:18:51
	 * @author aranghoo
	 */
	public void cancelPaymentRequestConfirm(MtPaymentVO mtPaymentVO) throws Exception;
	
	/**
	 * 지급완료 처리.
	 * PAYMENT_STATUS_CD=PYST3000 ==>PYST4000
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentVO
	 * @throws Exception
	 * @cdate 2021. 10. 6. 오전 11:20:27
	 * @author aranghoo
	 */
	public void updatePaymentRequestFinish(MtPaymentVO mtPaymentVO) throws Exception;
	
	/**
	 * 지금완료 처리 날자만 변경하는 서비스.
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentVO
	 * @throws Exception
	 * @cdate 2022. 3. 28. 오후 1:10:33
	 * @author aranghoo
	 */
	public void updatePaymentRequestFinishDate(MtPaymentVO mtPaymentVO) throws Exception;
	
	
	/**
	 * 지급완료 취소처리.
	 * PAYMENT_STATUS_CD=PYST4000 ==>PYST3000
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentVO
	 * @throws Exception
	 * @cdate 2021. 10. 6. 오전 11:18:51
	 * @author aranghoo
	 */
	public void cancelPaymentRequestFinish(MtPaymentVO mtPaymentVO) throws Exception;
	
	/**
	 * 백계약에 대한 금액상태를 조회한다.
	 *  - 발주금액(mtOrderAmount)
	 *  - 미지급금액(yetPaymentAmount)
	 *  - 기지급금액(donePaymentAmount)
	 *  - 요청금액(callTotalAmount)
	 * <pre>
	 * </pre>
	 * 
	 * @param mtOrderKey
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 12. 오후 5:58:05
	 * @author aranghoo
	 */
	public EgovMap selectMtBackOrderAmountInfo(String mtOrderKey) throws Exception;
	
	
	/**
	 * 작업발주에 대한 금액상태를 조회한다.
	 *  - 발주금액(mtOrderAmount)
	 *  - 미지급금액(yetPaymentAmount)
	 *  - 기지급금액(donePaymentAmount)
	 *  - 요청금액(callTotalAmount)
	 * <pre>
	 * </pre>
	 * 
	 * @param mtOrderKey
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 12. 오후 5:58:05
	 * @author aranghoo
	 */
	public EgovMap selectMtOrderAmountInfo(String mtOrderKey) throws Exception;
	
}
