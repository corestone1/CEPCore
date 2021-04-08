
package com.cep.mngProject.bill.service.impl;

import java.util.List;

import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mngProjectBillMapper")
public interface MngProjectBillMapper {
	
	public List<EgovMap> selectBillList(MngProjectBillSearchVO searchVO ) throws Exception;
	
	public List<EgovMap> selectSdBillList(MngProjectBillSearchVO searchVO) throws Exception;
	
	public void deleteBill(MngProjectBillSearchVO searchVO ) throws Exception;
	
	public EgovMap selectBillBasicInfo(MngProjectBillSearchVO searchVO) throws Exception;

	public EgovMap selectBillDetailInfo(MngProjectBillSearchVO searchVO) throws Exception;
	
	public EgovMap selectBillDefaultInfo(MngProjectBillSearchVO searchVO) throws Exception;
	
	public int selectCollectTurn(MngProjectBillSearchVO searchVO) throws Exception;
	
	public int selectBillTurnNoMax(MngProjectBillSearchVO searchVO) throws Exception;
	
	public void insertBillRequest(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void updateBillRequest(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void updateBillComplate(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void insertBilling(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void updateBillMapping(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void updateSalesDetailPayments(MngProjectBillVO mngProjectBillVO) throws Exception;
 
	public EgovMap selectSdBillingOp(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void insertSdBillingXml(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void insertPcBillInfo(MngProjectBillVO mngProjectBillVO) throws Exception;
}