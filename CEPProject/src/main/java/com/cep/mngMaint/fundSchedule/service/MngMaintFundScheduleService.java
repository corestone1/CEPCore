package com.cep.mngMaint.fundSchedule.service;

import java.util.List;

import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngMaintFundScheduleService {

	/**
	 * 유지보수관리 >> 수금.지급현황  >> 수금 현황 목록조회
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 21. 오후 3:33:30
	 * @author aranghoo
	 */
	public List<EgovMap> selectMtCollectRequestList(MngMaintBillSearchVO searchVO) throws Exception;
	
	/**
	 * 유지보수관리 >> 수금.지급현황  >> 지급 현황 목록조회
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 10. 21. 오후 3:33:40
	 * @author aranghoo
	 */
	public List<EgovMap> selectMtPaymentRequestList(MngMaintBillSearchVO searchVO) throws Exception;
}
