package com.cep.mngProject.billSchedule.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("mngProjectBillScheduleVO")
public class MngProjectBillScheduleVO implements Serializable {

	private static final long serialVersionUID = 7131092188616582062L;

	private String billType;     //매출 매출 구분(매출 : SD, 매입 : PC)
	private String quarter;      //분기(1~4분기)
	private String searchFromDt; //조회 시작일
	private String searchToDt;   //조회 종료일
	private String searchAcNm;   //거래처명
	private String searchPjNm;   //프로젝트명
	/**
	 * @return the billType
	 */
	public String getBillType() {
		return billType;
	}
	/**
	 * @param billType the billType to set
	 */
	public void setBillType(String billType) {
		this.billType = billType;
	}
	/**
	 * @return the quarter
	 */
	public String getQuarter() {
		return quarter;
	}
	/**
	 * @param quarter the quarter to set
	 */
	public void setQuarter(String quarter) {
		this.quarter = quarter;
	}
	
	/**
	 * @return the searchFromDt
	 */
	public String getSearchFromDt() {
		return searchFromDt;
	}
	/**
	 * @param searchFromDt the searchFromDt to set
	 */
	public void setSearchFromDt(String searchFromDt) {
		this.searchFromDt = searchFromDt;
	}
	/**
	 * @return the searchToDt
	 */
	public String getSearchToDt() {
		return searchToDt;
	}
	/**
	 * @param searchToDt the searchToDt to set
	 */
	public void setSearchToDt(String searchToDt) {
		this.searchToDt = searchToDt;
	}
	/**
	 * @return the searchAcNm
	 */
	public String getSearchAcNm() {
		return searchAcNm;
	}
	/**
	 * @param searchAcNm the searchAcNm to set
	 */
	public void setSearchAcNm(String searchAcNm) {
		this.searchAcNm = searchAcNm;
	}
	/**
	 * @return the searchPjNm
	 */
	public String getSearchPjNm() {
		return searchPjNm;
	}
	/**
	 * @param searchPjNm the searchPjNm to set
	 */
	public void setSearchPjNm(String searchPjNm) {
		this.searchPjNm = searchPjNm;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
