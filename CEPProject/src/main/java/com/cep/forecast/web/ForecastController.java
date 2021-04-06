package com.cep.forecast.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.forecast.service.ForecastService;
import com.cep.forecast.vo.ForecastSearchVO;
import com.cep.forecast.vo.ForecastVO;
import com.cmm.service.ComService;
import com.cmm.util.CepDisplayUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping(value="/forecast")
public class ForecastController {
	private static final Logger logger = LoggerFactory.getLogger(ForecastController.class);
	
	@Resource(name="forecastService")
	private ForecastService service;
	
	@Resource(name="comService")
	private ComService  comService;
	
	@RequestMapping(value="/list.do")
	public String selectForecast(@ModelAttribute("searchVO") ForecastSearchVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		logger.debug("searchVO.spState()        :: {}", searchVO.getPjFlag());
		logger.debug("searchVO.getSpState()     :: {}", searchVO.getSpState());
		logger.debug("searchVO.getSearchFlag()  :: {}", searchVO.getSearchFlag());
		logger.debug("searchVO.getSearchValue() :: {}", searchVO.getSearchValue());
		
		try{
		
			if(searchVO.getSearchFlag() == null 
			|| searchVO.getSearchFlag().equals("")
			|| !searchVO.getSearchFlag().equals("SE"))
			{
				HashMap<String, String> sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
				searchVO.setSalesEmpKey(sessionMap.get("empKey"));
				// 최초 조회 시 자신의 건만 보이게...
				model.put("empKey", sessionMap.get("empKey"));
			}
			
			model.put("employeeList", comService.selectEmployeeList());
			
			model.put("forecastList", service.selectForecastList(searchVO));
			
			model.put("displayUtil", new CepDisplayUtil());
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "forecast/list";
	}
	
	
	
	
	@RequestMapping(value="/delete.do")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		logger.debug(":::::: SP_KEY ======= {}", request.getParameter("SP_KEY"));
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap; 
	}
	
	
	
	
	
	
	//Forecast 기본정보 등록
	@RequestMapping(value="/write/basic.do")
	public String addBasic(@ModelAttribute("forecastVO") ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		try {
			
			logger.debug("spKey : {}", forecastVO.getSpKey() );
			
	//		forecastVO.setSpKey("SP210013");
			
			model.put("spKey", forecastVO.getSpKey());
			
			if(forecastVO != null && forecastVO.getSpKey() != null && !forecastVO.getSpKey().equals(""))
			{
				logger.debug("111 spKey : {}", forecastVO.getSpKey() );
				//수정으로 판단하고 기존 등록된 내용을 조회하여 화면에 전달
				ForecastVO lvoForecast = service.selectForecast(forecastVO);
				
				logger.debug("111 acKey : {}", lvoForecast.getAcKey() );
				
				if(lvoForecast.getAcKey() != null || !lvoForecast.getAcKey().equals(""))
				{
					model.addAttribute("forecast", lvoForecast);
				}
			}
		}
		catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "forecast/write/basic";
	}
	
