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
import com.cep.maintenance.contract.vo.MtGuarantyBondVO;
import com.cep.maintenance.contract.vo.MtSaleAmountListVO;
import com.cep.maintenance.contract.vo.MtSalesAmountVO;
import com.cep.maintenance.contract.vo.MtSalesOrderVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepStringUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

import com.cep.maintenance.contract.vo.MtBackOrderProductVO;
import com.cep.maintenance.contract.vo.MtBackOrderVO;
import com.cep.maintenance.contract.vo.MtBiddingVO;
import com.cep.maintenance.contract.vo.MtBuyAmountListVO;
import com.cep.maintenance.contract.vo.MtBuyAmountVO;
import com.cep.maintenance.contract.vo.MtContractLinkVO;
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
	@Transactional
	public void deleteContract(MtContractVO deleteVo) throws Exception {
		Map<String, Object> mtContractCountInfo = null; // 유지보수계약 단계별 등록 갯수 조회.
		Map<String, Object> deleteParam = null;
		try {
			mtContractCountInfo = selectMtContractCount(deleteVo.getMtIntegrateKey());
			if(null !=mtContractCountInfo) {
				deleteParam = new Hashtable<>();
				deleteParam.put("mtIntegrateKey", deleteVo.getMtIntegrateKey());
				deleteParam.put("modEmpKey", deleteVo.getModEmpKey());
				
				if((long)mtContractCountInfo.get("mtBuyAmountCnt")>0) {
					logger.debug("mtContractCountInfo.get(mtBuyAmountCnt) ====>"+mtContractCountInfo.get("mtBuyAmountCnt"));
					//백계약 매입정보 삭제
					mtMapper.deleteMtContractBuyAmountAll(deleteParam);
				} else {
					logger.debug("mtContractCountInfo.get(mtBuyAmountCnt1) ====>"+mtContractCountInfo.get("mtBuyAmountCnt"));
				}
				
				if((long)mtContractCountInfo.get("mtBackOrderCnt")>0) {
					logger.debug("mtContractCountInfo.get(mtBackOrderCnt) ====>"+mtContractCountInfo.get("mtBackOrderCnt"));
					/*
					 * 백계약 정보 삭제
					 * 1. 백계약 제품 삭제
					 * 2. 백계약 메인 삭제
					 */
					//1. 백계약 제품 전체삭제.
					mtMapper.deleteContractBackOrderProductAll(deleteParam);
					
					//2. 백계약 메인 전체삭제.
					mtMapper.deleteBackOrderAll(deleteParam);
				}else {
					logger.debug("mtContractCountInfo.get(mtBackOrderCnt1) ====>"+mtContractCountInfo.get("mtBackOrderCnt"));
				}
				
				if((long)mtContractCountInfo.get("mtSalesAmountCnt")>0) {
					//매출 정보 삭제
					logger.debug("mtContractCountInfo.get(mtSalesAmountCnt) ====>"+mtContractCountInfo.get("mtSalesAmountCnt"));
					
					deleteMtContractSalesAmountAll(deleteVo.getMtIntegrateKey(), null, deleteVo.getModEmpKey());
				} else {
					logger.debug("mtContractCountInfo.get(mtSalesAmountCnt1) ====>"+mtContractCountInfo.get("mtSalesAmountCnt"));
				}
				
				if((long)mtContractCountInfo.get("mtProductCnt")>0) {
					//제품 정보 삭제
					logger.debug("mtContractCountInfo.get(mtProductCnt) ====>"+mtContractCountInfo.get("mtProductCnt"));
					deleteMtContractProductAll(deleteVo.getModEmpKey(), deleteVo.getMtIntegrateKey());
				} else {
					logger.debug("mtContractCountInfo.get(mtProductCnt1) ====>"+mtContractCountInfo.get("mtProductCnt"));
				}
				
			}
			//기본정보 삭제.
			mtMapper.deleteMtContract(deleteVo);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		
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
	@Transactional
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
			
			//유지보수계약 forcast 연계정보 등록
			if(null != writeVo.getMtForcastLinkVo() && !"".equals(CepStringUtil.getDefaultValue(writeVo.getMtForcastLinkVo().getMtLinkCtKey(), ""))) {
				writeVo.getMtForcastLinkVo().setMtIntegrateKey(mtIntegrateKey);
				writeVo.getMtForcastLinkVo().setMtLinkCtClassCd("S"); //Forecast
				writeVo.getMtForcastLinkVo().setRegEmpKey(writeVo.getRegEmpKey());
				writeMtContractLink(writeVo.getMtForcastLinkVo());
			}
			
			//유지보수계약 project연계정보 등록
			if(null != writeVo.getMtProjectLinkVo() && !"".equals(CepStringUtil.getDefaultValue(writeVo.getMtProjectLinkVo().getMtLinkCtKey(), ""))) {
				writeVo.getMtProjectLinkVo().setMtIntegrateKey(mtIntegrateKey);
				writeVo.getMtProjectLinkVo().setMtLinkCtClassCd("P"); //PROJECT
				writeVo.getMtProjectLinkVo().setRegEmpKey(writeVo.getRegEmpKey());
				writeMtContractLink(writeVo.getMtProjectLinkVo());
			}
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
	@Transactional
	public String writeContractBasic(MtContractVO writeVo) throws Exception {
		String mtIntegrateKey = null;
		try {
			
			mtIntegrateKey = makePrimaryKey(PrimaryKeyType.MAINTENACE_CONTRACT_ALL);
			writeVo.setMtIntegrateKey(mtIntegrateKey);
			writeVo.setMtSeq(0);
			
//			logger.debug("mtIntegrateKey===>"+mtIntegrateKey);
			mtMapper.writeContractBasic(writeVo);
			
			//유지보수계약 forecast연계정보 등록
			if(null != writeVo.getMtForcastLinkVo() && !"".equals(CepStringUtil.getDefaultValue(writeVo.getMtForcastLinkVo().getMtLinkCtKey(), ""))) {
				writeVo.getMtForcastLinkVo().setMtIntegrateKey(mtIntegrateKey);
				writeVo.getMtForcastLinkVo().setMtLinkCtClassCd("S"); //Forecast
				writeVo.getMtForcastLinkVo().setRegEmpKey(writeVo.getRegEmpKey());
				writeMtContractLink(writeVo.getMtForcastLinkVo());
			}
			
			//유지보수계약 project연계정보 등록
			if(null != writeVo.getMtProjectLinkVo() && !"".equals(CepStringUtil.getDefaultValue(writeVo.getMtProjectLinkVo().getMtLinkCtKey(), ""))) {
				writeVo.getMtProjectLinkVo().setMtIntegrateKey(mtIntegrateKey);
				writeVo.getMtProjectLinkVo().setMtLinkCtClassCd("P"); //PROJECT
				writeVo.getMtProjectLinkVo().setRegEmpKey(writeVo.getRegEmpKey());
				writeMtContractLink(writeVo.getMtProjectLinkVo());
			}
			
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
	@Transactional
	public void updateMtContractBasic(MtContractVO updateVo) throws Exception {
		try {
			//1. 유지보수계약 기본정보 업데이트
			mtMapper.updateMtContractBasic(updateVo);
			
			//2. forecast 연계정보 삭제대상 삭제
			if(null != updateVo.getMtForcastLinkVo() && !"".equals(CepStringUtil.getDefaultValue(updateVo.getMtForcastLinkVo().getLinkDeleteKey(), ""))) {
				
				updateVo.getMtForcastLinkVo().setMtIntegrateKey(updateVo.getMtIntegrateKey());
				updateVo.getMtForcastLinkVo().setModEmpKey(updateVo.getModEmpKey());
				deleteMtContractLink(updateVo.getMtForcastLinkVo());				
			}
			
			//3.유지보수계약 forecast연계정보 등록
//			if(null != updateVo.getMtForcastLinkVo() && !"".equals(CepStringUtil.getDefaultValue(updateVo.getMtForcastLinkVo().getMtLinkCtKey(), ""))) {
			if(null != updateVo.getMtForcastLinkVo()) {
				if("".equals(CepStringUtil.getDefaultValue(updateVo.getMtForcastLinkVo().getMtLinkKey(), ""))) {
					//forecast연계정보 관리키가 없으면 신규등록
					updateVo.getMtForcastLinkVo().setMtIntegrateKey(updateVo.getMtIntegrateKey());
					updateVo.getMtForcastLinkVo().setMtLinkCtClassCd("S"); //Forecast
					updateVo.getMtForcastLinkVo().setRegEmpKey(updateVo.getRegEmpKey());
					writeMtContractLink(updateVo.getMtForcastLinkVo());
				} else {
					//forecast연계정보 관리키가 있으면 업데이트
					updateVo.getMtForcastLinkVo().setMtIntegrateKey(updateVo.getMtIntegrateKey());
					updateVo.getMtForcastLinkVo().setModEmpKey(updateVo.getModEmpKey());
					updateMtContractLink(updateVo.getMtForcastLinkVo());
				}
			}
			
			//4. project 연계정보 삭제대상 삭제
			if(null != updateVo.getMtProjectLinkVo() && !"".equals(CepStringUtil.getDefaultValue(updateVo.getMtProjectLinkVo().getLinkDeleteKey(), ""))) {
				
				updateVo.getMtProjectLinkVo().setMtIntegrateKey(updateVo.getMtIntegrateKey());
				updateVo.getMtProjectLinkVo().setModEmpKey(updateVo.getModEmpKey());
				deleteMtContractLink(updateVo.getMtProjectLinkVo());				
			}
			
			//3.유지보수계약 project연계정보 등록
//			if(null != updateVo.getMtProjectLinkVo() && !"".equals(CepStringUtil.getDefaultValue(updateVo.getMtProjectLinkVo().getMtLinkCtKey(), ""))) {
			if(null != updateVo.getMtProjectLinkVo()) {
				if("".equals(CepStringUtil.getDefaultValue(updateVo.getMtProjectLinkVo().getMtLinkKey(), ""))) {
					//project연계정보 관리키가 없으면 신규등록
					updateVo.getMtProjectLinkVo().setMtIntegrateKey(updateVo.getMtIntegrateKey());
					updateVo.getMtProjectLinkVo().setMtLinkCtClassCd("P"); //Project
					updateVo.getMtProjectLinkVo().setRegEmpKey(updateVo.getRegEmpKey());
					writeMtContractLink(updateVo.getMtProjectLinkVo());
				} else {
					//project연계정보 관리키가 있으면 업데이트
					updateVo.getMtProjectLinkVo().setMtIntegrateKey(updateVo.getMtIntegrateKey());
					updateVo.getMtProjectLinkVo().setModEmpKey(updateVo.getModEmpKey());
					updateMtContractLink(updateVo.getMtProjectLinkVo());
				}
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}
	

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#selectMtContractBasicDetail(java.lang.String)
	 */
	@Override
//	public MtContractVO selectContractBasicDetail(String mtIntegrateKey, String mtLinkCtClassCd) throws Exception {
	public MtContractVO selectContractBasicDetail(String mtIntegrateKey) throws Exception {
		MtContractVO contractBasicInfo = null;
		List<MtContractLinkVO> contractLinkList = null;
		MtContractLinkVO mtContractLinkVO = null;
		int contractLinkCnt = 0;
		try {
			contractBasicInfo = mtMapper.selectMtBasicDetail(mtIntegrateKey);
//			if(null !=contractBasicInfo 
//					&& !MtContractLinkVO.NOT_SELECT_LINK_CT_TYPE.equalsIgnoreCase(CepStringUtil.getDefaultValue(mtLinkCtClassCd, "N"))) {
			if(null !=contractBasicInfo) {
				//연계정보를 조회한다.
				mtContractLinkVO = new MtContractLinkVO();
				mtContractLinkVO.setMtIntegrateKey(mtIntegrateKey);
//				mtContractLinkVO.setMtLinkCtClassCd(mtLinkCtClassCd);
				contractLinkList = selectMtContractLinkList(mtContractLinkVO);
				if(null !=contractLinkList && contractLinkList.size()>0) {
					contractLinkCnt = contractLinkList.size();
					for (int i = 0; i < contractLinkCnt; i++) {
						mtContractLinkVO = contractLinkList.get(i);
						if("S".equalsIgnoreCase(mtContractLinkVO.getMtLinkCtClassCd())){
							contractBasicInfo.setMtForcastLinkVo(mtContractLinkVO);
						} else if("P".equalsIgnoreCase(mtContractLinkVO.getMtLinkCtClassCd())){
							contractBasicInfo.setMtProjectLinkVo(mtContractLinkVO);
						}
					}
				}
			}
		} catch (Exception e) {

			throw new Exception(e);
		}
		return contractBasicInfo;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectSalesOrderSelectBoxList(java.lang.String)
	 */
	@Override
	public List<EgovMap> selectSalesOrderSelectBoxList(String mtIntegrateKey) throws Exception {
		return mtMapper.selectSalesOrderSelectBoxList(mtIntegrateKey);
	}

	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectSalesOrderDetail(com.cep.maintenance.contract.vo.MtDefaultVO)
	 */
	@Override
	public MtSalesOrderVO selectSalesOrderDetail(MtDefaultVO searchVO) throws Exception {
		MtSalesOrderVO vo =  null;
		try {
			vo = mtMapper.selectSalesOrderDetail(searchVO.getSelectMtSalesOrderKey());
			logger.debug("searchVO.getSelectMtSalesOrderKey()===============>"+searchVO.getSelectMtSalesOrderKey());
			if(null != vo) {
				//selectMtContractProductList(MtDefaultVO searchVO)
				vo.setMtSalesOrderProductVoList(selectMtContractProductList(searchVO));
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return vo;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectSalesOrderList(java.lang.String)
	 */
	@Override
	public List<MtSalesOrderVO> selectSalesOrderList(String mtIntegrateKey) throws Exception {
		// TODO Auto-generated method stub
		return mtMapper.selectSalesOrderList(mtIntegrateKey);
	}
	
	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#writeMtContractProductList(java.util.Map)
	 */
	@Override
	@Transactional
	public String writeContractSalesOrder(MtSalesOrderVO mtSalesOrderVO) throws Exception {
		String[] deleteKeyList = null;
		List<MtContractProductVO> insertList = null;
		List<MtContractProductVO> updateList = null;
		int productListCnt = 0;
		MtContractProductVO mtProductVO = null;
		MtSaleAmountListVO mtSalesAmountListVO = null;
		String mtSalesOrderKey = null;
		try {
			
			if("".equals(CepStringUtil.getDefaultValue(mtSalesOrderVO.getMtSalesOrderKey(), ""))){
				//신규내용
				mtSalesOrderKey = writeMtSalesOrder(mtSalesOrderVO);
				
				mtSalesOrderVO.setMtSalesOrderKey(mtSalesOrderKey);
				//4. 제품 목록에 대한 매출금액 자동생성
				//매출정보를 자동생성한다.
				//if("Y".equalsIgnoreCase(CepStringUtil.getDefaultValue(mtSalesOrderVO.getUpdateYn(), "N"))) {
					mtSalesAmountListVO = new MtSaleAmountListVO();
					mtSalesAmountListVO.setMtIntegrateKey(mtSalesOrderVO.getMtIntegrateKey());
					mtSalesAmountListVO.setMtSalesOrderKey(mtSalesOrderVO.getMtSalesOrderKey());
					mtSalesAmountListVO.setRegEmpKey(mtSalesOrderVO.getRegEmpKey());
					mtSalesAmountListVO.setModEmpKey(mtSalesOrderVO.getRegEmpKey());
					mtSalesAmountListVO.setMtSalesAmountVOList(makeSalesAmoutList(mtSalesOrderVO.getMtSalesOrderProductVoList()));
					deleteNwriteMtContractSalesAmountList(mtSalesAmountListVO, true);
				//}
				
			} else {
				mtSalesOrderKey = mtSalesOrderVO.getMtSalesOrderKey();
				//매출계약 메인정보 업데이트 내용.
				mtMapper.updateSalesOrder(mtSalesOrderVO);
				// 수정
				/*신규제품과 업데이트 제품을 분리한다.*/
				if(null != mtSalesOrderVO.getMtSalesOrderProductVoList() && mtSalesOrderVO.getMtSalesOrderProductVoList().size()>0) {
					productListCnt = mtSalesOrderVO.getMtSalesOrderProductVoList().size();
					insertList = new ArrayList<>();
					updateList = new ArrayList<>();
					for (int i = 0; i < productListCnt; i++) {
						mtProductVO = mtSalesOrderVO.getMtSalesOrderProductVoList().get(i);
						if(!"0".equals(CepStringUtil.getDefaultValue(mtProductVO.getMtSalesPmKey(), "0"))){
//							logger.debug("updateVo==================>"+mtProductVO.getMtPmKey());
							// 업데이트 대상
							updateList.add(mtProductVO);
						} else {
//							logger.debug("insertVo==================>"+mtProductVO.getMtPmKey()+"/"+CepStringUtil.getDefaultValue(productVO.getMtPmKey(), "0"));
							// 신규등록대상
							insertList.add(mtProductVO);
						}
					}
				}
				
				//1. 제품목록 삭제.
				if(!"".equals(CepStringUtil.getDefaultValue(mtSalesOrderVO.getDeleteListKeys(), ""))) {
					deleteKeyList = mtSalesOrderVO.getDeleteListKeys().split(":");
				}
				
//				logger.debug("deleteKeyList==================>"+String.valueOf(deleteKeyList.toString())+"/"+deleteKeyList.length);
				if(null != deleteKeyList && deleteKeyList.length>0) {
					deleteMtContractProductList(mtSalesOrderVO.getModEmpKey(), deleteKeyList, mtSalesOrderVO.getMtSalesOrderKey());
				}
				//2.  신규 제품 등록
				if(null != insertList && insertList.size()>0) {
					writeMtProductList(mtSalesOrderVO.getMtIntegrateKey()
							, mtSalesOrderVO.getMtSalesOrderKey()
							, mtSalesOrderVO.getRegEmpKey()
							, insertList);
				}
				
				//3. 제품 업데이트
				if(null != updateList && updateList.size()>0) {
					updateMtProductList(mtSalesOrderVO.getModEmpKey(), updateList);
				}
				logger.debug("mtSalesOrderVO.getUpdateYn()======>"+mtSalesOrderVO.getUpdateYn());
				
				//매출정보 초기화 업데이트를 선택한 경우
				if("Y".equalsIgnoreCase(CepStringUtil.getDefaultValue(mtSalesOrderVO.getUpdateYn(), "N"))) {
					//4. 제품 목록에 대한 매출금액 자동생성
					//매출정보를 자동생성한다.
					mtSalesAmountListVO = new MtSaleAmountListVO();
					mtSalesAmountListVO.setMtIntegrateKey(mtSalesOrderVO.getMtIntegrateKey());
					mtSalesAmountListVO.setMtSalesOrderKey(mtSalesOrderVO.getMtSalesOrderKey());
					mtSalesAmountListVO.setRegEmpKey(mtSalesOrderVO.getRegEmpKey());
					mtSalesAmountListVO.setModEmpKey(mtSalesOrderVO.getRegEmpKey());
					mtSalesAmountListVO.setMtSalesAmountVOList(makeSalesAmoutList(mtSalesOrderVO.getMtSalesOrderProductVoList()));
					deleteNwriteMtContractSalesAmountList(mtSalesAmountListVO, false);
				}
				
			}
						
			
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return mtSalesOrderKey;
	}
	
	private String writeMtSalesOrder(MtSalesOrderVO mtSalesOrderVO) throws Exception {
		
		String mtSalesOrderKey = null;
		Map<String, Object> insertParam = null;
		try {
			
			//1. 매출계약 키를 생성한다.
			mtSalesOrderKey = makePrimaryKey(PrimaryKeyType.MAINTENACE_SALES_ORDER);
			
			if(!"".equals(CepStringUtil.getDefaultValue(mtSalesOrderKey, ""))){
				
				mtSalesOrderVO.setMtSalesOrderKey(mtSalesOrderKey);
				
				//2. 매출계약 메인을 등록한다.
				mtMapper.writeContractSalesOrder(mtSalesOrderVO);
				
				insertParam = new HashMap<>();

				insertParam = new Hashtable<>();
				insertParam.put("mtIntegrateKey", mtSalesOrderVO.getMtIntegrateKey());	
				insertParam.put("mtSalesOrderKey", mtSalesOrderKey);
				insertParam.put("regEmpKey", mtSalesOrderVO.getRegEmpKey());
				insertParam.put("mtContractProductVoList", mtSalesOrderVO.getMtSalesOrderProductVoList());
								
				//3. 매출계약 제품목록을 등록한다.
				mtMapper.writeMtContractProductList(insertParam);
				
			} else {
				throw new Exception("Can't make MT_BACK_ORDER_TB.MT_ORDER_KEY !!!! ..");
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		return mtSalesOrderKey;
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
	private void writeMtProductList(String mtIntegrateKey, String mtSalesOrderKey, String regEmpKey, List<MtContractProductVO> mtContractProductVoList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new Hashtable<>();
			insertParam.put("mtIntegrateKey", mtIntegrateKey);	
			insertParam.put("mtSalesOrderKey", mtSalesOrderKey);
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

	@Override
	@Transactional
	public void deleteSalesOrder(String modEmpKey, String mtSalesOrderKey, String mtIntegrateKey) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			
			//1.거래처별 매출계약 수금금액 삭제.(MT_SALES_AMOUNT_TB)
			deleteMtContractSalesAmountAll(mtIntegrateKey, mtSalesOrderKey, modEmpKey);
			
			
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("mtSalesOrderKey", mtSalesOrderKey);
			deleteParam.put("mtIntegrateKey", mtIntegrateKey);
			//2.유지보수 매출계약 제품목록 삭제
			mtMapper.deleteMtSalesOrderProductAll(deleteParam);
			//3.유지보수  매출계약 메인 삭제.
			mtMapper.deleteSalesOrder(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#deleteMtContractProduct(java.lang.String)
	 */
	@Override
	public void deleteMtContractProductList(String modEmpKey, String[] deleteKeyList, String mtSalesOrderKey) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("mtSalesOrderKey", mtSalesOrderKey);
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
	public List<MtContractProductVO> selectMtContractProductList(MtDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mtMapper.selectMtContractProductList(searchVO);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectPjContractProductList(com.cep.maintenance.contract.vo.MtDefaultVO)
	 */
	@Override
	public List<?> selectPjContractProductList(MtDefaultVO searchVO)  throws Exception {
		return mtMapper.selectPjContractProductList(searchVO);
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
	

	@Override
	public List<EgovMap> selectManufacturerList() throws Exception {
		// TODO Auto-generated method stub 
		return mtMapper.selectManufacturerList();
	}
	


	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectContractAmountInfo(java.lang.String)
	 */
	@Override
	public Map<String, Object> selectContractAmountInfo(MtDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mtMapper.selectContractAmountInfo(searchVO);
	}

	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectMtSalesTotalAmount(java.lang.String)
	 */
	@Override
	public int selectMtSalesTotalAmount(MtDefaultVO searchVO) throws Exception {
		return mtMapper.selectMtSalesTotalAmount(searchVO);
	}
	/* 
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#writeMtContractSalesAmountList(java.lang.String, java.lang.String, java.util.List)
	 */
	@Override
	@Transactional
	public void writeMtContractSalesAmountList(MtSaleAmountListVO mtSalesAmountListVO) throws Exception {
		Map<String, Object> insertParam = null;
		Map<String, Object> updateParam = null;
		
		String[] deleteKeyList = null; //삭제대상 매출정보 목록
		List<MtSalesAmountVO> insertList = null; //신규등록 대상 매출정보 목록
		List<MtSalesAmountVO> updateList = null; //수정 대상 매출정보 목록
		MtSalesAmountVO salesAmountVO = null;
		int salesAmountCnt = 0;
		try {
			
			/*신규매출정보와 업데이트 매출정보를  분리한다.*/
			if(null !=mtSalesAmountListVO.getMtSalesAmountVOList() && mtSalesAmountListVO.getMtSalesAmountVOList().size()>0) {
				insertList = new ArrayList<>();
				updateList = new ArrayList<>();
				salesAmountCnt = mtSalesAmountListVO.getMtSalesAmountVOList().size();
				
				for (int i = 0; i < salesAmountCnt; i++) {
					salesAmountVO = mtSalesAmountListVO.getMtSalesAmountVOList().get(i);
					if(!"0".equals(CepStringUtil.getDefaultValue(salesAmountVO.getMtSalesKey(), "0"))){
						// 업데이트 대상
						updateList.add(salesAmountVO);
					} else {
						// 신규등록대상
						insertList.add(salesAmountVO);
					}
				}
			}
			
			//1. 유지보수계약 매출정보 삭제
//			deleteKeyList = mtSalesAmountListVO.getDeleteKeys().split(":");
			if(!"".equals(CepStringUtil.getDefaultValue(mtSalesAmountListVO.getDeleteListKeys(), ""))) {
				deleteKeyList = mtSalesAmountListVO.getDeleteListKeys().split(":");
			}
			
			if(null != deleteKeyList && deleteKeyList.length>0) {
				
				deleteMtContractSalesAmountList(mtSalesAmountListVO.getModEmpKey(), mtSalesAmountListVO.getMtIntegrateKey(), deleteKeyList);				
			}

			//2. 유지보수계약 매출정보 업데이트
			if(null != updateList && updateList.size()>0) {
				
				updateParam = new HashMap<>();
				updateParam.put("mtIntegrateKey", mtSalesAmountListVO.getMtIntegrateKey());
				updateParam.put("mtSalesOrderKey", mtSalesAmountListVO.getMtSalesOrderKey());
				updateParam.put("modEmpKey", mtSalesAmountListVO.getModEmpKey());
				updateParam.put("mtSalesAmountVOList", updateList);
				
				updateMtContractSalesAmountList(updateParam);
				//updateMtContractBuyAmountList(mtSalesAmountListVO.getModEmpKey(), mtSalesAmountListVO.getMtIntegrateKey(), updateList);
			}
			
			//3. 유지보수계약 매출정보 신규등록
			if(null != insertList && insertList.size()>0) {
				insertParam = new Hashtable<>();

				insertParam.put("mtIntegrateKey", mtSalesAmountListVO.getMtIntegrateKey());
				insertParam.put("mtSalesOrderKey", mtSalesAmountListVO.getMtSalesOrderKey());
				insertParam.put("regEmpKey", mtSalesAmountListVO.getRegEmpKey());
				insertParam.put("mtSalesAmountVOList", insertList);
				mtMapper.writeMtContractSalesAmountList(insertParam);
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectMtContractSalesAmountList(com.cep.maintenance.contract.vo.MtDefaultVO)
	 */
	@Override
	public List<?> selectMtContractSalesAmountList(MtDefaultVO searchVO)  throws Exception {
		
		List<?> list = null;
		try {
			list = mtMapper.selectMtContractSalesAmountList(searchVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return list;
	}
	
	/**
	 * isNewData 가 ture : 신규, false:수정데이타
	 * isNewData:true = 기존등록된 데이타가 존재하지 않으므로 기존데이타 삭제 없이 등록만 수행
	 * isNewData:false = 기존 등록된 데이타를 DeleteYn=N 처리 후 등록.
	 */
	@Override
	@Transactional
	public void deleteNwriteMtContractSalesAmountList(MtSaleAmountListVO mtSalesAmountListVO, boolean isNewData) throws Exception {
		Map<String, Object> insertParam = null;
		Map<String, Object> deleteParam = null;
		try {
			logger.debug("deleteNwriteMtContractSalesAmountList==>"+mtSalesAmountListVO.getMtIntegrateKey());
			if(!isNewData) {
				//1. 기존 등록되어있는 매입금액을 모두 삭제한다.
				deleteParam = new HashMap<>();
				deleteParam.put("mtIntegrateKey", mtSalesAmountListVO.getMtIntegrateKey());
				deleteParam.put("mtSalesOrderKey", mtSalesAmountListVO.getMtSalesOrderKey());
				deleteParam.put("modEmpKey", mtSalesAmountListVO.getModEmpKey());
				mtMapper.deleteMtContractSalesAmountAll(deleteParam);
			}			
			
			//2.새로운 매입금액정보를 등록한다.
			insertParam = new Hashtable<>();
			insertParam.put("mtIntegrateKey", mtSalesAmountListVO.getMtIntegrateKey());
			insertParam.put("mtSalesOrderKey", mtSalesAmountListVO.getMtSalesOrderKey());
			insertParam.put("regEmpKey", mtSalesAmountListVO.getRegEmpKey());
			insertParam.put("mtSalesAmountVOList", mtSalesAmountListVO.getMtSalesAmountVOList());
			mtMapper.writeMtContractSalesAmountList(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}
	
	@Override
	public void updateMtContractSalesAmountList(Map<String, Object> updateParam)throws Exception {
		mtMapper.updateMtContractSalesAmountList(updateParam);
	}
	
	@Override
	public void deleteMtContractSalesAmountAll(String mtIntegrateKey, String mtSalesOrderKey, String modEmpKey) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new Hashtable<>();
			deleteParam.put("mtIntegrateKey", mtIntegrateKey);
			deleteParam.put("mtSalesOrderKey", mtSalesOrderKey);
			deleteParam.put("modEmpKey", modEmpKey);
			
			mtMapper.deleteMtContractSalesAmountAll(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}
	
	@Override
	public void deleteMtContractSalesAmountList(String modEmpKey, String mtIntegrateKey, String[] deleteKeyList) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new Hashtable<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("mtIntegrateKey", mtIntegrateKey);
			deleteParam.put("deleteKeyList", deleteKeyList);
			mtMapper.deleteMtContractSalesAmountList(deleteParam);
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
		MtBuyAmountListVO mtBuyAmountListVO = null;
		try {
			if("".equals(CepStringUtil.getDefaultValue(mtBackOrderVO.getMtOrderKey(), ""))){
				// 해당 내용 신규등록
				mtOrderKey = writeMtBackOrder(mtBackOrderVO);
				
				//신규생성시에는 무조건 백계약 매입정보를 생성한다.
				mtBuyAmountListVO = new MtBuyAmountListVO();
				mtBuyAmountListVO.setMtIntegrateKey(mtBackOrderVO.getMtIntegrateKey());
				mtBuyAmountListVO.setMtOrderKey(mtOrderKey);
				mtBuyAmountListVO.setRegEmpKey(mtBackOrderVO.getRegEmpKey());
				mtBuyAmountListVO.setModEmpKey(mtBackOrderVO.getModEmpKey());				
				mtBuyAmountListVO.setMtBuyAmountVOList(makeBuyAmoutList(mtBackOrderVO.getMtBackOrderProductVoList()));
								
				deleteNwriteMtContractBuyAmountList(mtBuyAmountListVO);
				
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
				if(!"".equals(CepStringUtil.getDefaultValue(mtBackOrderVO.getDeleteListKeys(), ""))) {
					deleteKeyList = mtBackOrderVO.getDeleteListKeys().split(":");
				}
				
				//logger.debug("mtBackOrderVO.getDeleteListKeys()===>"+mtBackOrderVO.getDeleteListKeys()+"/"+deleteKeyList);
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
				
				//매입정보 초기화 업데이트를 선택한 경우
				if("Y".equalsIgnoreCase(CepStringUtil.getDefaultValue(mtBackOrderVO.getUpdateYn(), "N"))) {
					//5. 백계약 업체별 제품정보에 대해 매입금액 자동생성
					mtBuyAmountListVO = new MtBuyAmountListVO();
					mtBuyAmountListVO.setMtIntegrateKey(mtBackOrderVO.getMtIntegrateKey());
					mtBuyAmountListVO.setMtOrderKey(mtOrderKey);
					mtBuyAmountListVO.setRegEmpKey(mtBackOrderVO.getRegEmpKey());
					mtBuyAmountListVO.setModEmpKey(mtBackOrderVO.getModEmpKey());				
					mtBuyAmountListVO.setMtBuyAmountVOList(makeBuyAmoutList(mtBackOrderVO.getMtBackOrderProductVoList()));
									
					deleteNwriteMtContractBuyAmountList(mtBuyAmountListVO);
				}
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
	 * @see com.cep.maintenance.contract.service.MtContractService#deleteBackOrder(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	@Transactional
	public void deleteBackOrder(String modEmpKey, String mtOrderKey, String mtIntegrateKey) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			
			//1.거래처별 백계약 매입정보 삭제.
			deleteMtContractBuyAmountAll(modEmpKey, mtOrderKey, mtIntegrateKey);
			
			
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("mtOrderKey", mtOrderKey);
			//2.유지보수계약 백계약 제품목록 삭제
			mtMapper.deleteBackOrderProductAll(deleteParam);
			
			//3.유지보수계약 백계약 메인 삭제.
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
	 * @see com.cep.maintenance.contract.service.MtContractService#selectMtContractBuyAmountList(java.lang.String, java.lang.String)
	 */
	@Override
	public List<?> selectMtContractBuyAmountList(String mtIntegrateKey, String mtOrderKey) throws Exception {

		Map<String, Object> selectParam = null;
		List<?> list = null;
		try {
			selectParam = new HashMap<>();
			selectParam.put("mtIntegrateKey", mtIntegrateKey);
			selectParam.put("mtOrderKey", mtOrderKey);
			list = mtMapper.selectMtContractBuyAmountList(selectParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectMtBuyTotalAmount(java.lang.String, java.lang.String)
	 */
	@Override
	public int selectMtBuyTotalAmount(String mtIntegrateKey, String mtOrderKey) throws Exception {
		Map<String, Object> selectParam = null;
		int buyTotalAmount = 0;
		try {
			selectParam = new HashMap<>();
			selectParam.put("mtIntegrateKey", mtIntegrateKey);
			selectParam.put("mtOrderKey", mtOrderKey);
			buyTotalAmount = mtMapper.selectMtBuyTotalAmount(selectParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return buyTotalAmount;
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
			if(!"".equals(CepStringUtil.getDefaultValue(mtBuyAmountListVO.getDeleteListKeys(), ""))) {
				deleteKeyList = mtBuyAmountListVO.getDeleteListKeys().split(":");
			}
			
			if(null != deleteKeyList && deleteKeyList.length>0) {
				deleteMtContractBuyAmountList(mtBuyAmountListVO.getModEmpKey(), mtBuyAmountListVO.getMtOrderKey(), deleteKeyList);
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
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#deleteMtContractBuyAmountList(java.lang.String, java.lang.String, java.lang.String[])
	 */
	@Override
	public void deleteMtContractBuyAmountList(String modEmpKey, String mtOrderKey, String[] deleteKeyList) throws Exception{
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("mtOrderKey", mtOrderKey);
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
	public void deleteMtContractBuyAmountAll(String modEmpKey, String mtOrderKey, String mtIntegrateKey) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("mtOrderKey", mtOrderKey);
			deleteParam.put("mtIntegrateKey", mtIntegrateKey);
			mtMapper.deleteMtContractBuyAmountAll(deleteParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#deleteNwriteMtContractBuyAmountList(com.cep.maintenance.contract.vo.MtBuyAmountListVO)
	 */
	@Override
	@Transactional
	public void deleteNwriteMtContractBuyAmountList(MtBuyAmountListVO mtBuyAmountListVO) throws Exception {
		Map<String, Object> insertParam = null;
		Map<String, Object> deleteParam = null;
		try {
			logger.debug("mtBuyAmountListVO.getMtIntegrateKey()==>"+mtBuyAmountListVO.getMtIntegrateKey());
			//1. 기존 등록되어있는 매입금액을 모두 삭제한다.
			deleteParam = new HashMap<>();
			deleteParam.put("mtIntegrateKey", mtBuyAmountListVO.getMtIntegrateKey());
			deleteParam.put("mtOrderKey", mtBuyAmountListVO.getMtOrderKey());
			deleteParam.put("modEmpKey", mtBuyAmountListVO.getModEmpKey());
			mtMapper.deleteMtContractBuyAmountAll(deleteParam);
			
			//2.새로운 매입금액정보를 등록한다.
			insertParam = new Hashtable<>();
			insertParam.put("mtIntegrateKey", mtBuyAmountListVO.getMtIntegrateKey());
			insertParam.put("mtOrderKey", mtBuyAmountListVO.getMtOrderKey());
			insertParam.put("regEmpKey", mtBuyAmountListVO.getRegEmpKey());
			insertParam.put("mtBuyAmountVOList", mtBuyAmountListVO.getMtBuyAmountVOList());
			mtMapper.writeMtContractBuyAmountList(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}
	
	
	/* ============================== 유지보수계약 연계정보 관리  ======================================*/
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#writeMtContractLink(com.cep.maintenance.contract.vo.MtContractLinkVO)
	 */
	public void writeMtContractLink(MtContractLinkVO mtContractLinkVO) throws Exception {
		try {
			mtMapper.writeMtContractLink(mtContractLinkVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#selectMtContractLinkList(com.cep.maintenance.contract.vo.MtContractLinkVO)
	 */
	public List<MtContractLinkVO> selectMtContractLinkList(MtContractLinkVO mtContractLinkVO) throws Exception {
		List<MtContractLinkVO> contractLinkList = null;
		try {
			logger.debug("mtContractLinkVO.getMtLinkCtClassCd()======>"+mtContractLinkVO.getMtLinkCtClassCd());
			contractLinkList = mtMapper.selectMtContractLinkList(mtContractLinkVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return contractLinkList;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#updateMtContractLink(com.cep.maintenance.contract.vo.MtContractLinkVO)
	 */
	public void updateMtContractLink(MtContractLinkVO mtContractLinkVO) throws Exception {
		try {
			mtMapper.updateMtContractLink(mtContractLinkVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#deleteMtContractLink(com.cep.maintenance.contract.vo.MtContractLinkVO)
	 */
	public void deleteMtContractLink(MtContractLinkVO mtContractLinkVO) throws Exception {
		try {
			mtMapper.deleteMtContractLink(mtContractLinkVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	
	/* ============================== 유지보수 입찰 보증증권 관리  ======================================*/

	@Override
	public void requestMtBiddingGb(MtBiddingVO mtBiddingVO) throws Exception {
		try {
			mtMapper.requestMtBiddingGb(mtBiddingVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}


	@Override
	public void endMtBiddingGb(MtBiddingVO mtBiddingVO) throws Exception {
		try {
			mtMapper.endMtBiddingGb(mtBiddingVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}


	@Override
	public void modifyMtBiddingGb(MtBiddingVO mtBiddingVO) throws Exception {
		try {
			mtMapper.modifyMtBiddingGb(mtBiddingVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}


	@Override
	public void deleteMtBidding(MtBiddingVO mtBiddingVO) throws Exception {
		try {
			mtMapper.deleteMtBidding(mtBiddingVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}


	@Override
	public MtBiddingVO selectMtBdGbInfo(String mtIntegrateKey) throws Exception {
		MtBiddingVO mtBiddingVO = null;
		try {
			mtBiddingVO = mtMapper.selectMtBdGbInfo(mtIntegrateKey);
			if(null == mtBiddingVO) {
				//계약정보가 없는 경우 진행상태를 발행전으로 전달한다.
				mtBiddingVO = new MtBiddingVO();
				mtBiddingVO.setBdGbFinishYn("N");
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return mtBiddingVO;
	}
	
	/* ============================== 유지보수 계약 보증증권 관리  ======================================*/
	@Override
	public String requestMtGuarantyBond(MtGuarantyBondVO mtGuarantyBondVO) throws Exception {
		String gbKey = null;
		MtGuarantyBondVO guarantyBondVO = null;
		try {
			//보증증권 PK를 생성한다.
			gbKey = makePrimaryKey(PrimaryKeyType.MAINTENACE_GUARANTEE);
			if(!"".equals(CepStringUtil.getDefaultValue(gbKey, ""))) {
				mtGuarantyBondVO.setGbKey(gbKey);
				mtMapper.requestMtGuarantyBond(mtGuarantyBondVO);
			} else {
				
				throw new Exception("유지보수 계약 보증중권 관리키 생성 실패 !!");
			}
			
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		return gbKey;
	}


	@Override
	public void endMtGuarantyBond(MtGuarantyBondVO mtGuarantyBondVO) throws Exception {
		try {
			mtMapper.endMtGuarantyBond(mtGuarantyBondVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}


	@Override
	public void modifyMtGuarantyBond(MtGuarantyBondVO mtGuarantyBondVO) throws Exception {
		try {
			mtMapper.modifyMtGuarantyBond(mtGuarantyBondVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}


	@Override
	public void deleteMtGuarantyBond(MtGuarantyBondVO mtGuarantyBondVO) throws Exception {
		try {
			mtMapper.deleteMtGuarantyBond(mtGuarantyBondVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}


	@Override
	public MtGuarantyBondVO selectMtGuarantyBondInfo(String mtIntegrateKey) throws Exception {
		MtGuarantyBondVO mtGuarantyBondVO = null;
		try {
			mtGuarantyBondVO = mtMapper.selectMtGuarantyBondInfo(mtIntegrateKey);
			if(null == mtGuarantyBondVO) {
				//계약정보가 없는 경우 진행상태를 발행전으로 전달한다.
				mtGuarantyBondVO = new MtGuarantyBondVO();
				mtGuarantyBondVO.setGbIssueYn("N");
			}
			logger.debug("mtGuarantyBondVO.getGbIssueYn()=====================>"+mtGuarantyBondVO.getGbIssueYn());
		} catch (Exception e) {
			throw new Exception(e);
		}
		return mtGuarantyBondVO;
	}
	
	
//	==========================================================================================================
	/**
	 * 1. 제품별로 유지보수 기간에 맞춰 해당 월에 금액을 배분한다.
	 * 2. 금액을 제품금액 기간에 맞춰 월별로 배분한다.
	  * @Method Name : makeSalesAmoutList
	  * @Cdate       : 2021. 1. 22.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품정보를 이용하여 매출정보를 자동생성하는 메서드
	  * @param voList
	  * @return
	 */
	private List<MtSalesAmountVO> makeSalesAmoutList(List<MtContractProductVO> voList) {
		Map<String, MtSalesAmountVO> yearMap = null;
		List<MtSalesAmountVO> mtSalesAmountVOList = null;
		int listCnt = 0;
		MtContractProductVO vo = null;
		int totalAmount = 0;
		try {
			if(null != voList && voList.size()>0) {
				System.out.println(voList.size());
				
				listCnt = voList.size();
				for (int i = 0; i < listCnt; i++) {
					if(null == yearMap) {
						yearMap = new HashMap<>();
					}
					vo = voList.get(i);
					//1. 해당 제품의 전체금액을 구한다.
					totalAmount = Integer.parseInt(vo.getMtPmQuantity())*Integer.parseInt(vo.getMtPmUprice());
					//2. 금액을 제품금액 기간에 맞춰 월별로 배분한다.
					yearMap = calcuSalesAmount(vo.getMtPmStartDt(), vo.getMtPmEndDt(), totalAmount, yearMap);
				}
				
				if(null !=yearMap && yearMap.size()>0) {
					mtSalesAmountVOList = new ArrayList<>(yearMap.values());
				}
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mtSalesAmountVOList;
	}
	
	
	private Map<String, MtSalesAmountVO> calcuSalesAmount(String fromDate, String toDate, int totalAmount, Map<String, MtSalesAmountVO> yearMap) throws Exception {
		List<String> monthList = null;
		MtSalesAmountVO salesVo = null;
		MtSalesAmountVO calcuSalesVo = null;
		int monthCnt = 0;
		int avrAmount = 0;
		String targetYear = null;
		String targetMonth = null;
		String checkYear = null;
		try {
			monthList = CepDateUtil.makeMonthListFormToEndDate(fromDate, toDate);
			
			if(null != monthList && monthList.size()>0) {
				//년도에 맞는 vo를 생성한다.
				for (int i = Integer.parseInt(fromDate.substring(0, 4)); i <= Integer.parseInt(toDate.substring(0, 4)); i++) {
//					System.out.println("=============>"+i);
					if(!yearMap.containsKey(String.valueOf(i))) {
						//해당 년도가 존재하지 않으면 해당 
						salesVo = new MtSalesAmountVO();
						salesVo.setMtSalesYear(String.valueOf(i));
						yearMap.put(String.valueOf(i), salesVo);
					}
				}	
				monthCnt = monthList.size(); // 개월수..
				avrAmount = totalAmount/monthCnt; //월별 평균금액
				//해당 월별로 금액배분.
				for (int i = 0; i < monthCnt; i++) {
					targetYear = monthList.get(i).substring(0, 4);
					targetMonth = monthList.get(i).substring(4, 6);
					if(null == checkYear) {
						checkYear = targetYear;
						calcuSalesVo = yearMap.get(targetYear);
					}
					
					if(!checkYear.equals(targetYear)) {
						//checkYear년도에 변경된 사항을 Map에 저장한다.
						yearMap.put(checkYear, calcuSalesVo);
						
						//새로운 target년도를 꺼내서 저장할 수 있도록 한다.
						calcuSalesVo = yearMap.get(targetYear);
						checkYear = targetYear;
					}
					
					//해당 월에 해당하는 값에 값을 더해준다.
					if("01".equals(targetMonth)) {
						calcuSalesVo.setMtSalesJanAmount(calcuSalesVo.getMtSalesJanAmount()+avrAmount);
					} else if("02".equals(targetMonth)) {
						calcuSalesVo.setMtSalesFebAmount(calcuSalesVo.getMtSalesFebAmount()+avrAmount);
					} else if("03".equals(targetMonth)) {
						calcuSalesVo.setMtSalesMarAmount(calcuSalesVo.getMtSalesMarAmount()+avrAmount);
					} else if("04".equals(targetMonth)) {
						calcuSalesVo.setMtSalesAprAmount(calcuSalesVo.getMtSalesAprAmount()+avrAmount);
					} else if("05".equals(targetMonth)) {
						calcuSalesVo.setMtSalesMayAmount(calcuSalesVo.getMtSalesMayAmount()+avrAmount);
					} else if("06".equals(targetMonth)) {
						calcuSalesVo.setMtSalesJunAmount(calcuSalesVo.getMtSalesJunAmount()+avrAmount);
					} else if("07".equals(targetMonth)) {
						calcuSalesVo.setMtSalesJulAmount(calcuSalesVo.getMtSalesJulAmount()+avrAmount);
					} else if("08".equals(targetMonth)) {
						calcuSalesVo.setMtSalesAugAmount(calcuSalesVo.getMtSalesAugAmount()+avrAmount);
					} else if("09".equals(targetMonth)) {
						calcuSalesVo.setMtSalesSepAmount(calcuSalesVo.getMtSalesSepAmount()+avrAmount);
					} else if("10".equals(targetMonth)) {
						calcuSalesVo.setMtSalesOctAmount(calcuSalesVo.getMtSalesOctAmount()+avrAmount);
					} else if("11".equals(targetMonth)) {
						calcuSalesVo.setMtSalesNovAmount(calcuSalesVo.getMtSalesNovAmount()+avrAmount);
					} else if("12".equals(targetMonth)) {
						calcuSalesVo.setMtSalesDecAmount(calcuSalesVo.getMtSalesDecAmount()+avrAmount);
					}
				}
				
				//마지막으로 변경된 년도의 객체를 저장한다.
				yearMap.put(checkYear, calcuSalesVo);
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return yearMap;
	}
	
//	/**
//	 * 1.제품의 전체 금액을 구한다.
//	 * 2.세금계산서 발행 요청월을 구한다.
//	 * 3.제품의 전체금액에서 세금계산서 발행요청 금액을 뺀다.
//	 * 4.세금계산서 발행금액을 뺀 금액에서 발행요청 개월 수를 뺀 개월로 평균금액을 구한다.
//	 * 5.세금계산서 밸행 요청을 한 해당 회차(해당월)를 제외하고 평균금액을 입력한다.
//	 * 6.세금계산서 발행요청월은 현재 값을 유지한다.
//	  * @Method Name : makeSalesAmoutList
//	  * @Cdate       : 2021. 10. 27.
//	  * @Author      : aranghoo
//	  * @Modification: 
//	  * @Method Description : 유지보수계약 제품정보를 이용하여 매출정보를 자동생성하는 메서드
//	  * @param voList
//	  * @return
//	 */
//	private List<MtSalesAmountVO> makeSalesAmoutList(String mtIntegrateKey) {
//		Map<String, MtSalesAmountVO> yearMap = null;
//		List<MtSalesAmountVO> mtSalesAmountVOList = null;
//				
//		MtContractVO contractBasicInfo = null;
//		
//		List<EgovMap> mtBillReqList = null;
//		EgovMap mtBillReqInfo = null;
//		String checkYear = null;
//		String salesYear = null;
//		String salesMonth = null;
//		int mtBillReqListCnt = 0;
//
//		int reqBillAmount = 0;
//		int totlaReqBillAmount = 0;
//		
//		Map<String, Map<String,EgovMap>> checkReqBillMap = new HashMap<>();
//		Map<String,EgovMap> reqCheckMonth = null;
//		try {			
//			
//			//유지보수 전체기간 및 전체 금액을 구하기 위해 기본정보를 조회한다.
//			contractBasicInfo = mtMapper.selectMtBasicDetail(mtIntegrateKey);
//			
//			//세금계산서 요청 정보를 구한다.
//			mtBillReqList = mtMapper.selectMtReqBillList(mtIntegrateKey);
//			//세금계산서 발행요청 금액에 대한 Map을 셋팅한다.
//			if(null !=mtBillReqList && mtBillReqList.size()>0) {
////				checkReqBillMap = new HashMap<>();
//				mtBillReqListCnt = mtBillReqList.size();//세금계산서 발행요청된 개월수
//				for (int i = 0; i < mtBillReqListCnt; i++) {
//					mtBillReqInfo = mtBillReqList.get(i);
//					salesYear = ((String)mtBillReqInfo.get("salesYearMonth")).substring(0, 4);
//					salesMonth = ((String)mtBillReqInfo.get("salesYearMonth")).substring(4, 6);
//					reqBillAmount = (Integer)mtBillReqInfo.get("salesTurnAmount");
//					totlaReqBillAmount = totlaReqBillAmount+reqBillAmount;
//					if(i==0) {
//						//처음에는 체크해야할 연도가 셋팅되지 않았으므로 처음 년도를 체크년도를 지정한다.
//						checkYear = salesYear;
//						//MtSalesAmountVO 를 초기화 한다.
////						salesVo = new MtSalesAmountVO();
//						reqCheckMonth = new HashMap<>();
//					}
//					
//					if(!checkYear.equals(salesYear)) {
//						//년도가 달라지면 checkReqBillMap에서 해당 년도의 reqCheckMonth map를 꺼낸다. 없으면 map를 초기화 한디.
//						reqCheckMonth = checkReqBillMap.get(salesYear);							
//						
//						//해당 년도의 reqCheckMonth이 없으므로 초기화 한다.
//						if(null == reqCheckMonth) {
//							
//							reqCheckMonth = new HashMap<>();
//						}
//						//체크 년도를 달라진 년도로 변경한다.
//						checkYear = salesYear;
//					}
//					//해당 월의 세금계산서 발행요청금액을 넣어준다.
//					reqCheckMonth.put(salesMonth, mtBillReqInfo);
//					//해당년도에 해당월의 맵을 넣어준다.
//					checkReqBillMap.put(checkYear, reqCheckMonth); //작업
//				}
//			}
//			
//			logger.debug("contractBasicInfo.getMtStartDt()======>"+contractBasicInfo.getMtStartDt());
//			logger.debug("contractBasicInfo.getMtEndDt()======>"+contractBasicInfo.getMtEndDt());
//			logger.debug("contractBasicInfo.getMtAmount()======>"+contractBasicInfo.getMtAmount());
//			logger.debug("mtBillReqListCnt======>"+mtBillReqListCnt);
//			logger.debug("totlaReqBillAmount======>"+totlaReqBillAmount);
//			logger.debug("checkReqBillMap.size()======>"+checkReqBillMap.size());
//			//MT_SALES_AMOUNT_TB에 등록할 데이타를 생성한다.
//			yearMap = calcuSalesAmount(contractBasicInfo.getMtStartDt()//유지보수 시작일자.
//					, contractBasicInfo.getMtEndDt() //유지보수 종료일자.
//					, (int)contractBasicInfo.getMtAmount() //유지보수 금액
//					, mtBillReqListCnt //세금계산서 발행요청한 개수.
//					, totlaReqBillAmount // 세금계산서 발행요청한 전체금액.
//					, checkReqBillMap); //세금계산서 요청한 년도별 월 금액.
//			
//			logger.debug("yearMap======>"+yearMap);
//			if(null !=yearMap && yearMap.size()>0) {
//				logger.debug("yearMap.size()======>"+yearMap.size());
//				mtSalesAmountVOList = new ArrayList<>(yearMap.values());				
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return mtSalesAmountVOList;
//	}	
	
//	private static Map<String, MtSalesAmountVO> calcuSalesAmount(String fromDate, String toDate, int totalAmount, int reqMonthCnt, int reqBillTotolAmount, Map<String, Map<String,EgovMap>> checkReqBillMap) throws Exception {
//		List<String> monthList = null;
//		MtSalesAmountVO salesVo = null;
//		MtSalesAmountVO calcuSalesVo = null;
//		int monthCnt = 0;
////		int avrAmount = 0;
//		String targetYear = null;
//		String targetMonth = null;
//		String checkYear = null;
//		
//		/*
//		 * 평균금액을 셋팅해야하는 월의 갯수 ==> 월별 평균값을 구하기 위해서 필요
//		 * 계약기간의 월에서 세금계산서 요청(reqMonthCnt)이 된 월을 뺀 개수
//		 * 세금계산서 요청이 된 월은 기존 금액으로 셋팅한다.
//		 */
//		int setMonthCnt = 0; 
//		
//		int averageAmount=0;
//		
//		Map<String, MtSalesAmountVO> yearMap = null;
//		
//		EgovMap mtBillReqInfo = null;
//		try {
//			monthList = CepDateUtil.makeMonthListFormToEndDate(fromDate, toDate);
//			
//			if(null != monthList && monthList.size()>0) {
//				//셋팅해야하는 월의 개수.
//				setMonthCnt = monthList.size()-reqMonthCnt;
//				/*
//				 * 전체금액에서 세금계산서 발행요청금액을 제외하고 셋팅해야하는 개월수로 나눈금액
//				 */
//				averageAmount = (totalAmount-reqBillTotolAmount)/setMonthCnt;
//				
//				yearMap = new HashMap<>();
//				//년도에 맞는 vo를 생성한다.
//				for (int i = Integer.parseInt(fromDate.substring(0, 4)); i <= Integer.parseInt(toDate.substring(0, 4)); i++) {
////					System.out.println("=============>"+i);
//					//년도별 객체를 생성한다.
//					salesVo = new MtSalesAmountVO();
//					salesVo.setMtSalesYear(String.valueOf(i));
//					yearMap.put(String.valueOf(i), salesVo);
//				}	
//				monthCnt = monthList.size(); // 개월수..
////				avrAmount = totalAmount/monthCnt; //월별 평균금액
//				//해당 월별로 금액배분.
//				for (int i = 0; i < monthCnt; i++) {
//					targetYear = monthList.get(i).substring(0, 4);
//					targetMonth = monthList.get(i).substring(4, 6);
//					if(null == checkYear) {
//						checkYear = targetYear;
//						calcuSalesVo = yearMap.get(targetYear);
//					}
//					
//					if(!checkYear.equals(targetYear)) {
//						//checkYear년도에 변경된 사항을 Map에 저장한다.
////						yearMap.put(checkYear, calcuSalesVo);
//						
//						//새로운 target년도를 꺼내서 저장할 수 있도록 한다.
//						calcuSalesVo = yearMap.get(targetYear);
//						checkYear = targetYear;
//					}
//					
//					//해당 월에 해당하는 값에 값을 더해준다.
//					if("01".equals(targetMonth)) {
//						if(checkReqBillMap.containsKey(targetYear) && checkReqBillMap.get(targetYear).containsKey(targetMonth)){
//							
//							mtBillReqInfo = checkReqBillMap.get(targetYear).get(targetMonth);
//							
//							//세금계산서 요청된 금액이면 해당 요청된 금액을 셋팅한다.
//							calcuSalesVo.setMtSalesJanAmount((Integer)mtBillReqInfo.get("salesTurnAmount"));
//							calcuSalesVo.setMtSalesJanCallYn((String)mtBillReqInfo.get("salesStatusCd"));
//						} else {
//							//요청된 월이 아닌 경우 해당 월을 셋팅한다.
//							calcuSalesVo.setMtSalesJanAmount(averageAmount);
//							calcuSalesVo.setMtSalesJanCallYn("N");
//						}
//					} else if("02".equals(targetMonth)) {
//						
//						if(checkReqBillMap.containsKey(targetYear) && checkReqBillMap.get(targetYear).containsKey(targetMonth)){
//							//세금계산서 요청된 금액이면 해당 요청된 금액을 셋팅한다.
////							calcuSalesVo.setMtSalesFebAmount(Integer.parseInt(checkReqBillMap.get(targetYear).get(targetMonth)));
//							mtBillReqInfo = checkReqBillMap.get(targetYear).get(targetMonth);
//							calcuSalesVo.setMtSalesFebAmount((Integer)mtBillReqInfo.get("salesTurnAmount"));
//							calcuSalesVo.setMtSalesFebCallYn((String)mtBillReqInfo.get("salesStatusCd"));
//						} else {
//							//요청된 월이 아닌 경우 해당 월을 셋팅한다.
//							calcuSalesVo.setMtSalesFebAmount(averageAmount);
//							calcuSalesVo.setMtSalesFebCallYn("N");
//						}
//					} else if("03".equals(targetMonth)) {
//						if(checkReqBillMap.containsKey(targetYear) && checkReqBillMap.get(targetYear).containsKey(targetMonth)){
////							System.out.println(targetYear+"/"+targetMonth+"="+checkReqBillMap.get(targetYear).containsKey(targetMonth));
//							//세금계산서 요청된 금액이면 해당 요청된 금액을 셋팅한다.
////							calcuSalesVo.setMtSalesMarAmount(Integer.parseInt(checkReqBillMap.get(targetYear).get(targetMonth)));
//
//							mtBillReqInfo = checkReqBillMap.get(targetYear).get(targetMonth);
//							calcuSalesVo.setMtSalesMarAmount((Integer)mtBillReqInfo.get("salesTurnAmount"));
//							calcuSalesVo.setMtSalesMarCallYn((String)mtBillReqInfo.get("salesStatusCd"));
//						} else {
//							//요청된 월이 아닌 경우 해당 월을 셋팅한다.
//							calcuSalesVo.setMtSalesMarAmount(averageAmount);
//							calcuSalesVo.setMtSalesMarCallYn("N");
//						}
//					} else if("04".equals(targetMonth)) {
//						if(checkReqBillMap.containsKey(targetYear) && checkReqBillMap.get(targetYear).containsKey(targetMonth)){
//							//세금계산서 요청된 금액이면 해당 요청된 금액을 셋팅한다.
////							calcuSalesVo.setMtSalesAprAmount(Integer.parseInt(checkReqBillMap.get(targetYear).get(targetMonth)));
//
//
//							mtBillReqInfo = checkReqBillMap.get(targetYear).get(targetMonth);
//							calcuSalesVo.setMtSalesAprAmount((Integer)mtBillReqInfo.get("salesTurnAmount"));
//							calcuSalesVo.setMtSalesAprCallYn((String)mtBillReqInfo.get("salesStatusCd"));
//						} else {
//							//요청된 월이 아닌 경우 해당 월을 셋팅한다.
//							calcuSalesVo.setMtSalesAprAmount(averageAmount);
//							calcuSalesVo.setMtSalesAprCallYn("N");
//						}
//					} else if("05".equals(targetMonth)) {
//						if(checkReqBillMap.containsKey(targetYear) && checkReqBillMap.get(targetYear).containsKey(targetMonth)){
//							//세금계산서 요청된 금액이면 해당 요청된 금액을 셋팅한다.
////							calcuSalesVo.setMtSalesMayAmount(Integer.parseInt(checkReqBillMap.get(targetYear).get(targetMonth)));
//
//							mtBillReqInfo = checkReqBillMap.get(targetYear).get(targetMonth);
//							calcuSalesVo.setMtSalesMayAmount((Integer)mtBillReqInfo.get("salesTurnAmount"));
//							calcuSalesVo.setMtSalesMayCallYn((String)mtBillReqInfo.get("salesStatusCd"));
//						} else {
//							//요청된 월이 아닌 경우 해당 월을 셋팅한다.
//							calcuSalesVo.setMtSalesMayAmount(averageAmount);
//							calcuSalesVo.setMtSalesMayCallYn("N");
//						}
//					} else if("06".equals(targetMonth)) {
//						if(checkReqBillMap.containsKey(targetYear) && checkReqBillMap.get(targetYear).containsKey(targetMonth)){
//							//세금계산서 요청된 금액이면 해당 요청된 금액을 셋팅한다.
////							calcuSalesVo.setMtSalesJunAmount(Integer.parseInt(checkReqBillMap.get(targetYear).get(targetMonth)));
//
//							mtBillReqInfo = checkReqBillMap.get(targetYear).get(targetMonth);
//							calcuSalesVo.setMtSalesJunAmount((Integer)mtBillReqInfo.get("salesTurnAmount"));
//							calcuSalesVo.setMtSalesJunCallYn((String)mtBillReqInfo.get("salesStatusCd"));
//						} else {
//							//요청된 월이 아닌 경우 해당 월을 셋팅한다.
//							calcuSalesVo.setMtSalesJunAmount(averageAmount);
//							calcuSalesVo.setMtSalesJunCallYn("N");
//						}
//					} else if("07".equals(targetMonth)) {
//						if(checkReqBillMap.containsKey(targetYear) && checkReqBillMap.get(targetYear).containsKey(targetMonth)){
//							//세금계산서 요청된 금액이면 해당 요청된 금액을 셋팅한다.
////							calcuSalesVo.setMtSalesJulAmount(Integer.parseInt(checkReqBillMap.get(targetYear).get(targetMonth)));
//
//							mtBillReqInfo = checkReqBillMap.get(targetYear).get(targetMonth);
//							calcuSalesVo.setMtSalesJulAmount((Integer)mtBillReqInfo.get("salesTurnAmount"));
//							calcuSalesVo.setMtSalesJulCallYn((String)mtBillReqInfo.get("salesStatusCd"));
//						} else {
//							//요청된 월이 아닌 경우 해당 월을 셋팅한다.
//							calcuSalesVo.setMtSalesJulAmount(averageAmount);
//							calcuSalesVo.setMtSalesJulCallYn("N");
//						}
//					} else if("08".equals(targetMonth)) {
//						if(checkReqBillMap.containsKey(targetYear) && checkReqBillMap.get(targetYear).containsKey(targetMonth)){
//							//세금계산서 요청된 금액이면 해당 요청된 금액을 셋팅한다.
////							calcuSalesVo.setMtSalesAugAmount(Integer.parseInt(checkReqBillMap.get(targetYear).get(targetMonth)));
//
//							mtBillReqInfo = checkReqBillMap.get(targetYear).get(targetMonth);
//							calcuSalesVo.setMtSalesAugAmount((Integer)mtBillReqInfo.get("salesTurnAmount"));
//							calcuSalesVo.setMtSalesAugCallYn((String)mtBillReqInfo.get("salesStatusCd"));
//						} else {
//							//요청된 월이 아닌 경우 해당 월을 셋팅한다.
//							calcuSalesVo.setMtSalesAugAmount(averageAmount);
//							calcuSalesVo.setMtSalesAugCallYn("N");
//						}
//					} else if("09".equals(targetMonth)) {
//						if(checkReqBillMap.containsKey(targetYear) && checkReqBillMap.get(targetYear).containsKey(targetMonth)){
//							//세금계산서 요청된 금액이면 해당 요청된 금액을 셋팅한다.
////							calcuSalesVo.setMtSalesSepAmount(Integer.parseInt(checkReqBillMap.get(targetYear).get(targetMonth)));
//
//							mtBillReqInfo = checkReqBillMap.get(targetYear).get(targetMonth);
//							calcuSalesVo.setMtSalesSepAmount((Integer)mtBillReqInfo.get("salesTurnAmount"));
//							calcuSalesVo.setMtSalesSepCallYn((String)mtBillReqInfo.get("salesStatusCd"));
//						} else {
//							//요청된 월이 아닌 경우 해당 월을 셋팅한다.
//							calcuSalesVo.setMtSalesSepAmount(averageAmount);
//							calcuSalesVo.setMtSalesSepCallYn("N");
//						}
//					} else if("10".equals(targetMonth)) {
//						if(checkReqBillMap.containsKey(targetYear) && checkReqBillMap.get(targetYear).containsKey(targetMonth)){
//							//세금계산서 요청된 금액이면 해당 요청된 금액을 셋팅한다.
////							calcuSalesVo.setMtSalesOctAmount(Integer.parseInt(checkReqBillMap.get(targetYear).get(targetMonth)));
//
//							mtBillReqInfo = checkReqBillMap.get(targetYear).get(targetMonth);
//							calcuSalesVo.setMtSalesOctAmount((Integer)mtBillReqInfo.get("salesTurnAmount"));
//							calcuSalesVo.setMtSalesOctCallYn((String)mtBillReqInfo.get("salesStatusCd"));
//						} else {
//							//요청된 월이 아닌 경우 해당 월을 셋팅한다.
//							calcuSalesVo.setMtSalesOctAmount(averageAmount);
//							calcuSalesVo.setMtSalesOctCallYn("N");
//						}
//					} else if("11".equals(targetMonth)) {
//						if(checkReqBillMap.containsKey(targetYear) && checkReqBillMap.get(targetYear).containsKey(targetMonth)){
//							//세금계산서 요청된 금액이면 해당 요청된 금액을 셋팅한다.
////							calcuSalesVo.setMtSalesNovAmount(Integer.parseInt(checkReqBillMap.get(targetYear).get(targetMonth)));
//
//							mtBillReqInfo = checkReqBillMap.get(targetYear).get(targetMonth);
//							calcuSalesVo.setMtSalesNovAmount((Integer)mtBillReqInfo.get("salesTurnAmount"));
//							calcuSalesVo.setMtSalesNovCallYn((String)mtBillReqInfo.get("salesStatusCd"));
//						} else {
//							//요청된 월이 아닌 경우 해당 월을 셋팅한다.
//							calcuSalesVo.setMtSalesNovAmount(averageAmount);
//							calcuSalesVo.setMtSalesNovCallYn("N");
//						}
//					} else if("12".equals(targetMonth)) {
//						if(checkReqBillMap.containsKey(targetYear) && checkReqBillMap.get(targetYear).containsKey(targetMonth)){
//							//세금계산서 요청된 금액이면 해당 요청된 금액을 셋팅한다.
////							calcuSalesVo.setMtSalesDecAmount(Integer.parseInt(checkReqBillMap.get(targetYear).get(targetMonth)));
//
//							mtBillReqInfo = checkReqBillMap.get(targetYear).get(targetMonth);
//							calcuSalesVo.setMtSalesDecAmount((Integer)mtBillReqInfo.get("salesTurnAmount"));
//							calcuSalesVo.setMtSalesDecCallYn((String)mtBillReqInfo.get("salesStatusCd"));
//						} else {
//							//요청된 월이 아닌 경우 해당 월을 셋팅한다.
//							calcuSalesVo.setMtSalesDecAmount(averageAmount);
//							calcuSalesVo.setMtSalesDecCallYn("N");
//						}
//					}
//				}
//				
//				//마지막으로 변경된 년도의 객체를 저장한다.
//				yearMap.put(checkYear, calcuSalesVo);
//			}
//		} catch (Exception e) {
//			throw new Exception(e);
//		}
//		return yearMap;
//	}	 
	
//	private Map<String, MtSalesAmountVO> calcuSalesAmount(String fromDate, String toDate, int totalAmount, Map<String, MtSalesAmountVO> yearMap) throws Exception {
//		List<String> monthList = null;
//		MtSalesAmountVO salesVo = null;
//		MtSalesAmountVO calcuSalesVo = null;
//		int monthCnt = 0;
//		int avrAmount = 0;
//		String targetYear = null;
//		String targetMonth = null;
//		String checkYear = null;
//		try {
//			monthList = CepDateUtil.makeMonthListFormToEndDate(fromDate, toDate);
//			
//			if(null != monthList && monthList.size()>0) {
//				//년도에 맞는 vo를 생성한다.
//				for (int i = Integer.parseInt(fromDate.substring(0, 4)); i <= Integer.parseInt(toDate.substring(0, 4)); i++) {
////					System.out.println("=============>"+i);
//					if(!yearMap.containsKey(String.valueOf(i))) {
//						//해당 년도가 존재하지 않으면 해당 
//						salesVo = new MtSalesAmountVO();
//						salesVo.setMtSalesYear(String.valueOf(i));
//						yearMap.put(String.valueOf(i), salesVo);
//					}
//				}	
//				monthCnt = monthList.size(); // 개월수..
//				avrAmount = totalAmount/monthCnt; //월별 평균금액
//				//해당 월별로 금액배분.
//				for (int i = 0; i < monthCnt; i++) {
//					targetYear = monthList.get(i).substring(0, 4);
//					targetMonth = monthList.get(i).substring(4, 6);
//					if(null == checkYear) {
//						checkYear = targetYear;
//						calcuSalesVo = yearMap.get(targetYear);
//					}
//					
//					if(!checkYear.equals(targetYear)) {
//						//checkYear년도에 변경된 사항을 Map에 저장한다.
//						yearMap.put(checkYear, calcuSalesVo);
//						
//						//새로운 target년도를 꺼내서 저장할 수 있도록 한다.
//						calcuSalesVo = yearMap.get(targetYear);
//						checkYear = targetYear;
//					}
//					
//					//해당 월에 해당하는 값에 값을 더해준다.
//					if("01".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesJanAmount(calcuSalesVo.getMtSalesJanAmount()+avrAmount);
//					} else if("02".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesFebAmount(calcuSalesVo.getMtSalesFebAmount()+avrAmount);
//					} else if("03".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesMarAmount(calcuSalesVo.getMtSalesMarAmount()+avrAmount);
//					} else if("04".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesAprAmount(calcuSalesVo.getMtSalesAprAmount()+avrAmount);
//					} else if("05".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesMayAmount(calcuSalesVo.getMtSalesMayAmount()+avrAmount);
//					} else if("06".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesJunAmount(calcuSalesVo.getMtSalesJunAmount()+avrAmount);
//					} else if("07".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesJulAmount(calcuSalesVo.getMtSalesJulAmount()+avrAmount);
//					} else if("08".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesAugAmount(calcuSalesVo.getMtSalesAugAmount()+avrAmount);
//					} else if("09".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesSepAmount(calcuSalesVo.getMtSalesSepAmount()+avrAmount);
//					} else if("10".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesOctAmount(calcuSalesVo.getMtSalesOctAmount()+avrAmount);
//					} else if("11".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesNovAmount(calcuSalesVo.getMtSalesNovAmount()+avrAmount);
//					} else if("12".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesDecAmount(calcuSalesVo.getMtSalesDecAmount()+avrAmount);
//					}
//				}
//				
//				//마지막으로 변경된 년도의 객체를 저장한다.
//				yearMap.put(checkYear, calcuSalesVo);
//			}
//		} catch (Exception e) {
//			throw new Exception(e);
//		}
//		return yearMap;
//	}	
//	private List<MtSalesAmountVO> makeSalesAmoutList(List<MtContractProductVO> voList, String mtIntegrateKey1) {
//		Map<String, MtSalesAmountVO> yearMap = null;
//		List<MtSalesAmountVO> mtSalesAmountVOList = null;
//		int listCnt = 0;
//		MtContractProductVO vo = null;
//		int totalAmount = 0;
//		
//		List<EgovMap> mtBillReqList = null;
//		EgovMap mtBillReqInfo = null;
//		String checkYear = null;
//		String salesYear = null;
//		String salesMonth = null;
//		int mtBillReqListCnt = 0;
//		MtSalesAmountVO salesVo = null;
//		int reqBillAmount = 0;
//		try {
//			if(null != voList && voList.size()>0) {
//				System.out.println(voList.size());
//				
//				listCnt = voList.size();
//				//제품별로 금액을 계약기간 월에 나누어 생성한다.
//				for (int i = 0; i < listCnt; i++) {
//					if(null == yearMap) {
//						yearMap = new HashMap<>();
//					}
//					vo = voList.get(i);
//					//제품별 금액.
//					totalAmount = Integer.parseInt(vo.getMtPmQuantity())*Integer.parseInt(vo.getMtPmUprice());
////					logger.debug("vo.getFromDate()====>"+vo.getFromDate());
////					logger.debug("vo.getMtPmStartDt()====>"+vo.getMtPmStartDt());
////					logger.debug("vo.getToDate()====>"+vo.getToDate());
////					logger.debug("vo.getMtPmEndDt()====>"+vo.getMtPmEndDt());
////					logger.debug("totalAmount====>"+totalAmount);
////					logger.debug("yearMap====>"+yearMap);
//					yearMap = calcuSalesAmount(vo.getMtPmStartDt(), vo.getMtPmEndDt(), totalAmount, yearMap);
//				}
//				
//				/*
//				 * 세금계산서 발행 요청한 금액은 해당 월의 요청금액으로 넣어준다.
//				 * 세금계산서 발행 요청금액은 변경할 수 없으며..
//				 * 변경을 원하는 경우 세금계산서 발행 요청을 취소해야함.
//				 */
//				if(null !=yearMap && yearMap.size()>0) {
//					/*
//					 * 세금계산서 발행요청 리스트를 가져온다.
//					 * 발행요청 년월정보 =salesYearMonth
//					 * 발행요청 금액 =salesTurnAmount
//					 */
//					mtBillReqList = mtMapper.selectMtReqBillList(mtIntegrateKey);
//					if(null !=mtBillReqList && mtBillReqList.size()>0) {
//						mtBillReqListCnt = mtBillReqList.size();
//						
//						for (int i = 0; i < mtBillReqListCnt; i++) {
//							mtBillReqInfo = mtBillReqList.get(i);
//							salesYear = ((String)mtBillReqInfo.get("salesYearMonth")).substring(0, 4);
//							salesMonth = ((String)mtBillReqInfo.get("salesYearMonth")).substring(4, 6);
//							reqBillAmount = Integer.parseInt((String)mtBillReqInfo.get("salesTurnAmount"));
//							if(i==0) {
//								checkYear = salesYear;
//								salesVo = yearMap.get(salesYear);
//							}
//							
//							if(!checkYear.equals(salesYear)) {
//								salesVo = yearMap.get(salesYear);
//								checkYear = salesYear;
//							}
//							
//							//해당월의 값을 계산서 발행 요청 금액으로 셋팅한다.
//							if("01".equals(salesMonth)) {
//								salesVo.setMtSalesJanAmount(reqBillAmount);
//							} else if("02".equals(salesMonth)) {
//								salesVo.setMtSalesFebAmount(reqBillAmount);
//							} else if("03".equals(salesMonth)) {
//								salesVo.setMtSalesMarAmount(reqBillAmount);
//							} else if("04".equals(salesMonth)) {
//								salesVo.setMtSalesAprAmount(reqBillAmount);
//							} else if("05".equals(salesMonth)) {
//								salesVo.setMtSalesMayAmount(reqBillAmount);
//							} else if("06".equals(salesMonth)) {
//								salesVo.setMtSalesJunAmount(reqBillAmount);
//							} else if("07".equals(salesMonth)) {
//								salesVo.setMtSalesJulAmount(reqBillAmount);
//							} else if("08".equals(salesMonth)) {
//								salesVo.setMtSalesAugAmount(reqBillAmount);
//							} else if("09".equals(salesMonth)) {
//								salesVo.setMtSalesSepAmount(reqBillAmount);
//							} else if("10".equals(salesMonth)) {
//								salesVo.setMtSalesOctAmount(reqBillAmount);
//							} else if("11".equals(salesMonth)) {
//								salesVo.setMtSalesNovAmount(reqBillAmount);
//							} else if("12".equals(salesMonth)) {
//								salesVo.setMtSalesDecAmount(reqBillAmount);
//							}
//							//변경된 정보를 다시 yearMap 셋팅한다.
//							yearMap.put(salesYear, salesVo);
//						}
//					}
//					
//					mtSalesAmountVOList = new ArrayList<>(yearMap.values());
//				}
//			}	
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return mtSalesAmountVOList;
//	}
	
	
//	private Map<String, MtSalesAmountVO> calcuSalesAmount(String fromDate, String toDate, int totalAmount, Map<String, MtSalesAmountVO> yearMap) throws Exception {
//		List<String> monthList = null;
//		MtSalesAmountVO salesVo = null;
//		MtSalesAmountVO calcuSalesVo = null;
//		int monthCnt = 0;
//		int avrAmount = 0;
//		String targetYear = null;
//		String targetMonth = null;
//		String checkYear = null;
//		try {
//			monthList = CepDateUtil.makeMonthListFormToEndDate(fromDate, toDate);
//			
//			if(null != monthList && monthList.size()>0) {
//				//년도에 맞는 vo를 생성한다.
//				for (int i = Integer.parseInt(fromDate.substring(0, 4)); i <= Integer.parseInt(toDate.substring(0, 4)); i++) {
////					System.out.println("=============>"+i);
//					if(!yearMap.containsKey(String.valueOf(i))) {
//						//해당 년도가 존재하지 않으면 해당 
//						salesVo = new MtSalesAmountVO();
//						salesVo.setMtSalesYear(String.valueOf(i));
//						yearMap.put(String.valueOf(i), salesVo);
//					}
//				}	
//				monthCnt = monthList.size(); // 개월수..
//				avrAmount = totalAmount/monthCnt; //월별 평균금액
//				//해당 월별로 금액배분.
//				for (int i = 0; i < monthCnt; i++) {
//					targetYear = monthList.get(i).substring(0, 4);
//					targetMonth = monthList.get(i).substring(4, 6);
//					if(null == checkYear) {
//						checkYear = targetYear;
//						calcuSalesVo = yearMap.get(targetYear);
//					}
//					
//					if(!checkYear.equals(targetYear)) {
//						//checkYear년도에 변경된 사항을 Map에 저장한다.
//						yearMap.put(checkYear, calcuSalesVo);
//						
//						//새로운 target년도를 꺼내서 저장할 수 있도록 한다.
//						calcuSalesVo = yearMap.get(targetYear);
//						checkYear = targetYear;
//					}
//					
//					//해당 월에 해당하는 값에 값을 더해준다.
//					if("01".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesJanAmount(calcuSalesVo.getMtSalesJanAmount()+avrAmount);
//					} else if("02".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesFebAmount(calcuSalesVo.getMtSalesFebAmount()+avrAmount);
//					} else if("03".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesMarAmount(calcuSalesVo.getMtSalesMarAmount()+avrAmount);
//					} else if("04".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesAprAmount(calcuSalesVo.getMtSalesAprAmount()+avrAmount);
//					} else if("05".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesMayAmount(calcuSalesVo.getMtSalesMayAmount()+avrAmount);
//					} else if("06".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesJunAmount(calcuSalesVo.getMtSalesJunAmount()+avrAmount);
//					} else if("07".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesJulAmount(calcuSalesVo.getMtSalesJulAmount()+avrAmount);
//					} else if("08".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesAugAmount(calcuSalesVo.getMtSalesAugAmount()+avrAmount);
//					} else if("09".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesSepAmount(calcuSalesVo.getMtSalesSepAmount()+avrAmount);
//					} else if("10".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesOctAmount(calcuSalesVo.getMtSalesOctAmount()+avrAmount);
//					} else if("11".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesNovAmount(calcuSalesVo.getMtSalesNovAmount()+avrAmount);
//					} else if("12".equals(targetMonth)) {
//						calcuSalesVo.setMtSalesDecAmount(calcuSalesVo.getMtSalesDecAmount()+avrAmount);
//					}
//				}
//				
//				//마지막으로 변경된 년도의 객체를 저장한다.
//				yearMap.put(checkYear, calcuSalesVo);
//			}
//		} catch (Exception e) {
//			throw new Exception(e);
//		}
//		return yearMap;
//	}
	
	
	/**
	 * 
	  * @Method Name : makeBuyAmoutList
	  * @Cdate       : 2021. 1. 25.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 백계약 거래처별 제품정보를 이용하여 거래처별 매입정보를 자동생성하는 메서드
	  * @param voList
	  * @return
	 */
	private List<MtBuyAmountVO> makeBuyAmoutList(List<MtBackOrderProductVO> voList) {
		Map<String, MtBuyAmountVO> yearMap = null;
		List<MtBuyAmountVO> mtBuyAmountVOList = null;
		int listCnt = 0;
		MtBackOrderProductVO vo = null;
		int totalAmount = 0;
		try {
			if(null != voList && voList.size()>0) {
				System.out.println(voList.size());
				
				listCnt = voList.size();
				for (int i = 0; i < listCnt; i++) {
					if(null == yearMap) {
						yearMap = new HashMap<>();
					}
					vo = voList.get(i);
					totalAmount = vo.getMtOrderPmQuantity()*vo.getMtOrderPmUprice();
//					logger.debug("vo.getFromDate()====>"+vo.getFromDate());
//					logger.debug("vo.getMtPmStartDt()====>"+vo.getMtPmStartDt());
//					logger.debug("vo.getToDate()====>"+vo.getToDate());
//					logger.debug("vo.getMtPmEndDt()====>"+vo.getMtPmEndDt());
//					logger.debug("totalAmount====>"+totalAmount);
//					logger.debug("yearMap====>"+yearMap);
					yearMap = calcuBuyAmount(vo.getMtStartDt(), vo.getMtEndDt(), totalAmount, yearMap);
				}
				
				if(null !=yearMap && yearMap.size()>0) {
					mtBuyAmountVOList = new ArrayList<>(yearMap.values());
				}
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mtBuyAmountVOList;
	}
	
	
	private Map<String, MtBuyAmountVO> calcuBuyAmount(String fromDate, String toDate, int totalAmount, Map<String, MtBuyAmountVO> yearMap) throws Exception {
		List<String> monthList = null;
		MtBuyAmountVO buyVo = null;
		MtBuyAmountVO calcuBuyVo = null;
		int monthCnt = 0;
		int avrAmount = 0;
		String targetYear = null;
		String targetMonth = null;
		String checkYear = null;
		try {
			monthList = CepDateUtil.makeMonthListFormToEndDate(fromDate, toDate);
			
			if(null != monthList && monthList.size()>0) {
				//년도에 맞는 vo를 생성한다.
				for (int i = Integer.parseInt(fromDate.substring(0, 4)); i <= Integer.parseInt(toDate.substring(0, 4)); i++) {
//					System.out.println("=============>"+i);
					if(!yearMap.containsKey(String.valueOf(i))) {
						//해당 년도가 존재하지 않으면 해당 
						buyVo = new MtBuyAmountVO();
						buyVo.setMtBuyYear(String.valueOf(i));
						yearMap.put(String.valueOf(i), buyVo);
					}
				}	
				monthCnt = monthList.size(); // 개월수..
				avrAmount = totalAmount/monthCnt; //월별 평균금액
				//해당 월별로 금액배분.
				for (int i = 0; i < monthCnt; i++) {
					targetYear = monthList.get(i).substring(0, 4);
					targetMonth = monthList.get(i).substring(4, 6);
					if(null == checkYear) {
						checkYear = targetYear;
						calcuBuyVo = yearMap.get(targetYear);
					}
					
					if(!checkYear.equals(targetYear)) {
						//checkYear년도에 변경된 사항을 Map에 저장한다.
						yearMap.put(checkYear, calcuBuyVo);
						
						//새로운 target년도를 꺼내서 저장할 수 있도록 한다.
						calcuBuyVo = yearMap.get(targetYear);
						checkYear = targetYear;
					}
					
					//해당 월에 해당하는 값에 값을 더해준다.
					if("01".equals(targetMonth)) {
						calcuBuyVo.setMtBuyJanAmount(calcuBuyVo.getMtBuyJanAmount()+avrAmount);
					} else if("02".equals(targetMonth)) {
						calcuBuyVo.setMtBuyFebAmount(calcuBuyVo.getMtBuyFebAmount()+avrAmount);
					} else if("03".equals(targetMonth)) {
						calcuBuyVo.setMtBuyMarAmount(calcuBuyVo.getMtBuyMarAmount()+avrAmount);
					} else if("04".equals(targetMonth)) {
						calcuBuyVo.setMtBuyAprAmount(calcuBuyVo.getMtBuyAprAmount()+avrAmount);
					} else if("05".equals(targetMonth)) {
						calcuBuyVo.setMtBuyMayAmount(calcuBuyVo.getMtBuyMayAmount()+avrAmount);
					} else if("06".equals(targetMonth)) {
						calcuBuyVo.setMtBuyJunAmount(calcuBuyVo.getMtBuyJunAmount()+avrAmount);
					} else if("07".equals(targetMonth)) {
						calcuBuyVo.setMtBuyJulAmount(calcuBuyVo.getMtBuyJulAmount()+avrAmount);
					} else if("08".equals(targetMonth)) {
						calcuBuyVo.setMtBuyAugAmount(calcuBuyVo.getMtBuyAugAmount()+avrAmount);
					} else if("09".equals(targetMonth)) {
						calcuBuyVo.setMtBuySepAmount(calcuBuyVo.getMtBuySepAmount()+avrAmount);
					} else if("10".equals(targetMonth)) {
						calcuBuyVo.setMtBuyOctAmount(calcuBuyVo.getMtBuyOctAmount()+avrAmount);
					} else if("11".equals(targetMonth)) {
						calcuBuyVo.setMtBuyNovAmount(calcuBuyVo.getMtBuyNovAmount()+avrAmount);
					} else if("12".equals(targetMonth)) {
						calcuBuyVo.setMtBuyDecAmount(calcuBuyVo.getMtBuyDecAmount()+avrAmount);
					}
				}
				
				//마지막으로 변경된 년도의 객체를 저장한다.
				yearMap.put(checkYear, calcuBuyVo);
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return yearMap;
	}






	
}
