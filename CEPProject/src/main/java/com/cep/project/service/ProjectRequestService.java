package com.cep.project.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectPaymentVO;
import com.cep.project.vo.ProjectPurchaseVO;
import com.cmm.vo.SalesVO;

public interface ProjectRequestService {
	
	/**
	 * 매출 정보를 등록한다.
	 * @Cdate       : 2021. 01. 15.
	 * @Author      : sylim
	 * @Modification: 
	 * @Method Description : 매출 정보 등록
	 * @param salesVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> insertSalesInfo(ProjectContractSalesVO projectContractSalesVO) throws Exception;
	
	/**
	 * 매출 정보를 조회한다.
	 * @Cdate       : 2021. 02. 05.
	 * @Author      : sylim
	 * @Modification: 
	 * @Method Description : 매출 정보 상세 조회
	 * @param key: salesKey
	 * @return
	 * @throws Exception
	 */
	public SalesVO selectSalesGuarantyDetail(String key) throws Exception;
	
	/**
	 * 매출 정보를 수정한다..
	 * @Cdate       : 2021. 02. 05.
	 * @Author      : sylim
	 * @Modification: 
	 * @Method Description : 매출 정보 수정
	 * @param key: salesKey
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> updateSalesInfo(SalesVO salesVO) throws Exception;

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
	public Map<String, Object> insertPurchaseInfo(HttpServletRequest request, ProjectPurchaseVO purchaseVO) throws Exception;
	
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
	public Map<String, Object> selectPaymentDetail(ProjectPaymentVO paymentVO) throws Exception;
	
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
	public Map<String, Object> insertPaymentInfo(HttpServletRequest request, ProjectPaymentVO paymentVO) throws Exception;
	
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
	public Map<String, Object> updatePaymentInfo(HttpServletRequest request, ProjectPaymentVO paymentVO) throws Exception;

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
	public List<?> selectPrePaymentList(String buyKey) throws Exception;
	
}
