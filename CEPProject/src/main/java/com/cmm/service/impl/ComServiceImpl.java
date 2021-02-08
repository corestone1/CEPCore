package com.cmm.service.impl;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.cmm.config.PrimaryKeyType;
import com.cmm.service.ComService;
import com.cmm.vo.PaymentVO;
import com.cmm.vo.PurchaseVO;
import com.cmm.vo.SalesVO;

@Service("comService")
public class ComServiceImpl implements ComService {
	
	@Resource(name="comMapper")
	private ComMapper comMapper;
	
	@Override
	public List<?> selectAccountList() throws Exception {
		return comMapper.selectAccountList();
	}
	
	@Override
	public List<?> selectAcDirectorList(String acKey) throws Exception {
		return comMapper.selectAcDirectorList(acKey);
	}
	
	@Override
	public List<?> selectEmployeeList() throws Exception {
		return comMapper.selectEmployeeList();
	}
	
	@Override
	public List<?> selectDepositList(String acKey) throws Exception {
		return comMapper.selectDepositList(acKey);
	}
	
	@Override
	public String makePrimaryKey(PrimaryKeyType keyType) throws Exception {
		String primaryKey = null;
		try {
			primaryKey = comMapper.makePrimaryKey(keyType.getValue());
		} catch (Exception e) {
			throw new Exception(e);
		}
		return primaryKey;
	}
	
	@Override
	public Map<String, Object> insertSalesInfo(String key, String regEmpKey, List<?> insertList) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Map<String, Object> insertParam = null;
		try {
			insertParam = new Hashtable<>();
			insertParam.put("salesCtFkKey", key);
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("SalesVOList", insertList);
			
			comMapper.insertSalesInfo(insertParam);
			returnMap.put("salesKey", key);
		    
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;		
	}
	
	@Override
	public PurchaseVO selectPurchaseDetail(String orderKey) throws Exception {
		return comMapper.selectPurchaseDetail(orderKey);
	}
	
	@Override
	public List<?> selectPaymentList(String buyKey)  throws Exception {
		return comMapper.selectPaymentList(buyKey);
	}
	
	@Override
	public Map<String, Object> selectPaymentDetail(PaymentVO paymentVO)  throws Exception {
		return comMapper.selectPaymentDetail(paymentVO);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertPaymentInfo(HttpServletRequest request, PaymentVO paymentVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		String paymentKey = "";
		
		try {
			paymentKey = makePrimaryKey(PrimaryKeyType.PAYMENT);
			paymentVO.setPaymentKey(paymentKey);
			
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			paymentVO.setRegEmpKey(session.get("empKey"));
			
			comMapper.insertPaymentInfo(paymentVO);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			throw new Exception(e);
		}
		return returnMap;
	}

	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> updatePaymentInfo(HttpServletRequest request, PaymentVO paymentVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		PurchaseVO purchaseVO = new PurchaseVO();
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			paymentVO.setModEmpKey(session.get("empKey"));
			
			if(paymentVO.getPaymentStatusCd().equals("PYST4000")) {
				purchaseVO.setDonePaymentAmount(paymentVO.getDonePaymentAmount());
				purchaseVO.setYetPaymentAmount(paymentVO.getYetPaymentAmount());
				purchaseVO.setBuyKey(paymentVO.getBuyKey());
				
				comMapper.updatePurchaseInfo(purchaseVO);
			} 
			
			comMapper.updatePaymentInfo(paymentVO);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			throw new Exception(e);
		}
		return returnMap;
	}
	
	@Override
	public List<?> selectPrePaymentList(String buyKey)  throws Exception {
		return comMapper.selectPrePaymentList(buyKey);
	}
}
