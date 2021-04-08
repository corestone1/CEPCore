/**
 * 
 */
package com.cep.forecast.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

/**
 * @File Name : ForecastSearchVO.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2020. 12. 1.
 * @version   : 1.0
 * @Description : Forecast Search용 VO
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 12. 1.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
@Alias("forecastSearchVO")
public class ForecastSearchVO implements Serializable {
	
	private static final long serialVersionUID = -8199715870875240847L;
	
	private String spKey;       //Forecast Key
	private String spState;     //진행상태
	private String pjFlag;      //구분(P:프로젝트/M:유지보수/기타)
	private String searchFlag;  //검색조건 (BN:사업명, AC:고객사, SE:영업담당자) 추후 추가
	private String searchValue; //검색조건 값
	
	private String spKeyDomId;     //Search Popup Return값을 넘기는 객체의 ID(Forecast키)
	private String spBusiNmDomId;  //Search Popup Return값을 넘기는 객체의 ID(사업명)
	
	/*
	 *  - funtion return : returnType=F
	 *  - Object return : returnType=O
	 */
	private String returnType; 	
	private String returnKey;	//Search Popup Return값을 넘기는 객체의 ID(Forecast키)
	private String returnNm;	//Search Popup Return값을 넘기는 객체의 ID(사업명)
	private String returnFunctionNm; //호출될 function명
	
	
	private String salesEmpKey;
	private String searchFromDt;
	private String searchToDt;
	
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
	 * @return the pjFlag
	 */
	public String getPjFlag() {
		return pjFlag;
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
	 * @param pjFlag the pjFlag to set
	 */
	public void setPjFlag(String pjFlag) {
		this.pjFlag = pjFlag;
	}
	/**
	 * @return the searchFlag
	 */
	public String getSearchFlag() {
		return searchFlag;
	}
	/**
	 * @param searchFlag the searchFlag to set
	 */
	public void setSearchFlag(String searchFlag) {
		this.searchFlag = searchFlag;
	}
	/**
	 * @return the searchValue
	 */
	public String getSearchValue() {
		return searchValue;
	}
	/**
	 * @param searchValue the searchValue to set
	 */
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	/**
	 * @return the spKeyDomId
	 */
	public String getSpKeyDomId() {
		return spKeyDomId;
	}
	/**
	 * @param spKeyDomId the spKeyDomId to set
	 */
	public void setSpKeyDomId(String spKeyDomId) {
		this.spKeyDomId = spKeyDomId;
	}
	/**
	 * @return the spBusiNmDomId
	 */
	public String getSpBusiNmDomId() {
		return spBusiNmDomId;
	}
	/**
	 * @param spBusiNmDomId the spBusiNmDomId to set
	 */
	public void setSpBusiNmDomId(String spBusiNmDomId) {
		this.spBusiNmDomId = spBusiNmDomId;
	}
	/**
	 * @return the returnType
	 */
	public String getReturnType() {
		return returnType;
	}
	/**
	 * @param returnType the returnType to set
	 */
	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}
	/**
	 * @return the returnKey
	 */
	public String getReturnKey() {
		return returnKey;
	}
	/**
	 * @param returnKey the returnKey to set
	 */
	public void setReturnKey(String returnKey) {
		this.returnKey = returnKey;
	}
	/**
	 * @return the returnNm
	 */
	public String getReturnNm() {
		return returnNm;
	}
	/**
	 * @param returnNm the returnNm to set
	 */
	public void setReturnNm(String returnNm) {
		this.returnNm = returnNm;
	}
	/**
	 * @return the returnFunctionNm
	 */
	public String getReturnFunctionNm() {
		return returnFunctionNm;
	}
	/**
	 * @param returnFunctionNm the returnFunctionNm to set
	 */
	public void setReturnFunctionNm(String returnFunctionNm) {
		this.returnFunctionNm = returnFunctionNm;
	}
	/**
	 * @return the salesEmpKey
	 */
	public String getSalesEmpKey() {
		return salesEmpKey;
	}
	/**
	 * @param salesEmpKey the salesEmpKey to set
	 */
	public void setSalesEmpKey(String salesEmpKey) {
		this.salesEmpKey = salesEmpKey;
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
	
	
}

