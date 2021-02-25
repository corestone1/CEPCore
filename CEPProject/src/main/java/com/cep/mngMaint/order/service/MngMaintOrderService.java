package com.cep.mngMaint.order.service;

import java.util.List;

import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngMaint.order.vo.MngMtOrderSearchVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngMaintOrderService {
	
	public List<EgovMap> selectOrderList(MngMtOrderSearchVO mngOrderSearchVO) throws Exception;

	public void deleteOrder(MngMtOrderSearchVO mngOrderSearchVO) throws Exception;
	
	public List<EgovMap> selectDirectorList(AccountSearchVO acountSearchVO) throws Exception;
}
