package com.cmm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cmm.vo.AlarmVO;

public interface AlarmService {
	public List<?> selectAlarm(AlarmVO alarmVO, HttpServletRequest request) throws Exception;
	public Map<String, Object> insertAlarm(AlarmVO alarmVO, HttpServletRequest request) throws Exception;
	public Map<String, Object> updateAlarm(String idx, HttpServletRequest request) throws Exception;
}
