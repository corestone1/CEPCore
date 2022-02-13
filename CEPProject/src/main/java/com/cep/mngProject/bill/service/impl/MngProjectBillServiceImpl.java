package com.cep.mngProject.bill.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.main.service.MainService;
import com.cep.mngProject.bill.service.MngProjectBillService;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;
import com.cmm.config.DeptInfo;
import com.cmm.config.EmailInfo;
import com.cmm.service.AlarmService;
import com.cmm.service.ComService;
import com.cmm.vo.AlarmVO;
import com.cmm.vo.MailVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngProjectBillService")
public class MngProjectBillServiceImpl implements MngProjectBillService {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectBillServiceImpl.class);
	
	@Resource(name="mngProjectBillMapper")
	private MngProjectBillMapper mapper;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Resource(name="comService")
	private ComService comService;
	
	@Resource(name="alarmService")
	private AlarmService alarmService;
	
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
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> insertBillRequest(HttpServletRequest request, MngProjectBillVO mngProjectBillVO) throws Exception
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		MailVO mailVO = new MailVO();
		AlarmVO alarmVO = new AlarmVO();
		HashMap<String, String> sessionMap = null;
		HashMap<String, String> userMap = new HashMap<String, String>();
		int result = 0;
		
		try {
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			userMap.put("empKey", sessionMap.get("empKey"));
			String name = mainService.selectName(userMap);
			String dept = DeptInfo.DEPT_OPER_L3.getValue();
			List<String> toList = new ArrayList<String>();
			
			//billCallKey가 있으면 Update 없으면 Insert
			if(mngProjectBillVO.getBillCallKey() == null || mngProjectBillVO.getBillCallKey().equals("")) {
				alarmVO.setAlarmTitle(mngProjectBillVO.getPjNm());
				alarmVO.setAlarmKind("계산서 발행 요청");
				alarmVO.setPjMtKey(mngProjectBillVO.getPjKey());
				
				for(Object obj : comService.selectDeptEmployeeList(dept)) {
					String email = obj.toString().substring(obj.toString().indexOf("=") + 1, obj.toString().length() - 1);
					toList.add(email);
				}
				
				String tmail = StringUtils.join(toList, ";");
				mailVO.setEmpKey(tmail);
				mailVO.setLink(EmailInfo.PAGE_URL.getValue() + "mngProject/bill/detail/main.do?pjKey=" + mngProjectBillVO.getPjKey());
				String subject = mngProjectBillVO.getPjNm() + "건 계산서 발행 요청";
				String content = String.join(
										System.getProperty("line.separator"), 
										"Project " + mngProjectBillVO.getPjNm() + "건에 계산서 발행 요청 정보가 있습니다.<br>요청인: " + name + "<br><br>");
				
				mailVO.setSubject(subject);
				mailVO.setContent(content);
				mailVO.setIsNewPw(false);
				
				result = comService.sendMail(request, mailVO);
				returnMap.put("mailList", toList);
				
				List<String> alarmList = new ArrayList<String>(toList);
				alarmList.add(sessionMap.get("empKey"));
				String amail = StringUtils.join(alarmList, ";");
				alarmVO.setAlarmTo(amail);
				
				if(result != 0) {
					alarmService.insertAlarm(alarmVO, request);
					
					mngProjectBillVO.setBillIssueStatus("R");
					mapper.insertBillRequest(mngProjectBillVO);
					
				} else {
					throw new Exception();
				}
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
	@SuppressWarnings("unchecked")
	public Map<String, Object> updatePaymentsComplate(HttpServletRequest request, MngProjectBillVO mngProjectBillVO) throws Exception {
		int result = 0;
		Map<String, Object> returnMap = new HashMap<String, Object>();
		MailVO mailVO = new MailVO();
		AlarmVO alarmVO = new AlarmVO();
		HashMap<String, String> sessionMap = null;
		MngProjectBillSearchVO mngProjectBillSearchVO = new MngProjectBillSearchVO();
		BeanUtils.copyProperties(mngProjectBillVO, mngProjectBillSearchVO);
		
		try {
			List<String> toList = new ArrayList<String>();
			toList.add(mapper.selectBillDetailInfo(mngProjectBillSearchVO).get("regEmpKey").toString());
			
			alarmVO.setAlarmTitle(mngProjectBillVO.getPjNm());
			alarmVO.setAlarmKind("수금 완료");
			alarmVO.setPjMtKey(mngProjectBillVO.getPjKey());
			
			String tmail = StringUtils.join(toList, ";");
			mailVO.setEmpKey(tmail);
			mailVO.setLink(EmailInfo.PAGE_URL.getValue() + "mngProject/bill/detail/main.do?pjKey=" + mngProjectBillVO.getPjKey());
			alarmVO.setAlarmTo(tmail);
			String subject = mngProjectBillVO.getPjNm() + "건 수금 완료";
			String content = String.join(
										System.getProperty("line.separator"), 
										"Project " + mngProjectBillVO.getPjNm() + "건에 수금이 완료되었습니다.<br><br>");
			
			mailVO.setSubject(subject);
			mailVO.setContent(content);
			mailVO.setIsNewPw(false);
			
			result = comService.sendMail(request, mailVO);
			
			if(result != 0) {
				sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
				
				mngProjectBillVO.setModEmpKey(sessionMap.get("empKey"));
				
				//계산서 상태 변경
				mapper.updateBillComplate(mngProjectBillVO);
				//PJ_SALES_DETAIL_TB UPDATE(수금)
				mapper.updateSalesDetailPayments(mngProjectBillVO);
				
				alarmService.insertAlarm(alarmVO, request);
			} else {
				throw new Exception();
			}
			returnMap.put("successYN", "Y");
			returnMap.put("mailList", tmail);
		} catch(Exception e) {
			e.printStackTrace();
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> updateBillComplate(HttpServletRequest request, MngProjectBillVO mngProjectBillVO) throws Exception
	{
		int result = 0;
		Map<String, Object> returnMap = new HashMap<String, Object>();
		MailVO mailVO = new MailVO();
		AlarmVO alarmVO = new AlarmVO();
		HashMap<String, String> sessionMap = null;
		MngProjectBillSearchVO mngProjectBillSearchVO = new MngProjectBillSearchVO();
		BeanUtils.copyProperties(mngProjectBillVO, mngProjectBillSearchVO);
		String status = "";
		
		try {
			List<String> toList = new ArrayList<String>();
			toList.add(mapper.selectBillDetailInfo(mngProjectBillSearchVO).get("regEmpKey").toString());
			
			alarmVO.setAlarmTitle(mngProjectBillVO.getPjNm());
			if(mngProjectBillVO.getBillIssueStatus().equals("R")) {
				status = "취소";
			} else {
				status = "완료";
			}
			alarmVO.setAlarmKind("계산서 발행 " + status);
			alarmVO.setPjMtKey(mngProjectBillVO.getPjKey());
			
			String tmail = StringUtils.join(toList, ";");
			mailVO.setEmpKey(tmail);
			mailVO.setLink(EmailInfo.PAGE_URL.getValue() + "mngProject/bill/detail/main.do?pjKey=" + mngProjectBillVO.getPjKey());
			alarmVO.setAlarmTo(tmail);
			String subject = mngProjectBillVO.getPjNm() + "건 계산서 발행 " + status;
			String content = String.join(
									System.getProperty("line.separator"), 
									"Project " + mngProjectBillVO.getPjNm() + "건에 계산서 발행이 " + status + "되었습니다.<br><br>");
			
			mailVO.setSubject(subject);
			mailVO.setContent(content);
			mailVO.setIsNewPw(false);
			
			result = comService.sendMail(request, mailVO);
			
			if(result != 0) {
				sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
				
				mngProjectBillVO.setModEmpKey(sessionMap.get("empKey"));
				
				mapper.updateBillComplate(mngProjectBillVO);
				
				alarmService.insertAlarm(alarmVO, request);
				
			} else {
				throw new Exception();
			}
			
			returnMap.put("successYN", "Y");
			returnMap.put("mailList", tmail);
			
		} catch(Exception e) {
			e.printStackTrace();
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	
}
