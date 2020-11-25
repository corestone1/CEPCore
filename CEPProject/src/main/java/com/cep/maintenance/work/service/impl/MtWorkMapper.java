package com.cep.maintenance.work.service.impl;

import java.util.List;
import java.util.Map;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.work.vo.MtWorkVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mtWorkMapper")
public interface MtWorkMapper {

	
	/**
	 * 
	  * @Method Name : writeWorkBasic
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 작업 등록
	  * @param mtWorkVO
	  * @throws Exception
	 */
	public void writeWorkBasic(MtWorkVO mtWorkVO) throws Exception; 
	
	/**
	 * 
	  * @Method Name : selectMtWorkList
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업 목록 조회
	  * @param searchVO
	  * @return
	  * @throws Exception
	 */
	public List<?> selectMtWorkList(MtDefaultVO searchVO) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtWork
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업 삭제
	  * @param deleteVo
	  * @throws Exception
	 */
	public void deleteMtWork(MtWorkVO deleteVo) throws Exception;
	

	
	
}
