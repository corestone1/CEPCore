package com.cep.maintenance.vo;

import java.io.Serializable;

/**
 * 
 * @File Name : MaintenanceDefaultVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 11. 3.
 * @version   : 1.0
 * @Description : 유지보수 검색 조건에 사용되는 변수 정의.
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 3.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MaintenanceDefaultVO implements Serializable{
	private static final long serialVersionUID = -858838578081269359L;
	
	private String fromDate; // from
	private String toDate; //to
	private String searchSaleEmpKey; //영업담당자 키 
	private String searchMtName;//검색 유지보수  프로젝트명
	/**
	 * @return the fromDate
	 */
	public String getFromDate() {
		return fromDate;
	}
	/**
	 * @param fromDate the fromDate to set
	 */
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	/**
	 * @return the toDate
	 */
	public String getToDate() {
		return toDate;
	}
	/**
	 * @param toDate the toDate to set
	 */
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	/**
	 * @return the searchSaleEmpKey
	 */
	public String getSearchSaleEmpKey() {
		return searchSaleEmpKey;
	}
	/**
	 * @param searchSaleEmpKey the searchSaleEmpKey to set
	 */
	public void setSearchSaleEmpKey(String searchSaleEmpKey) {
		this.searchSaleEmpKey = searchSaleEmpKey;
	}
	/**
	 * @return the searchMtName
	 */
	public String getSearchMtName() {
		return searchMtName;
	}
	/**
	 * @param searchMtName the searchMtName to set
	 */
	public void setSearchMtName(String searchMtName) {
		this.searchMtName = searchMtName;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
