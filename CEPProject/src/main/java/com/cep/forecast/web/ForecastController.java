package com.cep.forecast.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.forecast.service.ForecastService;
import com.cep.forecast.vo.ForecastVO;

@Controller
public class ForecastController {
	
	@Resource(name="forecastService")
	private ForecastService service;
	
	@RequestMapping(value="/forecastList.do")
	public String selectForecast(ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "forecast/forecastList";
	}
	
	@RequestMapping(value="/writeBasic.do")
	public String addBasic(ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "forecast/writeBasic";
	}
	
	@RequestMapping(value="/writeFundInfo.do")
	public String addFundInfo(ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "forecast/writeFundInfo";
	}
	
	@RequestMapping(value="/writeProgress.do")
	public String addProgress(ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "forecast/writeProgress";
	}
	
}
