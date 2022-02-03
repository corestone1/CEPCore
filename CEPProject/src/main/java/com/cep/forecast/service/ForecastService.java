package com.cep.forecast.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cep.forecast.vo.ForecastBiddingFileVO;
import com.cep.forecast.vo.ForecastBiddingVO;
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
	  * @Method Name : selectSalesInfo
	  * @Cdate       : 2021. 10. 25.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : Forecast Key로 리스트 조회
	  * @param forecastVO
	  * @return
	  * @throws Exception
	  */
	public List<EgovMap> selectSalesInfo(ForecastVO forecastVO) throws Exception;
	
	/**
	  * @Method Name : selectPcInfo
	  * @Cdate       : 2021. 10. 25.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : Forecast Key로 리스트 조회
	  * @param forecastVO
	  * @return
	  * @throws Exception
	  */
	public List<EgovMap> selectPcInfo(ForecastVO forecastVO) throws Exception;
	
	/**
	  * @Method Name : updateFundInfo
	  * @Cdate       : 2021. 1. 20.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description :
	  * @param forecastVO
	  * @throws Exception
	  */
	public Map<String, Object> writeFundInfo(HttpServletRequest request, ForecastVO forecastVO) throws Exception;

	
	/**
	  * @Method Name : updateProgress
	  * @Cdate       : 2021. 1. 20.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description :
	  * @param forecastVO
	  * @throws Exception
	  */
	public void updateProgress(HttpServletRequest request, ForecastVO forecastVO) throws Exception;
	
	/**
	 * 프로젝트 입찰 상세 정보를 조회한다.
	 * @param projectVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 상세 정보
	 * @exception
	 */
	public ForecastBiddingVO selectBiddingDetail(ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	/**
	 * 프로젝트 입찰 상세 정보를 조회한다.
	 * @param projectVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 상세 정보
	 * @exception
	 */
	public List<?> selectBiddingFileList(ForecastBiddingFileVO forecastBiddingFileVO) throws Exception;
	
	/**
	  * @Method Name : writeBiddingInfo
	  * @Cdate       : 2021. 11. 10.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :
	  * @param forecastBiddingVO
	  * @throws Exception
	  */
	public Map<String, Object> writeBiddingInfo(HttpServletRequest request, ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	/**
	  * @Method Name : requestBiddingDoc
	  * @Cdate       : 2021. 11. 25.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :
	  * @param forecastBiddingVO
	  * @throws Exception
	  */
	public Map<String, Object> requestBiddingDoc(HttpServletRequest request, ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	public EgovMap selectBdGbInfo(ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	public Map<String, Object> requestBiddingGb(HttpServletRequest request, ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	public Map<String, Object> modifyBiddingGb(HttpServletRequest request, ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	public Map<String, Object> endBiddingGb(HttpServletRequest request, ForecastBiddingVO forecastBiddingVO) throws Exception;
	
	public EgovMap selectSalesMeeingInfo(ForecastSearchVO forecastSearchVO) throws Exception;
	
	public void delete(HttpServletRequest request, ForecastVO forecastVO) throws Exception;
	
	// 임시(수주, 실주 등록 기능)
	public void changeStatus(HttpServletRequest request, ForecastVO forecastVO) throws Exception;
}