	@RequestMapping(value="/write/fundInfo.do")
	public String addFundInfo(@ModelAttribute("forecastVO") ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		logger.debug("spKey : {}", forecastVO.getSpKey() );
		
		try {
			model.put("displayUtil", new CepDisplayUtil());
			model.put("spKey", forecastVO.getSpKey());
			
			if(forecastVO.getSpKey() != null || !forecastVO.getSpKey().equals(""))
			{
				//수정으로 판단하고 기존 등록된 내용을 조회하여 화면에 전달
				ForecastVO lvoForecast = service.selectForecast(forecastVO);
				
				if(lvoForecast != null)
				{
					if( lvoForecast.getAcKey() != null || !lvoForecast.getAcKey().equals(""))
					{
						logger.debug("lvoForecast.getAcKey() : {}", lvoForecast.getAcKey());
						model.addAttribute("forecast", lvoForecast);
					}
				}
			}
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "forecast/write/fundInfo";
	}
	
	/**
	  * @Method Name : writeFundInfo
	  * @Cdate       : 2021. 1. 20.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description : Forecast - 매출/입 정보 저장
	  * @param forecastVO
	  * @param model
	  * @return
	  * @throws Exception
	  */
	@RequestMapping(value="/write/writeFundInfo.do")
	@ResponseBody
	public Map<String, Object> writeFundInfo(@ModelAttribute("forecastVO") ForecastVO forecastVO, ModelMap model) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("forecastVO.getFcBuyAmount()     :: {}", forecastVO.getFcBuyAmount());
		logger.debug("forecastVO.getFcSalesAmount()   :: {}", forecastVO.getFcSalesAmount());
		logger.debug("forecastVO.getFcSalesDtYr()     :: {}", forecastVO.getFcSalesDtYr());
		logger.debug("forecastVO.getFcSalesDtMt()     :: {}", forecastVO.getFcSalesDtMt());
		
		try
		{
			service.updateFundInfo(forecastVO);
			
		}
		catch(Exception e)
		{
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
	}
	
	@RequestMapping(value="/write/progress.do")
	public String addProgress(@ModelAttribute("forecastVO") ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		try{
			
			logger.debug("spKey : {}", forecastVO.getSpKey() );
			model.put("spKey", forecastVO.getSpKey());
			
			try
			{
				model.put("spKey", forecastVO.getSpKey());
				if(forecastVO != null && forecastVO.getSpKey() != null && !forecastVO.getSpKey().equals(""))
				{
					//수정으로 판단하고 기존 등록된 내용을 조회하여 화면에 전달
					ForecastVO lvoForecast = service.selectForecast(forecastVO);
					
					if(lvoForecast != null)
					{
						logger.debug("lvoForecast.getAcKey() : {}", lvoForecast.getAcKey());
						logger.debug("lvoForecast.getRemark() : {}", lvoForecast.getRemark());
						
						model.addAttribute("forecast", lvoForecast);
					}
				}

			}
			catch(Exception e)
			{
				logger.error("{}", e);
				throw e;
			}
			
		
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "forecast/write/progress";
	}
	
	
	/**
	  * @Method Name : writeProgress
	  * @Cdate       : 2021. 1. 20.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description : Forecast 진행사항 등록
	  * @param forecastVO
	  * @param model
	  * @return
	  * @throws Exception
	  */
	@RequestMapping(value="/write/writeProgress.do")
	@ResponseBody
	public Map<String, Object> writeProgress(@ModelAttribute("forecastVO") ForecastVO forecastVO, ModelMap model) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("forecastVO.getPmDetail2()  :: \n{}", forecastVO.getPmDetail2());
		logger.debug("forecastVO.getRemark()     :: \n{}", forecastVO.getRemark());
		
		try
		{
			service.updateProgress(forecastVO);
			
		}
		catch(Exception e)
		{
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
	}
	
	
	@RequestMapping(value="/popup/searchList.do")
	public String searchListPopup(@ModelAttribute("searchVO") ForecastSearchVO searchVO, ModelMap model) throws Exception {
		
		logger.debug("searchVO.spState()        :: {}", searchVO.getPjFlag());
		logger.debug("searchVO.getSpState()     :: {}", searchVO.getSpState());
		logger.debug("searchVO.getSearchFlag()  :: {}", searchVO.getSearchFlag());
		logger.debug("searchVO.getSearchValue() :: {}", searchVO.getSearchValue());
		
		try{	
			
			model.put("forecastList", service.selectForecastList(searchVO));
	//		model.put("spKeyDomId", searchVO.getSpKeyDomId());
	//		model.put("spBusiNmDomId", searchVO.getSpBusiNmDomId());
			model.put("returnType", searchVO.getReturnType());
			model.put("returnKey", searchVO.getReturnKey());
			model.put("returnNm", searchVO.getReturnNm());
			model.put("returnFunctionNm", searchVO.getReturnFunctionNm());
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "forecast/popup/searchList"; 
	}
	
	
	@RequestMapping(value="/write/writeBasic.do")
	@ResponseBody
	public Map<String, Object> basicWrite(@ModelAttribute("forecastVO") ForecastVO forecastVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		
		try {
			
			//spKey값이 null이면 insert, null이 아니면 update
			logger.debug("spKey    : {}", forecastVO.getSpKey());
			logger.debug("acKey    : {}", forecastVO.getAcKey());
			logger.debug("spBusiNm : {}", forecastVO.getSpBusiNm());
			logger.debug("pmKey    : {}", forecastVO.getPmKey());
			logger.debug("pmDetail : {}", forecastVO.getPmDetail());
			
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			forecastVO.setRegEmpKey(sessionMap.get("empKey"));
			
			returnMap.put("spKey", service.insertBasic(forecastVO));
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
	}
	
	
	//고객 목록 조회(임시 - 임수영 고객 관리 코딩 후 이관예정)
	@RequestMapping(value="/popup/searchListCurstorm.do")
	@ResponseBody
	public Map<String, Object> searchListCurstom(HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
	}
	
	
	@RequestMapping(value="/salesMeetingList.do")
	public String viewSalesMeetingList(@ModelAttribute("searchVO") ForecastSearchVO searchVO, ModelMap model) throws Exception {
		
		try {
			
			logger.debug("=================== viewSalesMeetingList ==============================");
			logger.debug("searchVO.spState()        :: {}", searchVO.getPjFlag());
			logger.debug("searchVO.getSpState()     :: {}", searchVO.getSpState());
			logger.debug("searchVO.getSearchFlag()  :: {}", searchVO.getSearchFlag());
			logger.debug("searchVO.getSearchValue() :: {}", searchVO.getSearchValue());
			
			
			searchVO.setSearchFromDt("20210101");
			searchVO.setSearchToDt("20210331");
			
			EgovMap leMapSales =  service.selectSalesMeeingInfo(searchVO);
			
			model.put("displayUtil", new CepDisplayUtil());
			
			model.put("forecastList",      leMapSales.get("forecastList"));
			model.put("forecastAmount",    leMapSales.get("forecastAmount"));
			
//			model.put("forecastSalesAmount",    leMapSales.get("forecastSalesAmount"));
//			model.put("forecastPurchaseAmount", leMapSales.get("forecastPurchaseAmount"));
//			model.put("forecastProfitAmount",   leMapSales.get("forecastProfitAmount"));
			
			model.put("biddingList",      leMapSales.get("biddingList"));
			model.put("biddingAmount",    leMapSales.get("biddingAmount"));
			
//			model.put("biddingSalesAmount",    leMapSales.get("biddingSalesAmount"));
//			model.put("biddingPurchaseAmount", leMapSales.get("biddingPurchaseAmount"));
//			model.put("biddingProfitAmount",   leMapSales.get("biddingProfitAmount"));
			
			model.put("projectList",      leMapSales.get("projectList"));
			model.put("projectAmount",    leMapSales.get("projectAmount"));
			
//			model.put("projectSalesAmount",    leMapSales.get("projectSalesAmount"));
//			model.put("projectPurchaseAmount", leMapSales.get("projectPurchaseAmount"));
//			model.put("projectProfitAmount",   leMapSales.get("projectProfitAmount"));
			
		} catch(Exception e) {
			logger.error("{}",e);
			throw e;
		}
		
		return "forecast/salesMeetingList";
	}
}
