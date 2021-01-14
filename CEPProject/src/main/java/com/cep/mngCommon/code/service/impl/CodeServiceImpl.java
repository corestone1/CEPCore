/**
 * 
 */
package com.cep.mngCommon.code.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.mngCommon.code.service.CodeService;
import com.cep.mngCommon.code.vo.CodeSearchVO;
import com.cep.mngCommon.code.vo.CodeVO;

/**
 * @File Name : CodeServiceImpl.java
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
@Service("codeService")
public class CodeServiceImpl implements CodeService {

	private static final Logger logger = LoggerFactory.getLogger(CodeServiceImpl.class);
	
	@Resource(name="codeMapper")
	private CodeMapper mapper;
	
	@Override
	public List<CodeVO> selectCodeList(CodeSearchVO searchVO) throws Exception {
		
		return mapper.selectCodeList(searchVO);
	}

}
