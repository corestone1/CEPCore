package com.cep.mngProject.fundSchedule.service;

import java.util.List;

import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngProjectFundScheduleService {
	
	public List<EgovMap> selectBillScheduleList(MngProjectBillSearchVO searchVO ) throws Exception;

}
