package com.cep.forecast.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

/**
 * @File Name : ForecastVO.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2021. 1. 21.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 1. 21.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
@Alias("forecastVO")
public class ForecastVO implements Serializable {

	private static final long serialVersionUID = -6756383864911581845L;
	
	private String spKey;         //영업계획 관리키
	private String acKey;         //고객 사업자번호
	private String salesCtClass;  //매출 계약 구분(프로젝트, 유지보수)
	private String spBusiNm;      //영업계획 사업명
	private String pmKey;         //제품 관리키
	private String pmDetail;      //제품 상세
	private int    fcSjConfQt;    //예상 수주 확전 분기
	private int    fcBuyAmount;   //예상 매출 금액
	private int    fcSalesAmount; //예상 매입 금액
	private int    fcSalesProfit; //예상 매출 이익
	private String fcSalesDt;     //예상 매출 일자
	private String fcCollectDt;   //예상 수금 일자
	private String fcBuyPayDt;    //예상 매일 결제 일자
	private String spState;       //영업계획 진행상태(추후 정의 필요)
	private String salesAcKey;    //매출 거래처 관리키
	private String buyAcKey;      //매입 거래처 관리키
	private String remark;        //비고(영업 진행상황)
	private String pmDetail2;
	
	private String fcSalesDtYr; 
	private String fcSalesDtMt;

	private String fcCollectDtYr;
	private String fcCollectDtMt;
	
	private String fcBuyPayDtYr;
	private String fcBuyPayDtMt;
	
	private String regDt;         //등록일
	private String regTm;         //등록시간
	private String regEmpKey;     //등록 직원 관리키
	private String modDt;         //마지막 수정일
	private String modTm;         //마지막 수정시간
	private String modEmpKey;     //마지막 수정 직원 관리키
	
	private String mfAcNm;          //고객사명
	private String pmNm;            //제품명
	private String pmDetailClassCd; //제품상세구분
	private String salesAcNm;       //매출처명
	private String buyAcNm;         //매입처명 
	
	/**
	 * @return the spKey
	 */
	public String getSpKey() {
		return spKey;
	}
	/**
	 * @param spKey the spKey to set
	 */
	public void setSpKey(String spKey) {
		this.spKey = spKey;
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
	 * @return the salesCtClass
	 */
	public String getSalesCtClass() {
		return salesCtClass;
	}
	/**
	 * @param salesCtClass the salesCtClass to set
	 */
	public void setSalesCtClass(String salesCtClass) {
		this.salesCtClass = salesCtClass;
	}
	/**
	 * @return the spBusiNm
	 */
	public String getSpBusiNm() {
		return spBusiNm;
	}
	/**
	 * @param spBusiNm the spBusiNm to set
	 */
	public void setSpBusiNm(String spBusiNm) {
		this.spBusiNm = spBusiNm;
	}
	/**
	 * @return the pmKey
	 */
	public String getPmKey() {
		return pmKey;
	}
	/**
	 * @param pmKey the pmKey to set
	 */
	public void setPmKey(String pmKey) {
		this.pmKey = pmKey;
	}
	/**
	 * @return the pmDetail
	 */
	public String getPmDetail() {
		return pmDetail;
	}
	/**
	 * @param pmDetail the pmDetail to set
	 */
	public void setPmDetail(String pmDetail) {
		this.pmDetail = pmDetail;
	}
	/**
	 * @return the fcSjConfQt
	 */
	public int getFcSjConfQt() {
		return fcSjConfQt;
	}
	/**
	 * @param fcSjConfQt the fcSjConfQt to set
	 */
	public void setFcSjConfQt(int fcSjConfQt) {
		this.fcSjConfQt = fcSjConfQt;
	}
	/**
	 * @return the fcBuyAmount
	 */
	public int getFcBuyAmount() {
		return fcBuyAmount;
	}
	/**
	 * @param fcBuyAmount the fcBuyAmount to set
	 */
	public void setFcBuyAmount(int fcBuyAmount) {
		this.fcBuyAmount = fcBuyAmount;
	}
	/**
	 * @return the fcSalesAmount
	 */
	public int getFcSalesAmount() {
		return fcSalesAmount;
	}
	/**
	 * @param fcSalesAmount the fcSalesAmount to set
	 */
	public void setFcSalesAmount(int fcSalesAmount) {
		this.fcSalesAmount = fcSalesAmount;
	}
	/**
	 * @return the fcSalesProfit
	 */
	public int getFcSalesProfit() {
		return fcSalesProfit;
	}
	/**
	 * @param fcSalesProfit the fcSalesProfit to set
	 */
	public void setFcSalesProfit(int fcSalesProfit) {
		this.fcSalesProfit = fcSalesProfit;
	}
	/**
	 * @return the fcSalesDt
	 */
	public String getFcSalesDt() {
		return fcSalesDt;
	}
	/**
	 * @param fcSalesDt the fcSalesDt to set
	 */
	public void setFcSalesDt(String fcSalesDt) {
		this.fcSalesDt = fcSalesDt;
	}
	/**
	 * @return the fcCollectDt
	 */
	public String getFcCollectDt() {
		return fcCollectDt;
	}
	/**
	 * @param fcCollectDt the fcCollectDt to set
	 */
	public void setFcCollectDt(String fcCollectDt) {
		this.fcCollectDt = fcCollectDt;
	}
	/**
	 * @return the fcBuyPayDt
	 */
	public String getFcBuyPayDt() {
		return fcBuyPayDt;
	}
	/**
	 * @param fcBuyPayDt the fcBuyPayDt to set
	 */
	public void setFcBuyPayDt(String fcBuyPayDt) {
		this.fcBuyPayDt = fcBuyPayDt;
	}
	/**
	 * @return the spState
	 */
	public String getSpState() {
		return spState;
	}
	/**
	 * @param spState the spState to set
	 */
	public void setSpState(String spState) {
		this.spState = spState;
	}
	/**
	 * @return the salesAcKey
	 */
	public String getSalesAcKey() {
		return salesAcKey;
	}
	/**
	 * @param salesAcKey the salesAcKey to set
	 */
	public void setSalesAcKey(String salesAcKey) {
		this.salesAcKey = salesAcKey;
	}
	/**
	 * @return the buyAcKey
	 */
	public String getBuyAcKey() {
		return buyAcKey;
	}
	/**
	 * @param buyAcKey the buyAcKey to set
	 */
	public void setBuyAcKey(String buyAcKey) {
		this.buyAcKey = buyAcKey;
	}
	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	/**
	 * @return the pmDetail2
	 */
	public String getPmDetail2() {
		return pmDetail2;
	}
	/**
	 * @param pmDetail2 the pmDetail2 to set
	 */
	public void setPmDetail2(String pmDetail2) {
		this.pmDetail2 = pmDetail2;
	}
	/**
	 * @return the fcSalesDtYr
	 */
	public String getFcSalesDtYr() {
		return fcSalesDtYr;
	}
	/**
	 * @param fcSalesDtYr the fcSalesDtYr to set
	 */
	public void setFcSalesDtYr(String fcSalesDtYr) {
		this.fcSalesDtYr = fcSalesDtYr;
	}
	/**
	 * @return the fcSalesDtMt
	 */
	public String getFcSalesDtMt() {
		return fcSalesDtMt;
	}
	/**
	 * @param fcSalesDtMt the fcSalesDtMt to set
	 */
	public void setFcSalesDtMt(String fcSalesDtMt) {
		this.fcSalesDtMt = fcSalesDtMt;
	}
	
	/**
	 * @return the fcCollectDtYr
	 */
	public String getFcCollectDtYr() {
		return fcCollectDtYr;
	}
	/**
	 * @param fcCollectDtYr the fcCollectDtYr to set
	 */
	public void setFcCollectDtYr(String fcCollectDtYr) {
		this.fcCollectDtYr = fcCollectDtYr;
	}
	/**
	 * @return the fcCollectDtMt
	 */
	public String getFcCollectDtMt() {
		return fcCollectDtMt;
	}
	/**
	 * @param fcCollectDtMt the fcCollectDtMt to set
	 */
	public void setFcCollectDtMt(String fcCollectDtMt) {
		this.fcCollectDtMt = fcCollectDtMt;
	}
	/**
	 * @return the fcBuyPayDtYr
	 */
	public String getFcBuyPayDtYr() {
		return fcBuyPayDtYr;
	}
	/**
	 * @param fcBuyPayDtYr the fcBuyPayDtYr to set
	 */
	public void setFcBuyPayDtYr(String fcBuyPayDtYr) {
		this.fcBuyPayDtYr = fcBuyPayDtYr;
	}
	/**
	 * @return the fcBuyPayDtMt
	 */
	public String getFcBuyPayDtMt() {
		return fcBuyPayDtMt;
	}
	/**
	 * @param fcBuyPayDtMt the fcBuyPayDtMt to set
	 */
	public void setFcBuyPayDtMt(String fcBuyPayDtMt) {
		this.fcBuyPayDtMt = fcBuyPayDtMt;
	}
	/**
	 * @return the regDt
	 */
	public String getRegDt() {
		return regDt;
	}
	/**
	 * @param regDt the regDt to set
	 */
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	/**
	 * @return the regTm
	 */
	public String getRegTm() {
		return regTm;
	}
	/**
	 * @param regTm the regTm to set
	 */
	public void setRegTm(String regTm) {
		this.regTm = regTm;
	}
	/**
	 * @return the regEmpKey
	 */
	public String getRegEmpKey() {
		return regEmpKey;
	}
	/**
	 * @param regEmpKey the regEmpKey to set
	 */
	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}
	/**
	 * @return the modDt
	 */
	public String getModDt() {
		return modDt;
	}
	/**
	 * @param modDt the modDt to set
	 */
	public void setModDt(String modDt) {
		this.modDt = modDt;
	}
	/**
	 * @return the modTm
	 */
	public String getModTm() {
		return modTm;
	}
	/**
	 * @param modTm the modTm to set
	 */
	public void setModTm(String modTm) {
		this.modTm = modTm;
	}
	/**
	 * @return the modEmpKey
	 */
	public String getModEmpKey() {
		return modEmpKey;
	}
	/**
	 * @param modEmpKey the modEmpKey to set
	 */
	public void setModEmpKey(String modEmpKey) {
		this.modEmpKey = modEmpKey;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	/**
	 * @return the mfAcNm
	 */
	public String getMfAcNm() {
		return mfAcNm;
	}
	/**
	 * @param mfAcNm the mfAcNm to set
	 */
	public void setMfAcNm(String mfAcNm) {
		this.mfAcNm = mfAcNm;
	}
	/**
	 * @return the pmNm
	 */
	public String getPmNm() {
		return pmNm;
	}
	/**
	 * @param pmNm the pmNm to set
	 */
	public void setPmNm(String pmNm) {
		this.pmNm = pmNm;
	}
	/**
	 * @return the buyAcNm
	 */
	public String getBuyAcNm() {
		return buyAcNm;
	}
	/**
	 * @param buyAcNm the buyAcNm to set
	 */
	public void setBuyAcNm(String buyAcNm) {
		this.buyAcNm = buyAcNm;
	}
	/**
	 * @return the salesAcNm
	 */
	public String getSalesAcNm() {
		return salesAcNm;
	}
	/**
	 * @param salesAcNm the salesAcNm to set
	 */
	public void setSalesAcNm(String salesAcNm) {
		this.salesAcNm = salesAcNm;
	}
	/**
	 * @return the pmDetailClassCd
	 */
	public String getPmDetailClassCd() {
		return pmDetailClassCd;
	}
	/**
	 * @param pmDetailClassCd the pmDetailClassCd to set
	 */
	public void setPmDetailClassCd(String pmDetailClassCd) {
		this.pmDetailClassCd = pmDetailClassCd;
	}
	
	
}
