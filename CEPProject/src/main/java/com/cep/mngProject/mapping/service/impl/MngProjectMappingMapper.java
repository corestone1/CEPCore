package com.cep.mngProject.mapping.service.impl;

import java.util.List;
import java.util.Map;

import com.cep.mngProject.mapping.vo.OrderBillVO;
import com.cep.mngProject.mapping.vo.PurchaseBillOpVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mngProjectMappingMapper")
public interface MngProjectMappingMapper {
	
	/**
	  * @Method Name : selectOrderBillList
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주 계산서 사상 정보 조회
	  * @param orderBillVO
	  * @return
	  */
	public List<?> selectOrderBillList(OrderBillVO orderBillVO) throws Exception;
	
	/**
	  * @Method Name : selectOrderBillDetail
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주 계산서 사상 상세 정보
	  * @param orderBillVO
	  * @return
	  */
	public OrderBillVO selectOrderDetail(OrderBillVO orderBillVO) throws Exception;
	
	/**
	  * @Method Name : selectOrderProduct
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주 제품 정보 조회
	  * @param orderBillVO
	  * @return
	  */
	public OrderBillVO selectOrderProduct(String key) throws Exception;
	
	/**
	  * @Method Name : selectBillDetail
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주별 계산서 사상 정보
	  * @param orderBillVO
	  * @return
	  */
	public List<?> selectBillDetail(OrderBillVO orderBillVO) throws Exception;
	
	/**
	  * @Method Name : updateOrderBill
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주 - 계산서 맵핑
	  * @param orderBillVO
	  * @return
	  */
	public int updateOrder(OrderBillVO orderBillVO) throws Exception;
	
	/**
	  * @Method Name : updatePurchaseBill
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주 - 계산서 맵핑
	  * @param param
	  * @return
	  */
	public int updatePurchaseBill(Map<String, Object> param) throws Exception;
	
	/**
	  * @Method Name : insertPcBillingOpInfo
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 매입 계산서 정보 등록(요청) 
	  * @param param
	  * @return
	  */
	public int insertPcBillingOpInfo(Map<String, Object> param) throws Exception;
	
	/**
	  * @Method Name : insertPcBillingOpInfo
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 매입 계산서 정보 등록(요청) 
	  * @param param
	  * @return
	  */
	public int updatePcBillingOpInfo(PurchaseBillOpVO purchasecBillOpVO) throws Exception;
	
	/**
	  * @Method Name : insertPaymentInfo
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 지급 정보 등록
	  * @param 
	  * @return
	  */
	public int insertPaymentInfo(Map<String, Object> param) throws Exception;
	
	/**
	  * @Method Name : updatePaymentInfo
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 지급 정보 수정
	  * @param 
	  * @return
	  */
	public int updatePaymentInfo(Map<String, Object> param) throws Exception;
	
}
