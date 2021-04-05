package com.cep.mngProject.fundSchedule.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cep.mngProject.fundSchedule.service.MngProjectFundScheduleService;
import com.cep.mngProject.fundSchedule.vo.MngProjectFundScheduleVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngProjectFundScheduleService")
public class MngProjectFundScheduleServiceImpl implements MngProjectFundScheduleService {

	
	@Resource(name="mngProjectFundScheduleMapper")
	private MngProjectFundScheduleMapper mapper;
	
	
	@Override
	public EgovMap selectFundScheduleList(MngProjectFundScheduleVO mngProjectFundScheduleVO) throws Exception {
	
		if(mngProjectFundScheduleVO.getSearchFromDt() == null || mngProjectFundScheduleVO.getSearchFromDt().equals(""))
		{
			// 최초 조회 시(조회 일자와 분기가 없을때) 현재 달 3월 12일 - 03-01 ~ 03-31
			mngProjectFundScheduleVO.setSearchFromDt("20210301");
			mngProjectFundScheduleVO.setSearchToDt("20210331");
		}
		
		
		
		// 분기 선택 시 (1분기 : 01-01 ~ 03-31, 2분기 : 04-01 ~ 06-30, 3분기 : 07-01 ~ 09-30, 4분기 : 10-01 ~ 12-31)
		// 조회 시작일 ~ 조회 종료일이 있을때 해당 기간 조회
		
		EgovMap legovMap = new EgovMap();
		
		legovMap.put("salesList", mapper.selectFundScheduleSdList(mngProjectFundScheduleVO));
		legovMap.put("salesTotalAmount", mapper.selectFundScheduleSdTotalAmount(mngProjectFundScheduleVO));
		
		legovMap.put("paymentList", mapper.selectFundSchedulePcList(mngProjectFundScheduleVO));
		legovMap.put("paymentAmmount", mapper.selectFundSchedulePcTotalAmount(mngProjectFundScheduleVO));
		
		return legovMap;
	}
	
	
	@Override
	public List<EgovMap> selectOrderProductList(MngProjectFundScheduleVO mngProductFundScheduleVO) throws Exception {
		
		if("S".equals(mngProductFundScheduleVO.getFundGb())){
			return mapper.selectOrderProductSdList(mngProductFundScheduleVO);
		} else {
			return mapper.selectOrderProductPcList(mngProductFundScheduleVO);
		}
	}
	
}
