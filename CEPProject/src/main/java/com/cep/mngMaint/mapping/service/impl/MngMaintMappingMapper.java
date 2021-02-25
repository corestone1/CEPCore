package com.cep.mngMaint.mapping.service.impl;

import java.util.List;

import com.cep.mngMaint.mapping.vo.MtOrderBillVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mngMaintMappingMapper")
public interface MngMaintMappingMapper {
	
	/**
	  * @Method Name : selectOrderBillList
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주 계산서 사상 정보 조회
	  * @param orderBillVO
	  * @return
	  */
	public List<?> selectOrderBillList(MtOrderBillVO orderBillVO) throws Exception;
	
	/**
	  * @Method Name : selectOrderProduct
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주 제품 정보 조회
	  * @param orderBillVO
	  * @return
	  */
	public MtOrderBillVO selectOrderProduct(String key) throws Exception;
}
