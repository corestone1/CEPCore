package com.cep.project.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;


@SuppressWarnings("serial")
@Alias("projectOrderVO")
public class ProjectOrderProductVO extends ProjectOrderVO implements Serializable {
	
	private String orderKey;
	private int orderSeq;
	private String orderPmFkKey;
	private int orderQuantity;
	private int orderUprice;
	private int mtRate;
	private String freeMtMonth;
	private String pmNmCd;
	
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
	public int getMtRate() {
		return mtRate;
	}
	public void setMtRate(int mtRate) {
		this.mtRate = mtRate;
	}
	public String getFreeMtMonth() {
		return freeMtMonth;
	}
	public void setFreeMtMonth(String freeMtMonth) {
		this.freeMtMonth = freeMtMonth;
	}
	public String getPmNmCd() {
		return pmNmCd;
	}
	public void setPmNmCd(String pmNmCd) {
		this.pmNmCd = pmNmCd;
	}
}
