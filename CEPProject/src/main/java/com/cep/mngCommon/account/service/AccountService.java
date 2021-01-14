/**
 * 
 */
package com.cep.mngCommon.account.service;

import java.util.List;

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
}
