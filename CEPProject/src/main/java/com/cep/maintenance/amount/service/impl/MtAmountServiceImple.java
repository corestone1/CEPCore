/**
 * 
 */
package com.cep.maintenance.amount.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.maintenance.amount.service.MtAmountService;
import com.cep.maintenance.amount.vo.MtPaymentPlanVO;
import com.cep.maintenance.amount.vo.MtPurchaseVO;
import com.cep.maintenance.amount.vo.MtSalesPlanVO;
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
			mtBuyKey = service.makePrimaryKey(PrimaryKeyType.MAINTENACE_PAYMENT);
			
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
//////////////////////////////////// 유지보수 매출 수금계획 /////////////////////////////////////////////
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.amount.service.MtAmountService#requestMtSalesPlanList(com.cep.maintenance.amount.vo.MtSalesPlanVO)
	 */
	@Override
	@Transactional
	public void requestMtSalesPlanList(MtSalesPlanVO mtSalesPlanVO) throws Exception {
		List<MtSalesPlanVO> insertList = null;
		List<MtSalesPlanVO> updateList = null;
		int salesPlanCnt = mtSalesPlanVO.getMtSalesPlanVoList().size();
		
		MtSalesPlanVO checkSalesPlanVO = null;
		Map<String, Object> insertParam = null;
		Map<String, Object> updateParam = null;
		
		MtSalesPlanVO deletePalnVo = new MtSalesPlanVO();
		
		/*
		 * 1.등록데이타와 수정데이타 분리
		 * 2.등록데이타 pk생성
		 * 3.mtSalesPlanVO.getMtIntegrateKey() 기준으로 삭제 flag처리.
		 * 3.등록데이타 등록
		 * 4.수정데이타 업데이트
		 */
		try {
			insertList = new ArrayList<>();
			updateList = new ArrayList<>();
			for (int i = 0; i < salesPlanCnt; i++) {
				checkSalesPlanVO = mtSalesPlanVO.getMtSalesPlanVoList().get(i);
				checkSalesPlanVO.setMtSalesOrderKey(mtSalesPlanVO.getMtSalesOrderKey());
				if("".equals(CepStringUtil.getDefaultValue(checkSalesPlanVO.getSalesKey(), ""))) {
					//등록 데이타.
					insertList.add(checkSalesPlanVO);
				} else {
					//업데이트 데이타.
					updateList.add(checkSalesPlanVO);
				}					
			}
			
//			deletePalnVo.setMtIntegrateKey(mtSalesPlanVO.getMtIntegrateKey());
			deletePalnVo.setSalesCtFkKey(mtSalesPlanVO.getMtIntegrateKey());
			deletePalnVo.setMtSalesOrderKey(mtSalesPlanVO.getMtSalesOrderKey());
			deleteMtSalesPlan(deletePalnVo);
			
			if(insertList.size()>0) {
				insertParam = new HashMap<>();
				insertParam.put("mtSalesPlanVoList", insertList);	
				insertParam.put("regEmpKey", mtSalesPlanVO.getRegEmpKey());
				
				writeMtSalesPlanList(insertParam);
			}
			
			if(updateList.size()>0) {
				updateParam = new HashMap<>();
				updateParam.put("mtSalesPlanVoList", updateList);	
				updateParam.put("modEmpKey", mtSalesPlanVO.getModEmpKey());
				
				updateMtSalesPlanList(updateParam);
			}
			
			//계산서 계획정보 등록(or 수정)시 MT_CONTRACT_TB.BILL_ISSUE_RULE정보를 업데이트 한다.
			mtAmountMapper.updateBillIssueRule(mtSalesPlanVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	public void writeMtSalesPlanList(Map<String, Object> insertParam) throws Exception {
		List<MtSalesPlanVO> salesPlanVoList = null;
		
		try {
			salesPlanVoList = (List<MtSalesPlanVO>)insertParam.get("mtSalesPlanVoList");
			if(null != salesPlanVoList && salesPlanVoList.size()>0) {
				//유지보수 매출 수금계획 PK를 생성한다.
				salesPlanVoList = makeSalesPlanPkey(salesPlanVoList);
				//PK값이 셋팅된 list를 다시 insertParam에 넣는다.
				insertParam.put("mtSalesPlanVoList", salesPlanVoList);
				mtAmountMapper.writeMtSalesPlanList(insertParam);
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	private List<MtSalesPlanVO> makeSalesPlanPkey(List<MtSalesPlanVO> salesPlanVoList) throws Exception{
		List<MtSalesPlanVO> planVoList = new ArrayList<MtSalesPlanVO>();
		MtSalesPlanVO salesPlanVO = null;
		int planCnt = 0;
		try {
			planCnt = salesPlanVoList.size();
			for (int i = 0; i < planCnt; i++) {
				salesPlanVO = salesPlanVoList.get(i);
				salesPlanVO.setSalesKey(service.makePrimaryKey(PrimaryKeyType.MAINTENACE_SALES_PLAN));
				planVoList.add(salesPlanVO);
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return planVoList;
	}
	@Override
	public void updateMtSalesPlanList(Map<String, Object> updateParam) throws Exception {
		try {
			mtAmountMapper.updateMtSalesPlanList(updateParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	public List<MtSalesPlanVO> selectMtSalesPlanList(MtSalesPlanVO salesPlanVO) throws Exception {
		List<MtSalesPlanVO> salesPlanVoList = null;
		try {
			salesPlanVoList= mtAmountMapper.selectMtSalesPlanList(salesPlanVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return salesPlanVoList;
	}

	@Override
	public void deleteMtSalesPlan(MtSalesPlanVO salesPlanVO) throws Exception {
		try {
			mtAmountMapper.deleteMtSalesPlan(salesPlanVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	public List<MtPaymentPlanVO> selectMtPaymentPlanList(MtPaymentPlanVO mtPaymentPlanVO) throws Exception {
		List<MtPaymentPlanVO> paymentPlanVoList = null;
		try {
			paymentPlanVoList= mtAmountMapper.selectMtPaymentPlanList(mtPaymentPlanVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return paymentPlanVoList;
	}

	@Override
	@Transactional
	public void writeMtPaymentPlanList(MtPaymentPlanVO mtPaymentPlanVO) throws Exception {
		List<MtPaymentPlanVO> insertList = null;
		List<MtPaymentPlanVO> updateList = null;
		int paymentPlanCnt = mtPaymentPlanVO.getMtPaymentPlanVOList().size();
		
		MtPaymentPlanVO checkPaymentPlanVO = null;
		Map<String, Object> insertParam = null;
		Map<String, Object> updateParam = null;
		
		MtPaymentPlanVO deletePalnVo = new MtPaymentPlanVO();
		
		/*
		 * 1.등록데이타와 수정데이타 분리
		 * 2.등록데이타 pk생성
		 * 3.checkPaymentPlanVO.getMtIntegrateKey()와  
		 *   checkPaymentPlanVO.getMtOrderKey() 기준으로 삭제 flag처리. 
		 * 3.등록데이타 등록
		 * 4.수정데이타 업데이트
		 */
		try {
			insertList = new ArrayList<>();
			updateList = new ArrayList<>();
			for (int i = 0; i < paymentPlanCnt; i++) {
				checkPaymentPlanVO = mtPaymentPlanVO.getMtPaymentPlanVOList().get(i);
//				checkPaymentPlanVO.setMtIntegrateKey(mtPaymentPlanVO.getMtIntegrateKey());
				checkPaymentPlanVO.setMtOrderKey(mtPaymentPlanVO.getMtOrderKey());
				if("".equals(CepStringUtil.getDefaultValue(checkPaymentPlanVO.getPaymentKey(), ""))) {
					//등록 데이타.
					insertList.add(checkPaymentPlanVO);
				} else {
					//업데이트 데이타.
					updateList.add(checkPaymentPlanVO);
				}					
			}
			if(updateList.size()>0) {
				deletePalnVo.setMtIntegrateKey(mtPaymentPlanVO.getMtIntegrateKey());
				deletePalnVo.setMtOrderKey(mtPaymentPlanVO.getMtOrderKey());
				deleteMtPaymentPlan(deletePalnVo);
			}
			
			
			if(insertList.size()>0) {
				insertParam = new HashMap<>();
				insertParam.put("mtPaymentPlanVoList", insertList);	
				insertParam.put("regEmpKey", mtPaymentPlanVO.getRegEmpKey());
				
				writeMtPaymentPlanList(insertParam);
			}
			
			if(updateList.size()>0) {
				updateParam = new HashMap<>();
				updateParam.put("mtPaymentPlanVoList", updateList);	
				updateParam.put("modEmpKey", mtPaymentPlanVO.getModEmpKey());
				
				updateMtPaymentPlanList(updateParam);
			}
		
		} catch (Exception e) {
			throw new Exception(e);
		}
	}

	@Override
	public void writeMtPaymentPlanList(Map<String, Object> insertParam) throws Exception {
		List<MtPaymentPlanVO> paymentPlanVoList = null;
		
		try {
			paymentPlanVoList = (List<MtPaymentPlanVO>)insertParam.get("mtPaymentPlanVoList");
			if(null != paymentPlanVoList && paymentPlanVoList.size()>0) {
				//유지보수 매입 지급계획 PK를 생성한다.
				paymentPlanVoList = makePaymentPlanPkey(paymentPlanVoList);
				//PK값이 셋팅된 list를 다시 insertParam에 넣는다.
				insertParam.put("mtPaymentPlanVoList", paymentPlanVoList);
				mtAmountMapper.writeMtPaymentPlanList(insertParam);
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	private List<MtPaymentPlanVO> makePaymentPlanPkey(List<MtPaymentPlanVO> paymentPlanVoList) throws Exception{
		List<MtPaymentPlanVO> planVoList = new ArrayList<MtPaymentPlanVO>();
		MtPaymentPlanVO paymentPlanVO = null;
		int planCnt = 0;
		try {
			planCnt = paymentPlanVoList.size();
			for (int i = 0; i < planCnt; i++) {
				paymentPlanVO = paymentPlanVoList.get(i);
				paymentPlanVO.setPaymentKey(service.makePrimaryKey(PrimaryKeyType.MAINTENACE_PAYMENT_PLAN));
				planVoList.add(paymentPlanVO);
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return planVoList;
	}
	
	@Override
	public void updateMtPaymentPlanList(Map<String, Object> updateParam) throws Exception {
		try {
			mtAmountMapper.updateMtPaymentPlanList(updateParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}
	
	
	public void deleteMtPaymentPlan(MtPaymentPlanVO mtPaymentPlanVO) throws Exception {
		try {
			mtAmountMapper.deleteMtPaymentPlan(mtPaymentPlanVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}
}
