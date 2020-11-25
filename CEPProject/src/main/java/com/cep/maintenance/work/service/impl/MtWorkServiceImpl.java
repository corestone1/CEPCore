package com.cep.maintenance.work.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.maintenance.contract.service.MtContractService;
import com.cep.maintenance.contract.service.impl.MtContractMapper;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.work.service.MtWorkService;
import com.cep.maintenance.work.vo.MtWorkVO;
import com.cmm.config.PrimaryKeyType;



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
	public List<?> selectMtWorkList(MtDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mtwMapper.selectMtWorkList(searchVO);
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#deleteMtWork(java.lang.String)
	 */
	@Override
	public void deleteMtWork(MtWorkVO deleteVo) throws Exception {
		mtwMapper.deleteMtWork(deleteVo);
		
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#writeWorkBasic(com.cep.maintenance.vo.MtWorkVO)
	 */
	@Override
	public String writeWorkBasic(MtWorkVO mtWorkVO) throws Exception {
		
		String mtWorkKey = null;
		Map<Object, Object> contractMap = null;
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
	

	
}
