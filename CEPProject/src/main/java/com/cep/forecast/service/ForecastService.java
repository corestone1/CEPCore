package com.cep.forecast.service;

import java.util.List;

import com.cep.forecast.vo.ForecastSearchVO;
import com.cep.forecast.vo.ForecastVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @File Name : ForecastService.java
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
public interface ForecastService {
	
	/**
	  * @Method Name : selectForecastList
	  * @Cdate       : 2020. 12. 1.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description :
	  * @param searchVO
	  * @return
	  * @throws Exception
	  */
	public List<EgovMap> selectForecastList(ForecastSearchVO searchVO) throws Exception;
	
	
	/**
	  * @Method Name : insertBasic
	  * @Cdate       : 2021. 1. 11.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description : Forecast 기본정보를 등록한다.
	  * @param forecastVO
	  * @throws Exception
	  */
	public String insertBasic(ForecastVO forecastVO) throws Exception;
	
	/**
	  * @Method Name : existForecast
	  * @Cdate       : 2021. 1. 20.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description : Forecast 존재여부 확인
	  * @param forecastVO
	  * @return
	  * @throws Exception
	  */
	public int existForecast(ForecastVO forecastVO) throws Exception;
	
	/**
	  * @Method Name : selectForecastBasic
	  * @Cdate       : 2021. 1. 12.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description : Forecast Key로 단 건 조회
	  * @param forecastVO
	  * @return
	  * @throws Exception
	  */
	public ForecastVO selectForecast(ForecastVO forecastVO) throws Exception;
	
	/**
	  * @Method Name : updateFundInfo
	  * @Cdate       : 2021. 1. 20.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description :
	  * @param forecastVO
	  * @throws Exception
	  */
	public void updateFundInfo(ForecastVO forecastVO) throws Exception;

	
	/**
	  * @Method Name : updateProgress
	  * @Cdate       : 2021. 1. 20.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description :
	  * @param forecastVO
	  * @throws Exception
	  */
	public void updateProgress(ForecastVO forecastVO) throws Exception;
	
	
	public EgovMap selectSalesMeeingInfo(ForecastSearchVO forecastSearchVO) throws Exception;
}
