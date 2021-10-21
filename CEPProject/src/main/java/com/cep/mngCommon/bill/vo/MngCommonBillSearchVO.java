package com.cep.mngCommon.bill.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("mngCommonBillSearchVO")
public class MngCommonBillSearchVO implements Serializable {
	
	private static final long serialVersionUID = 397259105811654573L;
	
	private String pjKey;
	private int    billTurnNo;
	private String billNo;
	private int    searchQuarter;
	private String searchFromDate;
	private String searchToDate;
	
	private String acKey;
	private String searchClassCd;
	private String searchCtClassCd;
	private String searchAcNm;
	private String searchPjNm;
	
	
	
	/**
	 * @return the pjKey
	 */
	public String getPjKey() {
		return pjKey;
	}
	/**
	 * @param pjKey the pjKey to set
	 */
	public void setPjKey(String pjKey) {
		this.pjKey = pjKey;
	}
	
	/**
	 * @return the billTurnNo
	 */
	public int getBillTurnNo() {
		return billTurnNo;
	}
	/**
	 * @param billTurnNo the billTurnNo to set
	 */
	public void setBillTurnNo(int billTurnNo) {
		this.billTurnNo = billTurnNo;
	}
	/**
	 * @return the billNo
	 */
	public String getBillNo() {
		return billNo;
	}
	/**
	 * @param billNo the billNo to set
	 */
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	
	/**
	 * @return the acKey
	 */
	public String getAcKey() {
		return acKey;
	}
	/**
	 * @param acKey the acKey to set
	 */
	public void setAcKey(String acKey) {
		this.acKey = acKey;
	}
	/**
	 * @return the searchQuarter
	 */
	public int getSearchQuarter() {
		return searchQuarter;
	}
	/**
	 * @param searchQuarter the searchQuarter to set
	 */
	public void setSearchQuarter(int searchQuarter) {
		this.searchQuarter = searchQuarter;
	}
	/**
	 * @return the searchFromDate
	 */
	public String getSearchFromDate() {
		return searchFromDate;
	}
	/**
	 * @param searchFromDate the searchFromDate to set
	 */
	public void setSearchFromDate(String searchFromDate) {
		this.searchFromDate = searchFromDate;
	}
	/**
	 * @return the searchToDate
	 */
	public String getSearchToDate() {
		return searchToDate;
	}
	/**
	 * @param searchToDate the searchToDate to set
	 */
	public void setSearchToDate(String searchToDate) {
		this.searchToDate = searchToDate;
	}
	/**
	 * @return the searchClassCd
	 */
	public String getSearchClassCd() {
		return searchClassCd;
	}
	/**
	 * @param searchClassCd the searchClassCd to set
	 */
	public void setSearchClassCd(String searchClassCd) {
		this.searchClassCd = searchClassCd;
	}
	
	public String getSearchCtClassCd() {
		return searchCtClassCd;
	}
	public void setSearchCtClassCd(String searchCtClassCd) {
		this.searchCtClassCd = searchCtClassCd;
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
