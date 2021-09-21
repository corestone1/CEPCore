package com.cep.mngProject.mapping.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.cep.project.vo.ProjectPaymentVO;

@SuppressWarnings("serial")
@Alias("purchaseBillVO")
public class PurchaseBillVO extends ProjectPaymentVO implements Serializable {
	
	private String acKey;
	private String buyKey;
	private String billCtFkKey;
	private String billFkPjKey;
	private String billIssueDt;
	private String billMappingYn;
	private String billAcNm;
	private String billAcKey;
	private int billAmount;
	private int billTurnNo;
	private String billNo;
	private String billDtFrom;
	private String billDtTo;
	private String taxYn;
	private String modEmpKey;
	
	public String getAcKey() {
		return acKey;
	}
	public void setAcKey(String acKey) {
		this.acKey = acKey;
	}
	public String getBuyKey() {
		return buyKey;
	}
	public void setBuyKey(String buyKey) {
		this.buyKey = buyKey;
	}
	public String getBillCtFkKey() {
		return billCtFkKey;
	}
	public void setBillCtFkKey(String billCtFkKey) {
		this.billCtFkKey = billCtFkKey;
	}
	public String getBillFkPjKey() {
		return billFkPjKey;
	}
	public void setBillFkPjKey(String billFkPjKey) {
		this.billFkPjKey = billFkPjKey;
	}
	public String getBillIssueDt() {
		return billIssueDt;
	}
	public void setBillIssueDt(String billIssueDt) {
		this.billIssueDt = billIssueDt;
	}
	public String getBillMappingYn() {
		return billMappingYn;
	}
	public void setBillMappingYn(String billMappingYn) {
		this.billMappingYn = billMappingYn;
	}
	public String getBillAcNm() {
		return billAcNm;
	}
	public void setBillAcNm(String billAcNm) {
		this.billAcNm = billAcNm;
	}
	public String getBillAcKey() {
		return billAcKey;
	}
	public void setBillAcKey(String billAcKey) {
		this.billAcKey = billAcKey;
	}
	public int getBillAmount() {
		return billAmount;
	}
	public void setBillAmount(int billAmount) {
		this.billAmount = billAmount;
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
	public String getBillDtFrom() {
		return billDtFrom;
	}
	public void setBillDtFrom(String billDtFrom) {
		this.billDtFrom = billDtFrom;
	}
	public String getBillDtTo() {
		return billDtTo;
	}
	public void setBillDtTo(String billDtTo) {
		this.billDtTo = billDtTo;
	}
	public String getTaxYn() {
		return taxYn;
	}
	public void setTaxYn(String taxYn) {
		this.taxYn = taxYn;
	}
	public String getModEmpKey() {
		return modEmpKey;
	}
	public void setModEmpKey(String modEmpKey) {
		this.modEmpKey = modEmpKey;
	}
}
