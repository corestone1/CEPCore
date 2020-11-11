package com.cep.maintenance.service.impl;

import java.util.List;

import com.cep.maintenance.vo.MaintenanceDefaultVO;
import com.cep.maintenance.vo.MtContractVO;
import com.cep.maintenance.vo.MtWorkVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("maintenanceMapper")
public interface MaintenanceMapper {
	
	public List<MtContractVO> selectMtContractList(MaintenanceDefaultVO searchVO) throws Exception;
	
	public List<?> selectEmployeeList() throws Exception;
	
	public void deleteMtContract(MtContractVO deleteVo) throws Exception;
	
	
	public List<?> selectMtWorkList(MaintenanceDefaultVO searchVO) throws Exception;
	
	public void deleteMtWork(MtWorkVO deleteVo) throws Exception;
	
	///////////////////////////////////////////////////////
	
	public List<?> selectAcDirectorList(String acKey)  throws Exception;
	
}
