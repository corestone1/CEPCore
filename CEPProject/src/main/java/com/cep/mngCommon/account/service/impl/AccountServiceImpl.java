/**
 * 
 */
package com.cep.mngCommon.account.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.mngCommon.account.service.AccountService;
import com.cep.mngCommon.account.vo.AccountDepositVO;
import com.cep.mngCommon.account.vo.AccountDirectorVO;
import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngCommon.account.vo.AccountVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.service.ComService;
import com.cmm.util.CepStringUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

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
	
	@Resource(name="comService")
	private ComService comService;
	
	
	@Override
	public List<AccountVO> selectAccountList(AccountSearchVO searchVO) throws Exception {
		return mapper.selectAccountList(searchVO);
	}
	
	@Override
	public Map<String, Object> selectAcBusiNum(AccountVO accountVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			int result = mapper.isExist(accountVO);
			returnMap.put("acCount", result);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	@Override
	public AccountVO selectAccountDetail(AccountSearchVO searchVO) throws Exception {
		return mapper.selectAccountDetail(searchVO);
	}
	
	@Override
	public List<EgovMap> selectAcDirectorList(AccountSearchVO searchVO) throws Exception {
		return mapper.selectDirectorList(searchVO);
	}
	
	@Override
	public List<EgovMap> selectAcDepositList(AccountSearchVO searchVO) throws Exception {
		return mapper.selectAcDepositList(searchVO);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> insertAccountInfo(HttpServletRequest request, AccountVO accountVO) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		List<AccountVO> insertList = new ArrayList<>();
		List<AccountVO> updateList = new ArrayList<>();
		
		accountVO.setRegEmpKey(session.get("empKey"));
		accountVO.setModEmpKey(session.get("empKey"));
		
		/*List<AccountDirectorVO> insertDirecList = new ArrayList<>();
		List<AccountDirectorVO> updateDirecList = new ArrayList<>();
		List<AccountDepositVO> insertDepoList = new ArrayList<>();
		List<AccountDepositVO> updateDepoList = new ArrayList<>();*/
		
		try {
			if(mapper.isExist(accountVO) != 0) {
				// 수정
				mapper.updateAccountInfo(accountVO);
				
				
				if(!"[]".equals(CepStringUtil.getDefaultValue(accountVO.getAccountDirectorVO(), "[]"))) {
					for(int i = 0; i < accountVO.getAccountDirectorVO().size(); i++) {
						if(CepStringUtil.getDefaultValue(accountVO.getAccountDirectorVO().get(i).getAcDirectorKey(), "0").equals("0")) {
							insertList.add(accountVO.getAccountDirectorVO().get(i));
						} else if(!CepStringUtil.getDefaultValue(accountVO.getAccountDirectorVO().get(i).getAcDirectorKey(), "0").equals("0")) {
							updateList.add(accountVO.getAccountDirectorVO().get(i));
						}
					}
				}
				
				if(insertList != null && insertList.size() != 0) {
					writeAcDirectorInfo(accountVO.getAcKey(), accountVO.getRegEmpKey(), insertList);
				}
				
				if(updateList != null && updateList.size() != 0) {
					updateAcDirectorInfo(accountVO.getAcKey(), accountVO.getModEmpKey(), updateList);
				}
				
				insertList = new ArrayList<>();
				updateList = new ArrayList<>();
				
				
				if(!"[]".equals(CepStringUtil.getDefaultValue(accountVO.getAccountDepositVO(), "[]"))) {
					for(int i = 0; i < accountVO.getAccountDepositVO().size(); i++) {
						if(CepStringUtil.getDefaultValue(accountVO.getAccountDepositVO().get(i).getAcAdSeq(), "0").equals("0")) {
							insertList.add(accountVO.getAccountDepositVO().get(i));
						} else if(!CepStringUtil.getDefaultValue(accountVO.getAccountDepositVO().get(i).getAcAdSeq(), "0").equals("0")) {
							updateList.add(accountVO.getAccountDepositVO().get(i));
						}
					}
				}
				
				if(insertList != null && insertList.size() != 0) {
					writeAcDepositInfo(accountVO.getAcKey(), accountVO.getRegEmpKey(), insertList);
				}
				
				if(updateList != null && updateList.size() != 0) {
					updateAcDepositInfo(accountVO.getAcKey(), accountVO.getModEmpKey(), updateList);
				}
				
				
				
				if(!"[]".equals(CepStringUtil.getDefaultValue(accountVO.getDeleteDirectorList(), "[]"))) {
					deleteAcDirectorInfo(accountVO.getAcKey(), accountVO.getModEmpKey(), accountVO.getDeleteDirectorList());
				}
				
				if(!"[]".equals(CepStringUtil.getDefaultValue(accountVO.getDeleteDepositList(), "[]"))) {
					deleteAcDepositInfo(accountVO.getAcKey(), accountVO.getModEmpKey(), accountVO.getDeleteDepositList());
				}
				
				
			} else {
				if(CepStringUtil.getDefaultValue(accountVO.getAcKey(), "").equals("")) {
					accountVO.setAcKey("9"+comService.makePrimaryKey(PrimaryKeyType.ACCOUNT));
				}
				
				mapper.insertAccountInfo(accountVO);
				
				if(!"[]".equals(CepStringUtil.getDefaultValue(accountVO.getAccountDirectorVO(), "[]"))) {
					for(int i = 0; i < accountVO.getAccountDirectorVO().size(); i++) {
						if(CepStringUtil.getDefaultValue(accountVO.getAccountDirectorVO().get(i).getAcDirectorKey(), "0").equals("0")) {
							insertList.add(accountVO.getAccountDirectorVO().get(i));
						} else if(!CepStringUtil.getDefaultValue(accountVO.getAccountDirectorVO().get(i).getAcDirectorKey(), "0").equals("0")) {
							updateList.add(accountVO.getAccountDirectorVO().get(i));
						}
					}
				}
				
				if(insertList != null && insertList.size() != 0) {
					writeAcDirectorInfo(accountVO.getAcKey(), accountVO.getRegEmpKey(), insertList);
				}
				
				insertList = new ArrayList<>();
				
				if(!"[]".equals(CepStringUtil.getDefaultValue(accountVO.getAccountDepositVO(), "[]"))) {
					for(int i = 0; i < accountVO.getAccountDepositVO().size(); i++) {
						if(CepStringUtil.getDefaultValue(accountVO.getAccountDepositVO().get(i).getAcAdSeq(), "0").equals("0")) {
							insertList.add(accountVO.getAccountDepositVO().get(i));
						} else if(!CepStringUtil.getDefaultValue(accountVO.getAccountDepositVO().get(i).getAcAdSeq(), "0").equals("0")) {
							updateList.add(accountVO.getAccountDepositVO().get(i));
						}
					}
				}
				
				if(insertList != null && insertList.size() != 0) {
					writeAcDepositInfo(accountVO.getAcKey(), accountVO.getRegEmpKey(), insertList);
				}
				
			}
			
			returnMap.put("successYN", "Y");
			returnMap.put("acKey", accountVO.getAcKey());
		} catch(Exception e) {
			returnMap.put("successYN", "N");
			throw new Exception(e);
		}
		
		return returnMap;
	}
	
	private void writeAcDirectorInfo(String acKey, String regEmpKey, List<?> insertDirecList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new Hashtable<>();
			
			insertParam.put("acKey", acKey);
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("accountDirectorVO", insertDirecList);
			mapper.insertAcDirectorInfo(insertParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	private void updateAcDirectorInfo(String acKey, String modEmpKey, List<?> updateDirecList) throws Exception {
		Map<String, Object> updateParam = null;
		try {
			updateParam = new Hashtable<>();
			
			updateParam.put("acKey", acKey);
			updateParam.put("modEmpKey", modEmpKey);
			updateParam.put("accountDirectorVO", updateDirecList);
			mapper.updateAcDirectorInfo(updateParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	private void deleteAcDirectorInfo(String acKey, String modEmpKey, String deleteDirectorKey) throws Exception {
		Map<String, Object> updateParam = null;
		List<String> deleteDirectorList = new ArrayList<String>();
		String[] deleteArray = deleteDirectorKey.split(";");
		
		for(int i = 0; i < deleteArray.length; i++) {
			deleteDirectorList.add(deleteArray[i]);
		}
		
		try {
			updateParam = new Hashtable<>();
			
			updateParam.put("acKey", acKey);
			updateParam.put("modEmpKey", modEmpKey);
			
			updateParam.put("deleteDirectorList", deleteDirectorList);
			mapper.deleteAcDirectorInfo(updateParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	private void writeAcDepositInfo(String acKey, String regEmpKey, List<?> insertDepoList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new Hashtable<>();
			
			insertParam.put("acKey", acKey);
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("accountDepositVO", insertDepoList);
			mapper.insertAcDepositInfo(insertParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	private void updateAcDepositInfo(String acKey, String modEmpKey, List<?> updateDepoList) throws Exception {
		Map<String, Object> updateParam = null;
		try {
			updateParam = new Hashtable<>();
			
			updateParam.put("acKey", acKey);
			updateParam.put("modEmpKey", modEmpKey);
			updateParam.put("accountDepositVO", updateDepoList);
			mapper.updateAcDepositInfo(updateParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	private void deleteAcDepositInfo(String acKey, String modEmpKey, String deleteDepositKey) throws Exception {
		Map<String, Object> updateParam = null;
		List<String> deleteDepositList = new ArrayList<String>();
		String[] deleteArray = deleteDepositKey.split(";");
		
		for(int i = 0; i < deleteArray.length; i++) {
			deleteDepositList.add(deleteArray[i]);
		}
		
		try {
			updateParam = new Hashtable<>();
			
			updateParam.put("acKey", acKey);
			updateParam.put("modEmpKey", modEmpKey);
			
			updateParam.put("deleteDepositList", deleteDepositList);
			mapper.deleteAcDepositInfo(updateParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public void deleteAccountInfo(HttpServletRequest request, AccountVO accountVO) throws Exception {
		HashMap<String, String> session = null;
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		accountVO.setModEmpKey(session.get("empKey"));
		
		mapper.deleteAcDirectorAll(accountVO);
		mapper.deleteAcDepositAll(accountVO);
		mapper.deleteAccountInfo(accountVO);
	}

}
