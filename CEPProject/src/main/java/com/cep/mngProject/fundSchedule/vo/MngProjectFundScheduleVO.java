package com.cep.mngProject.fundSchedule.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("mngProjectFundScheduleVO")
public class MngProjectFundScheduleVO implements Serializable {
	private String fundGb;       // S:매출, P:매입
	private String pjKey;        // 프로젝트 Key
	private String buyKey;       // 매입 Key
	
	private int    quarter;      //분기(1~4분기)
	private String searchFromDt; //조회 시작일
	private String searchToDt;   //조회 종료일
	private String searchAcNm;   //거래처명
	
	
	
	/**
	 * @return the fundGb
	 */
	public String getFundGb() {
		return fundGb;
	}
	/**
	 * @param fundGb the fundGb to set
	 */
	public void setFundGb(String fundGb) {
		this.fundGb = fundGb;
	}
	
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
	 * @return the buyKey
	 */
	public String getBuyKey() {
		return buyKey;
	}
	/**
	 * @param buyKey the buyKey to set
	 */
	public void setBuyKey(String buyKey) {
		this.buyKey = buyKey;
	}
	/**
	 * @return the quarter
	 */
	public int getQuarter() {
		return quarter;
	}
	/**
	 * @param quarter the quarter to set
	 */
	public void setQuarter(int quarter) {
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
	
	
}
