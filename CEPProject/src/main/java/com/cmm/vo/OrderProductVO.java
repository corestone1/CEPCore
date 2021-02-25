package com.cmm.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;


@SuppressWarnings("serial")
@Alias("orderProductVO")
public class OrderProductVO extends OrderVO implements Serializable {
	
	private String orderKey;
	private int orderSeq;
	private String orderPmFkKey;
	private int orderQuantity;
	private int orderUprice;
	private String orderReceiptDt;
	private int mtRate;
	private String freeMtStartDt;
	private String freeMtEndDt;
	private String pmNmCd;
	private String isNew;
	
	public String getOrderKey() {
		return orderKey;
	}
	public void setOrderKey(String orderKey) {
		this.orderKey = orderKey;
	}
	public int getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
	public String getOrderPmFkKey() {
		return orderPmFkKey;
	}
	public void setOrderPmFkKey(String orderPmFkKey) {
		this.orderPmFkKey = orderPmFkKey;
	}
	public int getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	public int getOrderUprice() {
		return orderUprice;
	}
	public void setOrderUprice(int orderUprice) {
		this.orderUprice = orderUprice;
	}
	public String getOrderReceiptDt() {
		return orderReceiptDt;
	}
	public void setOrderReceiptDt(String orderReceiptDt) {
		this.orderReceiptDt = orderReceiptDt;
	}
	public int getMtRate() {
		return mtRate;
	}
	public void setMtRate(int mtRate) {
		this.mtRate = mtRate;
	}
	public String getFreeMtStartDt() {
		return freeMtStartDt;
	}
	public void setFreeMtStartDt(String freeMtStartDt) {
		this.freeMtStartDt = freeMtStartDt;
	}
	public String getFreeMtEndDt() {
		return freeMtEndDt;
	}
	public void setFreeMtEndDt(String freeMtEndDt) {
		this.freeMtEndDt = freeMtEndDt;
	}
	public String getPmNmCd() {
		return pmNmCd;
	}
	public void setPmNmCd(String pmNmCd) {
		this.pmNmCd = pmNmCd;
	}
	public String getIsNew() {
		return isNew;
	}
	public void setIsNew(String isNew) {
		this.isNew = isNew;
	}
	
}
