package com.cep.mngProject.fundSchedule.service.impl;

import java.util.List;

import com.cep.mngProject.fundSchedule.vo.MngProjectFundScheduleVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mngProjectFundScheduleMapper")
public interface MngProjectFundScheduleMapper {
	             
	
	public List<EgovMap> selectFundScheduleSdList(MngProjectFundScheduleVO mngProjectFundScheduleVO) throws Exception;
	
	public int selectFundScheduleSdTotalAmount(MngProjectFundScheduleVO mngProjectFundScheduleVO) throws Exception;
	
	public List<EgovMap> selectFundSchedulePcList(MngProjectFundScheduleVO mngProjectFundScheduleVO) throws Exception;
	
	public int selectFundSchedulePcTotalAmount(MngProjectFundScheduleVO mngProjectFundScheduleVO) throws Exception;
	
	public List<EgovMap> selectOrderProductSdList(MngProjectFundScheduleVO mngProjectFundScheduleVO) throws Exception;
	
	public List<EgovMap> selectOrderProductPcList(MngProjectFundScheduleVO mngProjectFundScheduleVO) throws Exception;
}
