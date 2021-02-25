package com.cep.mngMaint.mapping.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cep.mngMaint.mapping.service.MngMaintMappingService;
import com.cep.mngMaint.mapping.vo.MtOrderBillVO;

@Service("mngMaintMappingService")
public class MngMaintMappingServiceImpl implements MngMaintMappingService {

	@Resource(name="mngMaintMappingMapper")
	private MngMaintMappingMapper mapper;

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
	public List<?> selectBillList(MtOrderBillVO orderBillVO) throws Exception {
		List<?> resultList = null;
		try {
			resultList = mapper.selectOrderBillList(orderBillVO);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return resultList;
	}
}
