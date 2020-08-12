package com.cep.example.service.impl;

import java.util.List;

import com.cep.example.vo.ExampleVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("exampleMapper")
public interface ExampleMapper {
	
	public List<?> selectList(ExampleVO exampleVO);
	
}
