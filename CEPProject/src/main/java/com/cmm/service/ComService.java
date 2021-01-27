package com.cmm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cmm.config.PrimaryKeyType;
import com.cmm.vo.SalesVO;

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
	* @param acKey : 고객정보 관리키
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
	  * @param keyType
	  * @return
	  * @throws Exception
	 */
	public List<?> selectEmployeeList() throws Exception;
	
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
}
