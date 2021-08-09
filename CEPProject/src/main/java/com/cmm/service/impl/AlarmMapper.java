package com.cmm.service.impl;

import java.util.List;

import com.cmm.vo.AlarmVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("alarmMapper")
public interface AlarmMapper {
		
	/**
	* 알람 조회
	* @Method Name : selectAlarm
	* @Cdate       : 2021. 07. 13.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 알림 조회
	* @return
	* @throws Exception
	*/
	public List<?> selectAlarmList(AlarmVO alarmVO) throws Exception;
	
	/**
	* 알림 등록
	* @Method Name : insertAlarm
	* @Cdate       : 2021. 07. 13.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 알림 등록 
	* @return
	* @throws Exception
	*/
	public int insertAlarm(AlarmVO alarmVO) throws Exception;
	
	/**
	* 알림 수정
	* @Method Name : updateAlarm
	* @Cdate       : 2021. 07. 13.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 알림 수정
	* @return
	* @throws Exception
	*/
	public int updateAlarm(AlarmVO alarmVO) throws Exception;

}
