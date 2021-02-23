package com.cep.mngCommon.account.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.mngCommon.account.service.AccountService;
import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngCommon.account.vo.AccountVO;
import com.cep.project.vo.ProjectVO;
import com.cmm.util.CepDisplayUtil;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller            
@RequestMapping(value="/mngCommon/account")
public class AccountController {
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

	@Resource(name="accountService")
	private AccountService service;
	
	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	
	                       
	@RequestMapping(value="/searchList.do")
	@ResponseBody
	public Map<String, Object> selectAccountList(@ModelAttribute("searchVO") AccountSearchVO searchVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		logger.debug("searchVO.getAcBuyYN()   :: {}", searchVO.getAcBuyYN());
		logger.debug("searchVO.getAcSalesYN() :: {}", searchVO.getAcSalesYN());
		logger.debug("searchVO.getAcNm()      :: {}", searchVO.getAcNm());
		
		List<AccountVO> lltAccountList = service.selectAccountList(searchVO);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("accountList", lltAccountList);
		
		return returnMap;
	}
	
	@RequestMapping(value="/list.do")
	public String selectAccountListMain(@ModelAttribute("searchVO") AccountSearchVO searchVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		try {
			logger.debug("searchVO.getAcBuyYN()   :: {}", searchVO.getAcBuyYN());
			logger.debug("searchVO.getAcSalesYN() :: {}", searchVO.getAcSalesYN());
			logger.debug("searchVO.getAcNm(11)      :: {}", searchVO.getAcNm());
			
			//List<AccountVO> lltAccountList = service.selectAccountList(searchVO);
			
			//Map<String, Object> returnMap = new HashMap<String, Object>();
			//returnMap.put("accountList", lltAccountList);
		} catch (Exception e) {
			logger.error("selectAccountListMain :: {}", e);
		}		
		
		return "mngCommon/account/list";
	}
	
	
	@RequestMapping(value="/write.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewAddAccountInfo(HttpServletRequest request, AccountSearchVO searchVO, ModelMap model) throws Exception {
		
		try {
			
		} catch (Exception e) {
			logger.error("viewAddAccountInfo :: {}", e);
		}
		
		return "mngCommon/account/write";
	}
}
