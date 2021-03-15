package com.cep.mngProject.mapping.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.cmm.vo.OrderProductVO;

@SuppressWarnings("serial")
@Alias("purchaseBillOpVO")
public class PurchaseBillOpVO extends PurchaseBillVO implements Serializable {
	
	private String billCallKey;
	private String billNo;
	private String billFkPjKey;
	private String billCtFkKey;
	private int billTurnNo;
	private int billAmount;
	private String billIssueStatus;
	private String billAcKey;
	
	public String getBillCallKey() {
		return billCallKey;
	}
	public void setBillCallKey(String billCallKey) {
		this.billCallKey = billCallKey;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public String getBillFkPjKey() {
		return billFkPjKey;
	}
	public void setBillFkPjKey(String billFkPjKey) {
		this.billFkPjKey = billFkPjKey;
	}
	public String getBillCtFkKey() {
		return billCtFkKey;
	}
	public void setBillCtFkKey(String billCtFkKey) {
		this.billCtFkKey = billCtFkKey;
	}
	public int getBillTurnNo() {
		return billTurnNo;
	}
	public void setBillTurnNo(int billTurnNo) {
		this.billTurnNo = billTurnNo;
	}
	public int getBillAmount() {
		return billAmount;
	}
	public void setBillAmount(int billAmount) {
		this.billAmount = billAmount;
	}
	public String getBillIssueStatus() {
		return billIssueStatus;
	}
	public void setBillIssueStatus(String billIssueStatus) {
		this.billIssueStatus = billIssueStatus;
	}
	public String getBillAcKey() {
		return billAcKey;
	}
	public void setBillAcKey(String billAcKey) {
		this.billAcKey = billAcKey;
	}
}
