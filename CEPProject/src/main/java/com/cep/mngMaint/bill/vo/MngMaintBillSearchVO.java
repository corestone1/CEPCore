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
	private String mtSalesOrderKey; //유지보수 매출계약 관리키
	private int    billTurnNo;
	private String billNo;
	private String salesKey; //수금계획(매출) pk(MT_SALES_DETAIL_TB.SALES_KEY)
	private String billCtFkKey;//수금계획(매출) pk(MT_SALES_DETAIL_TB.SALES_KEY)
	private int    searchQuarter;
	private String searchFromDate;
	private String searchToDate;
	
	private String billAcKey; // 거래처 사업자번호
//	private String billAcNm; // 매출처명
	private String acKey;// 고객사 사업자번호
	private String searchBillGroup; //전체(null), 매입(PC),매출(SD)구분
	private String searchAcNm;
	private String searchPjNm;
	
	private int proceedTurn; //요청회차
	private int totalTurn; //해당 유지보수 전체 요청회차
	

	private String searchGubun;
	private String searchWord; //검색어.
	
	private String mtOrderKey;//발주키
	
	private String paymentKey; //지급관리키
	
	private String mtOrderType;
	
	private String mtWorkKey; //유지보수 작업관리키
	
	private String fromDate; //검색시작일
	private String toDate; //검색 종료일.
	
	/*
	 *  - funtion return : returnType=F
	 *  - Object return : returnType=O
	 */
	private String returnType; 	
	private String returnFunctionNm; //returnType=F인 경우 부모호출될 function명
	private String returnBillNo;	//returnType이 O인 경우 팝업에서 전송할 부모 billNo가 들어갈 id값
	private String returnAmount;	//returnType이 O인 경우  팝업에서 전송할 부모 amount가 들어갈 id값
	
	private String iframGubun; // ifram내용중 list와 detail 중 어디를 보여줄지 구분하는 변수
	
	private String billType; // 매입(PC), 매출(SD) 구분
	/*
	 * 날짜검색 선택
	 * BI = BILL_ISSUE_DT : 계산서 발행일로 검색
	 * BR = 요청일로 검색
	 * 
	 * 
	 */
	private String dateSearchType; 
	
	private String searchSaleEmpNm; //영업담당자.
	
	private String paymentDtFkKey; // MT_PAYMENT_DETAIL_TB.PAYMENT_KEY
	
//	private String mtSalesAcKey;//매출처 사업자 번호
//	private String mtSalesAcNm;//매출서 사업자명.
	
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
	public String getSearchGubun() {
		return searchGubun;
	}
	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchBillGroup() {
		return searchBillGroup;
	}
	public void setSearchBillGroup(String searchBillGroup) {
		this.searchBillGroup = searchBillGroup;
	}
	public String getMtOrderKey() {
		return mtOrderKey;
	}
	public void setMtOrderKey(String mtOrderKey) {
		this.mtOrderKey = mtOrderKey;
	}
	public String getPaymentKey() {
		return paymentKey;
	}
	public void setPaymentKey(String paymentKey) {
		this.paymentKey = paymentKey;
	}
	public String getMtOrderType() {
		return mtOrderType;
	}
	public void setMtOrderType(String mtOrderType) {
		this.mtOrderType = mtOrderType;
	}
	public String getMtWorkKey() {
		return mtWorkKey;
	}
	public void setMtWorkKey(String mtWorkKey) {
		this.mtWorkKey = mtWorkKey;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getReturnType() {
		return returnType;
	}
	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}
	public String getReturnFunctionNm() {
		return returnFunctionNm;
	}
	public void setReturnFunctionNm(String returnFunctionNm) {
		this.returnFunctionNm = returnFunctionNm;
	}
	public String getReturnBillNo() {
		return returnBillNo;
	}
	public void setReturnBillNo(String returnBillNo) {
		this.returnBillNo = returnBillNo;
	}
	public String getReturnAmount() {
		return returnAmount;
	}
	public void setReturnAmount(String returnAmount) {
		this.returnAmount = returnAmount;
	}
	public String getIframGubun() {
		return iframGubun;
	}
	public void setIframGubun(String iframGubun) {
		this.iframGubun = iframGubun;
	}
	public String getBillType() {
		return billType;
	}
	public void setBillType(String billType) {
		this.billType = billType;
	}
	public String getDateSearchType() {
		return dateSearchType;
	}
	public void setDateSearchType(String dateSearchType) {
		this.dateSearchType = dateSearchType;
	}
	public String getSearchSaleEmpNm() {
		return searchSaleEmpNm;
	}
	public void setSearchSaleEmpNm(String searchSaleEmpNm) {
		this.searchSaleEmpNm = searchSaleEmpNm;
	}
	public String getMtSalesOrderKey() {
		return mtSalesOrderKey;
	}
	public void setMtSalesOrderKey(String mtSalesOrderKey) {
		this.mtSalesOrderKey = mtSalesOrderKey;
	}
	public String getPaymentDtFkKey() {
		return paymentDtFkKey;
	}
	public void setPaymentDtFkKey(String paymentDtFkKey) {
		this.paymentDtFkKey = paymentDtFkKey;
	}
//	public String getBillAcNm() {
//		return billAcNm;
//	}
//	public void setBillAcNm(String billAcNm) {
//		this.billAcNm = billAcNm;
//	}
//	public String getMtSalesAcKey() {
//		return mtSalesAcKey;
//	}
//	public void setMtSalesAcKey(String mtSalesAcKey) {
//		this.mtSalesAcKey = mtSalesAcKey;
//	}
//	public String getMtSalesAcNm() {
//		return mtSalesAcNm;
//	}
//	public void setMtSalesAcNm(String mtSalesAcNm) {
//		this.mtSalesAcNm = mtSalesAcNm;
//	}
}
