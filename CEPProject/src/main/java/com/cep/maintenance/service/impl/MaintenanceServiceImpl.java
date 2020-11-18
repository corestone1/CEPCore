package com.cep.maintenance.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.maintenance.service.MaintenanceService;
import com.cep.maintenance.vo.MaintenanceDefaultVO;
import com.cep.maintenance.vo.MtContractVO;
import com.cep.maintenance.vo.MtWorkVO;


@Service("maintenanceService")
public class MaintenanceServiceImpl implements MaintenanceService {
	
	private static final Logger logger = LoggerFactory.getLogger(MaintenanceServiceImpl.class);
	
	@Resource(name="maintenanceMapper")
	private MaintenanceMapper mapper;

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#selectMtList(com.cep.maintenance.vo.MaintenanceDefaultVO)
	 */
	@Override
	public List<MtContractVO> selectMtContractList(MaintenanceDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectMtContractList(searchVO);
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#selectEmployeeList()
	 */
	@Override
	public List<?> selectEmployeeList() throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectEmployeeList();
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#deleteMtContract(com.cep.maintenance.vo.MtContractVO)
	 */
	@Override
	public void deleteMtContract(MtContractVO deleteVo) throws Exception {
		mapper.deleteMtContract(deleteVo);
		
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#selectAcDirectorList(java.lang.String)
	 */
	@Override
	public List<?> selectAcDirectorList(String acKey) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectAcDirectorList(acKey);
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#selectMtWorkList(com.cep.maintenance.vo.MaintenanceDefaultVO)
	 */
	@Override
	public List<?> selectMtWorkList(MaintenanceDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectMtWorkList(searchVO);
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#deleteMtWork(java.lang.String)
	 */
	@Override
	public void deleteMtWork(MtWorkVO deleteVo) throws Exception {
		mapper.deleteMtWork(deleteVo);
		
	}
	
}
