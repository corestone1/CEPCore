package com.cep.mngMaint.fundSchedule.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cep.mngMaint.bill.service.impl.MngMaintBillMapper;
import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;
import com.cep.mngMaint.fundSchedule.service.MngMaintFundScheduleService;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngMaintFundScheduleService")
public class MngMaintFundScheduleServiceImpl implements MngMaintFundScheduleService {
	@Resource(name="mngMaintBillMapper")
	private MngMaintBillMapper mapper;

	@Override
	public List<EgovMap> selectMtCollectRequestList(MngMaintBillSearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectMtCollectRequestList(searchVO);
	}

	@Override
	public List<EgovMap> selectMtPaymentRequestList(MngMaintBillSearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectMtPaymentRequestList(searchVO);
	}
}
