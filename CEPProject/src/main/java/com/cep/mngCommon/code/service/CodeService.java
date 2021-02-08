/**
 * 
 */
package com.cep.mngCommon.code.service;

import java.util.List;

import com.cep.mngCommon.code.vo.CodeSearchVO;
import com.cep.mngCommon.code.vo.CodeVO;

/**
 * @File Name : ProductService.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2020. 11. 25.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 25.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */

public interface CodeService {

	/**
	  * @Method Name : selectCodeList
	  * @Cdate       : 2020. 11. 25.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description :코드목록을 조회 한다.
	  * @param CodeSearchVO
	  * @return
	  * @throws Exception
	  */
	List<CodeVO> selectCodeList(CodeSearchVO searchVO) throws Exception;
	
	
}
