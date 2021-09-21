package com.cep.mngMaint.bill.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.cmm.util.CepStringUtil;

@Alias("mngMaintBillSearchVO")
public class MngMaintBillSearchVO implements Serializable{
	private static final long serialVersionUID = 397259105811654573L;
	
	private String mtIntegrateKey; //유지보수 계약 PK
	private String billFkMtKey;//유지보수관리키(MT_INTEGRATE_KEY)
	private String pjKey;
	private int    billTurnNo;
	private String billNo;
	private String salesKey; //수금계획(매출) pk(MT_SALES_DETAIL_TB.SALES_KEY)
	private String billCtFkKey;//수금계획(매출) pk(MT_SALES_DETAIL_TB.SALES_KEY)
	private int    searchQuarter;
	private String searchFromDate;
	private String searchToDate;
	
	private String billAcKey; //사업자번호
	private String acKey;//사업자번호
	private String searchClassCd;
	private String searchAcNm;
	private String searchPjNm;
	
	private int proceedTurn; //요청회차
	private int totalTurn; //해당 유지보수 전체 요청회차
	
	/**
	 * @return String - the mtIntegrateKey
	 */
	public String getMtIntegrateKey() {
//		if("".equals(CepStringUtil.getDefaultValue(mtIntegrateKey, ""))) {
//			
//			if(!"".equals(CepStringUtil.getDefaultValue(pjKey, ""))) {
//				mtIntegrateKey = pjKey;
//			} else if(!"".equals(CepStringUtil.getDefaultValue(billFkMtKey, ""))) {
//				mtIntegrateKey = billFkMtKey;
//			}
//		}
		return mtIntegrateKey;
	}
	/**
	 * @param mtIntegrateKey the mtIntegrateKey to set
	 */
	public void setMtIntegrateKey(String mtIntegrateKey) {
		this.mtIntegrateKey = mtIntegrateKey;
		this.pjKey = mtIntegrateKey;
		this.billFkMtKey = mtIntegrateKey;
	}
	/**
	 * @return String - the billFkMtKey
	 */
	public String getBillFkMtKey() {
//		if("".equals(CepStringUtil.getDefaultValue(billFkMtKey, ""))) {
//			if(!"".equals(CepStringUtil.getDefaultValue(pjKey, ""))) {
//				billFkMtKey = pjKey;
//			} else if(!"".equals(CepStringUtil.getDefaultValue(mtIntegrateKey, ""))) {
//				billFkMtKey = pjKey;
//			}			
//		}
		return billFkMtKey;
	}
	/**
	 * @param billFkMtKey the billFkMtKey to set
	 */
	public void setBillFkMtKey(String billFkMtKey) {
		this.billFkMtKey = billFkMtKey;
		this.pjKey = billFkMtKey;
		this.mtIntegrateKey = billFkMtKey;
	}
	/**
	 * @return String - the pjKey
	 */
	public String getPjKey() {
//		if("".equals(CepStringUtil.getDefaultValue(pjKey, ""))) {
//			if(!"".equals(CepStringUtil.getDefaultValue(billFkMtKey, ""))) {
//				pjKey = billFkMtKey;
//			} else if(!"".equals(CepStringUtil.getDefaultValue(mtIntegrateKey, ""))) {
//				pjKey = mtIntegrateKey;
//			}	
//		}
		return pjKey;
	}
	/**
	 * @param pjKey the pjKey to set
	 */
	public void setPjKey(String pjKey) {
		this.pjKey = pjKey;
		this.billFkMtKey = pjKey;
		this.mtIntegrateKey = pjKey;
	}
	/**
	 * @return int - the billTurnNo
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
	 * @return String - the billNo
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
	 * @return int - the searchQuarter
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
	 * @return String - the searchFromDate
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
	 * @return String - the searchToDate
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
	 * @return String - the billAcKey
	 */
	public String getBillAcKey() {
		return billAcKey;
	}

	/**
	 * @param billAcKey the billAcKey to set
	 */
	public void setBillAcKey(String billAcKey) {
		this.billAcKey = billAcKey;
		this.acKey = billAcKey;
	}
	

	/**
	 * @return String - the acKey
	 */
	public String getAcKey() {
		return acKey;
	}

	/**
	 * @param acKey the acKey to set
	 */
	public void setAcKey(String acKey) {
		this.acKey = acKey;
		this.billAcKey = acKey;
	}
	/**
	 * @return String - the searchClassCd
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
	/**
	 * @return String - the searchAcNm
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
	 * @return String - the searchPjNm
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
	 * @return int - the proceedTurn
	 */
	public int getProceedTurn() {
		return proceedTurn;
	}
	/**
	 * @param proceedTurn the proceedTurn to set
	 */
	public void setProceedTurn(int proceedTurn) {
		this.proceedTurn = proceedTurn;
	}
	/**
	 * @return int - the totalTurn
	 */
	public int getTotalTurn() {
		return totalTurn;
	}
	/**
	 * @param totalTurn the totalTurn to set
	 */
	public void setTotalTurn(int totalTurn) {
		this.totalTurn = totalTurn;
	}
	/**
	 * @return String - the salesKey
	 */
//	public String getSalesKey() {
//		return salesKey;
//	}
//	/**
//	 * @param salesKey the salesKey to set
//	 */
//	public void setSalesKey(String salesKey) {
//		this.salesKey = salesKey;
//	}
	/**
	 * @return String - the billCtFkKey
	 */
	public String getBillCtFkKey() {
		return billCtFkKey;
	}
	/**
	 * @param billCtFkKey the billCtFkKey to set
	 */
	public void setBillCtFkKey(String billCtFkKey) {
		this.billCtFkKey = billCtFkKey;
		this.salesKey =billCtFkKey;
	}

	public String getSalesKey() {
		return salesKey;
	}
	public void setSalesKey(String salesKey) {
		this.salesKey = salesKey;
		this.billCtFkKey = salesKey;
	}
}
