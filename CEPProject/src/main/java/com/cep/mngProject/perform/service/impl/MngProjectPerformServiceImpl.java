package com.cep.mngProject.perform.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.mngCommon.account.service.impl.AccountMapper;
import com.cep.mngProject.perform.service.MngProjectPerformService;
import com.cep.mngProject.perform.vo.MngProjectPerformSearchVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngProjectPerformService")
public class MngProjectPerformServiceImpl implements MngProjectPerformService {

	private static final Logger logger = LoggerFactory.getLogger(MngProjectPerformServiceImpl.class);
	
	@Resource(name="mngProjectPerformMapper")
	private MngProjectPerformMapper mapper;
	
	@Resource(name="accountMapper")
	private AccountMapper acMapper;
	
	@Override
	public List<EgovMap> selectWorkList(MngProjectPerformSearchVO mngProjectPerformSearchVO) throws Exception
	{
		return mapper.selectWorkList(mngProjectPerformSearchVO);
	}
	
	@Override
	public List<EgovMap> selectInstallbaseList(MngProjectPerformSearchVO mngProjectPerformSearchVO) throws Exception
	{
		return mapper.selectInstallbaseList(mngProjectPerformSearchVO);
	}
	
}
