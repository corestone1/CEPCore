package com.cep.maintenance.contract.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.maintenance.contract.service.MtContractService;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.contract.vo.MtSaleAmountListVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.util.CepStringUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

import com.cep.maintenance.contract.vo.MtBackOrderProductVO;
import com.cep.maintenance.contract.vo.MtBackOrderVO;
import com.cep.maintenance.contract.vo.MtBuyAmountListVO;
import com.cep.maintenance.contract.vo.MtBuyAmountVO;
import com.cep.maintenance.contract.vo.MtContractProductVO;
import com.cep.maintenance.contract.vo.MtContractVO;



@Service("mtContractService")
public class MtContractServiceImpl implements MtContractService {
	
	private static final Logger logger = LoggerFactory.getLogger(MtContractServiceImpl.class);
	
	@Resource(name="mtContractMapper")
	private MtContractMapper mtMapper;

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#selectMtList(com.cep.maintenance.contract.vo.MtContractDefaultVO)
	 */
	@Override
	public List<MtContractVO> selectContractList(MtDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mtMapper.selectMtContractList(searchVO);
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#deleteMtContract(com.cep.maintenance.vo.MtContractVO)
	 */
	@Override
	public void deleteContract(MtContractVO deleteVo) throws Exception {
		mtMapper.deleteMtContract(deleteVo);
		
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectMtContractCount(java.lang.String)
	 */
	@Override
	public  Map<String, Object> selectMtContractCount(String mtIntegrateKey)  throws Exception {
		return mtMapper.selectMtContractCount(mtIntegrateKey);
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#writeFirestContractBasic(com.cep.maintenance.vo.MtContractVO)
	 */
	@Override
	public String writeFirestContractBasic(MtContractVO writeVo) throws Exception {
		String mtIntegrateKey = null;
		String mtCtKey = null;
//		Map<Object, Object> contractMap = null;
		try {
			mtIntegrateKey = makePrimaryKey(PrimaryKeyType.MAINTENACE_CONTRACT_ALL);
			mtCtKey = makePrimaryKey(PrimaryKeyType.MAINTENACE_CONTRACT); 
			writeVo.setMtIntegrateKey(mtIntegrateKey);
			writeVo.setMtCtKey(mtCtKey);
			
//			logger.debug("mtIntegrateKey===>"+mtIntegrateKey);
			mtMapper.writeContractBasic(writeVo);
			
		} catch (Exception e) {
			mtIntegrateKey = null;
			throw new Exception(e);
		}
		return mtIntegrateKey;
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#writeContractBasic(com.cep.maintenance.vo.MtContractVO)
	 */
	@Override
	public String writeContractBasic(MtContractVO writeVo) throws Exception {
		String mtIntegrateKey = null;
		try {
			
			mtIntegrateKey = makePrimaryKey(PrimaryKeyType.MAINTENACE_CONTRACT_ALL);
			writeVo.setMtIntegrateKey(mtIntegrateKey);
			writeVo.setMtSeq(0);
			
//			logger.debug("mtIntegrateKey===>"+mtIntegrateKey);
			mtMapper.writeContractBasic(writeVo);
			
		} catch (Exception e) {
			mtIntegrateKey = null;
			throw new Exception(e);
		}
		return mtIntegrateKey;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#updateMtContractBasic(com.cep.maintenance.contract.vo.MtContractVO)
	 */
	@Override
	public void updateMtContractBasic(MtContractVO updateVo) throws Exception {
		mtMapper.updateMtContractBasic(updateVo);
	}
	

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#selectMtContractBasicDetail(java.lang.String)
	 */
	@Override
	public MtContractVO selectContractBasicDetail(String mtIntegrateKey) throws Exception {
		MtContractVO contractBasicInfo = null;
		
		try {
			contractBasicInfo = mtMapper.selectMtBasicDetail(mtIntegrateKey);
		} catch (Exception e) {

			throw new Exception(e);
		}
		return contractBasicInfo;
	}
	


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#writeMtContractProductList(java.util.Map)
	 */
	@Override
	@Transactional
	public void writeMtContractProductList(MtContractProductVO productVO) throws Exception {
		String[] deleteKeyList = null;
		List<MtContractProductVO> insertList = null;
		List<MtContractProductVO> updateList = null;
		int productListCnt = 0;
		MtContractProductVO mtProductVO = null;
		try {
			if(productVO.getRowNum()>0){
				// 수정
				/*신규제품과 업데이트 제품을 분리한다.*/
				if(null != productVO.getMtContractProductVoList() && productVO.getMtContractProductVoList().size()>0) {
					productListCnt = productVO.getMtContractProductVoList().size();
					insertList = new ArrayList<>();
					updateList = new ArrayList<>();
					for (int i = 0; i < productListCnt; i++) {
						mtProductVO = productVO.getMtContractProductVoList().get(i);
						if(!"0".equals(CepStringUtil.getDefaultValue(productVO.getMtPmKey(), "0"))){
							// 업데이트 대상
							updateList.add(mtProductVO);
						} else {
							// 신규등록대상
							insertList.add(mtProductVO);
						}
					}
				}
				
				//1. 제품목록 삭제.
				deleteKeyList = productVO.getDeleteListKeys().split(":");
				if(null != deleteKeyList && deleteKeyList.length>0) {
					deleteMtContractProductList(productVO.getModEmpKey(), deleteKeyList);
				}
				//2.  신규 제품 등록
				if(null != insertList && insertList.size()>0) {
					writeMtProductList(productVO.getMtIntegrateKey()
							, productVO.getRegEmpKey()
							, insertList);
				}
				
				//3. 제품 업데이트
				if(null != updateList && updateList.size()>0) {
					updateMtProductList(productVO.getModEmpKey(), updateList);
				}
			}else {
				//등록
				writeMtProductList(productVO.getMtIntegrateKey(), productVO.getRegEmpKey(), productVO.getMtContractProductVoList());
				
			}
			
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}
	
	/**
	 * 
	  * @Method Name : writeMtProductList
	  * @Cdate       : 2020. 12. 31.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품목록을 등록한다.
	  * @param mtIntegrateKey
	  * @param regEmpKey
	  * @param mtContractProductVoList
	  * @throws Exception
	 */
	private void writeMtProductList(String mtIntegrateKey, String regEmpKey, List<MtContractProductVO> mtContractProductVoList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new Hashtable<>();
			insertParam.put("mtIntegrateKey", mtIntegrateKey);			
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("mtContractProductVoList", mtContractProductVoList);
			
			mtMapper.writeMtContractProductList(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	

	/**
	 * 
	  * @Method Name : updateMtProductList
	  * @Cdate       : 2020. 12. 31.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품목록을 수정한다.
	  * @param modEmpKey
	  * @param mtContractProductVoList
	  * @throws Exception
	 */
	private void updateMtProductList(String modEmpKey, List<MtContractProductVO> mtContractProductVoList) throws Exception {
		Map<String, Object> updateParam = null;
		try {
			updateParam = new Hashtable<>();		
			updateParam.put("modEmpKey", modEmpKey);
			updateParam.put("mtContractProductVoList", mtContractProductVoList);
			
			mtMapper.updateMtContractProductList(updateParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#deleteMtContractProduct(java.lang.String)
	 */
	@Override
	public void deleteMtContractProductList(String modEmpKey, String[] deleteKeyList) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("deleteKeyList", deleteKeyList);
			mtMapper.deleteMtContractProductList(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}		
		
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#deleteMtContractProductAll(java.lang.String)
	 */
	@Override
	public void deleteMtContractProductAll(String modEmpKey, String mtIntegrateKey) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("mtIntegrateKey", mtIntegrateKey);
			mtMapper.deleteMtContractProductAll(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}		
		
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectMtContractProductList(com.cep.maintenance.contract.vo.MtContractDefaultVO)
	 */
	@Override
	public List<?> selectMtContractProductList(MtDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mtMapper.selectMtContractProductList(searchVO);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectMtPmTotalAmount(java.lang.String)
	 */
	@Override
	public int selectMtPmTotalAmount(String mtIntegrateKey) throws Exception {
		return mtMapper.selectMtPmTotalAmount(mtIntegrateKey);
	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#selectAcDirectorList(java.lang.String)
	 */
	@Override
	public List<?> selectAcDirectorList(String acKey) throws Exception {
		// TODO Auto-generated method stub
		return mtMapper.selectAcDirectorList(acKey);
	}
	

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#selectEmployeeList()
	 */
	@Override
	public List<?> selectEmployeeList() throws Exception {
		// TODO Auto-generated method stub
		return mtMapper.selectEmployeeList();
	}
	
	
	
	public String makePrimaryKey(PrimaryKeyType keyType) throws Exception {
		String primaryKey = null;
		try {
			primaryKey = mtMapper.makePrimaryKey(keyType.getValue());
		} catch (Exception e) {
			throw new Exception(e);
		}
		return primaryKey;
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectContractAmountInfo(java.lang.String)
	 */
	@Override
	public Map<String, Object> selectContractAmountInfo(String mtIntegrateKey) throws Exception {
		// TODO Auto-generated method stub
		return mtMapper.selectContractAmountInfo(mtIntegrateKey);
	}


	/* 
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#writeMtContractSalesAmountList(java.lang.String, java.lang.String, java.util.List)
	 */
	@Override
	public void writeMtContractSalesAmountList(MtSaleAmountListVO mtSalesAmountVO) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new Hashtable<>();

			insertParam.put("mtIntegrateKey", mtSalesAmountVO.getMtIntegrateKey());
			insertParam.put("regEmpKey", mtSalesAmountVO.getRegEmpKey());
			insertParam.put("mtSalesAmountVOList", mtSalesAmountVO.getMtSalesAmountVOList());
			mtMapper.writeMtContractSalesAmountList(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}


	/* ============================== 유지보수계약 백계약  ======================================*/
	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#writeContractBackOrder(com.cep.maintenance.contract.vo.MtBackOrderVO)
	 */
	@Override
//	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Transactional
	public String writeContractBackOrder(MtBackOrderVO mtBackOrderVO) throws Exception {

		String[] deleteKeyList = null;
		List<MtBackOrderProductVO> insertList = null;
		List<MtBackOrderProductVO> updateList = null;
		int productListCnt = 0;
		MtBackOrderProductVO productVO = null;
		
		String mtOrderKey = null;
		try {
			if("".equals(mtBackOrderVO.getMtOrderKey())){
				// 해당 내용 신규등록
				mtOrderKey = writeMtBackOrder(mtBackOrderVO);
			} else {
				/*해당 내용 업데이트*/
				
				mtOrderKey= mtBackOrderVO.getMtOrderKey();
				
				/*신규제품과 업데이트 제품을 분리한다.*/
				if(null !=mtBackOrderVO.getMtBackOrderProductVoList() && mtBackOrderVO.getMtBackOrderProductVoList().size()>0){
					productListCnt = mtBackOrderVO.getMtBackOrderProductVoList().size();
					insertList = new ArrayList<>();
					updateList = new ArrayList<>();
					for (int i = 0; i < productListCnt; i++) {
						productVO = mtBackOrderVO.getMtBackOrderProductVoList().get(i);
						if(!"0".equals(CepStringUtil.getDefaultValue(productVO.getMtOrderPmKey(), "0"))){
							// 업데이트 대상
							updateList.add(productVO);
//							logger.debug("update productVO.getMtOrderPmKey()===>"+productVO.getMtOrderPmKey());
						} else {
							// 신규등록대상
							insertList.add(productVO);
//							logger.debug("insert productVO.getMtOrderPmKey()===>"+productVO.getMtOrderPmKey());
						}
					}
				}

				//1. 백계약 제품목록 삭제.
				deleteKeyList = mtBackOrderVO.getDeleteListKeys().split(":");
				if(null != deleteKeyList && deleteKeyList.length>0) {
					deleteBackOrderProductList(mtBackOrderVO.getModEmpKey(), deleteKeyList);
				}
				
				//2. 백계약  신규 제품 등록
				if(null != insertList && insertList.size()>0) {
					insertContractBackOrderList(mtBackOrderVO.getMtOrderKey()
							, mtBackOrderVO.getRegEmpKey()
							, insertList);
				}
				
				//3. 백계약 제품 업데이트
				if(null != updateList && updateList.size()>0) {
					updateContractBackOrderList(mtBackOrderVO.getModEmpKey(), updateList);
				}
				//4. 백계약 메인정보 업데이트
				updateContractBackOrder(mtBackOrderVO);
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		return mtOrderKey;
	}
	
	/**
	 * 
	  * @Method Name : deleteBackOrderProductList
	  * @Cdate       : 2020. 12. 21.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 백계약 제품정보를 삭제한다.
	  * @param deleteKeyList
	  * @return
	  * @throws Exception
	 */
	private void deleteBackOrderProductList(String modEmpKey, String[] deleteKeyList ) throws Exception{
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("deleteKeyList", deleteKeyList);
			mtMapper.deleteBackOrderProductList(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}		
	}
	
	/**
	 * 
	  * @Method Name : writeMtBackOrder
	  * @Cdate       : 2020. 12. 21.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 백계약을 등록한다(백계약 업체정보 + 품목)
	  * @param mtBackOrderVO
	  * @return
	  * @throws Exception
	 */
	private String writeMtBackOrder(MtBackOrderVO mtBackOrderVO) throws Exception {
		
		String mtOrderKey = null;
		Map<String, Object> insertParam = null;
		try {
			
			//1. 백계약 키를 생성한다.
			mtOrderKey = makePrimaryKey(PrimaryKeyType.MAINTENACE_BACK_ORDER);
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtOrderKey, ""))){
				mtBackOrderVO.setMtOrderKey(mtOrderKey);
				
				//2. 백계약 메인을 등록한다.
				mtMapper.writeContractBackOrder(mtBackOrderVO);
				
				insertParam = new HashMap<>();

				insertParam.put("mtOrderKey", mtOrderKey);
				insertParam.put("regEmpKey", mtBackOrderVO.getRegEmpKey());
				insertParam.put("mtBackOrderProductVoList", mtBackOrderVO.getMtBackOrderProductVoList());
				
				//3. 백계약 제품목록을 등록한다.
				mtMapper.writeContractBackOrderProduct(insertParam);
				
			} else {
				throw new Exception("Can't make MT_BACK_ORDER_TB.MT_ORDER_KEY !!!! ..");
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		return mtOrderKey;
	}
	
	/**
	 * 
	  * @Method Name : updateContractBackOrder
	  * @Cdate       : 2020. 12. 21.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 백계약 메인정보를 수정한다.
	  * @throws Exception
	 */
	private void updateContractBackOrder(MtBackOrderVO mtBackOrderVO) throws Exception {
		
		try {
			mtMapper.updateBackOrder(mtBackOrderVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
//		return checkFlag;
	}
	
	private void insertContractBackOrderList(String mtOrderKey
			, String regEmpKey
			, List<MtBackOrderProductVO> insertList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new HashMap<>();

			insertParam.put("mtOrderKey", mtOrderKey);
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("mtBackOrderProductVoList", insertList);
			//백계약 제품목록을 등록한다.
			mtMapper.writeContractBackOrderProduct(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	
	private void updateContractBackOrderList(String modEmpKey
			, List<MtBackOrderProductVO> updateList) throws Exception {
		Map<String, Object> updateParam = null;
		try {
			updateParam = new HashMap<>();

			updateParam.put("modEmpKey", modEmpKey);
			updateParam.put("mtBackOrderProductVoList", updateList);
			//백계약 제품내용을 수정한다.
			mtMapper.updateBackOrderProductList(updateParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
//		return checkFlag;
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectBackOrderSelectBoxList(java.lang.String)
	 */
	@Override
	public List<EgovMap> selectBackOrderSelectBoxList(String mtIntegrateKey) throws Exception {
		return mtMapper.selectBackOrderSelectBoxList(mtIntegrateKey);
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectBackOrderDetail(java.lang.String)
	 */
	@Override
//	public Map<String, Object> selectBackOrderDetail(String mtOrderKey) throws Exception {
//		Map<String, Object> backorderMap = null;
//		try {
//			backorderMap = mtMapper.selectBackOrderDetail(mtOrderKey);
//			if(null != backorderMap) {
//				backorderMap.put("mtBackOrderProductVoList", selectBackOrderProductList(mtOrderKey));
//				
//			}
//		} catch (Exception e) {
//			throw new Exception(e);
//		}
//		return backorderMap;
//	}
	public MtBackOrderVO selectBackOrderDetail(String mtOrderKey) throws Exception {
		MtBackOrderVO vo = null;
		try {
			vo = mtMapper.selectBackOrderDetail(mtOrderKey);
			if(null != vo) {
				vo.setMtBackOrderProductVoList(selectBackOrderProductList(mtOrderKey));
//				logger.debug("vo.getMtBackOrderProductVoList().size()===>"+vo.getMtBackOrderProductVoList().size());
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return vo;
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectBackOrderList(java.lang.String)
	 */
	@Override
	public List<MtBackOrderVO> selectBackOrderList(String mtIntegrateKey) throws Exception {
		// TODO Auto-generated method stub
		return mtMapper.selectBackOrderList(mtIntegrateKey);
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectBackOrderProductList(java.lang.String)
	 */
	@Override
	public List<MtBackOrderProductVO> selectBackOrderProductList(String mtOrderKey) throws Exception {
		// TODO Auto-generated method stub
		return mtMapper.selectBackOrderProductList(mtOrderKey);
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#deleteBackOrder(java.lang.String, java.lang.String)
	 */
	@Override
	@Transactional
	public void deleteBackOrder(String modEmpKey, String mtOrderKey) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("mtOrderKey", mtOrderKey);
			//유지보수계약 백계약 제품목록 삭제
			mtMapper.deleteBackOrderProductAll(deleteParam);
			
			//유지보수계약 백계약 메인 삭제.
			mtMapper.deleteBackOrder(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#updateBackOrder(com.cep.maintenance.contract.vo.MtBackOrderVO)
	 */
	@Override
	@Transactional
	public void updateBackOrder(MtBackOrderVO mtBackOrderVO) throws Exception {
		String [] deleteKeyList = null;
		List<MtBackOrderProductVO> updateProdctList = null;
		List<MtBackOrderProductVO> insertProdctList = null;
		Map<String, Object> updateParam = null;
		Map<String, Object> insertParam = null;
		Map<String, Object> deleteParam = null;
		
		int productListSize = 0;
		try {
			//유지보수계약 백계약 삭제제품 대상 키 추출
			if(!"".equals(CepStringUtil.getDefaultValue(mtBackOrderVO.getDeleteListKeys(), ""))){
				deleteKeyList = mtBackOrderVO.getDeleteListKeys().split(":");
			}
			
			//유지보수계약 백계약 제품목록 업데이트, 신규등록 대상 추출
			if(null !=mtBackOrderVO.getMtBackOrderProductVoList() && mtBackOrderVO.getMtBackOrderProductVoList().size()>0){
				updateProdctList = new ArrayList<>();
				insertProdctList = new ArrayList<>();
				productListSize = mtBackOrderVO.getMtBackOrderProductVoList().size();
				
				for (int i = 0; i < productListSize; i++) {
					if(!"".equals(CepStringUtil.getDefaultValue(
							String.valueOf(mtBackOrderVO.getMtBackOrderProductVoList().get(i).getMtOrderPmKey()), ""))){
						//MtOrderKey 값이 있는 경우 update대상
						updateProdctList.add(mtBackOrderVO.getMtBackOrderProductVoList().get(i));
					} else {
						//MtOrderKey 값이 없는 경우 insert대상
						insertProdctList.add(mtBackOrderVO.getMtBackOrderProductVoList().get(i));
					}
				}
			}
			
			
			//1. 유지보수계약 백계약 제품삭제
			if(null !=deleteKeyList && deleteKeyList.length>0) {
				deleteParam = new HashMap<>();
				deleteParam.put("modEmpKey", mtBackOrderVO.getModEmpKey());
				deleteParam.put("deleteKeyList", deleteKeyList);
				mtMapper.deleteBackOrderProductList(deleteParam);
			}
			
			//2. 유지보수계약 백계약 제품 업데이트
			if(null !=updateProdctList && updateProdctList.size()>0) {
				updateParam = new HashMap<>();
				updateParam.put("modEmpKey", mtBackOrderVO.getModEmpKey());
				updateParam.put("mtBackOrderProductVoList", insertProdctList);
				mtMapper.updateBackOrderProductList(updateParam);
			}
			
			//3. 유지보수계약 백계약 신규제품 등록.
			if(null !=insertProdctList && insertProdctList.size()>0) {
				insertParam = new HashMap<>();
				
				insertParam.put("mtOrderKey", mtBackOrderVO.getMtOrderKey());
				insertParam.put("regEmpKey", mtBackOrderVO.getRegEmpKey());
				insertParam.put("mtBackOrderProductVoList", insertProdctList);
				mtMapper.writeContractBackOrderProduct(insertParam);
			}			
			
			//4. 유지보수계약 백계약 업데이트.
			mtMapper.updateBackOrder(mtBackOrderVO);
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	/* ============================== 유지보수계약 매입  ======================================*/

	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectMtBuyAmountRefer(java.lang.String, java.lang.String)
	 */
	@Override
	public Map<String, Object> selectMtBuyAmountRefer(String mtIntegrateKey, String mtOrderKey) throws Exception {
		Map<String, Object> buyAmountRefer = null;
		Map<String, Object> selectParam = null;
		
		try {
			selectParam = new HashMap<>();
			selectParam.put("mtIntegrateKey", mtIntegrateKey);
			selectParam.put("mtOrderKey", mtOrderKey);
			buyAmountRefer = mtMapper.selectMtBuyAmountRefer(selectParam);
//			
//			if(null != buyAmountRefer && buyAmountRefer.size()>0){
//				buyAmountRefer.put("mtBuyTotalAmount", mtMapper.selectMtBuyTotalAmount(mtOrderKey));
//			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return buyAmountRefer;
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectMtContractBuyAmountList(java.lang.String)
	 */
	@Override
	public List<?> selectMtContractBuyAmountList(String mtOrderKey) throws Exception {

		Map<String, Object> selectParam = null;
		List<?> list = null;
		try {
			selectParam = new HashMap<>();
			selectParam.put("mtOrderKey", mtOrderKey);
			list = mtMapper.selectMtContractBuyAmountList(selectParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return list;
	}
	
	public Map<String, Object> selectMtContractBuyAmountDetail(String mtOrderKey, String mtBuyKey) throws Exception {

		Map<String, Object> selectParam = null;
		List<?> list = null;
		Map<String, Object> returnMap = null;
		try {
			selectParam = new HashMap<>();
			selectParam.put("mtOrderKey", mtOrderKey);
			selectParam.put("mtBuyKey", mtBuyKey);
			list = mtMapper.selectMtContractBuyAmountList(selectParam);
			if(null !=list && list.size()>0) {
				returnMap = (Map<String, Object>)list.get(0);
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return returnMap;
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#writeMtContractBuyAmountList(com.cep.maintenance.contract.vo.MtBuyAmountListVO)
	 */
	@Override
	public void writeMtContractBuyAmountList(MtBuyAmountListVO mtBuyAmountListVO) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new HashMap<>();
			insertParam.put("mtIntegrateKey", mtBuyAmountListVO.getMtIntegrateKey()); //유지보수계약 관리키
			insertParam.put("mtOrderKey", mtBuyAmountListVO.getMtOrderKey()); // 백계약 관리키
			insertParam.put("regEmpKey", mtBuyAmountListVO.getRegEmpKey()); // 등록직원 관리키
			insertParam.put("mtBuyAmountVOList", mtBuyAmountListVO.getMtBuyAmountVOList()); // 년도별 매입리스트.
			mtMapper.writeMtContractBuyAmountList(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#updateMtContractBuyAmountList(com.cep.maintenance.contract.vo.MtBuyAmountListVO)
	 */
	@Override
	@Transactional
	public void updateMtContractBuyAmountList(MtBuyAmountListVO mtBuyAmountListVO) throws Exception {
		String[] deleteKeyList = null; //삭제대상 매입정보 목록
		List<MtBuyAmountVO> insertList = null; //신규등록 대상 매입정보 목록
		List<MtBuyAmountVO> updateList = null; //수정 대상 매입정보 목록
		MtBuyAmountVO buyAmountVO = null;
		int buyAmountCnt = 0;
		try {
			/*신규제품과 업데이트 제품을 분리한다.*/
			if(null !=mtBuyAmountListVO.getMtBuyAmountVOList() && mtBuyAmountListVO.getMtBuyAmountVOList().size()>0) {
				insertList = new ArrayList<>();
				updateList = new ArrayList<>();
				buyAmountCnt = mtBuyAmountListVO.getMtBuyAmountVOList().size();
				for (int i = 0; i < buyAmountCnt; i++) {
					buyAmountVO = mtBuyAmountListVO.getMtBuyAmountVOList().get(i);
					if(!"0".equals(CepStringUtil.getDefaultValue(buyAmountVO.getMtBuyKey(), "0"))){
						// 업데이트 대상
						updateList.add(buyAmountVO);
					} else {
						// 신규등록대상
						insertList.add(buyAmountVO);
					}
				}
			}
			
			//1. 유지보수계약 매입정보 삭제
			deleteKeyList = mtBuyAmountListVO.getDeleteKeys().split(":");
			if(null != deleteKeyList && deleteKeyList.length>0) {
				deleteMtContractBuyAmountList(mtBuyAmountListVO.getModEmpKey(), deleteKeyList);
			}
			
			//2. 유지보수계약 매입정보 업데이트
			if(null != updateList && updateList.size()>0) {
				updateMtContractBuyAmountList(mtBuyAmountListVO.getModEmpKey(), mtBuyAmountListVO.getMtOrderKey(), updateList);
			}
			
			//3. 유지보수계약 매입정보 신규등록
			if(null != insertList && insertList.size()>0) {
				writeMtContractBuyAmountList(mtBuyAmountListVO.getMtIntegrateKey(), mtBuyAmountListVO.getMtOrderKey(), mtBuyAmountListVO.getRegEmpKey(), insertList);
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}
	
	private void deleteMtContractBuyAmountList(String modEmpKey, String[] deleteKeyList) throws Exception{
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("deleteKeyList", deleteKeyList);
			mtMapper.deleteMtContractBuyAmountList(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}		
	}
	
	private void updateMtContractBuyAmountList(String modEmpKey, String mtOrderKey
			, List<MtBuyAmountVO> updateList) throws Exception {
		Map<String, Object> updateParam = null;
		try {
			updateParam = new HashMap<>();

			updateParam.put("modEmpKey", modEmpKey);
			updateParam.put("mtOrderKey", mtOrderKey);
			updateParam.put("mtBuyAmountVoList", updateList);
			//백계약 제품내용을 수정한다.
			mtMapper.updateMtContractBuyAmountList(updateParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
//		return checkFlag;
	}
	
	private void writeMtContractBuyAmountList(String mtIntegrateKey, String mtOrderKey, String regEmpKey
			, List<MtBuyAmountVO> insertList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new HashMap<>();
			insertParam.put("mtIntegrateKey", mtIntegrateKey); //유지보수계약 관리키
			insertParam.put("mtOrderKey", mtOrderKey); // 백계약 관리키
			insertParam.put("regEmpKey", regEmpKey); // 등록직원 관리키
			insertParam.put("mtBuyAmountVOList", insertList); // 년도별 매입리스트.
			mtMapper.writeMtContractBuyAmountList(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#deleteMtContractBuyAmountAll(java.lang.String, java.lang.String)
	 */
	@Override
	public void deleteMtContractBuyAmountAll(String modEmpKey, String mtOrderKey) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("mtOrderKey", mtOrderKey);
			mtMapper.deleteMtContractBuyAmountAll(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	
}
