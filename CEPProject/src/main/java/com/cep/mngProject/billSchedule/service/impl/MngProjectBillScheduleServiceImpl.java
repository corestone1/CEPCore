package com.cep.mngProject.billSchedule.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cep.mngProject.billSchedule.service.MngProjectBillScheduleService;
import com.cep.mngProject.billSchedule.vo.MngProjectBillScheduleVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngProjectBillScheduleService")
public class MngProjectBillScheduleServiceImpl implements MngProjectBillScheduleService {

	@Resource(name="mngProjectBillCalendarMapper")
	private MngProjectBillScheduleMapper mapper;
	
	@Override
//	public List<EgovMap> selectBillScheduleList(MngProjectBillScheduleVO billScheduleVO) throws Exception {
	public EgovMap selectBillScheduleList(MngProjectBillScheduleVO billScheduleVO) throws Exception {
		
		if(billScheduleVO.getBillType() == null || billScheduleVO.getBillType().equals(""))
		{
			// 최초 조회 시(조회 일자와 분기가 없을때) 현재 달 3월 12일 - 03-01 ~ 03-31
			billScheduleVO.setBillType("SD");
			billScheduleVO.setSearchFromDt("20210301");
			billScheduleVO.setSearchToDt("20210331");
		}
		
		
		
		// 분기 선택 시 (1분기 : 01-01 ~ 03-31, 2분기 : 04-01 ~ 06-30, 3분기 : 07-01 ~ 09-30, 4분기 : 10-01 ~ 12-31)
		// 조회 시작일 ~ 조회 종료일이 있을때 해당 기간 조회
		
		EgovMap legovMapResult = new EgovMap();
		
		//매입-매출 분기
		//return mapper.selectBillScheduleSdList(billScheduleVO);
		
		legovMapResult.put("billList",    mapper.selectBillScheduleSdList(billScheduleVO));
		legovMapResult.put("totalAmount", mapper.selectBillScheduleSdTotalAmount(billScheduleVO));
		legovMapResult.put("totalTax",    mapper.selectBillScheduleSdTotalTax(billScheduleVO));
		return legovMapResult;
	}
	
	
	
}
