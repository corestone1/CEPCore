package com.cep.forecast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.forecast.service.ForecastService;
import com.cep.forecast.vo.ForecastSearchVO;
import com.cep.forecast.vo.ForecastVO;

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
	
	@Override
	public List<ForecastVO> selectForecastList(ForecastSearchVO searchVO) throws Exception {
		
		return mapper.selectFocecastList(searchVO);
	}
	
	@Override
	public String insertBasic(ForecastVO forecastVO) throws Exception {
		
		forecastVO.setSpKey(mapper.makeSpKey());
		
		mapper.insertBasic(forecastVO);
		
		return forecastVO.getSpKey();
	}
	
	@Override
	public ForecastVO selectForecast(ForecastVO forecastVO) throws Exception {
		return mapper.selectForecast(forecastVO);
	}
}
