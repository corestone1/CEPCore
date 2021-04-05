package com.cmm.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.main.service.impl.MainMapper;
import com.cep.main.vo.EmpVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.service.ComService;
import com.cmm.util.CepMailMngUtil;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.MailVO;
import com.cmm.vo.PaymentVO;
import com.cmm.vo.PurchaseVO;
import com.cmm.vo.SalesVO;

@Service("comService")
public class ComServiceImpl implements ComService {
	
	private static final Logger logger = LoggerFactory.getLogger(ComServiceImpl.class);
	
	@Resource(name="comMapper")
	private ComMapper comMapper;
	
	@Resource(name="mailMapper")
	private MailMapper mailMapper;
	
	@Resource(name="mainMapper")
	private MainMapper mainMapper;
	
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
	public List<?> selectDeptEmployeeList(String dept) throws Exception {
		return comMapper.selectDeptEmployeeList(dept);
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
	public Map<String, Object> insertSalesInfo(ProjectContractSalesVO projectContractSalesVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Map<String, Object> insertParam = null;
		String salesKey = null;
		try {
			
			insertParam = new Hashtable<>();
			insertParam.put("salesCtFkKey", projectContractSalesVO.getPjKey());
			insertParam.put("regEmpKey", projectContractSalesVO.getRegEmpKey());
			insertParam.put("SalesVOList", projectContractSalesVO.getProjectContractSalesVOList());

			comMapper.insertSalesInfo(insertParam);
			returnMap.put("salesKey", salesKey);
		    
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;		
	}
	
	@Override
	public SalesVO selectSalesGuarantyDetail(String key) throws Exception {
		return comMapper.selectSalesGuarantyDetail(key);	
	}
	
	@Override
	public Map<String, Object> updateSalesInfo(SalesVO salesVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			comMapper.updateSalesInfo(salesVO);
			returnMap.put("successYN", "Y");
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
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertPurchaseInfo(HttpServletRequest request, PurchaseVO purchaseVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		String buyKey = "";
		
		try {
			buyKey = makePrimaryKey(PrimaryKeyType.PROJECT_PURCHASE);
			purchaseVO.setBuyKey(buyKey);
			
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			purchaseVO.setRegEmpKey(session.get("empKey"));
			
			comMapper.insertPurchaseInfo(purchaseVO);
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
			paymentVO.setPaymentBuyFkKey(comMapper.selectPurchaseDetail(purchaseVO.getBuyOrderFkKey()).getBuyKey());
			paymentVO.setModEmpKey(purchaseVO.getModEmpKey());
			
			comMapper.deletePaymentAllInfo(paymentVO);
			/* 지급 정보 삭제 */
			comMapper.deletePurchaseInfo(purchaseVO);
			
			/* 발주 계산서 매핑 정보 삭제*/
			
			
		} catch(Exception e) {
			throw new Exception(e);
		}
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
				purchaseVO.setModEmpKey(session.get("empKey"));
				
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
	
	@Override
	@Transactional
	public int sendMail(HttpServletRequest request, MailVO mailVO) throws Exception {
		EmpVO empVO = new EmpVO();
		int result = 1;
		HashMap<String, String> map = new HashMap<String, String>();
		ArrayList<String> receiverList = new ArrayList<String>();
		
		CepMailMngUtil mail = new CepMailMngUtil();
        // 받는 사람 이메일 설정
        mail.setToEmail(CepStringUtil.getDefaultValue(mailVO.getEmpKey(),""));
        // 메일 제목 설정
        mail.setSubject(mailVO.getSubject());
        // 메일 바로가기 설정
        mail.setLink(mailVO.getLink());
        // 메일 내용 설정
        mail.setContent(mailVO.getContent());
        
        if(!CepStringUtil.getDefaultValue(mailVO.getIsNewPw(), "").equals("") && mailVO.getIsNewPw() == true) {
        	empVO.setEmpKey(mailVO.getEmpKey());
        	empVO.setEmpPw(mailVO.getEmpPw());
        	
        	mainMapper.updatePassword(empVO);
        }
        
		StringTokenizer stMailAddress = new StringTokenizer(mailVO.getEmpKey(), ";");
		while(stMailAddress.hasMoreElements()) {
			receiverList.add(stMailAddress.nextToken());
		}
        
        for(int i = 0; i < receiverList.size(); i++) {
        	map.put("empKey", receiverList.get(i));
        	
        	result = mainMapper.selectEmp(map) & result;
        }
        
        try {
        	if(result != 0) { // 찾고자 하는 이메일 계정이 DB에 있을 때
        		logger.info("Sending...");
        		mail.sendMail();
        		for(int i = 0; i < receiverList.size(); i++) {
	            	mailVO.setFromEmail(mail.getFromEmail());
	            	mailVO.setSubject(mail.getSubject());
	            	mailVO.setContent(mail.getContent());
	            	mailVO.setToEmail(receiverList.get(i));
	        		mailVO.setSuccessYn("Y");
	        		mailMapper.insertMailInfo(mailVO);
        		}
        		logger.info("Email sent!");
        	} else {
        		for(int i = 0; i < receiverList.size(); i++) {
	            	mailVO.setFromEmail(mail.getFromEmail());
	            	mailVO.setSubject(mail.getSubject());
	            	mailVO.setContent(mail.getContent());
	            	mailVO.setToEmail(receiverList.get(i));
	        		mailVO.setSuccessYn("N");
	        		mailMapper.insertMailInfo(mailVO);
        		}
        	}
			
        } catch(UnsupportedEncodingException e) {
        	e.printStackTrace();
        } catch(MessagingException e) {
        	e.printStackTrace();
        } catch(Exception e) {
        	e.printStackTrace();
        }
    	
        return result;
	}
	
}
