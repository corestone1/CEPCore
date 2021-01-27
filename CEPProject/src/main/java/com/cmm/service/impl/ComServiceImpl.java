package com.cmm.service.impl;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.cmm.config.PrimaryKeyType;
import com.cmm.service.ComService;
import com.cmm.vo.SalesVO;

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
	
	@Override
	public Map<String, Object> insertSalesInfo(String key, String regEmpKey, List<?> insertList) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Map<String, Object> insertParam = null;
		try {
			insertParam = new Hashtable<>();
			insertParam.put("salesCtFkKey", key);
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("SalesVOList", insertList);
			
			comMapper.insertSalesInfo(insertParam);
			returnMap.put("salesKey", key);
		    
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;		
	}
}
