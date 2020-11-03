package com.cep.main.service.impl;

import java.util.HashMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mainMapper")
public interface MainMapper {
	int selectEmp(HashMap<String, String> map) throws Exception;
}
