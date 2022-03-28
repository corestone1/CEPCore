
package com.cep.mngCommon.bill.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.cep.mngCommon.bill.vo.MngCommonBillSearchVO;
import com.cep.mngCommon.bill.vo.MngCommonBillVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngCommonBillService {
	
	public List<EgovMap> selectBillList(MngCommonBillSearchVO searchVO ) throws Exception;
	
	public Map<String, Object> deleteBill(MngCommonBillSearchVO searchVO ) throws Exception;
	
//	public EgovMap selectBillBasicInfo(MngCommonBillSearchVO searchVO) throws Exception;
	
//	public EgovMap selectBillDetailInfo(MngCommonBillSearchVO searchVO) throws Exception;
	
//	public Integer selectCollectTurn(MngCommonBillSearchVO searchVO) throws Exception;
	
//	public void insertBillRequest(MngCommonBillVO mngCommonBillVO) throws Exception;
	
//	public void updateBillComplate(MngCommonBillVO mngCommonBillVO) throws Exception;
	
//	public void writeBillInsert(MngCommonBillVO mngCommonBillVO) throws Exception;
	
//	public void updatePaymentsComplate(MngCommonBillVO mngCommonBillVO) throws Exception;
	
//	public void insertSdBillingXml(MngCommonBillVO mngCommonBillVO) throws Exception;
	
//	public EgovMap selectSdBillingOp(MngCommonBillVO mngCommonBillVO) throws Exception;
	
	public int selectExistBill(MngCommonBillVO mngCommonBillVO) throws Exception;
	
	public Map<String, Object> insertBillingExcelBatch(MngCommonBillVO mngCommonBillVO) throws Exception;
	
}
