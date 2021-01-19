package com.cep.forecast.web;

import java.util.HashMap;
import java.util.List;
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

@Controller
@RequestMapping(value="/forecast")
public class ForecastController {
	private static final Logger logger = LoggerFactory.getLogger(ForecastController.class);
	
	@Resource(name="forecastService")
	private ForecastService service;
	
	@RequestMapping(value="/list.do")
	public String selectForecast(@ModelAttribute("searchVO") ForecastSearchVO searchVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		logger.debug("searchVO.spState()        :: {}", searchVO.getPjFlag());
		logger.debug("searchVO.getSpState()     :: {}", searchVO.getSpState());
		logger.debug("searchVO.getSearchFlag()  :: {}", searchVO.getSearchFlag());
		logger.debug("searchVO.getSearchValue() :: {}", searchVO.getSearchValue());
		
		List<ForecastVO> lltForecast = service.selectForecastList(searchVO);
		
		model.put("forecastList", lltForecast);
		
		return "forecast/list";
	}
	
	
	
	
	@RequestMapping(value="/delete.do")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		logger.debug(":::::: SP_KEY ======= {}", request.getParameter("SP_KEY"));
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		return returnMap; 
	}
	
	
	
	
	
	
	//Forecast 기본정보 등록
	@RequestMapping(value="/write/basic.do")
	public String addBasic(@ModelAttribute("forecastVO") ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		logger.debug("spKey : {}", forecastVO.getSpKey() );
		
		forecastVO.setSpKey("SP210013");
		
		model.put("spKey", forecastVO.getSpKey());
		
		if(forecastVO.getSpKey() != null || !forecastVO.getSpKey().equals(""))
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
		
		return "forecast/write/basic";
	}
	
	@RequestMapping(value="/write/fundInfo.do")
	public String addFundInfo(@ModelAttribute("forecastVO") ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		logger.debug("spKey : {}", forecastVO.getSpKey() );
		model.put("spKey", forecastVO.getSpKey());
		
		if(forecastVO.getSpKey() != null || !forecastVO.getSpKey().equals(""))
		{
			//수정으로 판단하고 기존 등록된 내용을 조회하여 화면에 전달
		}
		
		return "forecast/write/fundInfo";
	}
	
	@RequestMapping(value="/write/progress.do")
	public String addProgress(@ModelAttribute("forecastVO") ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		logger.debug("spKey : {}", forecastVO.getSpKey() );
		model.put("spKey", forecastVO.getSpKey());
		
		if(forecastVO.getSpKey() != null || !forecastVO.getSpKey().equals(""))
		{
			//수정으로 판단하고 기존 등록된 내용을 조회하여 화면에 전달
		}
		
		return "forecast/write/progress";
	}
	
	@RequestMapping(value="/popup/searchList.do")
	public String searchListPopup(@ModelAttribute("searchVO") ForecastSearchVO searchVO, ModelMap model) throws Exception {
		
		logger.debug("searchVO.spState()        :: {}", searchVO.getPjFlag());
		logger.debug("searchVO.getSpState()     :: {}", searchVO.getSpState());
		logger.debug("searchVO.getSearchFlag()  :: {}", searchVO.getSearchFlag());
		logger.debug("searchVO.getSearchValue() :: {}", searchVO.getSearchValue());
		
		List<ForecastVO> lltForecast = service.selectForecastList(searchVO);
		
		model.put("forecastList", lltForecast);
		
		
		return "forecast/popup/searchList"; 
	}
	
	
	@RequestMapping(value="/write/writeBasic.do")
	@ResponseBody
	public Map<String, Object> basicWrite(@ModelAttribute("forecastVO") ForecastVO forecastVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		//spKey값이 null이면 insert, null이 아니면 update
		logger.debug("spKey    : {}", forecastVO.getSpKey());
		logger.debug("acKey    : {}", forecastVO.getAcKey());
		logger.debug("spBusiNm : {}", forecastVO.getSpBusiNm());
		logger.debug("pmKey    : {}", forecastVO.getPmKey());
		logger.debug("pmDetail : {}", forecastVO.getPmDetail());
		
		forecastVO.setRegEmpKey("ynk@corestone.co.kr");
		
		returnMap.put("spKey", service.insertBasic(forecastVO));
		
		return returnMap;
	}
	
	
	//고객 목록 조회(임시 - 임수영 고객 관리 코딩 후 이관예정)
	@RequestMapping(value="/popup/searchListCurstorm.do")
	@ResponseBody
	public Map<String, Object> searchListCurstom(HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		
		return returnMap;
	}
}
