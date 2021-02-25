package com.cep.mngProject.order.service;

import java.util.List;

import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngProject.order.vo.MngOrderSearchVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngProjectOrderService {
	
	public List<EgovMap> selectOrderList(MngOrderSearchVO mngOrderSearchVO) throws Exception;

	public void deleteOrder(MngOrderSearchVO mngOrderSearchVO) throws Exception;
	
	public List<EgovMap> selectDirectorList(AccountSearchVO acountSearchVO) throws Exception;
}
