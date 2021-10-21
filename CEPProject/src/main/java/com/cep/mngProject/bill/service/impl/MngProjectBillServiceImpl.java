package com.cep.mngProject.bill.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.mngCommon.bill.vo.MngCommonBillVO;
import com.cep.mngProject.bill.service.MngProjectBillService;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngProjectBillService")
public class MngProjectBillServiceImpl implements MngProjectBillService {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectBillServiceImpl.class);
	
	@Resource(name="mngProjectBillMapper")
	private MngProjectBillMapper mapper;
	
	@Override
	public List<EgovMap> selectSdBillList(MngProjectBillSearchVO searchVO ) throws Exception {
		
//		return mapper.selectBillList(searchVO);
		
		return mapper.selectSdBillList(searchVO);
	}
	
	@Override
	public EgovMap selectBillBasicInfo(MngProjectBillSearchVO searchVO) throws Exception {
		return mapper.selectBillBasicInfo(searchVO);
	}
	
	@Override
	public Integer selectCollectTurn(MngProjectBillSearchVO searchVO) throws Exception {
		return mapper.selectCollectTurn(searchVO);
	}
	
	@Override
	public EgovMap selectBillDetailInfo(MngProjectBillSearchVO searchVO) throws Exception {
		
		int litBillTurnNo = 1;
		
		if(searchVO.getBillTurnNo() == 0) {
			litBillTurnNo = mapper.selectBillTurnNoMax(searchVO);
		} else {
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
	public Map<String, Object> selectXmlBillList(MngProjectBillVO mngProjectBillVO) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<EgovMap> resultList = null;
		
		try {
			resultList = mapper.selectXmlBillList(mngProjectBillVO);
			returnMap.put("xmlBillList", resultList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return returnMap;
	}
	
	@Override
	public Map<String, Object> insertBillRequest(MngProjectBillVO mngProjectBillVO) throws Exception
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			//billCallKey가 있으면 Update 없으면 Insert
			if(mngProjectBillVO.getBillCallKey() == null || mngProjectBillVO.getBillCallKey().equals("")) {
				//신규
				mngProjectBillVO.setBillIssueStatus("R");
				mapper.insertBillRequest(mngProjectBillVO);
			} else {
				//수정
				mapper.updateBillRequest(mngProjectBillVO);
			}
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			e.printStackTrace();
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	@Override
	public void insertSdBillingXml(MngProjectBillVO mngProjectBillVO) throws Exception {
		
		//PJ_SD_BILLING_TB Insert
		mapper.insertSdBillingXml(mngProjectBillVO);
		
		mngProjectBillVO.setBillIssueStatus("M");
		//PJ_SD_BILLING_OP_TB Update
		mapper.updateBillMapping(mngProjectBillVO);
	}
	
	@Override
	public void deleteSdBillingXml(MngProjectBillVO mngProjectBillVO) throws Exception {
		
		//PJ_SD_BILLING_TB Insert
		mapper.deleteSdBillingXml(mngProjectBillVO);
		
		mngProjectBillVO.setBillIssueStatus("R");
		//PJ_SD_BILLING_OP_TB Update
		mapper.updateBillMapping(mngProjectBillVO);
	}
	
	@Override
	@Transactional
	public Map<String, Object> updatePaymentsComplate(MngProjectBillVO mngProjectBillVO) throws Exception
	{
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			//계산서 상태 변경
			mapper.updateBillComplate(mngProjectBillVO);
			
			//PJ_SALES_DETAIL_TB UPDATE(수금)
			mapper.updateSalesDetailPayments(mngProjectBillVO);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			e.printStackTrace();
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	@Override
	public void updateBillComplate(MngProjectBillVO mngProjectBillVO) throws Exception
	{
		mapper.updateBillComplate(mngProjectBillVO);
	}
	
	
}
