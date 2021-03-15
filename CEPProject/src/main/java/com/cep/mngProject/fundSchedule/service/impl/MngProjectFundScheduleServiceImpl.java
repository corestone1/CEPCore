package com.cep.mngProject.fundSchedule.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.fundSchedule.service.MngProjectFundScheduleService;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngProjectFundScheduleService")
public class MngProjectFundScheduleServiceImpl implements MngProjectFundScheduleService {

	
	@Resource(name="mngProjectFundScheduleMapper")
	private MngProjectFundScheduleMapper mapper;
	
	
	@Override
	public List<EgovMap> selectBillScheduleList(MngProjectBillSearchVO searchVO ) throws Exception
	{
		return mapper.selectBillScheduleList(searchVO);
	}
}
