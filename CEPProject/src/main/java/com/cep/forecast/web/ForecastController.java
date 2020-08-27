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
	
	@RequestMapping(value="/writeForecast.do")
	public String addForecast(ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		return "forecast/writeForecast";
	}
	
}
