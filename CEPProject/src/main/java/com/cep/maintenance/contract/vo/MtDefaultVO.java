package com.cep.maintenance.contract.vo;

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
public class MtDefaultVO implements Serializable{
	private static final long serialVersionUID = -858838578081269359L;
	private int rowNum;
	private String fromDate; // from
	private String toDate; //to
	private String searchSaleEmpKey; //영업담당자 키 
	private String searchMtName;//검색 유지보수  프로젝트명
	private String btnOption; //검색(search),수정(edit),삭제(delete),엑셀(excel)
	private String selectKey; //선택한 항목의 key값
	private String searchWorkEmpKey; //유지보수 작업(지원)담당자
	private String searchWorkResult; // 작업결과(진행중/완료)
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
	/**
	 * @return the btnOption
	 */
	public String getBtnOption() {
		return btnOption;
	}
	/**
	 * @param btnOption the btnOption to set
	 */
	public void setBtnOption(String btnOption) {
		this.btnOption = btnOption;
	}
	/**
	 * @return the selectKey
	 */
	public String getSelectKey() {
		return selectKey;
	}
	/**
	 * @param selectKey the selectKey to set
	 */
	public void setSelectKey(String selectKey) {
		this.selectKey = selectKey;
	}
	/**
	 * @return the searchWorkEmpKey
	 */
	public String getSearchWorkEmpKey() {
		return searchWorkEmpKey;
	}
	/**
	 * @param searchWorkEmpKey the searchWorkEmpKey to set
	 */
	public void setSearchWorkEmpKey(String searchWorkEmpKey) {
		this.searchWorkEmpKey = searchWorkEmpKey;
	}
	/**
	 * @return the searchWorkResult
	 */
	public String getSearchWorkResult() {
		return searchWorkResult;
	}
	/**
	 * @param searchWorkResult the searchWorkResult to set
	 */
	public void setSearchWorkResult(String searchWorkResult) {
		this.searchWorkResult = searchWorkResult;
	}
	/**
	 * @return the rowNum
	 */
	public int getRowNum() {
		return rowNum;
	}
	/**
	 * @param rowNum the rowNum to set
	 */
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	
	
}
