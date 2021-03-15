package com.cep.project.vo;

/**
 * 지급 클래스
 * @author sylim
 * @since 2021.01.29
 * @version 1.0
 * 
 * <pre>
 * << 개정 이력 >>
 * 
 * 수정일			수정자		수정내용
 * -------			-------		---------------------------------------
 * 2021.01.29	sylim			최초 생성
 * */

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.cmm.util.CepDateUtil;
import com.cmm.util.CepStringUtil;

@Alias("projectPaymentVO")
public class ProjectPaymentVO extends ProjectPurchaseVO implements Serializable {
	private static final long serialVersionUID  = 1L;
	
	private String paymentKey;
	private String paymentBuyFkKey;
	private String paymentStatusCd;
	private int paymentTurn;
	private String paymentCallDt;
	private String paymentDt;
	private int callAmount;
	private String callAmountTaxYn;
	private String paymentAcFkKey;
	private int paymentAccSeqFkKey;
	private String billFkKey;
	private String remark;
	
	public String getPaymentKey() {
		return paymentKey;
	}
	public void setPaymentKey(String paymentKey) {
		this.paymentKey = paymentKey;
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
	public String getCallAmountTaxYn() {
		return callAmountTaxYn;
	}
	public void setCallAmountTaxYn(String callAmountTaxYn) {
		this.callAmountTaxYn = callAmountTaxYn;
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
	
}
