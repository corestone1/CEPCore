package com.cep.maintenance.work.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.maintenance.amount.service.MtAmountService;
import com.cep.maintenance.amount.vo.MtPurchaseVO;
import com.cep.maintenance.contract.service.MtContractService;
import com.cep.maintenance.contract.service.impl.MtContractMapper;
import com.cep.maintenance.contract.vo.MtBackOrderProductVO;
import com.cep.maintenance.contract.vo.MtBackOrderVO;
import com.cep.maintenance.contract.vo.MtBuyAmountListVO;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.work.service.MtWorkService;
import com.cep.maintenance.work.vo.MtOrderProductVO;
import com.cep.maintenance.work.vo.MtOrderVO;
import com.cep.maintenance.work.vo.MtWorkProductVO;
import com.cep.maintenance.work.vo.MtWorkVO;
import com.cep.project.vo.ProjectPurchaseVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.util.CepStringUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;



@Service("mtWorkService")
public class MtWorkServiceImpl implements MtWorkService {
	
	@Resource(name="mtContractService")
	private MtContractService service;
	
	@Resource(name="mtAmountService")
	private MtAmountService amountService;
	
	private static final Logger logger = LoggerFactory.getLogger(MtWorkServiceImpl.class);
	
	@Resource(name="mtWorkMapper")
	private MtWorkMapper mtwMapper;
	
	@Resource(name="mtContractMapper")
	private MtContractMapper mtMapper;

