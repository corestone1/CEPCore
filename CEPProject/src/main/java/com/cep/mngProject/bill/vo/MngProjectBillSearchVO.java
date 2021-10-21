package com.cep.mngProject.bill.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("mngProjectBillSearchVO")
public class MngProjectBillSearchVO extends MngProjectBillVO implements Serializable {

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
	
	
	public String getPjKey() {
		return pjKey;
	}
	public void setPjKey(String pjKey) {
		this.pjKey = pjKey;
	}
	public int getBillTurnNo() {
		return billTurnNo;
	}
	public void setBillTurnNo(int billTurnNo) {
		this.billTurnNo = billTurnNo;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public int getSearchQuarter() {
		return searchQuarter;
	}
	public void setSearchQuarter(int searchQuarter) {
		this.searchQuarter = searchQuarter;
	}
	public String getSearchFromDate() {
		return searchFromDate;
	}
	public void setSearchFromDate(String searchFromDate) {
		this.searchFromDate = searchFromDate;
	}
	public String getSearchToDate() {
		return searchToDate;
	}
	public void setSearchToDate(String searchToDate) {
		this.searchToDate = searchToDate;
	}
	public String getAcKey() {
		return acKey;
	}
	public void setAcKey(String acKey) {
		this.acKey = acKey;
	}
	public String getSearchClassCd() {
		return searchClassCd;
	}
	public void setSearchClassCd(String searchClassCd) {
		this.searchClassCd = searchClassCd;
	}
	public String getSearchCtClassCd() {
		return searchCtClassCd;
	}
	public void setSearchCtClassCd(String searchCtClassCd) {
		this.searchCtClassCd = searchCtClassCd;
	}
	public String getSearchAcNm() {
		return searchAcNm;
	}
	public void setSearchAcNm(String searchAcNm) {
		this.searchAcNm = searchAcNm;
	}
	public String getSearchPjNm() {
		return searchPjNm;
	}
	public void setSearchPjNm(String searchPjNm) {
		this.searchPjNm = searchPjNm;
	}
	
}
