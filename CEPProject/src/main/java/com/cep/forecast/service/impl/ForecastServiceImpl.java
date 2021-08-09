package com.cep.forecast.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.forecast.service.ForecastService;
import com.cep.forecast.vo.ForecastSearchVO;
import com.cep.forecast.vo.ForecastVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

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
	public List<EgovMap> selectForecastList(ForecastSearchVO searchVO) throws Exception {
		
		return mapper.selectFocecastList(searchVO);
	}
	
	@Override
	public String insertBasic(ForecastVO forecastVO) throws Exception {
		
		
		if(forecastVO.getSpKey() == null || forecastVO.getSpKey().equals("")) {
			//신규등록
			forecastVO.setSpKey(mapper.makeSpKey());
		
			mapper.insertBasic(forecastVO);
		}else{
			//업데이트
			mapper.updateBasic(forecastVO);
		}
		
		return forecastVO.getSpKey();
	}
	
	
	@Override
	public int existForecast(ForecastVO forecastVO) throws Exception {
		return mapper.existForecast(forecastVO);
	}
	
		
	@Override
	public ForecastVO selectForecast(ForecastVO forecastVO) throws Exception {
		return mapper.selectForecast(forecastVO);
	}
	
	
	@Override
	@SuppressWarnings("unchecked")
	public void updateFundInfo(HttpServletRequest request, ForecastVO forecastVO) throws Exception
	{
		HashMap<String, String> session = null;
		
		forecastVO.setFcSalesProfit(forecastVO.getFcSalesAmount() - forecastVO.getFcBuyAmount());
		forecastVO.setFcSalesDt(forecastVO.getFcSalesDtYr() + forecastVO.getFcSalesDtMt());
		forecastVO.setFcCollectDt(forecastVO.getFcCollectDtYr() + forecastVO.getFcCollectDtMt());
		forecastVO.setFcBuyPayDt(forecastVO.getFcBuyPayDtYr() + forecastVO.getFcBuyPayDtMt());
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			forecastVO.setModEmpKey(session.get("empKey"));
			
			mapper.updateFundInfo(forecastVO);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public void updateProgress(HttpServletRequest request, ForecastVO forecastVO) throws Exception
	{
		HashMap<String, String> session = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			forecastVO.setModEmpKey(session.get("empKey"));
			
			mapper.updateProgress(forecastVO);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	
	@Override
	public EgovMap selectSalesMeeingInfo(ForecastSearchVO forecastSearchVO) throws Exception {
		
		EgovMap leMap = new EgovMap();
		
		
		leMap.put("forecastList",      mapper.selectFocecastListSm(forecastSearchVO));
		leMap.put("forecastAmount",    mapper.selectFocecastAmount(forecastSearchVO));
		
//		leMap.put("forecastSalesAmount",    mapper.selectFocecastSalesAmount(forecastSearchVO));
//		leMap.put("forecastPurchaseAmount", mapper.selectFocecastPurchaseAmount(forecastSearchVO));
//		leMap.put("forecastProfitAmount",   mapper.selectFocecastProfitAmount(forecastSearchVO));
		
		leMap.put("biddingList",      mapper.selectBiddingList(forecastSearchVO));
		leMap.put("biddingAmount",    mapper.selectBiddingAmount(forecastSearchVO));
		
//		leMap.put("biddingSalesAmount",    mapper.selectBiddingSalesAmount(forecastSearchVO));
//		leMap.put("biddingPurchaseAmount", mapper.selectBiddingPurchaseAmount(forecastSearchVO));
//		leMap.put("biddingProfitAmount",   mapper.selectBiddingProfitAmount(forecastSearchVO));
		
		leMap.put("projectList",      mapper.selectProjectList(forecastSearchVO));
		leMap.put("projectAmount",    mapper.selectProjectAmount(forecastSearchVO));
		
//		leMap.put("projectSalesAmount",    mapper.selectProjectSalesAmount(forecastSearchVO));
//		leMap.put("projectPurchaseAmount", mapper.selectProjectPurchaseAmount(forecastSearchVO));
//		leMap.put("projectProfitAmount",   mapper.selectProjectProfitAmount(forecastSearchVO));
		
		
		return leMap;
	}
	
	@Override
	public void delete(ForecastVO forecastVO) throws Exception {
		mapper.delete(forecastVO);
	}
}
