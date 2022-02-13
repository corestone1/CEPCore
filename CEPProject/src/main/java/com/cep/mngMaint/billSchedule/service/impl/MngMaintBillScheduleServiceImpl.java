package com.cep.mngMaint.billSchedule.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.maintenance.contract.vo.MtContractVO;
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
		List<EgovMap> billReqList = null;
		try {
			billReqList = mapper.selectMtBillRequestList(searchVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return billReqList;
	}	
	


	@Override
	public List<EgovMap> selectMtSalesBillPlanList(MngMaintBillSearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectMtSalesBillPlanList(searchVO);
	}

	

	@Override
	public List<EgovMap> selectMtSalesBillApprovalList(MtContractVO mtContractVO) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectMtSalesBillApprovalList(mtContractVO);
	}


	@Override
	public List<EgovMap> selectManufacturerList() throws Exception {
		// TODO Auto-generated method stub 
		return mapper.selectManufacturerList();
	}



	@Override
	public List<EgovMap> selectMtPaymentPlanList(MngMaintBillSearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectMtPaymentPlanList(searchVO);
	}
	
	@Override
	public List<EgovMap> selectMtPurchaseApprovalList(MtContractVO mtContractVO) throws Exception{
		return mapper.selectMtPurchaseApprovalList(mtContractVO);
	}
		
}
