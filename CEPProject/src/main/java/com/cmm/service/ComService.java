package com.cmm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cmm.config.PrimaryKeyType;
import com.cmm.vo.PaymentVO;
import com.cmm.vo.PurchaseVO;

public interface ComService {
	
	/**
	 * 
	  * @Method Name : selectAccountList
	  * @Cdate       : 2020. 12. 20.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 거래처를 조회하는 메소드
	  * @param keyType
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
	* @param acKey : 거래처 관리키
	* @return
	* @throws Exception
	*/
	public List<?> selectAcDirectorList(String acKey)  throws Exception;
	
	/**
	 * 
	  * @Method Name : selectEmployeeList
	  * @Cdate       : 2020. 12. 20.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 직원을 조회하는 메소드
	  * @param 
	  * @return
	  * @throws Exception
	 */
	public List<?> selectEmployeeList() throws Exception;
	
	/**
	 * 
	  * @Method Name : selectDepositList
	  * @Cdate       : 2021. 01. 30.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 거래처 계좌를 조회하는 메소드
	  * @param acKey : 거래처 관리키
	  * @return
	  * @throws Exception
	 */
	public List<?> selectDepositList(String acKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : makePrimaryKey
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 관리키를 생성하는 메서드
	  * @param keyType
	  * @return
	  * @throws Exception
	 */
	public String makePrimaryKey(PrimaryKeyType keyType) throws Exception;
	
	/**
	 * 프로젝트 매출 정보를 등록한다.
	 * @Cdate       : 2020. 01. 15.
	 * @Author      : sylim
	 * @Modification: 
	 * @Method Description : 매출 정보 등록
	 * @param salesVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> insertSalesInfo(String key, String regEmpKey, List<?> insertList) throws Exception;
	

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
	* @Method Name : selectPaymentList
	* @Cdate       : 2021. 01. 29.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 지급 정보 조회
	* @param buyKey: 매입 관리키
	* @return
	* @throws Exception
	*/
	public List<?> selectPaymentList(String buyKey) throws Exception;
	
	/**
	* 
	* @Method Name : selectPaymentDetail
	* @Cdate       : 2021. 02. 01.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 지급 정보 상세 조회
	* @param paymentVO
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectPaymentDetail(PaymentVO paymentVO) throws Exception;
	
	/**
	* 
	* @Method Name : insertPaymentInfo
	* @Cdate       : 2021. 01. 29.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 지급 정보 등록
	* @param paymentVO
	* @return
	* @throws Exception
	*/
	public Map<String, Object> insertPaymentInfo(HttpServletRequest request, PaymentVO paymentVO) throws Exception;
	
	/**
	* 
	* @Method Name : updatePaymentInfo
	* @Cdate       : 2021. 01. 29.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 지급 정보 수정
	* @param paymentVO
	* @return
	* @throws Exception
	*/
	public Map<String, Object> updatePaymentInfo(HttpServletRequest request, PaymentVO paymentVO) throws Exception;

	/**
	* 
	* @Method Name : selectPrePaymentList
	* @Cdate       : 2021. 02. 03.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 기 지급 정보 조회
	* @param buyKey
	* @return
	* @throws Exception
	*/
	List<?> selectPrePaymentList(String buyKey) throws Exception;
	
}
