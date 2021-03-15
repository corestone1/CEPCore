package com.cep.mngProject.order.service.impl;

import java.util.List;

import com.cep.mngProject.order.vo.MngOrderInsertVO;
import com.cep.mngProject.order.vo.MngOrderSearchVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mngProjectOrderMapper")
public interface MngProjectOrderMapper {
	
	public List<EgovMap> selectOrderList(MngOrderSearchVO mngOrderSearchVO) throws Exception;

	public void deleteOrder(MngOrderSearchVO mngOrderSearchVO) throws Exception;
	
	public String makeOrderKey() throws Exception;
	
	public void insertMngOrderProduct(MngOrderInsertVO mngOrderInsertVO) throws Exception;
	
	public void insertMngOrder(MngOrderInsertVO mngOrderInsertVO) throws Exception;
	
	public EgovMap selectOrderInfo(MngOrderSearchVO mngOrderSearchVO) throws Exception;
	
	public List<EgovMap> selectOrderProductList(MngOrderSearchVO mngOrderSearchVO) throws Exception;
	
	public void updateMngOrder(MngOrderInsertVO mngOrderInsertVO) throws Exception;
	
	public void deleteOrderProductAll(MngOrderInsertVO mngOrderInsertVO) throws Exception;
}
