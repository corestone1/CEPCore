package com.cep.main.service.impl;

import java.util.HashMap;

import com.cep.main.vo.EmpVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mainMapper")
public interface MainMapper {
	int selectEmp(HashMap<String, String> map) throws Exception;
	int updatePassword(EmpVO empVo) throws Exception;
	String selectName(HashMap<String, String> map) throws Exception;
}
