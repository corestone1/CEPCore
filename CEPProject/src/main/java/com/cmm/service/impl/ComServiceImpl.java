package com.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cmm.config.PrimaryKeyType;
import com.cmm.service.ComService;

@Service("comService")
public class ComServiceImpl implements ComService {
	
	@Resource(name="comMapper")
	private ComMapper comMapper;
	
	@Override
	public List<?> selectAccountList() throws Exception {
		return comMapper.selectAccountList();
	}
	
	@Override
	public List<?> selectAcDirectorList(String acKey) throws Exception {
		return comMapper.selectAcDirectorList(acKey);
	}
	
	@Override
	public List<?> selectEmployeeList() throws Exception {
		return comMapper.selectEmployeeList();
	}
	
	@Override
	public String makePrimaryKey(PrimaryKeyType keyType) throws Exception {
		String primaryKey = null;
		try {
			primaryKey = comMapper.makePrimaryKey(keyType.getValue());
		} catch (Exception e) {
			throw new Exception(e);
		}
		return primaryKey;
	}
}
