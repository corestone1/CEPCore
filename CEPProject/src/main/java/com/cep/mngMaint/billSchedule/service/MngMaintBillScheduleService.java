package com.cep.mngMaint.billSchedule.service;

import java.util.List;

import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngMaintBillScheduleService {


	/**
	 * 유지보수 관리 >>계산서일정 조회화면. 
	 * 매입세금계산서 요청, 매출세금계산서 요청 목록을 조회한다.
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 20. 오후 3:42:17
	 * @author aranghoo
	 */
	public List<EgovMap> selectMtBillRequestList(MngMaintBillSearchVO searchVO) throws Exception;
	
	/**
	 * 유지보수관리 >> 매출계획목록
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 11. 17. 오후 3:34:15
	 * @author aranghoo
	 */
	public List<EgovMap> selectMtSalesBillPlanList(MngMaintBillSearchVO searchVO) throws Exception;
	
	/**
	 * 매출/매입 세금계산서 제조사 구분 목록.
	 * <pre>
	 * </pre>
	 * 
	 * @return
	 * @throws Exception
	 * @cdate 2021. 11. 22. 오후 4:15:32
	 * @author aranghoo
	 */
	public List<EgovMap> selectManufacturerList() throws Exception;
	
	/**
	 * 유지보수관리 >> 지급계획목록
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 12. 13. 오후 2:08:32
	 * @author aranghoo
	 */
	public List<EgovMap> selectMtPaymentPlanList(MngMaintBillSearchVO searchVO) throws Exception;
}
