package com.cep.mngProject.mapping.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.cmm.vo.DepartmentVO;
import com.cmm.vo.OrderProductVO;

@SuppressWarnings("serial")
@Alias("orderBillVO")
public class OrderBillVO extends DepartmentVO implements Serializable {
	
	private String pjOrderKey;
	private String orderDt;
	private int billMappingNum;
	private int buyTurn;
	private int orderAmount;
	private String billFkPjKey;
	private String pjNm;
	private String pmNmCd;
	private String orderAcNm;
	private String orderAcKey;
	private String acKey;
	private String orderEmpNm;
	private String orderDtFrom;
	private String orderDtTo;
	private String orderCtFkKey;
	private int billMappedAmount;
	private String buyKey;
	private String billIssueDt;
	private String billMappingYn;
	private String billAcNm;
	private String billAcKey;
	private int billAmount;
	private String billNo;
	private String billDtFrom;
	private String billDtTo;
	private String modEmpKey;
	private List<OrderProductVO> productList;
	private List<PurchaseBillVO> billList;
	
	private String mappedStatus;
	
	public String getPjOrderKey() {
		return pjOrderKey;
	}
	public void setPjOrderKey(String pjOrderKey) {
		this.pjOrderKey = pjOrderKey;
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
	public String getBillFkPjKey() {
		return billFkPjKey;
	}
	public void setBillFkPjKey(String billFkPjKey) {
		this.billFkPjKey = billFkPjKey;
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
	public String getOrderAcKey() {
		return orderAcKey;
	}
	public void setOrderAcKey(String orderAcKey) {
		this.orderAcKey = orderAcKey;
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
	public String getOrderCtFkKey() {
		return orderCtFkKey;
	}
	public void setOrderCtFkKey(String orderCtFkKey) {
		this.orderCtFkKey = orderCtFkKey;
	}
	public int getBillMappedAmount() {
		return billMappedAmount;
	}
	public void setBillMappedAmount(int billMappedAmount) {
		this.billMappedAmount = billMappedAmount;
	}
	public String getBuyKey() {
		return buyKey;
	}
	public void setBuyKey(String buyKey) {
		this.buyKey = buyKey;
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
	public String getModEmpKey() {
		return modEmpKey;
	}
	public void setModEmpKey(String modEmpKey) {
		this.modEmpKey = modEmpKey;
	}
	public List<OrderProductVO> getProductList() {
		return productList;
	}
	public void setProductList(List<OrderProductVO> productList) {
		this.productList = productList;
	}
	public List<PurchaseBillVO> getBillList() {
		return billList;
	}
	public void setBillList(List<PurchaseBillVO> billList) {
		this.billList = billList;
	}
	public String getMappedStatus() {
		return mappedStatus;
	}
	public void setMappedStatus(String mappedStatus) {
		this.mappedStatus = mappedStatus;
	}
	
	
}
