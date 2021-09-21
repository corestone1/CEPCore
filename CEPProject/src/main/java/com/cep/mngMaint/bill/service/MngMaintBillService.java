package com.cep.mngMaint.bill.service;


import java.util.List;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;
import com.cep.mngMaint.bill.vo.MngMaintBillVO;
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
	public List<EgovMap> selectBillList(MngMaintBillSearchVO searchVO ) throws Exception;
	
	/**
	 * 유지보수 매출 세금계산서 완료처리
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
	public void updateSdPaymentStatus(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	
}
