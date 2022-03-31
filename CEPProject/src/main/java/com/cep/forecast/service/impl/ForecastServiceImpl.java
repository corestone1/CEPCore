package com.cep.forecast.service.impl;

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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.forecast.service.ForecastService;
import com.cep.forecast.vo.ForecastBiddingFileVO;
import com.cep.forecast.vo.ForecastBiddingVO;
import com.cep.forecast.vo.ForecastSearchVO;
import com.cep.forecast.vo.ForecastVO;
import com.cep.main.service.MainService;
import com.cmm.config.DeptInfo;
import com.cmm.config.EmailInfo;
import com.cmm.config.PrimaryKeyType;
import com.cmm.service.AlarmService;
import com.cmm.service.ComService;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.AlarmVO;
import com.cmm.vo.MailVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @File Name : ForecastServiceImpl.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2020. 12. 1.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 12. 1.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
@Service("forecastService")
public class ForecastServiceImpl implements ForecastService {
	
	private static final Logger logger = LoggerFactory.getLogger(ForecastServiceImpl.class);
	
	@Resource(name="forecastMapper")
	private ForecastMapper mapper;
	
	@Resource(name="comService")
	private ComService comService;
	
	@Resource(name="alarmService")
	private AlarmService alarmService;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Override
	public List<EgovMap> selectForecastList(ForecastSearchVO searchVO) throws Exception {
		
		return mapper.selectForecastList(searchVO);
	}
	
	@Override
	public List<EgovMap> selectForecastPopList(ForecastSearchVO searchVO) throws Exception {
		
		return mapper.selectForecastPopList(searchVO);
	}
	
	@Override
	public String insertBasic(ForecastVO forecastVO) throws Exception {
		
		
		if(forecastVO.getSpKey() == null || forecastVO.getSpKey().equals("")) {
			//신규등록
			forecastVO.setSpKey(mapper.makeSpKey());
		
			mapper.insertBasic(forecastVO);
		}else{
			//업데이트
			mapper.updateBasic(forecastVO);
		}
		
		return forecastVO.getSpKey();
	}
	
	
	@Override
	public int existForecast(ForecastVO forecastVO) throws Exception {
		return mapper.existForecast(forecastVO);
	}
	
		
	@Override
	public ForecastVO selectForecast(ForecastVO forecastVO) throws Exception {
		return mapper.selectForecast(forecastVO);
	}
	
	@Override
	public List<EgovMap> selectSalesInfo(ForecastVO forecastVO) throws Exception {
		return mapper.selectSalesInfo(forecastVO);
	}
	
	@Override
	public List<EgovMap> selectPcInfo(ForecastVO forecastVO) throws Exception {
		return mapper.selectPcInfo(forecastVO);
	}
	
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public Map<String, Object> writeFundInfo(HttpServletRequest request, ForecastVO forecastVO) throws Exception
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HashMap<String, String> session = null;
		
		int profit = 0;
		List<ForecastVO> insertList = new ArrayList<ForecastVO>();
		List<ForecastVO> updateList = new ArrayList<ForecastVO>();
		String[] salesDeleteKeyList = null;
		String[] pcDeleteKeyList = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			
			if(!forecastVO.getForecastSalesVOList().isEmpty()) {
				for(int i = 0; i < forecastVO.getForecastSalesVOList().size(); i++) {
					
					if(!"".equals(CepStringUtil.getDefaultValue(forecastVO.getForecastSalesVOList().get(i).getFcSalesDtYr(), "")) && 
							!"".equals(CepStringUtil.getDefaultValue(forecastVO.getForecastSalesVOList().get(i).getFcSalesDtMt(), ""))) {
						forecastVO.getForecastSalesVOList().get(i).setFcSalesDt(forecastVO.getForecastSalesVOList().get(i).getFcSalesDtYr() + forecastVO.getForecastSalesVOList().get(i).getFcSalesDtMt());
					} 
					
					if(!"".equals(CepStringUtil.getDefaultValue(forecastVO.getForecastSalesVOList().get(i).getFcCollectDtYr(), "")) &&
							!"".equals(CepStringUtil.getDefaultValue(forecastVO.getForecastSalesVOList().get(i).getFcCollectDtMt(), ""))) {
						forecastVO.getForecastSalesVOList().get(i).setFcCollectDt(forecastVO.getForecastSalesVOList().get(i).getFcCollectDtYr() + forecastVO.getForecastSalesVOList().get(i).getFcCollectDtMt());
					} 
					
					/*forecastVO.getForecastSalesVOList().get(i).setFcSalesDt(forecastVO.getForecastSalesVOList().get(i).getFcSalesDtYr() + forecastVO.getForecastSalesVOList().get(i).getFcSalesDtMt());
					forecastVO.getForecastSalesVOList().get(i).setFcCollectDt(forecastVO.getForecastSalesVOList().get(i).getFcCollectDtYr() + forecastVO.getForecastSalesVOList().get(i).getFcCollectDtMt());*/
					
					if("".equals(CepStringUtil.getDefaultValue(forecastVO.getForecastSalesVOList().get(i).getSalesKey(), ""))) {
						insertList.add(forecastVO.getForecastSalesVOList().get(i));
						
					} else {
						updateList.add(forecastVO.getForecastSalesVOList().get(i));
					}
					
					profit += forecastVO.getForecastSalesVOList().get(i).getFcSalesAmount();
				}
				
			}
			