	/* (non-Javadoc) 
	 * @see com.cep.maintenance.service.MaintenanceService#selectMtWorkList(com.cep.maintenance.vo.MaintenanceDefaultVO)
	 */
	@Override
	public List<MtWorkVO> selectMtWorkList(MtDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mtwMapper.selectWorkList(searchVO);
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#deleteMtWork(java.lang.String)
	 */
	@Override
	@Transactional
	public void deleteMtWork(MtWorkVO deleteVo) throws Exception {
		try {
			//유지보수작업 제품정보 삭제
			mtwMapper.deleteWorkProductAll(deleteVo);
			//유지보수작업 발주삭제
			
			//유지보수 기본정보 삭제
			mtwMapper.deleteMtWork(deleteVo);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#writeWorkBasic(com.cep.maintenance.vo.MtWorkVO)
	 */
	@Override
	public String writeWorkBasic(MtWorkVO mtWorkVO) throws Exception {
		
		String mtWorkKey = null;
		try {
			mtWorkKey = service.makePrimaryKey(PrimaryKeyType.MAINTENACE_WORK);
			
			mtWorkVO.setMtWorkKey(mtWorkKey);
			
			
			mtwMapper.writeWorkBasic(mtWorkVO);
			
		} catch (Exception e) {
			mtWorkKey = null;
			throw new Exception(e);
		}
		return mtWorkKey;
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#selectWorkDetail(java.lang.String)
	 */
	@Override
	public MtWorkVO selectWorkDetail(String mtWorkKey) throws Exception {
		// TODO Auto-generated method stub
		return mtwMapper.selectWorkDetail(mtWorkKey);
	}
	

	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#mtWorkAuthInfo(java.lang.String)
	 */
	@Override
	public MtWorkVO mtWorkAuthInfo(String mtWorkKey) throws Exception {
		// TODO Auto-generated method stub
		return mtwMapper.mtWorkAuthInfo(mtWorkKey);
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#updateWorkBasic(com.cep.maintenance.work.vo.MtWorkVO)
	 */
	@Override
	public void updateWorkBasic(MtWorkVO mtWorkVO) throws Exception {
		mtwMapper.updateWorkBasic(mtWorkVO);
		
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#writeWorkProductList(com.cep.maintenance.work.vo.MtWorkProductVO)
	 */
	@Override
	@Transactional
	public void writeWorkProductList(MtWorkProductVO mtWorkProductVO) throws Exception {
		
		String[] deleteKeyList = null;

		List<MtWorkProductVO> insertList = null;
		List<MtWorkProductVO> updateList = null;
		int listCnt = 0;
		MtWorkProductVO productVO = null;
		
		try {
			logger.debug("mtWorkProductVO.getRowNum()========>"+mtWorkProductVO.getRowNum());
			if(mtWorkProductVO.getRowNum()>0) {
				//수정
				/*신규제품과 업데이트 제품을 분리한다.*/
				logger.debug("mtWorkProductVO.getRowNum()========>"+mtWorkProductVO.getRowNum());
				if(null != mtWorkProductVO.getMtWorkProductVoList() && mtWorkProductVO.getMtWorkProductVoList().size() >0) {
					listCnt = mtWorkProductVO.getMtWorkProductVoList().size();
					insertList = new ArrayList<>();
					updateList = new ArrayList<>();
					for (int i = 0; i < listCnt; i++) {
						productVO = mtWorkProductVO.getMtWorkProductVoList().get(i);
						if(!"0".equals(CepStringUtil.getDefaultValue(productVO.getMtWorkSeq(), "0"))) {
							// 업데이트 대상
							updateList.add(productVO);
						} else {
							//신규등록대상
							insertList.add(productVO);
						}
					}
				} // 분리작업 완료
				
				// 삭제목록 추출
				if(!"".equals(CepStringUtil.getDefaultValue(mtWorkProductVO.getDeleteListKeys(), ""))) {
					deleteKeyList = mtWorkProductVO.getDeleteListKeys().split(":");
				}
				logger.debug("insert cnt("+insertList.size()+"), update cnt("+updateList.size()+"), delete cnt("+mtWorkProductVO.getDeleteListKeys()+")....");
				//1. 제품삭제
				if(null != deleteKeyList && deleteKeyList.length>0) {
					deleteWorkProductList(mtWorkProductVO.getModEmpKey(), mtWorkProductVO.getMtWorkKey(), deleteKeyList);
				}
				
				//2. 신규제품 등록
				if(null != insertList && insertList.size()>0) {
					writeProductList(mtWorkProductVO.getMtWorkKey(), mtWorkProductVO.getRegEmpKey(), insertList);
				}
				
				//3. 제품업데이트
				if(null != updateList && updateList.size()>0) {
					updateProductList(mtWorkProductVO.getMtWorkKey(), mtWorkProductVO.getModEmpKey(), updateList);
				}
				
			} else {
				//신규등록
				writeProductList(mtWorkProductVO.getMtWorkKey(), mtWorkProductVO.getRegEmpKey(), mtWorkProductVO.getMtWorkProductVoList());
			}
		} catch (Exception e) {
			throw new Exception(e);
		}	
		
	}
	
	private void writeProductList(String mtWorkKey, String regEmpKey, List<MtWorkProductVO> insertList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new HashMap<>();
			insertParam.put("mtWorkKey", mtWorkKey);
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("mtWorkProductVoList", insertList);
			

			mtwMapper.writeWorkProductList(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	private void updateProductList(String mtWorkKey, String modEmpKey, List<MtWorkProductVO> updateList) throws Exception {
		Map<String, Object> updateParam = null;
		try {
			updateParam = new HashMap<>();
			updateParam.put("mtWorkKey", mtWorkKey);
			updateParam.put("modEmpKey", modEmpKey);
			updateParam.put("mtWorkProductVoList", updateList);
			

			mtwMapper.updateWorkProductList(updateParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	public void deleteWorkProductList(String modEmpKey, String mtWorkKey, String[] deleteKeyList) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("mtWorkKey", mtWorkKey);
			deleteParam.put("deleteKeyList", deleteKeyList);
			mtwMapper.deleteWorkProductList(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}	
	}
	
	@Override
	public void deleteWorkProductAll(String modEmpKey, String mtWorkKey)throws Exception {
//		Map<String, Object> deleteParam = null;
		MtWorkVO deleteVo = null;
		try {
			if(!"".equals(CepStringUtil.getDefaultValue(modEmpKey, "")) && !"".equals(CepStringUtil.getDefaultValue(modEmpKey, ""))) {
				deleteVo = new MtWorkVO();
				deleteVo.setModEmpKey(modEmpKey);
				deleteVo.setMtWorkKey(mtWorkKey);
				mtwMapper.deleteWorkProductAll(deleteVo);
			}
//			deleteParam = new HashMap<>();
//			deleteParam.put("modEmpKey", modEmpKey);
//			deleteParam.put("mtWorkKey", mtWorkKey);
//			mtwMapper.deleteWorkProductAll(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}	
	}

	
	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#selectWorkProductList(java.lang.String)
	 */
	@Override
	public List<MtWorkProductVO> selectWorkProductList(String mtWorkKey) throws Exception {
		// TODO Auto-generated method stub
		return mtwMapper.selectWorkProductList(mtWorkKey);
	}
	
	/* ============================== 유지보수작업 발주  ======================================*/

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#writeMtWorkOrder(com.cep.maintenance.work.vo.MtOrderVO)
	 */
	@Override
	@Transactional
	public String writeMtWorkOrder(MtOrderVO mtOrderVO) throws Exception {
		String[] deleteKeyList = null;
		List<MtOrderProductVO> insertList = null;
		List<MtOrderProductVO> updateList = null;
		int productListCnt = 0;
		MtOrderProductVO productVO = null;
		
		String mtOrderKey = null;
//		MtBuyAmountListVO mtBuyAmountListVO = null;
//		MtPurchaseVO purchaseVO = null;
		ProjectPurchaseVO projectPurchaseVO = null;
		List<ProjectPurchaseVO> checkPurchaseVOList = null;
		ProjectPurchaseVO checkPurchaseVO = null;
		int updateCnt=0;
		double vatValue = 0;
		double orderAmountWithTax=0;
		int orderAmountWithOutTax=0;
		try {
			if("".equals(mtOrderVO.getMtOrderKey())){
				// 해당 내용 신규등록
				mtOrderKey = writeMtWorkOrderWithProduct(mtOrderVO);
				
				
				//신규생성시에는 무조건 발주 매입정보를 생성한다.
//				purchaseVO = new MtPurchaseVO();
//				purchaseVO.setBuyFkPjKey(mtOrderVO.getOrderCtFkKey()); //유지보수 작업관리키
//				purchaseVO.setBuyOrderFkKey(mtOrderKey); //발주관리키
//				if("N".equalsIgnoreCase(mtOrderVO.getTaxYn())) {
//					//부가세 제외 금액인 경우 해당 금액을 그대로 넣어준다.
//					purchaseVO.setBuyAmount(mtOrderVO.getOrderAmount()); //발주금액
//					purchaseVO.setYetPaymentAmount(mtOrderVO.getOrderAmount()); //미지금금액
//				} else {
//					/*
//					 * 부가세 포함인 경우 해당 금액에서 부가세를 제외하는 로직을 구현한다.
//					 * 부가세 = Math.round((orderAmount/1.1)*0.1)
//					 * 부가세 제외 금액 = orderAmount-부가세
//					 */
//					orderAmountWithTax = mtOrderVO.getOrderAmount();
//					vatValue = Math.round((orderAmountWithTax/1.1)*0.1);
//					orderAmountWithOutTax = (int)Math.round(orderAmountWithTax-vatValue);
//
//					purchaseVO.setBuyAmount(orderAmountWithOutTax); //발주금액
//					purchaseVO.setYetPaymentAmount(orderAmountWithOutTax); //미지금금액
//				}
//				
//				purchaseVO.setBuyTurn(1);
//				purchaseVO.setRegEmpKey(mtOrderVO.getRegEmpKey());
//				purchaseVO.setFkPjKeyType(MtPurchaseVO.MT_WORK_FK_TYPE);//유지보수 작업 발주.				
//				amountService.writeMtPurchaseInfo(purchaseVO);
			} else {
				/*해당 내용 업데이트*/
				
				mtOrderKey= mtOrderVO.getMtOrderKey();
				
				/*신규제품과 업데이트 제품을 분리한다.*/
				if(null !=mtOrderVO.getMtOrderProductVoList() && mtOrderVO.getMtOrderProductVoList().size()>0){
					productListCnt = mtOrderVO.getMtOrderProductVoList().size();
					insertList = new ArrayList<>();
					updateList = new ArrayList<>();
					for (int i = 0; i < productListCnt; i++) {
						productVO = mtOrderVO.getMtOrderProductVoList().get(i);
						if(!"0".equals(CepStringUtil.getDefaultValue(productVO.getOrderSeq(), "0"))){
							// 업데이트 대상
							updateList.add(productVO);
//							logger.debug("update productVO.getOrderSeq()===>"+productVO.getOrderSeq());
						} else {
							// 신규등록대상
							insertList.add(productVO);
//							logger.debug("insert productVO.getOrderSeq()===>"+productVO.getOrderSeq());
						}
					}
				}

				//1. 발주 제품목록 삭제.
				if(!"".equals(CepStringUtil.getDefaultValue(mtOrderVO.getDeleteListKeys(), ""))) {
					deleteKeyList = mtOrderVO.getDeleteListKeys().split(":");
				}
				
				//logger.debug("mtBackOrderVO.getDeleteListKeys()===>"+mtBackOrderVO.getDeleteListKeys()+"/"+deleteKeyList);
				if(null != deleteKeyList && deleteKeyList.length>0) {
					deleteWorkOrderProductList(mtOrderVO.getModEmpKey(), deleteKeyList);
				}
				
				//2. 발주  신규 제품 등록
				if(null != insertList && insertList.size()>0) {
					writeOrderProductList(mtOrderVO.getMtOrderKey()
							, mtOrderVO.getRegEmpKey()
							, insertList);
				}
				
				//3. 발주 제품 업데이트
				if(null != updateList && updateList.size()>0) {
					updateWorkOrderProductList(mtOrderVO.getMtOrderKey(), mtOrderVO.getModEmpKey(), updateList);
				}
				//4. 발주 메인정보 업데이트
				updateWorkOrderMain(mtOrderVO);
				
				//5.매입정보 업데이트
				
				projectPurchaseVO = new ProjectPurchaseVO();
				projectPurchaseVO.setBuyOrderFkKey(mtOrderVO.getMtOrderKey()); //발주관리키
				
				checkPurchaseVOList = amountService.selectMtPurchaseInfoList(projectPurchaseVO) ;
				if(null !=checkPurchaseVOList && checkPurchaseVOList.size()>0 ) {
					checkPurchaseVO = checkPurchaseVOList.get(0);
					if("N".equalsIgnoreCase(mtOrderVO.getTaxYn())) {
						//부가세 제외 금액인 경우 해당 금액을 그대로 넣어준다.
						orderAmountWithOutTax = mtOrderVO.getOrderAmount();
					} else {
						/*
						 * 부가세 포함인 경우 해당 금액에서 부가세를 제외하는 로직을 구현한다.
						 * 부가세 = Math.round((orderAmount/1.1)*0.1)
						 * 부가세 제외 금액 = orderAmount-부가세
						 */
						orderAmountWithTax = mtOrderVO.getOrderAmount();
						vatValue = Math.round((orderAmountWithTax/1.1)*0.1);
						orderAmountWithOutTax = (int)Math.round(orderAmountWithTax-vatValue);

					}
					
					if(checkPurchaseVO.getBuyAmount() != orderAmountWithOutTax ) {
						//금액이 다른경우 업데이트 수행.
						if(checkPurchaseVO.getDonePaymentAmount()==0) {
							projectPurchaseVO.setBuyAmount(orderAmountWithOutTax); //발주금액
							projectPurchaseVO.setYetPaymentAmount(orderAmountWithOutTax); //미지금금액
							projectPurchaseVO.setModEmpKey(mtOrderVO.getModEmpKey());			
//							updateCnt = amountService.updateMtWorkPurchaseInfo(projectPurchaseVO);
//							if(updateCnt<=0) {
//								throw new Exception("Can't update MT_PURCHASE_TB table please check.(BUY_ORDER_FK_KEY:"+mtOrderVO.getMtOrderKey()+")");
//							}
						} else {
							throw new Exception("Can't update MT_PURCHASE_TB table because  DONE_PAYMENT_AMOUNT("+checkPurchaseVO.getDonePaymentAmount()+") is greater than zero.(BUY_ORDER_FK_KEY:"+mtOrderVO.getMtOrderKey()+")");
						}
						
					}
				}
				
//				if("Y".equalsIgnoreCase(CepStringUtil.getDefaultValue(mtOrderVO.getUpdateYn(), "N"))) {
//					//5. 발주업데이트 시 매입정보 업데이트 부분 로직구현해야함.
//				}
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		return mtOrderKey;
	}
	
	/**
	 * 
	  * @Method Name : writeMtWorkOrderWithProduct
	  * @Cdate       : 2021. 3. 11.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 발주를 등록한다(발주 메인 + 발주품목리스트)
	  * @param mtOrderVO
	  * @return
	  * @throws Exception
	 */
	private String writeMtWorkOrderWithProduct(MtOrderVO mtOrderVO) throws Exception {
		
		String mtOrderKey = null;
		Map<String, Object> insertParam = null;
		try {
			
			//1. 유지보수 발주 키를 생성한다.
			mtOrderKey = service.makePrimaryKey(PrimaryKeyType.MAINTENACE_ORDER);
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtOrderKey, ""))){
				mtOrderVO.setMtOrderKey(mtOrderKey);
				
				//2. 유지보수 발주 메인을 등록한다.
				mtwMapper.writeMtWorkOrder(mtOrderVO);
				
				insertParam = new HashMap<>();

				insertParam.put("mtOrderKey", mtOrderKey);
				insertParam.put("regEmpKey", mtOrderVO.getRegEmpKey());
				insertParam.put("mtOrderProductVoList", mtOrderVO.getMtOrderProductVoList());
				
				//3. 유지보수 발주 제품목록을 등록한다.
				mtwMapper.writeMtWorkOrderProductList(insertParam);
				
			} else {
				throw new Exception("Can't make MT_ORDER_TB.MT_ORDER_KEY !!!! ..");
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		return mtOrderKey;
	}
	
	private void deleteWorkOrderProductList(String modEmpKey, String[] deleteKeyList ) throws Exception{
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("deleteKeyList", deleteKeyList);
			mtwMapper.deleteWorkOrderProductList(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}		
	}

	private void writeOrderProductList(String mtOrderKey
			, String regEmpKey
			, List<MtOrderProductVO> insertList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new HashMap<>();

			insertParam.put("mtOrderKey", mtOrderKey);
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("mtOrderProductVoList", insertList);
			//백계약 제품목록을 등록한다.
			mtwMapper.writeMtWorkOrderProductList(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	private void updateWorkOrderProductList(String mtOrderKey, String modEmpKey
			, List<MtOrderProductVO> updateList) throws Exception {
		Map<String, Object> updateParam = null;
		try {
			updateParam = new HashMap<>();

			updateParam.put("modEmpKey", modEmpKey);
			updateParam.put("mtOrderKey", mtOrderKey);
			updateParam.put("mtOrderProductVoList", updateList);
			//백계약 제품내용을 수정한다.
			mtwMapper.updateWorkOrderProductList(updateParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
//		return checkFlag;
	}
	/**
	 * 
	  * @Method Name : updateWorkOrderMain
	  * @Cdate       : 2021. 3. 11.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 발주 메인정보 수정
	  * @param mtOrderVO
	  * @throws Exception
	 */
	private void updateWorkOrderMain(MtOrderVO mtOrderVO) throws Exception {
		mtwMapper.updateWorkOrder(mtOrderVO);
	}
	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#selectWorkOrderSelectBoxList(java.lang.String)
	 */
	@Override
	public List<EgovMap> selectWorkOrderSelectBoxList(String orderCtFkKey) throws Exception {
		// TODO Auto-generated method stub
		return mtwMapper.selectWorkOrderSelectBoxList(orderCtFkKey);
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#selectWorkOrderDetail(java.lang.String)
	 */
	@Override
	public MtOrderVO selectWorkOrderDetail(String mtOrderKey) throws Exception {
		MtOrderVO vo = null;
		List<MtOrderProductVO> productList = null;
		try {
			vo = mtwMapper.selectWorkOrderDetail(mtOrderKey);
			if(null != vo) {
				productList = selectWorkOrderProductList(mtOrderKey);
				if(null != productList) {
					vo.setMtOrderProductVoList(productList);
				}
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return vo;
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#selectWorkOrderList(java.util.Map)
	 */
	@Override
	public List<MtOrderVO> selectWorkOrderList(Map<String, Object> searchParam) throws Exception {
		// TODO Auto-generated method stub
		return mtwMapper.selectWorkOrderList(searchParam);
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#selectWorkOrderProductList(java.lang.String)
	 */
	@Override
	public List<MtOrderProductVO> selectWorkOrderProductList(String mtOrderKey) throws Exception {
		// TODO Auto-generated method stub
		return mtwMapper.selectWorkOrderProductList(mtOrderKey);
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#deleteWorkOrder(java.lang.String, java.lang.String)
	 */
	@Override
	@Transactional
	public void deleteWorkOrder(String modEmpKey, String mtOrderKey) throws Exception {
		Map<String, Object> deleteParam = null;
		int updateCnt = 0;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("mtOrderKey", mtOrderKey);
			deleteParam.put("buyOrderFkKey", mtOrderKey);
//			1. 매입정보 삭제		
			updateCnt = amountService.deleteMtWorkOrderPurchaseInfo(deleteParam);
			if(updateCnt>0) {
//				2. 유지보수작업 발주 제품목록 삭제.						
				mtwMapper.deleteWorkOrderProduct(deleteParam);
				
//				3. 유지보수작업 발주 메인 삭제.
				mtwMapper.deleteWorkOrder(deleteParam);
			} else {
				throw new Exception("Can't delete MT_PURCHASE_TB table please check.(BUY_ORDER_FK_KEY:"+mtOrderKey+")");
			}
		
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#updateWorkOrder(com.cep.maintenance.work.vo.MtOrderVO)
	 */
//	@Override
//	@Transactional
//	public void updateWorkOrder(MtOrderVO mtOrderVO) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}

	
	

	
}
