package com.cep.mngMaint.mapping.service;

import java.util.List;

import com.cep.mngMaint.mapping.vo.MtOrderBillVO;

public interface MngMaintMappingService {
	/**
	  * @Method Name : selectOrderBillList
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주 계산서 맵핑 정보 조회
	  * @param orderBillVO
	  * @return
	  * @throws Exception
	  */
	public List<?> selectOrderBillList(MtOrderBillVO orderBillVO) throws Exception;
	
	/**
	  * @Method Name : selectBillList
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 계산서 맵핑 정보 조회
	  * @param orderBillVO
	  * @return
	  * @throws Exception
	  */
	public List<?> selectBillList(MtOrderBillVO orderBillVO) throws Exception;
}
