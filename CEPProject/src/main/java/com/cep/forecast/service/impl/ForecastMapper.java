package com.cep.forecast.service.impl;

import java.util.List;

import com.cep.forecast.vo.ForecastSearchVO;
import com.cep.forecast.vo.ForecastVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("forecastMapper")
public interface ForecastMapper {
	
	public List<ForecastVO> selectFocecastList(ForecastSearchVO searchVO) throws Exception;
	
	public String makeSpKey() throws Exception;
	
	public void insertBasic(ForecastVO forecastVO) throws Exception;
	
	public ForecastVO selectForecast(ForecastVO forecastVO) throws Exception;
	
}
