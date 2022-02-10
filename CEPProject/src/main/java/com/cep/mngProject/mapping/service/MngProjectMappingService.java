package com.cep.mngProject.mapping.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cep.mngProject.mapping.vo.OrderBillVO;

public interface MngProjectMappingService {
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
	public List<?> selectOrderBillList(OrderBillVO orderBillVO) throws Exception;
	
	/**
	  * @Method Name : selectOrderBillDetail
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주 맵핑 상세 조회
	  * @param orderBillVO
	  * @return
	  * @throws Exception
	  */
	public OrderBillVO selectOrderDetail(OrderBillVO orderBillVO) throws Exception;
	
	/**
	  * @Method Name : selectBillDetail
	  * @Cdate       : 2021. 2. 17.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주별 계산서 맵핑 정보 조회
	  * @param orderBillVO
	  * @return
	  * @throws Exception
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
	  * @throws Exception
	  */
	public Map<String, Object> updateOrderBill(HttpServletRequest request, OrderBillVO orderBillVO) throws Exception;
	
	
	/**
	  * @Method Name : deleteOrderBill
	  * @Cdate       : 2022. 2. 01.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주 - 계산서 맵핑 취소
	  * @param orderBillVO
	  * @return
	  * @throws Exception
	  */
	public Map<String, Object> deleteOrderBill(HttpServletRequest request, OrderBillVO orderBillVO) throws Exception;
	
}
