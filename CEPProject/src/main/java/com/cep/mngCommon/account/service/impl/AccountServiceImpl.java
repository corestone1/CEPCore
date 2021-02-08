/**
 * 
 */
package com.cep.mngCommon.account.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.mngCommon.account.service.AccountService;
import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngCommon.account.vo.AccountVO;

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

}
