/**
 * 
 */
package com.cep.mngCommon.account.service.impl;

import java.util.List;

import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngCommon.account.vo.AccountVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @File Name : AccountMapper.java
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
@Mapper("accountMapper")
public interface AccountMapper {

	public List<AccountVO> selectAccountList(AccountSearchVO searchVO) throws Exception;
	
	public List<EgovMap> selectDirectorList(AccountSearchVO acountSearchVO) throws Exception;
}
