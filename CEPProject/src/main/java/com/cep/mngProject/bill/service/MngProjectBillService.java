package com.cep.mngProject.bill.service;

import java.util.List;
import java.util.Map;

import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngProjectBillService {

	public List<EgovMap> selectSdBillList(MngProjectBillSearchVO searchVO ) throws Exception;
	
	public EgovMap selectBillBasicInfo(MngProjectBillSearchVO searchVO) throws Exception;

	public Integer selectCollectTurn(MngProjectBillSearchVO searchVO) throws Exception;
	
	public EgovMap selectBillDetailInfo(MngProjectBillSearchVO searchVO) throws Exception;
	
	public Map<String, Object> insertBillRequest(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public Map<String, Object> selectXmlBillList(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void insertSdBillingXml(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void deleteSdBillingXml(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public Map<String, Object> updatePaymentsComplate(MngProjectBillVO mngProjectBillVO) throws Exception;
	
	public void updateBillComplate(MngProjectBillVO mngProjectBillVO) throws Exception;
	
}
