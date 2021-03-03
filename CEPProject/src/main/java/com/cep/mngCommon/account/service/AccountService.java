/**
 * 
 */
package com.cep.mngCommon.account.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngCommon.account.vo.AccountVO;

/**
 * @File Name : AccountService.java
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

public interface AccountService {

	/**
	  * @Method Name : selectAccountList
	  * @Cdate       : 2021. 1. 6.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description :
	  * @param searchVO
	  * @return
	  * @throws Exception
	  */
	List<AccountVO> selectAccountList(AccountSearchVO searchVO) throws Exception;
	
	/**
	  * @Method Name : selectAccountDetail
	  * @Cdate       : 2021. 2. 24.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :
	  * @param searchVO
	  * @return
	  * @throws Exception
	  */
	AccountVO selectAccountDetail(AccountSearchVO searchVO) throws Exception;
	
	/**
	  * @Method Name : selectAcDirectorList
	  * @Cdate       : 2021. 2. 24.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :
	  * @param searchVO
	  * @return
	  * @throws Exception
	  */
	List<?> selectAcDirectorList(AccountSearchVO searchVO) throws Exception;
	
	/**
	  * @Method Name : selectAcDepositList
	  * @Cdate       : 2021. 2. 24.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description :
	  * @param searchVO
	  * @return
	  * @throws Exception
	  */
	List<?> selectAcDepositList(AccountSearchVO searchVO) throws Exception;
	
	/**
	  * @Method Name : insertAccountInfo
	  * @Cdate       : 2021. 2. 24.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 거래처 정보 추가
	  * @param searchVO
	  * @return
	  * @throws Exception
	  */
	Map<String, Object> insertAccountInfo(HttpServletRequest request, AccountVO accountVO) throws Exception;
	
}
