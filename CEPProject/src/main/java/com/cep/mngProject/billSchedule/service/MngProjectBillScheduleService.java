package com.cep.mngProject.billSchedule.service;

import com.cep.mngProject.billSchedule.vo.MngProjectBillScheduleVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngProjectBillScheduleService {

	//public List<EgovMap> selectBillScheduleList(MngProjectBillScheduleVO billScheduleVO) throws Exception;
	public EgovMap selectBillScheduleList(MngProjectBillScheduleVO billScheduleVO) throws Exception;
}
