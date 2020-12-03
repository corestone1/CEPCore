package com.cep.maintenance.contract.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.maintenance.contract.service.MtContractService;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cmm.config.PrimaryKeyType;
import com.cep.maintenance.contract.vo.MtContractVO;



@Service("mtContractService")
public class MtContractServiceImpl implements MtContractService {
	
	/*private static final String MT_TOTAL_GUBUN="MA";
	private static final String MT_GUBUN="MT";
	private static final String MW_GUBUN="MW";*/
	
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




	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#writeFirestContractBasic(com.cep.maintenance.vo.MtContractVO)
	 */
	@Override
	public String writeFirestContractBasic(MtContractVO writeVo) throws Exception {
		String mtIntegrateKey = null;
		String mtCtKey = null;
		Map<Object, Object> contractMap = null;
		try {
			mtIntegrateKey = makePrimaryKey(PrimaryKeyType.MAINTENACE_CONTRACT_ALL);
			mtCtKey = makePrimaryKey(PrimaryKeyType.MAINTENACE_CONTRACT); 
			writeVo.setMtIntegrateKey(mtIntegrateKey);
			writeVo.setMtCtKey(mtCtKey);
			
			logger.info("mtIntegrateKey===>"+mtIntegrateKey);
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
		// TODO Auto-generated method stub
		return null;
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
	
}
