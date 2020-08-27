package com.cep.forecast.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.forecast.service.ForecastService;

@Service("forecastService")
public class ForecastServiceImpl implements ForecastService {
	
	private static final Logger logger = LoggerFactory.getLogger(ForecastServiceImpl.class);
	
	@Resource(name="forecastMapper")
	private ForecastMapper mapper;
	
}
