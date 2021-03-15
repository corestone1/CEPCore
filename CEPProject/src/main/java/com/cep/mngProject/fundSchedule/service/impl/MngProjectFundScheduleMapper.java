package com.cep.mngProject.fundSchedule.service.impl;

import java.util.List;

import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mngProjectFundScheduleMapper")
public interface MngProjectFundScheduleMapper {
	
	public List<EgovMap> selectBillScheduleList(MngProjectBillSearchVO searchVO ) throws Exception;

}
