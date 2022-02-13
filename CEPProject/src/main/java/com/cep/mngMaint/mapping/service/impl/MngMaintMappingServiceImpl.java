package com.cep.mngMaint.mapping.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.maintenance.contract.service.MtContractService;
import com.cep.mngMaint.bill.service.impl.MngMaintBillMapper;
import com.cep.mngMaint.bill.vo.MtPaymentVO;
import com.cep.mngMaint.mapping.service.MngMaintMappingService;
import com.cep.mngMaint.mapping.vo.MtOrderBillVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.util.CepStringUtil;

@Service("mngMaintMappingService")
public class MngMaintMappingServiceImpl implements MngMaintMappingService {

	@Resource(name="mngMaintMappingMapper")
	private MngMaintMappingMapper mapper;
	
	@Resource(name="mtContractService")
	private MtContractService contService;
	
	@Resource(name="mngMaintBillMapper")
	private MngMaintBillMapper billMapper;

	@Override
	public List<?> selectOrderBillList(MtOrderBillVO orderBillVO) throws Exception {
		List<?> resultList = null;
		try {
			resultList = mapper.selectOrderBillList(orderBillVO);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return resultList;
	}

	@Override
	public MtOrderBillVO selectMtOrderBillDetail(MtOrderBillVO orderBillVO) throws Exception {
		MtOrderBillVO mtOrderBillVO = null;
		try {
			mtOrderBillVO  = mapper.selectMtOrderBillDetail(orderBillVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return mtOrderBillVO;
	}
	
	
	@Override
	public List<?> selectMappingBillList(MtOrderBillVO orderBillVO) throws Exception {
		List<?> resultList = null;
		try {
			resultList = mapper.selectMappingBillList(orderBillVO);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return resultList;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.mngMaint.mapping.service.MngMaintMappingService#writePaymentBillMapping(com.cep.mngMaint.bill.vo.MtPaymentVO)
	 */
	@Override
	@Transactional
	public String writePaymentBillMapping(MtPaymentVO mtPaymentVO) throws Exception {
		String paymentKey = null;
		try {
//			지급관리키를 생성한다.
			paymentKey = contService.makePrimaryKey(PrimaryKeyType.MAINTENACE_PAYMENT);
			if(!"".equals(CepStringUtil.getDefaultValue(paymentKey, ""))) {
				mtPaymentVO.setPaymentKey(paymentKey);
//				writePaymentRequestInfo2(mtPaymentVO);
				
//				1. MT_PC_BILLING_OP_TB(지급테이블)에 계산서 매핑정보 등록
				mapper.writePaymentBillMapping(mtPaymentVO);
				
//				2. CMM_PC_BILLING_TB(계산서테이블)에 계산서 매핑정보 업데이트
				billMapper.updatePaymentRequestBill(mtPaymentVO);
			} else {
				throw new Exception("Can't make payment key !! please check DB!!");
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return paymentKey;
	}

}
