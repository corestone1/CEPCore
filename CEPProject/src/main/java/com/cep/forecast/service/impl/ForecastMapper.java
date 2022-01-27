package com.cep.forecast.service.impl;

import java.util.List;
import java.util.Map;

import com.cep.forecast.vo.ForecastBiddingFileVO;
import com.cep.forecast.vo.ForecastBiddingVO;
import com.cep.forecast.vo.ForecastSearchVO;
import com.cep.forecast.vo.ForecastVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("forecastMapper")
public interface ForecastMapper {
	
	public List<EgovMap> selectForecastList(ForecastSearchVO searchVO) throws Exception;
	
	public String makeSpKey() throws Exception;
	
	public void insertBasic(ForecastVO forecastVO) throws Exception;
	
	public int existForecast(ForecastVO forecastVO) throws Exception;
	
	public ForecastVO selectForecast(ForecastVO forecastVO) throws Exception;
	
	public void updateBasic(ForecastVO forecastVO) throws Exception;
	
	public List<EgovMap> selectSalesInfo(ForecastVO forecastVO) throws Exception;
	
	public List<EgovMap> selectPcInfo(ForecastVO forecastVO) throws Exception;
	
	// public void updateFundInfo(ForecastVO forecastVO) throws Exception;
	
	public void insertSalesInfo(Map<String, Object> insertParam) throws Exception;
	
	public void updateSalesInfo(Map<String, Object> updateParam) throws Exception;
	
	public void insertPcInfo(Map<String, Object> insertParam) throws Exception;
	
	public void updatePcInfo(Map<String, Object> updateParam) throws Exception;
	
	public void deleteSalesInfo(Map<String, Object> deleteParam) throws Exception;
	
	public void deletePcInfo(Map<String, Object> deleteParam) throws Exception;
	
	public void updateProgress(ForecastVO forecastVO) throws Exception;
	
	/**
	 * 프로젝트 입찰 상세정보를 조회한다.
	 * @param projectVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 입찰 상세 정보
	 * @exception
	 */
	public ForecastBiddingVO selectBiddingDetail(ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	/**
	 * 프로젝트 입찰 파일 정보를 조회한다.
	 * @param projectBiddingFileVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 입찰 파일 정보
	 * @exception
	 */
	public List<?> selectBiddingFileList(ForecastBiddingFileVO forecastBiddingFileVO) throws Exception;
	
	/**
	 * 프로젝트 입찰 정보를 등록한다.
	 * @param projectBiddingVO - 등록할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public void insertBiddingInfo(ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	/**
	 * 프로젝트 입찰 정보를 수정한다.
	 * @param projectBiddingVO - 수정할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public void updateBiddingInfo(ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	/**
	 * 프로젝트 입찰 파일 정보를 등록한다.
	 * @param insertParam - 등록할 정보가 담긴 map
	 * @return 
	 * @exception
	 */
	public void insertBiddingFileInfo(Map<String, Object> insertParam) throws Exception;
	
	/**
	 * 프로젝트 입찰 파일 정보를 수정한다.
	 * @param insertParam - 수정할 정보가 담긴 map
	 * @return 
	 * @exception
	 */
	public void updateBiddingFileInfo(Map<String, Object> updateParam) throws Exception;
	
	/* 영업 회의 자료 관려 */
	public List<ForecastVO> selectFocecastListSm(ForecastSearchVO searchVO) throws Exception;
	
	public EgovMap selectFocecastAmount(ForecastSearchVO searchVO) throws Exception;
	
	public List<EgovMap> selectBiddingList(ForecastSearchVO searchVO) throws Exception;
	
	public EgovMap selectBiddingAmount(ForecastSearchVO searchVO) throws Exception;
	
	public EgovMap selectBdGbInfo(ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	public void requestBiddingGb(ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	public void modifyBiddingGb(ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	public void endBiddingGb(ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	public List<EgovMap> selectProjectList(ForecastSearchVO searchVO) throws Exception;
	
	public EgovMap selectProjectAmount(ForecastSearchVO searchVO) throws Exception;
	
	public void delete(ForecastVO forecastVO) throws Exception;
	
	// 임시
	public void changeStatus(ForecastVO forecastVO) throws Exception;
}
