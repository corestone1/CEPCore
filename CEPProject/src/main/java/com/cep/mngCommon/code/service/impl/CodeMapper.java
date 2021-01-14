/**
 * 
 */
package com.cep.mngCommon.code.service.impl;

import java.util.List;

import com.cep.mngCommon.code.vo.CodeSearchVO;
import com.cep.mngCommon.code.vo.CodeVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * @File Name : CodeMapper.java
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
@Mapper("codeMapper")
public interface CodeMapper {
	
	public List<CodeVO> selectCodeList(CodeSearchVO searchVO) throws Exception;
	
}
