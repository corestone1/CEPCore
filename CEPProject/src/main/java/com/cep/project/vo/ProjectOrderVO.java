package com.cep.project.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.cep.example.vo.SampleDefaultVO;

@SuppressWarnings("serial")
@Alias("projectOrderVO")
public class ProjectOrderVO extends SampleDefaultVO implements Serializable {
	
	private String orderKey;
	private String orderCtClass;
	private String orderCtFkKey;
	private String orderDt;
	private String orderAcKey;
	private String orderAcNm;
	private String orderAcDirectorKey;
	private String orderPayTerms;
	private int orderAmount;
	private int mtOrderAmount;
	private String orderReceiptDt;
	private String taxYn;
	private List<ProjectOrderProductVO> projectOrderProductVOList;
	
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
	public int getMtOrderAmount() {
		return mtOrderAmount;
	}
	public void setMtOrderAmount(int mtOrderAmount) {
		this.mtOrderAmount = mtOrderAmount;
	}
	public String getTaxYn() {
		return taxYn;
	}
	public void setTaxYn(String taxYn) {
		this.taxYn = taxYn;
	}
	public String getOrderReceiptDt() {
		return orderReceiptDt;
	}
	public void setOrderReceiptDt(String orderReceiptDt) {
		this.orderReceiptDt = orderReceiptDt;
	}
	public List<ProjectOrderProductVO> getProjectOrderProductVOList() {
		return projectOrderProductVOList;
	}
	public void setProjectOrderProductVOList(List<ProjectOrderProductVO> projectOrderProductVOList) {
		this.projectOrderProductVOList = projectOrderProductVOList;
	}
	
}
