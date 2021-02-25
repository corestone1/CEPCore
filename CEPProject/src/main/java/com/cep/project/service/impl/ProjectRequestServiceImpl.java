package com.cep.project.service.impl;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.cep.project.service.ProjectRequestService;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectPaymentVO;
import com.cep.project.vo.ProjectPurchaseVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.service.ComService;
import com.cmm.vo.PaymentVO;
import com.cmm.vo.PurchaseVO;
import com.cmm.vo.SalesVO;

@Service("projectRequestService")
public class ProjectRequestServiceImpl implements ProjectRequestService {
	
	@Resource(name="projectRequestMapper")
	private ProjectRequestMapper mapper;
	
	@Resource(name="comService")
	private ComService comService;
	
	
	@Override
	public Map<String, Object> insertSalesInfo(ProjectContractSalesVO projectContractSalesVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Map<String, Object> insertParam = null;
		String salesKey = null;
		try {
			
			insertParam = new Hashtable<>();
			insertParam.put("salesCtFkKey", projectContractSalesVO.getPjKey());
			insertParam.put("regEmpKey", projectContractSalesVO.getRegEmpKey());
			insertParam.put("SalesVOList", projectContractSalesVO.getProjectContractSalesVOList());

			mapper.insertSalesInfo(insertParam);
			returnMap.put("salesKey", salesKey);
		    
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;		
	}
	
	@Override
	public SalesVO selectSalesGuarantyDetail(String key) throws Exception {
		return mapper.selectSalesGuarantyDetail(key);	
	}
	
	@Override
	public Map<String, Object> updateSalesInfo(SalesVO salesVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			mapper.updateSalesInfo(salesVO);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;		
	}
	
	@Override
	public ProjectPurchaseVO selectPurchaseDetail(String orderKey) throws Exception {
		return mapper.selectPurchaseDetail(orderKey);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertPurchaseInfo(HttpServletRequest request, PurchaseVO purchaseVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		String buyKey = "";
		
		try {
			buyKey = comService.makePrimaryKey(PrimaryKeyType.PURCHASE);
			purchaseVO.setBuyKey(buyKey);
			
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			purchaseVO.setRegEmpKey(session.get("empKey"));
			
			mapper.insertPurchaseInfo(purchaseVO);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			throw new Exception(e);
		}
		return returnMap;
	}
	
	@Override
	public void deletePurchaseInfo(PurchaseVO purchaseVO) throws Exception {
		PaymentVO paymentVO = new PaymentVO();
		try {
			paymentVO.setPaymentBuyFkKey(mapper.selectPurchaseDetail(purchaseVO.getBuyOrderFkKey()).getBuyKey());
			paymentVO.setModEmpKey(purchaseVO.getModEmpKey());
			
			mapper.deletePaymentAllInfo(paymentVO);
			/* 지급 정보 삭제 */
			mapper.deletePurchaseInfo(purchaseVO);
			
			/* 발주 계산서 매핑 정보 삭제*/
			
			
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	public List<?> selectPaymentList(String buyKey)  throws Exception {
		return mapper.selectPaymentList(buyKey);
	}
	
	@Override
	public Map<String, Object> selectPaymentDetail(ProjectPaymentVO paymentVO)  throws Exception {
		return mapper.selectPaymentDetail(paymentVO);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertPaymentInfo(HttpServletRequest request, PaymentVO paymentVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		String paymentKey = "";
		
		try {
			paymentKey = comService.makePrimaryKey(PrimaryKeyType.PAYMENT);
			paymentVO.setPaymentKey(paymentKey);
			
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			paymentVO.setRegEmpKey(session.get("empKey"));
			
			mapper.insertPaymentInfo(paymentVO);
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
				purchaseVO.setModEmpKey(session.get("empKey"));
				
				mapper.updatePurchaseInfo(purchaseVO);
			} 
			
			mapper.updatePaymentInfo(paymentVO);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			throw new Exception(e);
		}
		return returnMap;
	}
	
	@Override
	public List<?> selectPrePaymentList(String buyKey)  throws Exception {
		return mapper.selectPrePaymentList(buyKey);
	}
	
}
