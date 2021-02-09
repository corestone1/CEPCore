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

import com.cep.maintenance.contract.service.MtContractService;
import com.cep.maintenance.contract.service.impl.MtContractMapper;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.work.service.MtWorkService;
import com.cep.maintenance.work.vo.MtWorkProductVO;
import com.cep.maintenance.work.vo.MtWorkVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.util.CepStringUtil;



@Service("mtWorkService")
public class MtWorkServiceImpl implements MtWorkService {
	
	@Resource(name="mtContractService")
	private MtContractService service;
	
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

	
	

	
}
