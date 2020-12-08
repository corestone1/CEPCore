package com.cep.maintenance.contract.service.impl;

import java.util.List;
import java.util.Map;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.contract.vo.MtContractProductVO;
import com.cep.maintenance.contract.vo.MtContractVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mtContractMapper")
public interface MtContractMapper {
	
	
	/**
	 * 
	  * @Method Name : writeContractProductList
	  * @Cdate       : 2020. 12. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품 등록
	  * @param insertParam
	  * @throws Exception
	 */
	public void writeMtContractProductList(Map<String, Object> insertParam) throws Exception;
	

	
}
