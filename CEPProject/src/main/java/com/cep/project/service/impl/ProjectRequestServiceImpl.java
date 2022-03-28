package com.cep.project.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.cep.mngProject.mapping.service.impl.MngProjectMappingMapper;
import com.cep.mngProject.mapping.vo.PurchaseBillOpVO;
import com.cep.project.service.ProjectRequestService;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectPaymentVO;
import com.cep.project.vo.ProjectPurchaseVO;
import com.cmm.config.DeptInfo;
import com.cmm.config.EmailInfo;
import com.cmm.config.PrimaryKeyType;
import com.cmm.service.AlarmService;
import com.cmm.service.ComService;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.AlarmVO;
import com.cmm.vo.MailVO;
import com.cmm.vo.SalesVO;

@Service("projectRequestService")
public class ProjectRequestServiceImpl implements ProjectRequestService {
	
	@Resource(name="projectRequestMapper")
	private ProjectRequestMapper mapper;
	
	@Resource(name="mngProjectMappingMapper")
	private MngProjectMappingMapper mngPjMapper;
	
	@Resource(name="comService")
	private ComService comService;
	
	@Resource(name="alarmService")
	private AlarmService alarmService;
	
	
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
	public Map<String, Object> insertPurchaseInfo(HttpServletRequest request, ProjectPurchaseVO purchaseVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		String buyKey = "";
		
		try {
			buyKey = comService.makePrimaryKey(PrimaryKeyType.PROJECT_PURCHASE);
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
	public void deletePurchaseInfo(ProjectPurchaseVO purchaseVO) throws Exception {
		ProjectPaymentVO paymentVO = new ProjectPaymentVO();
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
	public Map<String, Object> insertPaymentInfo(HttpServletRequest request, ProjectPaymentVO paymentVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		ProjectPurchaseVO purchaseVO = null;
		HashMap<String, String> session = null;
		String paymentKey = "";
		
		try {
			paymentKey = comService.makePrimaryKey(PrimaryKeyType.PAYMENT);
			paymentVO.setPaymentKey(paymentKey);
			
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			paymentVO.setRegEmpKey(session.get("empKey"));
			
			purchaseVO = mapper.selectPurchaseDetail(paymentVO.getBuyOrderFkKey());
			paymentVO.setPaymentBuyFkKey(purchaseVO.getBuyKey());
			
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
	public Map<String, Object> updatePaymentInfo(HttpServletRequest request, ProjectPaymentVO paymentVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		ProjectPurchaseVO purchaseVO = new ProjectPurchaseVO();
		PurchaseBillOpVO purchaseBillOpVO = new PurchaseBillOpVO();
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		MailVO mailVO = new MailVO();
		AlarmVO alarmVO = new AlarmVO();
		String content = "";
		String subject = "";
		String url = "";
		String name = "";
		String dept = "";
		int result = 0;
		List<String> mailList = new ArrayList<String>();
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			name = (String)request.getSession().getAttribute("name");
			dept = DeptInfo.DEPT_OPER_L2.getValue();
			url = EmailInfo.PAGE_URL.getValue() + paymentVO.getLink();
			paymentVO.setModEmpKey(session.get("empKey"));
			
			alarmVO.setAlarmTitle(paymentVO.getPjNm());
			alarmVO.setPjMtKey(paymentVO.getPjKey());
			
			mailVO.setLink(url);
			
			if(!CepStringUtil.getDefaultValue(paymentVO.getPaymentStatusCd(), "").equals("") && paymentVO.getPaymentStatusCd().equals("PYST2000")) {
				
				content = String.join(
		                System.getProperty("line.separator"),
		                "["+paymentVO.getPjKey()+"] "+ paymentVO.getPjNm() + " 프로젝트 건 매입금 지급을 요청하였습니다. <br>(요청자: " +name+",",
		                " 요청 일자: "+format.format (System.currentTimeMillis())+")<br><br>");
				
				for(Object obj : comService.selectDeptEmployeeList(dept)) {
					String email = obj.toString().substring(obj.toString().indexOf("=") + 1, obj.toString().length() - 1);
					mailList.add(email);
				}
				
				mailVO.setContent(content);
				mailVO.setEmpKey(StringUtils.join(mailList, ";"));
				
				List<String> alarmList = new ArrayList<String>(mailList);
				alarmList.add(session.get("empKey"));
				String amail = StringUtils.join(alarmList, ";");
				alarmVO.setAlarmKind("매입금 지급 요청");
				alarmVO.setAlarmTo(amail);
				
				result = comService.sendMail(request, mailVO);
				/* 테스트 서버 운영 종료 후 주석 해제(if~else) */
				if(result == 0) {
					throw new Exception();
				} else {
					alarmService.insertAlarm(alarmVO, request);
					
					mapper.updatePaymentInfo(paymentVO);
					
					/*purchaseVO.setBuyKey(paymentVO.getPaymentBuyFkKey());
					purchaseVO.setModEmpKey(session.get("empKey"));
					purchaseVO.setYetPaymentAmount(paymentVO.getYetPaymentAmount());
					purchaseVO.setDonePaymentAmount(paymentVO.getDonePaymentAmount());
					purchaseVO.setBillPurchaseCd(paymentVO.getBillPurchaseCd());
					purchaseVO.setBillMfCd(paymentVO.getBillMfCd());
					mapper.updatePurchaseInfo(purchaseVO);*/
				}
			} else {
				if(!CepStringUtil.getDefaultValue(paymentVO.getPaymentStatusCd(), "").equals("") && paymentVO.getPaymentStatusCd().equals("PYST4000")) {
					mailList.add(mapper.selectPaymentDetail(paymentVO).get("regEmpKey").toString());
					
					alarmVO.setAlarmKind("지급 완료");
					
					String tmail = StringUtils.join(mailList, ";");
					mailVO.setEmpKey(tmail);
					
					alarmVO.setAlarmTo(tmail);
					
					subject = paymentVO.getPjNm() + "건 매입금 지급 완료";
					content = String.join(
												System.getProperty("line.separator"), 
												"["+paymentVO.getPjKey()+"] "+ paymentVO.getPjNm() + "프로젝트 건에 지급이 완료되었습니다. <br> (지급인: " +name+",",
												" 확인 일자: "+format.format (System.currentTimeMillis())+")<br><br>");
					
					mailVO.setSubject(subject);
					mailVO.setContent(content);
					mailVO.setIsNewPw(false);
					
					result = comService.sendMail(request, mailVO);
					
					/* 테스트 서버 운영 종료 후 주석 해제(if~else) */
					if(result != 0) {
					
						purchaseVO.setDonePaymentAmount(paymentVO.getDonePaymentAmount());
						purchaseVO.setYetPaymentAmount(paymentVO.getYetPaymentAmount());
						purchaseVO.setBuyKey(paymentVO.getBuyKey());
						purchaseVO.setModEmpKey(session.get("empKey"));
						
						mapper.updatePurchaseInfo(purchaseVO);
						
						purchaseBillOpVO.setBillNo(paymentVO.getBillFkKey());
						purchaseBillOpVO.setModEmpKey(session.get("empKey"));
						
						mngPjMapper.updatePcBillingOpInfo(purchaseBillOpVO);
						
						alarmService.insertAlarm(alarmVO, request);
					} else {
						throw new Exception();
					}
					
				} else if(!CepStringUtil.getDefaultValue(paymentVO.getPaymentStatusCd(), "").equals("")) {
					mailList.add(mapper.selectPaymentDetail(paymentVO).get("regEmpKey").toString());
					
					alarmVO.setAlarmKind("매입금 지급 승인");
					
					String tmail = StringUtils.join(mailList, ";");
					mailVO.setEmpKey(tmail);

					alarmVO.setAlarmTo(tmail);
					
					subject = paymentVO.getPjNm() + "건 매입금 지급 승인";
					content = String.join(
			                System.getProperty("line.separator"),
			                "["+paymentVO.getPjKey()+"] "+ paymentVO.getPjNm() + " 프로젝트 건 매입금 지급을 승인하였습니다. <br>(확인자: " +name+",",
			                " 확인 일자: "+format.format (System.currentTimeMillis())+")<br><br>");
					
					mailVO.setSubject(subject);
					mailVO.setContent(content);
					mailVO.setEmpKey(paymentVO.getPjSaleEmpKey());
					
					result = comService.sendMail(request, mailVO);
					
					/* 테스트 서버 운영 종료 후 주석 해제(if~else) */
					if(result == 0) {
						throw new Exception();
					} else {
						alarmService.insertAlarm(alarmVO, request);
						
						/*purchaseVO.setBuyKey(paymentVO.getPaymentBuyFkKey());
						purchaseVO.setModEmpKey(session.get("empKey"));
						purchaseVO.setYetPaymentAmount(paymentVO.getYetPaymentAmount());
						purchaseVO.setDonePaymentAmount(paymentVO.getDonePaymentAmount());
						purchaseVO.setBillPurchaseCd(paymentVO.getBillPurchaseCd());
						purchaseVO.setBillMfCd(paymentVO.getBillMfCd());
						mapper.updatePurchaseInfo(purchaseVO);*/
					}
				} else {
					/*purchaseVO.setBuyKey(paymentVO.getPaymentBuyFkKey());
					purchaseVO.setModEmpKey(session.get("empKey"));
					purchaseVO.setYetPaymentAmount(paymentVO.getYetPaymentAmount());
					purchaseVO.setDonePaymentAmount(paymentVO.getDonePaymentAmount());
					purchaseVO.setBillPurchaseCd(paymentVO.getBillPurchaseCd());
					purchaseVO.setBillMfCd(paymentVO.getBillMfCd());
					mapper.updatePurchaseInfo(purchaseVO);*/
				}
				
				mapper.updatePaymentInfo(paymentVO);
				
			}
			
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			returnMap.put("successYN", "N");
			throw new Exception(e);
		}
		return returnMap;
	}
	
	@Override
	public List<?> selectPrePaymentList(String buyKey)  throws Exception {
		return mapper.selectPrePaymentList(buyKey);
	}

	@Override
	public List<?> selectPcBillInfo(String billNo) throws Exception {
		return mapper.selectPcBillInfo(billNo);
	}
	
}
