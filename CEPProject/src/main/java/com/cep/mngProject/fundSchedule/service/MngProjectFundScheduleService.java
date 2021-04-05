package com.cep.mngProject.fundSchedule.service;

import java.util.List;

import com.cep.mngProject.fundSchedule.vo.MngProjectFundScheduleVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngProjectFundScheduleService {
	
	public EgovMap selectFundScheduleList(MngProjectFundScheduleVO mngProjectFundScheduleVO) throws Exception;
	
	public List<EgovMap> selectOrderProductList(MngProjectFundScheduleVO mngProductFundScheduleVO) throws Exception;
	
}
