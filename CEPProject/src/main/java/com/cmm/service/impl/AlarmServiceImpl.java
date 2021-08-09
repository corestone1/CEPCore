package com.cmm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.cmm.service.AlarmService;
import com.cmm.vo.AlarmVO;

@Service("alarmService")
public class AlarmServiceImpl implements AlarmService {

	@Resource(name="alarmMapper")
	private AlarmMapper mapper;
	
	
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public List<?> selectAlarm(AlarmVO alarmVO, HttpServletRequest request) throws Exception {
		HashMap<String, String> session = null;
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		alarmVO.setAlarmTo(session.get("empKey"));
		
		return mapper.selectAlarmList(alarmVO);
		
	}
	
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertAlarm(AlarmVO alarmVO, HttpServletRequest request) throws Exception {
		Map<String, Object> retVal = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			alarmVO.setRegEmpKey(session.get("empKey"));
			
			mapper.insertAlarm(alarmVO);
			retVal.put("successYN", "Y");
		} catch(Exception e) {
			retVal.put("successYN", "N");
			e.printStackTrace();
		}
		
		return retVal;
	}
	
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateAlarm(String idx, HttpServletRequest request) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		AlarmVO alarmVO = new AlarmVO();
		
		HashMap<String, String> session = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			
			alarmVO.setModEmpKey(session.get("empKey"));
			alarmVO.setAlarmKey(idx);
			
			mapper.updateAlarm(alarmVO);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			returnMap.put("successYN", "N");
			e.printStackTrace();
		}
		
		return returnMap;
	}
	
}
