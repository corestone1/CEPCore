/**
 * 
 */
package com.cep.mngCommon.account.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.mngCommon.account.service.AccountService;
import com.cep.mngCommon.account.vo.AccountDepositVO;
import com.cep.mngCommon.account.vo.AccountDirectorVO;
import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngCommon.account.vo.AccountVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @File Name : AccountServiceImpl.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2021. 1. 6.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 1. 6.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
@Service("accountService")
public class AccountServiceImpl implements AccountService {

	private static final Logger logger = LoggerFactory.getLogger(AccountServiceImpl.class);
	
	@Resource(name="accountMapper")
	private AccountMapper mapper;
	
	
	@Override
	public List<AccountVO> selectAccountList(AccountSearchVO searchVO) throws Exception {
		return mapper.selectAccountList(searchVO);
	}
	
	@Override
	public AccountVO selectAccountDetail(AccountSearchVO searchVO) throws Exception {
		return mapper.selectAccountDetail(searchVO);
	}
	
	@Override
	public List<EgovMap> selectAcDirectorList(AccountSearchVO searchVO) throws Exception {
		return mapper.selectDirectorList(searchVO);
	}
	
	@Override
	public List<EgovMap> selectAcDepositList(AccountSearchVO searchVO) throws Exception {
		return mapper.selectAcDepositList(searchVO);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> insertAccountInfo(HttpServletRequest request, AccountVO accountVO) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		List<AccountDirectorVO> insertDirecList = new ArrayList<>();
		List<AccountDirectorVO> updateDirecList = new ArrayList<>();
		List<AccountDepositVO> insertDepoList = new ArrayList<>();
		List<AccountDepositVO> updateDepoList = new ArrayList<>();
		
		try {
			if(mapper.isExist(accountVO) != 0) {
				// 수정
			} else {
				mapper.insertAccountInfo(accountVO);
				writeAcDirectorInfo(accountVO.getAccountDirectorVO());
				writeAcDepositInfo(accountVO.getAccountDepositVO());
			}
			
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			returnMap.put("successYN", "N");
			throw new Exception(e);
		}
		
		return returnMap;
	}
	
	private void writeAcDirectorInfo(List<?> insertDirecList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new Hashtable<>();
			
			insertParam.put("accountDirectorVO", insertDirecList);
			mapper.insertAcDirectorInfo(insertParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	private void writeAcDepositInfo(List<?> insertDepoList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new Hashtable<>();
			
			insertParam.put("accountDepositVO", insertDepoList);
			mapper.insertAcDepositInfo(insertParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}

}
