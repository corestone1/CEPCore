package com.cep.mngProject.order.service.impl;

import java.util.List;

import com.cep.mngProject.order.vo.MngOrderSearchVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mngProjectOrderMapper")
public interface MngProjectOrderMapper {
	
	public List<EgovMap> selectOrderList(MngOrderSearchVO mngOrderSearchVO) throws Exception;

	public void deleteOrder(MngOrderSearchVO mngOrderSearchVO) throws Exception;
}
