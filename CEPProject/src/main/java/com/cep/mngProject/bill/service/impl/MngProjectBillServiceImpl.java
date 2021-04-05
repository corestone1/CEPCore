<<<<<<< HEAD
package com.cep.mngProject.bill.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.mngProject.bill.service.MngProjectBillService;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;
import com.cep.mngProject.order.service.impl.MngProjectOrderServiceImpl;
import com.cep.mngProject.order.vo.MngOrderInsertVO;
import com.cmm.util.CepDateUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngProjectBillService")
public class MngProjectBillServiceImpl implements MngProjectBillService {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectOrderServiceImpl.class);
	
	@Resource(name="mngProjectBillMapper")
	private MngProjectBillMapper mapper;
	
	@Override
	public List<EgovMap> selectBillList(MngProjectBillSearchVO searchVO ) throws Exception {
		
//		return mapper.selectBillList(searchVO);
		
		return mapper.selectSdBillList(searchVO);
	}
	
	@Override
	public void deleteBill(MngProjectBillSearchVO searchVO ) throws Exception
	{
		mapper.deleteBill(searchVO);
	}
	
	@Override
	public EgovMap selectBillBasicInfo(MngProjectBillSearchVO searchVO) throws Exception
	{
		return mapper.selectBillBasicInfo(searchVO);
	}
	
	@Override
	public int selectCollectTurn(MngProjectBillSearchVO searchVO) throws Exception
	{
		return mapper.selectCollectTurn(searchVO);
	}
	
	@Override
	public EgovMap selectBillDetailInfo(MngProjectBillSearchVO searchVO) throws Exception
	{
		
		//계산서 순번 구하기
		int litBillTurnNo = 1;
		
		if(searchVO.getBillTurnNo() == 0){
			litBillTurnNo = mapper.selectBillTurnNoMax(searchVO);	
		}
		else
		{
			litBillTurnNo = searchVO.getBillTurnNo();
		}
		
		searchVO.setBillTurnNo(litBillTurnNo);
		
		logger.debug("####== billTurnNo : {}", litBillTurnNo);
		
		EgovMap billMap = mapper.selectBillDetailInfo(searchVO);
		
		logger.debug("####1== billMap : {}", billMap);
		
		if(billMap == null || billMap.get("billCallKey") == null || billMap.get("billCallKey").equals(""))
		{
			//계산서 요청 정보가 없으므로 PJ_SALES_DETAIL_TB 에서 기본 정보를 조회한다.
			billMap = mapper.selectBillDefaultInfo(searchVO);
		}
		
		logger.debug("####2== billMap : {}", billMap);
		
		
		return billMap;
	}
	
	@Override
	public void insertBillRequest(MngProjectBillVO mngProjectBillVO) throws Exception
	{
		
		//billCallKey가 있으면 Update 없으면 Insert
		if(mngProjectBillVO.getBillCallKey() == null || mngProjectBillVO.getBillCallKey().equals("")) {
			//신규
			mngProjectBillVO.setBillIssueStatus("R");
			mapper.insertBillRequest(mngProjectBillVO);
		} else {
			//수정
			mapper.updateBillRequest(mngProjectBillVO);
		}
		
	}

	@Override
	public void updateBillComplate(MngProjectBillVO mngProjectBillVO) throws Exception
	{
		mngProjectBillVO.setBillIssueStatus("I");
		mapper.updateBillComplate(mngProjectBillVO);
	}
	
	
	@Override
	@Transactional
	public void writeBillInsert(MngProjectBillVO mngProjectBillVO) throws Exception
	{
		//PJ_SD_BILLING_TB INSERT
		
		//계산서 번호등 임시 데이터 생성
		mngProjectBillVO.setBillNo(CepDateUtil.getToday("yyyyMMddHHmmssSSS"));
		mngProjectBillVO.setBillIssueDt(CepDateUtil.getToday("yyyyMMdd"));
		mngProjectBillVO.setBillMappingYn("Y");
		
		mapper.insertBilling(mngProjectBillVO);
		
		//PJ_SD_BILLING_OP_TB UPDATE
		mapper.updateBillMapping(mngProjectBillVO);
		
	}
	
	@Override
	@Transactional
	public void updatePaymentsComplate(MngProjectBillVO mngProjectBillVO) throws Exception
	{
		//계산서 상태 변경
		mngProjectBillVO.setBillIssueStatus("E");
		mapper.updateBillComplate(mngProjectBillVO);
		
		//PJ_SALES_DETAIL_TB UPDATE(수금)
		mapper.updateSalesDetailPayments(mngProjectBillVO);
	}
	
	@Override
	public EgovMap selectSdBillingOp(MngProjectBillVO mngProjectBillVO) throws Exception {
		
		return  mapper.selectSdBillingOp(mngProjectBillVO);
	}
	
	
	@Override
	@Transactional
	public void insertSdBillingXml(MngProjectBillVO mngProjectBillVO) throws Exception {
		
		//PJ_SD_BILLING_TB Insert
		mapper.insertSdBillingXml(mngProjectBillVO);
		
		
		//PJ_SD_BILLING_OP_TB Update
		mapper.updateBillMapping(mngProjectBillVO);
	}
	
	
	@Override
	@Transactional
	public void insertBillingExcelBatch(MngProjectBillVO mngProjectBillVO) throws Exception {
		
		List<MngProjectBillVO> lltBillVO = mngProjectBillVO.getMngBillInsertVOList();
		int litListSize = lltBillVO.size();
		
		MngProjectBillVO billVO;
		
		for(int i = 0; i < litListSize; i++)
		{
			billVO = lltBillVO.get(i);
			
			billVO.setRegEmpKey(mngProjectBillVO.getRegEmpKey());
			
			logger.debug("billVO.getBillNo()          : {}", billVO.getBillNo());
			logger.debug("billVO.getAcKey()           : {}", billVO.getAcKey());
			logger.debug("billVO.getBillAmount()      : {}", billVO.getBillAmount());
			logger.debug("billVO.getBillIssueDt()     : {}", billVO.getBillIssueDt());
			logger.debug("billVO.getBillIssueStatus() : {}", billVO.getBillIssueStatus());
			
			
			//PJ_PC_BILLING_TB Insert
			mapper.insertPcBillInfo(billVO);
		}
	}
}
=======
package com.cep.mngProject.bill.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.mngProject.bill.service.MngProjectBillService;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;
import com.cep.mngProject.order.service.impl.MngProjectOrderServiceImpl;
import com.cmm.util.CepDateUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngProjectBillService")
public class MngProjectBillServiceImpl implements MngProjectBillService {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectOrderServiceImpl.class);
	
	@Resource(name="mngProjectBillMapper")
	private MngProjectBillMapper mapper;
	
	@Override
	public List<EgovMap> selectBillList(MngProjectBillSearchVO searchVO ) throws Exception {
		
//		return mapper.selectBillList(searchVO);
		
		return mapper.selectSdBillList(searchVO);
	}
	
	@Override
	public void deleteBill(MngProjectBillSearchVO searchVO ) throws Exception
	{
		mapper.deleteBill(searchVO);
	}
	
	@Override
	public EgovMap selectBillBasicInfo(MngProjectBillSearchVO searchVO) throws Exception
	{
		return mapper.selectBillBasicInfo(searchVO);
	}
	
	@Override
	public int selectCollectTurn(MngProjectBillSearchVO searchVO) throws Exception
	{
		return mapper.selectCollectTurn(searchVO);
	}
	
	@Override
	public EgovMap selectBillDetailInfo(MngProjectBillSearchVO searchVO) throws Exception
	{
		
		//계산서 순번 구하기
		int litBillTurnNo = 1;
		
		if(searchVO.getBillTurnNo() == 0){
			litBillTurnNo = mapper.selectBillTurnNoMax(searchVO);	
		}
		else
		{
			litBillTurnNo = searchVO.getBillTurnNo();
		}
		
		searchVO.setBillTurnNo(litBillTurnNo);
		
		logger.debug("####== billTurnNo : {}", litBillTurnNo);
		
		EgovMap billMap = mapper.selectBillDetailInfo(searchVO);
		
		logger.debug("####1== billMap : {}", billMap);
		
		if(billMap == null || billMap.get("billCallKey") == null || billMap.get("billCallKey").equals(""))
		{
			//계산서 요청 정보가 없으므로 PJ_SALES_DETAIL_TB 에서 기본 정보를 조회한다.
			billMap = mapper.selectBillDefaultInfo(searchVO);
		}
		
		logger.debug("####2== billMap : {}", billMap);
		
		
		return billMap;
	}
	
	@Override
	public void insertBillRequest(MngProjectBillVO mngProjectBillVO) throws Exception
	{
		
		//billCallKey가 있으면 Update 없으면 Insert
		if(mngProjectBillVO.getBillCallKey() == null || mngProjectBillVO.getBillCallKey().equals("")) {
			//신규
			mngProjectBillVO.setBillIssueStatus("R");
			mapper.insertBillRequest(mngProjectBillVO);
		} else {
			//수정
			mapper.updateBillRequest(mngProjectBillVO);
		}
		
	}

	@Override
	public void updateBillComplate(MngProjectBillVO mngProjectBillVO) throws Exception
	{
		mngProjectBillVO.setBillIssueStatus("I");
		mapper.updateBillComplate(mngProjectBillVO);
	}
	
	
	@Override
	@Transactional
	public void writeBillInsert(MngProjectBillVO mngProjectBillVO) throws Exception
	{
		//PJ_SD_BILLING_TB INSERT
		
		//계산서 번호등 임시 데이터 생성
		mngProjectBillVO.setBillNo(CepDateUtil.getToday("yyyyMMddHHmmssSSS"));
		mngProjectBillVO.setBillIssueDt(CepDateUtil.getToday("yyyyMMdd"));
		mngProjectBillVO.setBillMappingYn("Y");
		
		mapper.insertBilling(mngProjectBillVO);
		
		//PJ_SD_BILLING_OP_TB UPDATE
		mapper.updateBillMapping(mngProjectBillVO);
		
	}
	
	@Override
	@Transactional
	public void updatePaymentsComplate(MngProjectBillVO mngProjectBillVO) throws Exception
	{
		//계산서 상태 변경
		mngProjectBillVO.setBillIssueStatus("E");
		mapper.updateBillComplate(mngProjectBillVO);
		
		//PJ_SALES_DETAIL_TB UPDATE(수금)
		mapper.updateSalesDetailPayments(mngProjectBillVO);
	}
	
}
>>>>>>> branch 'master' of https://github.com/corestone1/CEPCore.git
