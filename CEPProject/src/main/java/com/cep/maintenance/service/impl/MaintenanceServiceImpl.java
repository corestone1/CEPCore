package com.cep.maintenance.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.maintenance.service.MaintenanceService;


@Service("maintenanceService")
public class MaintenanceServiceImpl implements MaintenanceService {
	
	private static final Logger logger = LoggerFactory.getLogger(MaintenanceServiceImpl.class);
	
	@Resource(name="maintenanceMapper")
	private MaintenanceMapper mapper;
	
}
