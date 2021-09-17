package com.cep.mngMaint.order.service;

import java.util.List;

import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngMaint.order.vo.MngMtOrderSearchVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngMaintOrderService {
	
	/**
	 * 발주목록 조회.(유지보수관리 ==> 발주목록)
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 9. 15. 오후 5:09:31
	 * @author aranghoo
	 */
	public List<EgovMap> selectMtOrdertList(MngMtOrderSearchVO searchVO) throws Exception;

	public void deleteOrder(MngMtOrderSearchVO mngOrderSearchVO) throws Exception;
	
	public List<EgovMap> selectDirectorList(AccountSearchVO acountSearchVO) throws Exception;
}
