package com.cep.mngProject.order.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cep.mngCommon.account.service.impl.AccountMapper;
import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngProject.order.service.MngProjectOrderService;
import com.cep.mngProject.order.vo.MngOrderSearchVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngProjectOrderService")
public class MngProjectOrderServiceImpl implements MngProjectOrderService {

	@Resource(name="mngProjectOrderMapper")
	private MngProjectOrderMapper mapper;
	
	@Resource(name="accountMapper")
	private AccountMapper acMapper;
	
	@Override
	public List<EgovMap> selectOrderList(MngOrderSearchVO mngOrderSearchVO) throws Exception
	{
		return mapper.selectOrderList(mngOrderSearchVO);
	}
	
	@Override
	public void deleteOrder(MngOrderSearchVO mngOrderSearchVO) throws Exception
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
