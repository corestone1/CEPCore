package com.cep.example.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.example.service.ExampleService;
import com.cep.example.vo.ExampleVO;

@Service("exampleService")
public class ExampleServiceImpl implements ExampleService {
	
	private static final Logger logger = LoggerFactory.getLogger(ExampleServiceImpl.class);
	
	@Resource(name="exampleMapper")
	private ExampleMapper exampleMapper;
	
	@Override
	public List<?> selectList(ExampleVO exampleVO) throws Exception {
		return exampleMapper.selectList(exampleVO);
	}
}
