package com.cep.mngMaint.order.service.impl;

import java.util.List;

import com.cep.mngMaint.order.vo.MngMtOrderSearchVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mngMaintOrderMapper")
public interface MngMaintOrderMapper {
	
	public List<EgovMap> selectMtOrdertList(MngMtOrderSearchVO mngOrderSearchVO) throws Exception;

	public void deleteOrder(MngMtOrderSearchVO mngOrderSearchVO) throws Exception;
}
