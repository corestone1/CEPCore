package com.cmm.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.cep.project.vo.ProjectVO;

@SuppressWarnings("serial")
@Alias("orderVO")
public class OrderVO extends ProjectVO implements Serializable {
	
	private String orderKey;
	private String orderCtClass;
	private String orderCtFkKey;
	private String orderDt;
	private String orderAcKey;
	private String orderAcNm;
	private String orderAcDirectorKey;
	private String orderAcDirectorNm;
	private String orderAcDirectorMbNum;
	private String orderPayTerms;
	private int orderAmount;
	private int buyTurn;
	private String taxYn;
	private List<OrderProductVO> orderProductVOList;
	
	public String getOrderKey() {
		return orderKey;
	}
	public void setOrderKey(String orderKey) {
		this.orderKey = orderKey;
	}
	public String getOrderCtClass() {
		return orderCtClass;
	}
	public void setOrderCtClass(String orderCtClass) {
		this.orderCtClass = orderCtClass;
	}
	public String getOrderCtFkKey() {
		return orderCtFkKey;
	}
	public void setOrderCtFkKey(String orderCtFkKey) {
		this.orderCtFkKey = orderCtFkKey;
	}
	public String getOrderDt() {
		return orderDt;
	}
	public void setOrderDt(String orderDt) {
		this.orderDt = orderDt;
	}
	public String getOrderAcKey() {
		return orderAcKey;
	}
	public void setOrderAcKey(String orderAcKey) {
		this.orderAcKey = orderAcKey;
	}
	public String getOrderAcNm() {
		return orderAcNm;
	}
	public void setOrderAcNm(String orderAcNm) {
		this.orderAcNm = orderAcNm;
	}
	public String getOrderAcDirectorKey() {
		return orderAcDirectorKey;
	}
	public void setOrderAcDirectorKey(String orderAcDirectorKey) {
		this.orderAcDirectorKey = orderAcDirectorKey;
	}
	public String getOrderAcDirectorNm() {
		return orderAcDirectorNm;
	}
	public void setOrderAcDirectorNm(String orderAcDirectorNm) {
		this.orderAcDirectorNm = orderAcDirectorNm;
	}
	public String getOrderAcDirectorMbNum() {
		return orderAcDirectorMbNum;
	}
	public void setOrderAcDirectorMbNum(String orderAcDirectorMbNum) {
		this.orderAcDirectorMbNum = orderAcDirectorMbNum;
	}
	public String getOrderPayTerms() {
		return orderPayTerms;
	}
	public void setOrderPayTerms(String orderPayTerms) {
		this.orderPayTerms = orderPayTerms;
	}
	public int getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	public int getBuyTurn() {
		return buyTurn;
	}
	public void setBuyTurn(int buyTurn) {
		this.buyTurn = buyTurn;
	}
	public String getTaxYn() {
		return taxYn;
	}
	public void setTaxYn(String taxYn) {
		this.taxYn = taxYn;
	}
	public List<OrderProductVO> getOrderProductVOList() {
		return orderProductVOList;
	}
	public void setOrderProductVOList(List<OrderProductVO> orderProductVOList) {
		this.orderProductVOList = orderProductVOList;
	}
	
}
