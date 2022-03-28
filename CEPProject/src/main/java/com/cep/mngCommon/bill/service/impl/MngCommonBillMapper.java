
package com.cep.mngCommon.bill.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.cep.mngCommon.bill.vo.MngCommonBillSearchVO;
import com.cep.mngCommon.bill.vo.MngCommonBillVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mngCommonBillMapper")
public interface MngCommonBillMapper {
	
	public List<EgovMap> selectBillList(MngCommonBillSearchVO searchVO ) throws Exception;
	
	public List<EgovMap> selectSdBillList(MngCommonBillSearchVO searchVO) throws Exception;
	
	public void deleteBill(MngCommonBillSearchVO searchVO ) throws Exception;
	
//	public EgovMap selectBillBasicInfo(MngCommonBillSearchVO searchVO) throws Exception;

//	public EgovMap selectBillDetailInfo(MngCommonBillSearchVO searchVO) throws Exception;
	
//	public EgovMap selectBillDefaultInfo(MngCommonBillSearchVO searchVO) throws Exception;
	
//	public Integer selectCollectTurn(MngCommonBillSearchVO searchVO) throws Exception;
	
//	public Integer selectBillTurnNoMax(MngCommonBillSearchVO searchVO) throws Exception;
	
//	public void insertBillRequest(MngCommonBillVO mngCommonBillVO) throws Exception;
	
//	public void updateBillRequest(MngCommonBillVO mngCommonBillVO) throws Exception;
	
//	public void updateBillComplate(MngCommonBillVO mngCommonBillVO) throws Exception;
	
//	public void insertBilling(MngCommonBillVO mngCommonBillVO) throws Exception;
	
//	public void updateBillMapping(MngCommonBillVO mngCommonBillVO) throws Exception;
	
//	public void updateSalesDetailPayments(MngCommonBillVO mngCommonBillVO) throws Exception;
 
//	public EgovMap selectSdBillingOp(MngCommonBillVO mngCommonBillVO) throws Exception;
	
//	public void insertSdBillingXml(MngCommonBillVO mngCommonBillVO) throws Exception;
	
	public int selectExistBill(MngCommonBillVO mngCommonBillVO) throws Exception;
	
	public void insertPcBillInfo(MngCommonBillVO mngCommonBillVO) throws SQLException;
	
	public void insertPcBillOpInfo(MngCommonBillVO mngCommonBillVO) throws Exception;
}