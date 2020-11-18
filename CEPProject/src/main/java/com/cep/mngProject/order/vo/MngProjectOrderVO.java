package com.cep.mngProject.order.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("mngProjectOrderVO")
public class MngProjectOrderVO implements Serializable {
	private String orderPmFkKey;
	private String orderQuantity;
	private String orderUprice;
	/*private String taxYn;*/
	private String orderPayTerms;
	private String orderAcKey;
	private String orderCategory;
	private String remark;
	private List<MngProjectOrderVO> list;
	
	public String getOrderPmFkKey() {
		return orderPmFkKey;
	}
	public void setOrderPmFkKey(String orderPmFkKey) {
		this.orderPmFkKey = orderPmFkKey;
	}
	public String getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(String orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	public String getOrderUprice() {
		return orderUprice;
	}
	public void setOrderUprice(String orderUprice) {
		this.orderUprice = orderUprice;
	}
	public String getOrderPayTerms() {
		return orderPayTerms;
	}
	public void setOrderPayTerms(String orderPayTerms) {
		this.orderPayTerms = orderPayTerms;
	}
	public String getOrderAcKey() {
		return orderAcKey;
	}
	public void setOrderAcKey(String orderAcKey) {
		this.orderAcKey = orderAcKey;
	}
	public String getOrderCategory() {
		return orderCategory;
	}
	public void setOrderCategory(String orderCategory) {
		this.orderCategory = orderCategory;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public List<MngProjectOrderVO> getList() {
		return list;
	}
	public void setList(List<MngProjectOrderVO> list) {
		this.list = list;
	}
}
