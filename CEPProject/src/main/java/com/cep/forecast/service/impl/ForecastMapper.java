package com.cep.forecast.service.impl;

import java.util.List;

import com.cep.forecast.vo.ForecastSearchVO;
import com.cep.forecast.vo.ForecastVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("forecastMapper")
public interface ForecastMapper {
	
	public List<EgovMap> selectFocecastList(ForecastSearchVO searchVO) throws Exception;
	
	public String makeSpKey() throws Exception;
	
	public void insertBasic(ForecastVO forecastVO) throws Exception;
	
	public int existForecast(ForecastVO forecastVO) throws Exception;
	
	public ForecastVO selectForecast(ForecastVO forecastVO) throws Exception;
	
	public void updateBasic(ForecastVO forecastVO) throws Exception;
	
	public void updateFundInfo(ForecastVO forecastVO) throws Exception;
	
	public void updateProgress(ForecastVO forecastVO) throws Exception;
	
	/* 영업 회의 자료 관려 */
	public List<ForecastVO> selectFocecastListSm(ForecastSearchVO searchVO) throws Exception;
	
	public EgovMap selectFocecastAmount(ForecastSearchVO searchVO) throws Exception;
	
	public List<EgovMap> selectBiddingList(ForecastSearchVO searchVO) throws Exception;
	
	public EgovMap selectBiddingAmount(ForecastSearchVO searchVO) throws Exception;
	
	public List<EgovMap> selectProjectList(ForecastSearchVO searchVO) throws Exception;
	
	public EgovMap selectProjectAmount(ForecastSearchVO searchVO) throws Exception;
	
	public void delete(ForecastVO forecastVO) throws Exception;
}
