package com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import com.cmm.vo.PaymentVO;
import com.cmm.vo.PurchaseVO;
import com.cmm.vo.SalesVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("comMapper")
public interface ComMapper {
		
	/**
	* 고객사 정보 조회
	* @Method Name : selectAccountList
	* @Cdate       : 2020. 12. 20.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 거래처 조회
	* @return
	* @throws Exception
	*/
	public List<?> selectAccountList() throws Exception;
	
	/**
	* 
	* @Method Name : selectAcDirectorList
	* @Cdate       : 2020. 11. 24.
	* @Author      : aranghoo
	* @Modification: 
	* @Method Description : 거래처 담당자정보 조회
	* @param acKey : 고객정보 관리키
	* @return
	* @throws Exception
	*/
	public List<?> selectAcDirectorList(String acKey)  throws Exception;
	
	/**
	* 직원 조회
	* @Method Name : selectEmployeeList
	* @Cdate       : 2020. 11. 24.
	* @Author      : aranghoo
	* @Modification: 
	* @Method Description :
	* @return
	* @throws Exception
	*/
	public List<?> selectEmployeeList() throws Exception;
	
	/**
	* 거래처 계좌 조회
	* @Method Name : selectDepositList
	* @Cdate       : 2021. 01. 30.
	* @Author      : sylim
	* @Modification: 
	* @Method Description :
	* @return
	* @throws Exception
	*/
	public List<?> selectDepositList(String acKey) throws Exception;
	
	
	/**
	* 
	* @Method Name : makePrimaryKey
	* @Cdate       : 2020. 11. 20.
	* @Author      : aranghoo
	* @Modification: 
	* @Method Description :
	* @param keyType : 업무구분(유지보수 :MT, 프로젝트 :PJ)
	* @return
	* @throws Exception
	*/
	public String makePrimaryKey(String keyType) throws Exception;
	
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
	public PurchaseVO selectPurchaseDetail(String orderKey) throws Exception;
	
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
	public void insertPurchaseInfo(PurchaseVO purchaseVO) throws Exception;
	
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
	public void updatePurchaseInfo(PurchaseVO purchaseVO) throws Exception;
	
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
	public void deletePurchaseInfo(PurchaseVO purchaseVO) throws Exception;
	
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
	/*public PaymentVO selectPaymentDetail(String buyKey)  throws Exception;*/
	public Map<String, Object> selectPaymentDetail(PaymentVO paymentVO) throws Exception;

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
	public void insertPaymentInfo(PaymentVO paymentVO) throws Exception;

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
	public void updatePaymentInfo(PaymentVO paymentVO) throws Exception;

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
	public void deletePaymentAllInfo(PaymentVO paymentVO) throws Exception;


}
