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
	 * 발주서 맵핑 팝업에서 발주메인 상세정보.
	 * <pre>
	 * </pre>
	 * 
	 * @param orderBillVO
	 * @return
	 * @throws Exception
	 * @cdate 2022. 1. 26. 오후 5:04:03
	 * @author aranghoo
	 */
	public MtOrderBillVO selectMtOrderBillDetail(MtOrderBillVO orderBillVO) throws Exception;
	
	/**
	 * 발주서 맵핑 팝업에서 하단 세금계산서 맵핑정보 리스트.
	 * <pre>
	 * </pre>
	 * 
	 * @param orderBillVO
	 * @return
	 * @throws Exception
	 * @cdate 2022. 1. 26. 오후 5:04:59
	 * @author aranghoo
	 */
	public List<?> selectMappingBillList(MtOrderBillVO orderBillVO) throws Exception;
}
