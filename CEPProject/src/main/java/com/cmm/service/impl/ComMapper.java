package com.cmm.service.impl;

import java.util.List;
import java.util.Map;

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
	* @Cdate       : 2020. 01. 15.
	* @Author      : sylim
	* @Modification: 
	* @Method Description : 매출 정보 등록
	* @param salesVO 
	* @return
	* @throws Exception
	*/
	public int insertSalesInfo(Map<String, Object> insertParam) throws Exception;
	
}
