
package com.cep.mngCommon.bill.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.mngCommon.bill.service.MngCommonBillService;
import com.cep.mngCommon.bill.vo.MngCommonBillSearchVO;
import com.cep.mngCommon.bill.vo.MngCommonBillVO;
import com.cep.mngProject.order.service.impl.MngProjectOrderServiceImpl;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngCommonBillService")
public class MngCommonBillServiceImpl implements MngCommonBillService {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectOrderServiceImpl.class);
	
	@Resource(name="mngCommonBillMapper")
	private MngCommonBillMapper mapper;
	
	@Override
	public List<EgovMap> selectBillList(MngCommonBillSearchVO searchVO ) throws Exception {
		
//		return mapper.selectBillList(searchVO);
		
		return mapper.selectBillList(searchVO);
	}
	
	@Override
	public Map<String, Object> deleteBill(MngCommonBillSearchVO searchVO ) throws Exception
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			mapper.deleteBill(searchVO);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			e.printStackTrace();
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	/*@Override
	public EgovMap selectBillBasicInfo(MngCommonBillSearchVO searchVO) throws Exception
	{
		return mapper.selectBillBasicInfo(searchVO);
	}*/
	
	/*@Override
	public Integer selectCollectTurn(MngCommonBillSearchVO searchVO) throws Exception
	{
		return mapper.selectCollectTurn(searchVO);
	}*/
	
	/*@Override
	public EgovMap selectBillDetailInfo(MngCommonBillSearchVO searchVO) throws Exception
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
	}*/
	
	/*@Override
	public void insertBillRequest(MngCommonBillVO mngCommonBillVO) throws Exception
	{
		
		//billCallKey가 있으면 Update 없으면 Insert
		if(mngCommonBillVO.getBillCallKey() == null || mngCommonBillVO.getBillCallKey().equals("")) {
			//신규
			mngCommonBillVO.setBillIssueStatus("R");
			mapper.insertBillRequest(mngCommonBillVO);
		} else {
			//수정
			mapper.updateBillRequest(mngCommonBillVO);
		}
		
	}*/

	/*@Override
	public void updateBillComplate(MngCommonBillVO mngCommonBillVO) throws Exception
	{
		mngCommonBillVO.setBillIssueStatus("I");
		mapper.updateBillComplate(mngCommonBillVO);
	}*/
	
	
	/*@Override
	@Transactional
	public void writeBillInsert(MngCommonBillVO mngCommonBillVO) throws Exception
	{
		//PJ_SD_BILLING_TB INSERT
		
		//계산서 번호등 임시 데이터 생성
		mngCommonBillVO.setBillNo(CepDateUtil.getToday("yyyyMMddHHmmssSSS"));
		mngCommonBillVO.setBillIssueDt(CepDateUtil.getToday("yyyyMMdd"));
		mngCommonBillVO.setBillMappingYn("Y");
		
		mapper.insertBilling(mngCommonBillVO);
		
		//PJ_SD_BILLING_OP_TB UPDATE
		mapper.updateBillMapping(mngCommonBillVO);
		
	}*/
	
	/*@Override
	@Transactional
	public void updatePaymentsComplate(MngCommonBillVO mngCommonBillVO) throws Exception
	{
		//계산서 상태 변경
		mngCommonBillVO.setBillIssueStatus("E");
		mapper.updateBillComplate(mngCommonBillVO);
		
		//PJ_SALES_DETAIL_TB UPDATE(수금)
		mapper.updateSalesDetailPayments(mngCommonBillVO);
	}*/
	
	/*@Override
	public EgovMap selectSdBillingOp(MngCommonBillVO mngCommonBillVO) throws Exception {
		
		return  mapper.selectSdBillingOp(mngCommonBillVO);
	}*/
	
	
	/*@Override
	@Transactional
	public void insertSdBillingXml(MngCommonBillVO mngCommonBillVO) throws Exception {
		
		//PJ_SD_BILLING_TB Insert
		mapper.insertSdBillingXml(mngCommonBillVO);
		
		
		//PJ_SD_BILLING_OP_TB Update
		mapper.updateBillMapping(mngCommonBillVO);
	}*/
	
	@Override
	@Transactional
	public int selectExistBill(MngCommonBillVO mngCommonBillVO) throws Exception {
		List<MngCommonBillVO> lltBillVO = mngCommonBillVO.getMngBillInsertVOList();
		int litListSize = lltBillVO.size();
		int result = 0;
		
		MngCommonBillVO billVO;
		for(int i = 0; i < litListSize; i++) {
			billVO = lltBillVO.get(i);
			result = mapper.selectExistBill(billVO);
			if(result != 0) {
				break;
			}
		}
		
		return result;
	}
	
	
	@Override
	@Transactional
	public Map<String, Object> insertBillingExcelBatch(MngCommonBillVO mngCommonBillVO) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<MngCommonBillVO> lltBillVO = mngCommonBillVO.getMngBillInsertVOList();
		int litListSize = lltBillVO.size();
		
		MngCommonBillVO billVO;
		try {
			for(int i = 0; i < litListSize; i++) {
				billVO = lltBillVO.get(i);
				
				billVO.setRegEmpKey(mngCommonBillVO.getRegEmpKey());
				
				logger.debug("billVO.getBillNo()          : {}", billVO.getBillNo());
				logger.debug("billVO.getAcKey()           : {}", billVO.getAcKey());
				logger.debug("billVO.getBillAmount()      : {}", billVO.getBillAmount());
				logger.debug("billVO.getBillIssueDt()     : {}", billVO.getBillIssueDt());
				logger.debug("billVO.getBillIssueStatus() : {}", billVO.getBillIssueStatus());
				
				
				//CMM_PC_BILLING_TB Insert
				mapper.insertPcBillInfo(billVO);
			} 
			returnMap.put("successYN","Y");
		}catch(Exception e) {
			
		} 
		
		return returnMap;
	}
}


