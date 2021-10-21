package com.cep.mngMaint.billSchedule.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.mngMaint.bill.service.impl.MngMaintBillMapper;
import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;
import com.cep.mngMaint.billSchedule.service.MngMaintBillScheduleService;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngMaintBillScheduleService")
public class MngMaintBillScheduleServiceImpl implements MngMaintBillScheduleService {
	private static final Logger logger = LoggerFactory.getLogger(MngMaintBillScheduleServiceImpl.class);
	
	@Resource(name="mngMaintBillMapper")
	private MngMaintBillMapper mapper;
		
	@Override
	public List<EgovMap> selectMtBillRequestList(MngMaintBillSearchVO searchVO) throws Exception {
		return mapper.selectMtBillRequestList(searchVO);
	}	
}
