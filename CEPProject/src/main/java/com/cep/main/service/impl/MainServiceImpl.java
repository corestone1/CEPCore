package com.cep.main.service.impl;

import java.util.HashMap;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cep.main.service.MainService;

@Service("mainService")
public class MainServiceImpl implements MainService {

	// TODO mybatis 사용
	@Resource(name="mainMapper")
	private MainMapper mapper;
	
	@Override
	public int loginCheck(HashMap<String, String> map) throws Exception {

		return mapper.selectEmp(map);
	}
	
}
