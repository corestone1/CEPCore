package com.cep.mngMaint.mapping.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.cmm.vo.OrderProductVO;

@SuppressWarnings("serial")
@Alias("mtOrderBillVO")
public class MtOrderBillVO implements Serializable {
	
	private String orderKey;
	private String orderDt;
	private int billMappingNum;
	private int buyTurn;
	private int orderAmount;
	private String pjNm;
	private String pmNmCd;
	private String orderAcNm;
	private String acKey;
	private String orderEmpNm;
	private String orderCtClass;
	private String orderDtFrom;
	private String orderDtTo;
	private List<OrderProductVO> productList;
	
	public String getOrderKey() {
		return orderKey;
	}
	public void setOrderKey(String orderKey) {
		this.orderKey = orderKey;
	}
	public String getOrderDt() {
		return orderDt;
	}
	public void setOrderDt(String orderDt) {
		this.orderDt = orderDt;
	}
	public int getBillMappingNum() {
		return billMappingNum;
	}
	public void setBillMappingNum(int billMappingNum) {
		this.billMappingNum = billMappingNum;
	}
	public int getBuyTurn() {
		return buyTurn;
	}
	public void setBuyTurn(int buyTurn) {
		this.buyTurn = buyTurn;
	}
	public int getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	public String getPjNm() {
		return pjNm;
	}
	public void setPjNm(String pjNm) {
		this.pjNm = pjNm;
	}
	public String getPmNmCd() {
		return pmNmCd;
	}
	public void setPmNmCd(String pmNmCd) {
		this.pmNmCd = pmNmCd;
	}
	public String getOrderAcNm() {
		return orderAcNm;
	}
	public void setOrderAcNm(String orderAcNm) {
		this.orderAcNm = orderAcNm;
	}
	public String getAcKey() {
		return acKey;
	}
	public void setAcKey(String acKey) {
		this.acKey = acKey;
	}
	public String getOrderEmpNm() {
		return orderEmpNm;
	}
	public void setOrderEmpNm(String orderEmpNm) {
		this.orderEmpNm = orderEmpNm;
	}
	public String getOrderCtClass() {
		return orderCtClass;
	}
	public void setOrderCtClass(String orderCtClass) {
		this.orderCtClass = orderCtClass;
	}
	public String getOrderDtFrom() {
		return orderDtFrom;
	}
	public void setOrderDtFrom(String orderDtFrom) {
		this.orderDtFrom = orderDtFrom;
	}
	public String getOrderDtTo() {
		return orderDtTo;
	}
	public void setOrderDtTo(String orderDtTo) {
		this.orderDtTo = orderDtTo;
	}
	public List<OrderProductVO> getProductList() {
		return productList;
	}
	public void setProductList(List<OrderProductVO> productList) {
		this.productList = productList;
	}
	
}
