package com.cep.mngMaint.bill.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;
@Alias("mtPaymentVO")
public class MtPaymentVO extends MngMaintBillSearchVO implements Serializable{
	private static final long serialVersionUID  = 1L;
	
	private String mtIntegrateKey; //유지보수 계약 PK
	private String paymentKey; //지급관리키
	private String mtOrderType; // Mt order type (BO:백계약 지급, PC:작업발주 지급) 
	private String paymentBuyFkKey; //mtOrderKey
	private String paymentDtFkKey; //지급계획 관리키(MT_PAYMENT_DETAIL_TB.PAYMENT_KEY)
	/*
	 * W:대기(PYST1000) > M:매핑 > R:요청(PYST2000) > C:승인(PYST3000) > E:지급완료(PYST4000)
	 */
	private String paymentStatusCd; //요청/승인 상태 코드 
	private String paymentStatusCdNm; //요청/승인 상태 코드명
	private int paymentTurn;//mtOrderKey+순번(자동)
	private String paymentCallDt;//지급요청일자
	private String paymentDt; //지급일자.
	private int callAmount;//지급금액(세금계산서 금액)
	private String paymentAcFkKey;//거래처 관리키(사업자번호)
	private int paymentAccSeqFkKey; // 거래처 지급계좌관리키
	private String billFkKey;//계산서번호 (CMM_PC_BILLING_TB.BILL_NO)
	private String remark; // 비고
	private String regDt;
	private String regTm;
	private String regEmpKey;
	private String modDt;
	private String modTm;
	private String modEmpKey;
	
	private String currentStatus; //현재 요청상태
	private String requestStatus; //변경할 요청상태.
	private String paymentYearMonth;
	
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
	public String getPaymentBuyFkKey() {
		return paymentBuyFkKey;
	}
	public void setPaymentBuyFkKey(String paymentBuyFkKey) {
		this.paymentBuyFkKey = paymentBuyFkKey;
	}
	public String getPaymentStatusCd() {
		return paymentStatusCd;
	}
	public void setPaymentStatusCd(String paymentStatusCd) {
		this.paymentStatusCd = paymentStatusCd;
	}
	public int getPaymentTurn() {
		return paymentTurn;
	}
	public void setPaymentTurn(int paymentTurn) {
		this.paymentTurn = paymentTurn;
	}
	public String getPaymentCallDt() {
		return paymentCallDt;
	}
	public void setPaymentCallDt(String paymentCallDt) {
		this.paymentCallDt = paymentCallDt;
	}
	public String getPaymentDt() {
		return paymentDt;
	}
	public void setPaymentDt(String paymentDt) {
		this.paymentDt = paymentDt;
	}
	public int getCallAmount() {
		return callAmount;
	}
	public void setCallAmount(int callAmount) {
		this.callAmount = callAmount;
	}
	public String getPaymentAcFkKey() {
		return paymentAcFkKey;
	}
	public void setPaymentAcFkKey(String paymentAcFkKey) {
		this.paymentAcFkKey = paymentAcFkKey;
	}
	public int getPaymentAccSeqFkKey() {
		return paymentAccSeqFkKey;
	}
	public void setPaymentAccSeqFkKey(int paymentAccSeqFkKey) {
		this.paymentAccSeqFkKey = paymentAccSeqFkKey;
	}
	public String getBillFkKey() {
		return billFkKey;
	}
	public void setBillFkKey(String billFkKey) {
		this.billFkKey = billFkKey;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getMtIntegrateKey() {
		return mtIntegrateKey;
	}
	public void setMtIntegrateKey(String mtIntegrateKey) {
		this.mtIntegrateKey = mtIntegrateKey;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getRegTm() {
		return regTm;
	}
	public void setRegTm(String regTm) {
		this.regTm = regTm;
	}
	public String getRegEmpKey() {
		return regEmpKey;
	}
	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}
	public String getModDt() {
		return modDt;
	}
	public void setModDt(String modDt) {
		this.modDt = modDt;
	}
	public String getModTm() {
		return modTm;
	}
	public void setModTm(String modTm) {
		this.modTm = modTm;
	}
	public String getModEmpKey() {
		return modEmpKey;
	}
	public void setModEmpKey(String modEmpKey) {
		this.modEmpKey = modEmpKey;
	}
	public String getPaymentStatusCdNm() {
		return paymentStatusCdNm;
	}
	public void setPaymentStatusCdNm(String paymentStatusCdNm) {
		this.paymentStatusCdNm = paymentStatusCdNm;
	}
	public String getCurrentStatus() {
		return currentStatus;
	}
	public void setCurrentStatus(String currentStatus) {
		this.currentStatus = currentStatus;
	}
	public String getRequestStatus() {
		return requestStatus;
	}
	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}
	public String getPaymentDtFkKey() {
		return paymentDtFkKey;
	}
	public void setPaymentDtFkKey(String paymentDtFkKey) {
		this.paymentDtFkKey = paymentDtFkKey;
	}
	public String getPaymentYearMonth() {
		return paymentYearMonth;
	}
	public void setPaymentYearMonth(String paymentYearMonth) {
		this.paymentYearMonth = paymentYearMonth;
	}
}
