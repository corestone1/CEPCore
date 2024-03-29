/**
 * 
 */
package com.cep.mngMaint.order.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

/**
 * @File Name : MngOrderSearchVO.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2021. 2. 15.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 2. 15.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
@Alias("mngMtOrderSearchVO")
public class MngMtOrderSearchVO implements Serializable {

	private static final long serialVersionUID = -3046214326120107255L;
	
	private String orderCtClass;
	private String orderKey;
	private String orderKeySearch;
	private String pjNm;
	private String orderDtFrom;
	private String orderDtTo;
	private String orderEmpNm;	
	private String regEmpKey;
	
	private String mtOrderType; //백계약 , 유지보수 작업 발주
	private String searchOderAcKeyNm; //매입처 명
	private String searchGubun;
	private String searchWord; //검색어.
	/**
	 * @return the orderCtClass
	 */
	public String getOrderCtClass() {
		return orderCtClass;
	}
	/**
	 * @param orderCtClass the orderCtClass to set
	 */
	public void setOrderCtClass(String orderCtClass) {
		this.orderCtClass = orderCtClass;
	}
	/**
	 * @return the orderKey
	 */
	public String getOrderKey() {
		return orderKey;
	}
	/**
	 * @param orderKey the orderKey to set
	 */
	public void setOrderKey(String orderKey) {
		this.orderKey = orderKey;
	}
	
	/**
	 * @return the orderKeySearch
	 */
	public String getOrderKeySearch() {
		return orderKeySearch;
	}
	/**
	 * @param orderKeySearch the orderKeySearch to set
	 */
	public void setOrderKeySearch(String orderKeySearch) {
		this.orderKeySearch = orderKeySearch;
	}
	/**
	 * @return the pjNm
	 */
	public String getPjNm() {
		return pjNm;
	}
	/**
	 * @param pjNm the pjNm to set
	 */
	public void setPjNm(String pjNm) {
		this.pjNm = pjNm;
	}
	/**
	 * @return the orderDtFrom
	 */
	public String getOrderDtFrom() {
		return orderDtFrom;
	}
	/**
	 * @param orderDtFrom the orderDtFrom to set
	 */
	public void setOrderDtFrom(String orderDtFrom) {
		this.orderDtFrom = orderDtFrom;
	}
	/**
	 * @return the orderDtTo
	 */
	public String getOrderDtTo() {
		return orderDtTo;
	}
	/**
	 * @param orderDtTo the orderDtTo to set
	 */
	public void setOrderDtTo(String orderDtTo) {
		this.orderDtTo = orderDtTo;
	}
	/**
	 * @return the orderEmpNm
	 */
	public String getOrderEmpNm() {
		return orderEmpNm;
	}
	/**
	 * @param orderEmpNm the orderEmpNm to set
	 */
	public void setOrderEmpNm(String orderEmpNm) {
		this.orderEmpNm = orderEmpNm;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
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
	 * @return String - the mtOrderType
	 */
	public String getMtOrderType() {
		return mtOrderType;
	}
	/**
	 * @param mtOrderType the mtOrderType to set
	 */
	public void setMtOrderType(String mtOrderType) {
		this.mtOrderType = mtOrderType;
	}
	/**
	 * @return String - the searchOderAcKeyNm
	 */
	public String getSearchOderAcKeyNm() {
		return searchOderAcKeyNm;
	}
	/**
	 * @param searchOderAcKeyNm the searchOderAcKeyNm to set
	 */
	public void setSearchOderAcKeyNm(String searchOderAcKeyNm) {
		this.searchOderAcKeyNm = searchOderAcKeyNm;
	}
	/**
	 * @return String - the searchGubun
	 */
	public String getSearchGubun() {
		return searchGubun;
	}
	/**
	 * @param searchGubun the searchGubun to set
	 */
	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
	}
	/**
	 * @return String - the searchWord
	 */
	public String getSearchWord() {
		return searchWord;
	}
	/**
	 * @param searchWord the searchWord to set
	 */
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	
}
