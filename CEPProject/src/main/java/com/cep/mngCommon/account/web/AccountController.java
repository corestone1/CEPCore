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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.mngCommon.account.service.AccountService;
import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngCommon.account.vo.AccountVO;

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
		List<?> accountList = null;
		try {
			logger.debug("searchVO.getAcBuyYN()   :: {}", searchVO.getAcBuyYN());
			logger.debug("searchVO.getAcSalesYN() :: {}", searchVO.getAcSalesYN());
			logger.debug("searchVO.getAcNm(11)      :: {}", searchVO.getAcNm());
			
			accountList = service.selectAccountList(searchVO);
			model.put("accountList", accountList);
		} catch (Exception e) {
			logger.error("selectAccountListMain :: {}", e);
		}		
		
		return "mngCommon/account/list";
	}
	
	@RequestMapping(value="/isExist.do", method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> checkAcBusiNum(HttpServletRequest request, @RequestBody AccountVO accountVO) throws Exception {
		Map<String, Object> returnMap = null;
		returnMap = service.selectAcBusiNum(accountVO);
		return returnMap;
	}
	
	@RequestMapping(value="/write.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewAddAccountInfo(HttpServletRequest request, AccountSearchVO searchVO, ModelMap model) throws Exception {
		AccountVO accountVO = null;
		List<?> acDirectorList = null;
		List<?> acDepositList = null;
		
		try {
			accountVO = service.selectAccountDetail(searchVO);
			acDirectorList = service.selectAcDirectorList(searchVO);
			acDepositList = service.selectAcDepositList(searchVO);
			
			model.put("accountVO", accountVO);
			model.put("acDirectorList", acDirectorList);
			model.put("acDepositList", acDepositList);
		} catch (Exception e) {
			logger.error("viewAddAccountInfo :: {}", e);
		}
		
		return "mngCommon/account/write";
	}
	
	@RequestMapping(value="/insert/accountInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addAccountInfo(HttpServletRequest request, @RequestBody AccountVO accountVO) throws Exception {
		Map<String, Object> returnMap = null;
		returnMap = service.insertAccountInfo(request, accountVO);
		
		return returnMap;
	}
	
	@RequestMapping(value="/detail.do")
	public String selectDetail(HttpServletRequest request, AccountSearchVO searchVO, ModelMap model) throws Exception {
		List<?> accountList = null;
		List<?> acDirectorList = null;
		List<?> acDepositList = null;
		
		try {
			accountList = service.selectAccountList(searchVO);
			acDirectorList = service.selectAcDirectorList(searchVO);
			acDepositList = service.selectAcDepositList(searchVO);
			
			model.put("accountList", accountList);
			model.put("acDirectorList", acDirectorList);
			model.put("acDepositList", acDepositList);
		} catch (Exception e) {
			logger.error("viewAddAccountInfo :: {}", e);
		}
		
		return "mngCommon/account/detail";
	}
}
