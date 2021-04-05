/**
 * 
 */
package com.cep.maintenance.amount.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cep.maintenance.amount.service.MtAmountService;
import com.cep.maintenance.amount.vo.MtPurchaseVO;
import com.cep.maintenance.contract.service.MtContractService;
import com.cep.project.vo.ProjectPurchaseVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.util.CepStringUtil;

/**
 * @File Name : MtAmountServiceImple.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2021. 3. 11.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 3. 11.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
@Service("mtAmountService")
public class MtAmountServiceImple implements MtAmountService {
	
	@Resource(name="mtContractService")
	private MtContractService service;
	
	@Resource(name="mtAmountMapper")
	private MtAmountMapper mtAmountMapper;

	/* (non-Javadoc)
	 * @see com.cep.maintenance.amount.service.MtAmountService#writePurchaseInfo(com.cep.project.vo.ProjectPurchaseVO)
	 */
	@Override
	public String writeMtPurchaseInfo(MtPurchaseVO purchaseVO) throws Exception {
		String mtBuyKey = null; //매입관리키
		
		try {
			mtBuyKey = service.makePrimaryKey(PrimaryKeyType.MAINTENACE_PURCHASE);
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtBuyKey, ""))){
				purchaseVO.setBuyKey(mtBuyKey);
				mtAmountMapper.writeMtPurchaseInfo(purchaseVO);
			} else {
				throw new Exception("Can't make MT_PURCHASE_TB.BUY_KEY !!!! ..");
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return mtBuyKey;
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.amount.service.MtAmountService#updateMtWorkPurchaseInfo(com.cep.project.vo.ProjectPurchaseVO)
	 */
	@Override
	public int updateMtWorkPurchaseInfo(ProjectPurchaseVO purchaseVO) throws Exception {
		int updateCnt = 0;
		try {
			updateCnt = mtAmountMapper.updateMtWorkPurchaseInfo(purchaseVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return updateCnt;
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.amount.service.MtAmountService#deleteMtWorkOrderPurchaseInfo(java.util.Map)
	 */
	@Override
	public int deleteMtWorkOrderPurchaseInfo(Map<String, Object> deleteParam) throws Exception {
		int deleteCnt = 0;
		try {
			deleteCnt = mtAmountMapper.deleteMtWorkOrderPurchaseInfo(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return deleteCnt;
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.amount.service.MtAmountService#deleteMtWorkPurchaseInfoAll(java.util.Map)
	 */
	@Override
	public int deleteMtWorkPurchaseInfoAll(Map<String, Object> deleteParam) throws Exception {
		int deleteCnt = 0;
		try {
			deleteCnt = mtAmountMapper.deleteMtWorkPurchaseInfoAll(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return deleteCnt;
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.amount.service.MtAmountService#selectMtPurchaseInfoList(com.cep.project.vo.ProjectPurchaseVO)
	 */
	@Override
	public List<ProjectPurchaseVO> selectMtPurchaseInfoList(ProjectPurchaseVO purchaseVO) throws Exception {
		List<ProjectPurchaseVO> purchaseInfoList = null;
		try {
			purchaseInfoList = mtAmountMapper.selectMtPurchaseInfoList(purchaseVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return purchaseInfoList;
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.amount.service.MtAmountService#selectMtDonePaymetAmount(com.cep.project.vo.ProjectPurchaseVO)
	 */
	@Override
	public int selectMtDonePaymentAmount(ProjectPurchaseVO purchaseVO) throws Exception {
		int donePaymentAmount = 0;
		try {
			donePaymentAmount = mtAmountMapper.selectMtDonePaymentAmount(purchaseVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return donePaymentAmount;
	}

}