			if(insertList != null && insertList.size() != 0) {
				insertSalesInfo(forecastVO.getSpKey(), session.get("empKey"), insertList);
			} 
			if(updateList != null && updateList.size() != 0) {
				updateSalesInfo(forecastVO.getSpKey(), session.get("empKey"), updateList);
			}
			
			insertList = new ArrayList<ForecastVO>();
			updateList = new ArrayList<ForecastVO>();
			
			if(!forecastVO.getForecastPcVOList().isEmpty()) {
				for(int i = 0; i < forecastVO.getForecastPcVOList().size(); i++) {
					
					if(!"".equals(CepStringUtil.getDefaultValue(forecastVO.getForecastPcVOList().get(i).getFcBuyDtYr(), "")) && 
							!"".equals(CepStringUtil.getDefaultValue(forecastVO.getForecastPcVOList().get(i).getFcBuyDtMt(), ""))) {
						forecastVO.getForecastPcVOList().get(i).setFcBuyDt(forecastVO.getForecastPcVOList().get(i).getFcBuyDtYr() + forecastVO.getForecastPcVOList().get(i).getFcBuyDtMt());
					}
					
					if(!"".equals(CepStringUtil.getDefaultValue(forecastVO.getForecastPcVOList().get(i).getFcBuyPayDtYr(), "")) && 
							!"".equals(CepStringUtil.getDefaultValue(forecastVO.getForecastPcVOList().get(i).getFcBuyPayDtMt(), ""))) {
						forecastVO.getForecastPcVOList().get(i).setFcBuyPayDt(forecastVO.getForecastPcVOList().get(i).getFcBuyPayDtYr() + forecastVO.getForecastPcVOList().get(i).getFcBuyPayDtMt());
					}
					
					/*forecastVO.getForecastPcVOList().get(i).setFcBuyDt(forecastVO.getForecastPcVOList().get(i).getFcBuyDtYr() + forecastVO.getForecastPcVOList().get(i).getFcBuyDtMt());
					forecastVO.getForecastPcVOList().get(i).setFcBuyPayDt(forecastVO.getForecastPcVOList().get(i).getFcBuyPayDtYr() + forecastVO.getForecastPcVOList().get(i).getFcBuyPayDtMt());*/
					
					if("".equals(CepStringUtil.getDefaultValue(forecastVO.getForecastPcVOList().get(i).getBuyKey(), ""))) {
						insertList.add(forecastVO.getForecastPcVOList().get(i));
						
					} else {
						updateList.add(forecastVO.getForecastPcVOList().get(i));
					}
					
					profit -= forecastVO.getForecastPcVOList().get(i).getFcBuyAmount();
				}
			}
			
			if(insertList != null && insertList.size() != 0) {
				insertPcInfo(forecastVO.getSpKey(), session.get("empKey"), insertList);
			} 
			if(updateList != null && updateList.size() != 0) {
				updatePcInfo(forecastVO.getSpKey(), session.get("empKey"), updateList);
			}
			
			
			if(!CepStringUtil.getDefaultValue(forecastVO.getSalesDeleteListKeys(), "").equals("")) {
				salesDeleteKeyList = forecastVO.getSalesDeleteListKeys().split(":");
			}
			
