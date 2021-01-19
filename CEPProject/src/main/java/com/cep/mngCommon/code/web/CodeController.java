package com.cep.mngCommon.code.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.mngCommon.code.service.CodeService;
import com.cep.mngCommon.code.vo.CodeSearchVO;
import com.cep.mngCommon.code.vo.CodeVO;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
@RequestMapping(value="/mngCommon/code")
public class CodeController {
	private static final Logger logger = LoggerFactory.getLogger(CodeController.class);

	@Resource(name="codeService")
	private CodeService service;
	
	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@RequestMapping(value="/list.do")
	@ResponseBody
	public Map<String, Object> selectCodeList(@ModelAttribute("searchVO") CodeSearchVO searchVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		logger.debug("searchVO.getCdClass() :: {}", searchVO.getCdClass());
		logger.debug("searchVO.getCdNm()     :: {}", searchVO.getCdNm());
		logger.debug("searchVO.getCdUpCd()     :: {}", searchVO.getCdUpCd());
		
		
		List<CodeVO> lltCodeList = service.selectCodeList(searchVO);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("codeList", lltCodeList);
		
		return returnMap;
	}
}
