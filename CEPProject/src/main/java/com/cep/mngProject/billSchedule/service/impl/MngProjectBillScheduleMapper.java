package com.cep.mngProject.billSchedule.service.impl;

import java.util.List;

import com.cep.mngProject.billSchedule.vo.MngProjectBillScheduleVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mngProjectBillCalendarMapper")
public interface MngProjectBillScheduleMapper {

	public List<EgovMap> selectBillScheduleSdList(MngProjectBillScheduleVO billScheduleVO) throws Exception;
	
	public int selectBillScheduleSdTotalAmount(MngProjectBillScheduleVO billScheduleVO) throws Exception;
	
	public int selectBillScheduleSdTotalTax(MngProjectBillScheduleVO billScheduleVO) throws Exception;
	
}
