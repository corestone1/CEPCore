package com.cep.project.service.impl;

import java.util.List;
import java.util.Map;

import com.cep.project.vo.ProjectPaymentVO;
import com.cep.project.vo.ProjectPurchaseVO;
import com.cmm.vo.SalesVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("projectRequestMapper")
public interface ProjectRequestMapper {
	
	/**
	* 
	* @Method Name : insertSalesInfo
	* @Cdate       : 2021. 01. 15.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매출 정보 등록
	* @param salesVO 
	* @return
	* @throws Exception
	*/
	public int insertSalesInfo(Map<String, Object> insertParam) throws Exception;
	
	/**
	* 
	* @Method Name : selectSalesDetail
	* @Cdate       : 2021. 02. 06.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매출 정보 상세 조회
	* @param salesKey 
	* @return
	* @throws Exception
	*/
	public SalesVO selectSalesGuarantyDetail(String key) throws Exception;
	public SalesVO selectGuarantyDetail(String key) throws Exception;
	
	/**
	* 
	* @Method Name : updateSalesInfo
	* @Cdate       : 2021. 02. 06.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매출 정보 수정
	* @param salesVO 
	* @return
	* @throws Exception
	*/
	public void updateSalesInfo(SalesVO salesVO) throws Exception;
	
	/**
	* 
	* @Method Name : selectPurchaseDetail
	* @Cdate       : 2021. 01. 29.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매입 정보 조회
	* @param orderKey: 발주 관리키
	* @return
	* @throws Exception
	*/
	public ProjectPurchaseVO selectPurchaseDetail(String orderKey) throws Exception;
	
	/**
	* 
	* @Method Name : insertPurchaseInfo
	* @Cdate       : 2021. 01. 29.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매입 정보 등록
	* @param purchaseVO
	* @return
	* @throws Exception
	*/
	public void insertPurchaseInfo(ProjectPurchaseVO purchaseVO) throws Exception;
	
	/**
	* 
	* @Method Name : updatePurchaseInfo
	* @Cdate       : 2021. 01. 29.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매입 정보 수정
	* @param 
	* @return
	* @throws Exception
	*/
	public void updatePurchaseInfo(ProjectPurchaseVO purchaseVO) throws Exception;
	
	/**
	* 
	* @Method Name : deletePurchaseInfo
	* @Cdate       : 2021. 01. 29.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매입 정보 삭제
	* @param purchaseVO
	* @return
	* @throws Exception
	*/
	public void deletePurchaseInfo(ProjectPurchaseVO purchaseVO) throws Exception;
	
	/**
	* 
	* @Method Name : selectPaymentList
	* @Cdate       : 2021. 01. 29.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 지급 정보 조회
	* @param buyKey: 매입 관리키
	* @return
	* @throws Exception
	*/
	public List<?> selectPaymentList(String buyKey)  throws Exception;
	
	/**
	* 
	* @Method Name : selectPaymentDetail
	* @Cdate       : 2021. 01. 29.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 지급 정보 조회
	* @param paymentBuyFkKey: 매입 관리키, paymentTurn: 지급 순번
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectPaymentDetail(ProjectPaymentVO paymentVO) throws Exception;

	/**
	* 
	* @Method Name : insertPaymentInfo
	* @Cdate       : 2021. 01. 29.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매입금 지급 정보 등록
	* @param paymentVO
	* @return
	* @throws Exception
	*/
	public void insertPaymentInfo(ProjectPaymentVO paymentVO) throws Exception;

	/**
	* 
	* @Method Name : updatePaymentInfo
	* @Cdate       : 2021. 01. 29.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매입금 지급 정보 수정
	* @param paymentVO
	* @return
	* @throws Exception
	*/
	public void updatePaymentInfo(ProjectPaymentVO paymentVO) throws Exception;

	/**
	* 
	* @Method Name : selectPrePaymentList
	* @Cdate       : 2021. 01. 23.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 기 지급 정보 조회
	* @param buyKey
	* @return
	* @throws Exception
	*/
	public List<?> selectPrePaymentList(String buyKey) throws Exception;

	/**
	* 
	* @Method Name : deletePaymentAllInfo
	* @Cdate       : 2021. 02. 10.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매입별 지급 정보 전체 삭제
	* @param buyKey
	* @return
	* @throws Exception
	*/
	public void deletePaymentAllInfo(ProjectPaymentVO paymentVO) throws Exception;


}
