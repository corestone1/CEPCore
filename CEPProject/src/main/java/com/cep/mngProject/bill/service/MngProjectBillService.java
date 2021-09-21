
package com.cep.mngProject.bill.service;

import java.util.List;

import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngProjectBillService {
	
	public List<EgovMap> selectBillList(MngProjectBillSearchVO searchVO ) throws Exception;
	
	public void deleteBill(MngProjectBillSearchVO searchVO ) throws Exception;
	
	public EgovMap selectBillBasicInfo(MngProjectBillSearchVO searchVO) throws Exception;
	
	public EgovMap selectBillDetailInfo(MngProjectBillSearchVO searchVO) throws Exception;
	
	public Integer selectCollectTurn(MngProjectBillSearchVO searchVO) throws Exception;
	
	public void insertBillRequest(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void updateBillComplate(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void writeBillInsert(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void updatePaymentsComplate(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void insertSdBillingXml(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public EgovMap selectSdBillingOp(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void insertBillingExcelBatch(MngProjectBillVO mngProjectBillVO) throws Exception;
	
}
