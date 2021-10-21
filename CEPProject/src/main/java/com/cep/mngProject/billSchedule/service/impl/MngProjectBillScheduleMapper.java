package com.cep.mngProject.billSchedule.service.impl;

import java.util.List;

import com.cep.mngProject.billSchedule.vo.MngProjectBillScheduleVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mngProjectBillCalendarMapper")
public interface MngProjectBillScheduleMapper {

	public List<EgovMap> selectBillScheduleList(MngProjectBillScheduleVO billScheduleVO) throws Exception;
	
	public int selectBillScheduleTotalAmount(MngProjectBillScheduleVO billScheduleVO) throws Exception;
	
	public int selectBillScheduleTotalTax(MngProjectBillScheduleVO billScheduleVO) throws Exception;
	
}
