package com.cep.example.service;

import java.util.List;

import com.cep.example.vo.ExampleVO;

public interface ExampleService {
	
	public List<?> selectList(ExampleVO exampleVO) throws Exception; 
	
}
