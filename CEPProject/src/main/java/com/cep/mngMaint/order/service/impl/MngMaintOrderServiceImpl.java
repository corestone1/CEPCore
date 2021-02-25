package com.cep.mngMaint.order.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cep.mngCommon.account.service.impl.AccountMapper;
import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngMaint.order.service.MngMaintOrderService;
import com.cep.mngMaint.order.vo.MngMtOrderSearchVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngMaintOrderService")
public class MngMaintOrderServiceImpl implements MngMaintOrderService {

	@Resource(name="mngMaintOrderMapper")
	private MngMaintOrderMapper mapper;
	
	@Resource(name="accountMapper")
	private AccountMapper acMapper;
	
	@Override
	public List<EgovMap> selectOrderList(MngMtOrderSearchVO mngOrderSearchVO) throws Exception
	{
		return mapper.selectOrderList(mngOrderSearchVO);
	}
	
	@Override
	public void deleteOrder(MngMtOrderSearchVO mngOrderSearchVO) throws Exception
	{
		//Order Table 삭제
		mapper.deleteOrder(mngOrderSearchVO);
		
		//Order Product Table 삭제
	}
	
	@Override
	public List<EgovMap> selectDirectorList(AccountSearchVO acSearchVO) throws Exception
	{
		return acMapper.selectDirectorList(acSearchVO);
	}
}