			if(salesDeleteKeyList != null && salesDeleteKeyList.length > 0) {
				deleteSalesList(forecastVO.getModEmpKey(), salesDeleteKeyList);
			}
			
			if(!CepStringUtil.getDefaultValue(forecastVO.getPcDeleteListKeys(), "").equals("")) {
				pcDeleteKeyList = forecastVO.getPcDeleteListKeys().split(":");
			}
			
			if(pcDeleteKeyList != null && pcDeleteKeyList.length > 0) {
				deletePcList(forecastVO.getModEmpKey(), pcDeleteKeyList);
			}
			
			forecastVO.setFcSalesProfit(profit);
			mapper.updateBasic(forecastVO);
			
			returnMap.put("successYN", "Y");
			
			
		} catch(Exception e) {
			returnMap.put("successYN", "N");
			throw new Exception(e);
		}
		
		return returnMap;
	}
	
	private void insertSalesInfo(String spKey, String regEmpKey, List<ForecastVO> forecastVO) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new HashMap<>();
			insertParam.put("salesSpFkKey", spKey);
			insertParam.put("primaryKey", PrimaryKeyType.FORECAST_SALES.getValue());
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("forecastSalesVOList", forecastVO);
			
			mapper.insertSalesInfo(insertParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
	}
	
	private void updateSalesInfo(String spKey, String modEmpKey, List<ForecastVO> forecastVO) throws Exception {
		Map<String, Object> updateParam = null;
		try {
			updateParam = new HashMap<>();
			updateParam.put("salesSpFkKey", spKey);
			updateParam.put("modEmpKey", modEmpKey);
			updateParam.put("forecastSalesVOList", forecastVO);
			
			mapper.updateSalesInfo(updateParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
	}
	
	private void insertPcInfo(String spKey, String regEmpKey, List<ForecastVO> forecastVO) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new HashMap<>();
			insertParam.put("buySpFkKey", spKey);
			insertParam.put("primaryKey", PrimaryKeyType.FORECAST_PURCHASE.getValue());
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("forecastPcVOList", forecastVO);
			
			mapper.insertPcInfo(insertParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
	}
	
	private void updatePcInfo(String spKey, String modEmpKey, List<ForecastVO> forecastVO) throws Exception {
		Map<String, Object> updateParam = null;
		try {
			updateParam = new HashMap<>();
			updateParam.put("buySpFkKey", spKey);
			updateParam.put("modEmpKey", modEmpKey);
			updateParam.put("forecastPcVOList", forecastVO);
			
			mapper.updatePcInfo(updateParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
	}
	
	private void deleteSalesList(String modEmpKey, String[] deleteKeyList) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("deleteKeyList", deleteKeyList);
			
			mapper.deleteSalesInfo(deleteParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	private void deletePcList(String modEmpKey, String[] deleteKeyList) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("deleteKeyList", deleteKeyList);
			
			mapper.deletePcInfo(deleteParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public void updateProgress(HttpServletRequest request, ForecastVO forecastVO) throws Exception
	{
		HashMap<String, String> session = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			forecastVO.setModEmpKey(session.get("empKey"));
			
			mapper.updateProgress(forecastVO);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	public ForecastBiddingVO selectBiddingDetail(ForecastBiddingVO forecastBiddingVO) throws Exception {
		return mapper.selectBiddingDetail(forecastBiddingVO);
	}
	
	@Override
	public List<?> selectBiddingFileList(ForecastBiddingFileVO forecastBiddingFileVO) throws Exception {
		return mapper.selectBiddingFileList(forecastBiddingFileVO);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> writeBiddingInfo(HttpServletRequest request, ForecastBiddingVO forecastBiddingVO) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		String bdKey = null;
		int listCnt = 0;
		List<ForecastBiddingFileVO> insertList =  new ArrayList<>();
		List<ForecastBiddingFileVO> updateList =  new ArrayList<>();
		
		try {
			
			listCnt = forecastBiddingVO.getBiddingFileVOList().size();
			
			if(!CepStringUtil.getDefaultValue(forecastBiddingVO.getBdKey(), "").equals("")) {
				// 업데이트
				forecastBiddingVO.setModEmpKey(session.get("empKey"));
				mapper.updateBiddingInfo(forecastBiddingVO);
				
				for(int i = 0; i <listCnt; i++) {
					if(CepStringUtil.getDefaultValue(forecastBiddingVO.getBiddingFileVOList().get(i).getBdSeq(), "0").equals("0") && 
							forecastBiddingVO.getBiddingFileVOList().get(i).getBdFileCheck().equals("Y")) {
						// 새로 등록되는 입찰 파일
						insertList.add(forecastBiddingVO.getBiddingFileVOList().get(i));
					} else if(!CepStringUtil.getDefaultValue(forecastBiddingVO.getBiddingFileVOList().get(i).getBdSeq(), "0").equals("0")) {
						// 수정 되는 입찰 파일
						updateList.add(forecastBiddingVO.getBiddingFileVOList().get(i));
					}
				}
				
				if(insertList != null && insertList.size() != 0) {
					writeBiddingFileInfo(forecastBiddingVO.getBdKey(), insertList);
				}
				
				if(updateList != null && updateList.size() != 0) {
					updateBiddingFileInfo(forecastBiddingVO.getBdKey(), updateList);
				}
				
			} else {
				bdKey = comService.makePrimaryKey(PrimaryKeyType.PROJECT_BIDDING);
				forecastBiddingVO.setBdKey(bdKey);
				forecastBiddingVO.setRegEmpKey(session.get("empKey"));
			    
			    mapper.insertBiddingInfo(forecastBiddingVO);
			    
			    for(int i = 0; i <listCnt; i++) {
					if(CepStringUtil.getDefaultValue(forecastBiddingVO.getBiddingFileVOList().get(i).getBdSeq(), "0").equals("0") && 
							forecastBiddingVO.getBiddingFileVOList().get(i).getBdFileCheck().equals("Y")) {
						// 새로 등록되는 입찰 파일
						insertList.add(forecastBiddingVO.getBiddingFileVOList().get(i));
					} 
				}
			    if(insertList.size() != 0) {
			    	writeBiddingFileInfo(bdKey, insertList);
			    }
			}
			
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			returnMap.put("successYN", "N");
			throw new Exception(e);
		}
		
		return returnMap;		
	}
	
	private void writeBiddingFileInfo(String bdKey, List<?> insertList) throws Exception {
		Map<String, Object> insertParam = null;
		
		try {
			insertParam = new Hashtable<>();
			
			insertParam.put("bdKey", bdKey);
			insertParam.put("biddingFileVOList", insertList);
			
			mapper.insertBiddingFileInfo(insertParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	private void updateBiddingFileInfo(String bdKey, List<?> updateList) throws Exception {
		Map<String, Object> updateParam = null;
		
		try {
			updateParam = new Hashtable<>();
			
			updateParam.put("bdKey", bdKey);
			updateParam.put("biddingFileVOList", updateList);
			
			mapper.updateBiddingFileInfo(updateParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> requestBiddingDoc(HttpServletRequest request, ForecastBiddingVO forecastBiddingVO) throws Exception {
		int result = 0;
		Map<String, Object> returnMap = new HashMap<String, Object>();
		MailVO mailVO = new MailVO();
		AlarmVO alarmVO = new AlarmVO();
		HashMap<String, String> sessionMap = null;
		HashMap<String, String> userMap = new HashMap<String, String>();
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");

		try {
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			userMap.put("empKey", sessionMap.get("empKey"));
			String name = mainService.selectName(userMap);
			String dept = DeptInfo.DEPT_OPER_L3.getValue();
			List<String> toList = new ArrayList<String>();
			
			alarmVO.setAlarmTitle(forecastBiddingVO.getSpBusiNm());
			alarmVO.setAlarmKind("입찰 서류 요청");
			alarmVO.setPjMtKey(forecastBiddingVO.getSpKey());
			
			for(Object obj : comService.selectDeptEmployeeList(dept)) {
				String email = obj.toString().substring(obj.toString().indexOf("=") + 1, obj.toString().length() - 1);
				toList.add(email);
			}
			
			String tmail = StringUtils.join(toList, ";");
			mailVO.setEmpKey(tmail);
			mailVO.setLink(EmailInfo.PAGE_URL.getValue() + "forecast/list.do?spKey="+forecastBiddingVO.getSpKey()+ "&step=biddingInfo");
			String subject = forecastBiddingVO.getSpBusiNm() + "건 입찰 서류 요청";
			String content = String.join(
									System.getProperty("line.separator"), 
									"["+forecastBiddingVO.getSpKey()+"] " + forecastBiddingVO.getSpBusiNm()+" Forecast 건에 입찰 서류 요청 정보가 있습니다.<br>(요청자: "+name+",",
									" 요청 일자: "+format.format (System.currentTimeMillis())+")<br><br>");
			
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
				returnMap.put("mailSuccessYN", "Y");
				alarmService.insertAlarm(alarmVO, request);
			} else {
				returnMap.put("mailSuccessYN", "N");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			returnMap.put("mailiSuccessYN", "N");
		}
		
		return returnMap;
	}
	
	@Override
	public EgovMap selectBdGbInfo(ForecastBiddingVO forecastBiddingVO) throws Exception {
		return mapper.selectBdGbInfo(forecastBiddingVO);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> requestBiddingGb(HttpServletRequest request, ForecastBiddingVO forecastBiddingVO) throws Exception {
		int result = 0;
		MailVO mailVO = new MailVO();
		AlarmVO alarmVO = new AlarmVO();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		HashMap<String, String> userMap = new HashMap<String, String>();
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		
		try {
			String dept = DeptInfo.DEPT_OPER_L3.getValue();
			List<String> toList = new ArrayList<String>();
			
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			userMap.put("empKey", sessionMap.get("empKey"));
			String name = mainService.selectName(userMap);
			
			alarmVO.setAlarmTitle(forecastBiddingVO.getSpBusiNm());
			alarmVO.setAlarmKind("입찰 보증 증권 발행 신청");
			alarmVO.setPjMtKey(forecastBiddingVO.getSpKey());
			
			for(Object obj : comService.selectDeptEmployeeList(dept)) {
				String email = obj.toString().substring(obj.toString().indexOf("=") + 1, obj.toString().length() - 1);
				toList.add(email);
			}
			
			String tmail = StringUtils.join(toList, ";");
			mailVO.setEmpKey(tmail);
			mailVO.setLink(EmailInfo.PAGE_URL.getValue() + "forecast/list.do?spKey="+forecastBiddingVO.getSpKey()+ "&step=biddingInfo");
			alarmVO.setAlarmTo(tmail);
			
			String subject = forecastBiddingVO.getSpBusiNm() + " 건 입찰 보증 증권 발행 신청";
			String content = String.join(
									System.getProperty("line.separator"), 
									"["+forecastBiddingVO.getSpKey()+"] " +forecastBiddingVO.getSpBusiNm()+" Forecast 건에 입찰 보증 증권 발행 신청 건이 있습니다.<br>(요청자: "+name+",",
									" 요청 일자: "+format.format (System.currentTimeMillis())+")<br><br>");
			
			mailVO.setSubject(subject);
			mailVO.setContent(content);
			mailVO.setIsNewPw(false);
			
			result = comService.sendMail(request, mailVO);
			if(result != 0) {
				returnMap.put("mailSuccessYN", "Y");
				alarmService.insertAlarm(alarmVO, request);
				mapper.requestBiddingGb(forecastBiddingVO);
				returnMap.put("successYN", "Y");
			} else {
				returnMap.put("mailSuccessYN", "N");
			}
			
			returnMap.put("mailList", toList);
		} catch(Exception e) {
			e.printStackTrace();
			returnMap.put("mailSuccessYN", "N");
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> modifyBiddingGb(HttpServletRequest request, ForecastBiddingVO forecastBiddingVO) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		
		try {
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			forecastBiddingVO.setRegEmpKey(sessionMap.get("empKey"));
			
			mapper.modifyBiddingGb(forecastBiddingVO);
			
			returnMap.put("successYN", "Y");
			
		} catch(Exception e) {
			logger.error("{}", e);
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> endBiddingGb(HttpServletRequest request, ForecastBiddingVO forecastBiddingVO) throws Exception {
		int result = 0;
		MailVO mailVO = new MailVO();
		AlarmVO alarmVO = new AlarmVO();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		HashMap<String, String> userMap = new HashMap<String, String>();
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		
		try {
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			userMap.put("empKey", sessionMap.get("empKey"));
			String name = mainService.selectName(userMap);
			
			List<String> toList = new ArrayList<String>();
			toList.add(mapper.selectBdGbInfo(forecastBiddingVO).get("regEmpKey").toString());
			
			alarmVO.setAlarmTitle(forecastBiddingVO.getSpBusiNm());
			alarmVO.setAlarmKind("입찰 보증 증권 발행 완료");
			alarmVO.setPjMtKey(forecastBiddingVO.getSpKey());
			
			String tmail =StringUtils.join(toList, ";"); 
			mailVO.setEmpKey(tmail);
			mailVO.setLink(EmailInfo.PAGE_URL.getValue() + "forecast/list.do?spKey="+forecastBiddingVO.getSpKey()+ "&step=biddingInfo");
			alarmVO.setAlarmTo(tmail);
			String subject = forecastBiddingVO.getSpBusiNm() + " 건 입찰 보증 증권 발행 완료";
			String content = String.join(
									System.getProperty("line.separator"), 
									"["+forecastBiddingVO.getSpKey()+"] " +forecastBiddingVO.getSpBusiNm()+" Forecast 건에 보증 증권 발행이 완료되었습니다. 완료인: "+name+",",
									" 완료 일자: "+format.format (System.currentTimeMillis())+")<br><br>");
			
			mailVO.setSubject(subject);
			mailVO.setContent(content);
			mailVO.setIsNewPw(false);
			
			result = comService.sendMail(request, mailVO);
			if(result != 0) {
				sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
				
				forecastBiddingVO.setRegEmpKey(sessionMap.get("empKey"));
				
				mapper.endBiddingGb(forecastBiddingVO);
				alarmService.insertAlarm(alarmVO, request);
				
				returnMap.put("mailSuccessYN", "Y");
				returnMap.put("successYN", "Y");
			} else {
				returnMap.put("mailSuccessYN", "N");
			}
			
			returnMap.put("mailList", tmail);
			
		} catch(Exception e) {
			logger.error("{}", e);
			returnMap.put("mailSuccessYN", "N");
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	@Override
	public EgovMap selectSalesMeeingInfo(ForecastSearchVO forecastSearchVO) throws Exception {
		
		EgovMap leMap = new EgovMap();
		
		
		leMap.put("forecastList",      mapper.selectFocecastListSm(forecastSearchVO));
		leMap.put("forecastAmount",    mapper.selectFocecastAmount(forecastSearchVO));
		
//		leMap.put("forecastSalesAmount",    mapper.selectFocecastSalesAmount(forecastSearchVO));
//		leMap.put("forecastPurchaseAmount", mapper.selectFocecastPurchaseAmount(forecastSearchVO));
//		leMap.put("forecastProfitAmount",   mapper.selectFocecastProfitAmount(forecastSearchVO));
		
		leMap.put("biddingList",      mapper.selectBiddingList(forecastSearchVO));
		leMap.put("biddingAmount",    mapper.selectBiddingAmount(forecastSearchVO));
		
//		leMap.put("biddingSalesAmount",    mapper.selectBiddingSalesAmount(forecastSearchVO));
//		leMap.put("biddingPurchaseAmount", mapper.selectBiddingPurchaseAmount(forecastSearchVO));
//		leMap.put("biddingProfitAmount",   mapper.selectBiddingProfitAmount(forecastSearchVO));
		
		leMap.put("projectList",      mapper.selectProjectList(forecastSearchVO));
		leMap.put("projectAmount",    mapper.selectProjectAmount(forecastSearchVO));
		
//		leMap.put("projectSalesAmount",    mapper.selectProjectSalesAmount(forecastSearchVO));
//		leMap.put("projectPurchaseAmount", mapper.selectProjectPurchaseAmount(forecastSearchVO));
//		leMap.put("projectProfitAmount",   mapper.selectProjectProfitAmount(forecastSearchVO));
		
		
		return leMap;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public void delete(HttpServletRequest request, ForecastVO forecastVO) throws Exception {
		HashMap<String, String> sessionMap = null;
		try {
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			forecastVO.setModEmpKey(sessionMap.get("empKey"));
			mapper.delete(forecastVO);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 임시
	@Override
	public void changeStatus(HttpServletRequest request, ForecastVO forecastVO) throws Exception {
		mapper.changeStatus(forecastVO);
	}
}
