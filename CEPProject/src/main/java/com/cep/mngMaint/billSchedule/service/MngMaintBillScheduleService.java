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
}
