package com.cep.mngProject.bill.service.impl;

import java.util.List;

import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mngProjectBillMapper")
public interface MngProjectBillMapper {
	
	public List<EgovMap> selectSdBillList(MngProjectBillSearchVO searchVO ) throws Exception;
	
	public EgovMap selectBillBasicInfo(MngProjectBillSearchVO searchVO) throws Exception;

	public Integer selectCollectTurn(MngProjectBillSearchVO searchVO) throws Exception;
	
	public Integer selectBillTurnNoMax(MngProjectBillSearchVO searchVO) throws Exception;
	
	public EgovMap selectBillDetailInfo(MngProjectBillSearchVO searchVO) throws Exception;
	
	public EgovMap selectBillDefaultInfo(MngProjectBillSearchVO searchVO) throws Exception;
	
	public List<EgovMap> selectXmlBillList(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void insertBillRequest(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void updateBillRequest(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void insertSdBillingXml(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void deleteSdBillingXml(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void updateBillMapping(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void updateBillComplate(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void updateSalesDetailPayments(MngProjectBillVO mngProjectBillVO) throws Exception;
	
}
