package com.cmm.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmm.service.AlarmService;
import com.cmm.util.CepDisplayUtil;
import com.cmm.vo.AlarmVO;

@Controller
@RequestMapping("/alarm")
public class AlarmController {
	
	@Resource(name="alarmService")
	private AlarmService service;
	
	@RequestMapping(value="/viewAlarm.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<?> selectAlarm(HttpServletRequest request) throws Exception {
		AlarmVO alarmVO = new AlarmVO();
		
		List<?> alarmList = service.selectAlarm(alarmVO, request);
		
		return alarmList;
	}
	
	@RequestMapping(value="/list.do", method={RequestMethod.GET, RequestMethod.POST})
	public String selectAlarmList(HttpServletRequest request, ModelMap model) throws Exception {
		AlarmVO alarmVO = new AlarmVO();
		
		List<?> alarmList = service.selectAlarm(alarmVO, request);
		model.put("alarmList", alarmList);
		
		return "mngPersonal/list";
	}
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> addAlarm(@RequestBody AlarmVO alarmVO, HttpServletRequest request) throws Exception {
		Map<String, Object> returnMap = null;
		returnMap = service.insertAlarm(alarmVO, request);
		
		return returnMap;
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateAlarm(@RequestParam("idx") String idx, HttpServletRequest request) throws Exception {
		Map<String, Object> returnMap = null;
		returnMap = service.updateAlarm(idx, request);
		
		return returnMap;
	}
}
