package com.cep.project.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.ibatis.type.Alias;

import com.cmm.vo.SalesVO;

@SuppressWarnings("serial")
@Alias("projectContractSalesVO")
public class ProjectContractSalesVO extends ProjectSalesVO implements Serializable {
	
	private String ctKey;
	private String pjKey;
	private int ctAmount;
	private String ctDt;
	private String ctPayTerms;
	private int collectTurn;
	private String regEmpKey;
	private String salesKey;
	private String salesCtFkKey;
	private String salesCtClass;
	private int salesTurn;
	private int salesCollectRate;
	private int salesTurnAmount;
	private String salesChargeDt;
	private String salesBillFcDt;
	private String salesCollectFcDt;
	private String salesCollectFinishDt;
	private String salesGbYn;
	private String salesStatusCd;
	private String statusCd;
	private String isNew;
	private String billSalesCd;
	private String billMfCd;
	private List<ProjectContractSalesVO> projectContractSalesVOList;
	
	public String getCtKey() {
		return ctKey;
	}
	public void setCtKey(String ctKey) {
		this.ctKey = ctKey;
	}
	public String getPjKey() {
		return pjKey;
	}
	public void setPjKey(String pjKey) {
		this.pjKey = pjKey;
	}
	public int getCtAmount() {
		return ctAmount;
	}
	public void setCtAmount(int ctAmount) {
		this.ctAmount = ctAmount;
	}
	public String getCtDt() {
		return ctDt;
	}
	public void setCtDt(String ctDt) {
		this.ctDt = ctDt;
	}
	public String getCtPayTerms() {
		return ctPayTerms;
	}
	public void setCtPayTerms(String ctPayTerms) {
		this.ctPayTerms = ctPayTerms;
	}
	public int getCollectTurn() {
		return collectTurn;
	}
	public void setCollectTurn(int collectTurn) {
		this.collectTurn = collectTurn;
	}
	public String getRegEmpKey() {
		return regEmpKey;
	}
	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}
	public String getSalesKey() {
		return salesKey;
	}
	public void setSalesKey(String salesKey) {
		this.salesKey = salesKey;
	}
	public String getSalesCtFkKey() {
		return salesCtFkKey;
	}
	public void setSalesCtFkKey(String salesCtFkKey) {
		this.salesCtFkKey = salesCtFkKey;
	}
	public String getSalesCtClass() {
		return salesCtClass;
	}
	public void setSalesCtClass(String salesCtClass) {
		this.salesCtClass = salesCtClass;
	}
	public int getSalesTurn() {
		return salesTurn;
	}
	public void setSalesTurn(int salesTurn) {
		this.salesTurn = salesTurn;
	}
	public int getSalesCollectRate() {
		return salesCollectRate;
	}
	public void setSalesCollectRate(int salesCollectRate) {
		this.salesCollectRate = salesCollectRate;
	}
	public int getSalesTurnAmount() {
		return salesTurnAmount;
	}
	public void setSalesTurnAmount(int salesTurnAmount) {
		this.salesTurnAmount = salesTurnAmount;
	}
	public String getSalesChargeDt() {
		return salesChargeDt;
	}
	public void setSalesChargeDt(String salesChargeDt) {
		this.salesChargeDt = salesChargeDt;
	}
	public String getSalesBillFcDt() {
		return salesBillFcDt;
	}
	public void setSalesBillFcDt(String salesBillFcDt) {
		this.salesBillFcDt = salesBillFcDt;
	}
	public String getSalesCollectFcDt() {
		return salesCollectFcDt;
	}
	public void setSalesCollectFcDt(String salesCollectFcDt) {
		this.salesCollectFcDt = salesCollectFcDt;
	}
	public String getSalesCollectFinishDt() {
		return salesCollectFinishDt;
	}
	public void setSalesCollectFinishDt(String salesCollectFinishDt) {
		this.salesCollectFinishDt = salesCollectFinishDt;
	}
	public String getSalesGbYn() {
		return salesGbYn;
	}
	public void setSalesGbYn(String salesGbYn) {
		this.salesGbYn = salesGbYn;
	}
	public String getSalesStatusCd() {
		return salesStatusCd;
	}
	public void setSalesStatusCd(String salesStatusCd) {
		this.salesStatusCd = salesStatusCd;
	}
	public String getIsNew() {
		return isNew;
	}
	public void setIsNew(String isNew) {
		this.isNew = isNew;
	}
	public String getBillSalesCd() {
		return billSalesCd;
	}
	public void setBillSalesCd(String billSalesCd) {
		this.billSalesCd = billSalesCd;
	}
	public String getBillMfCd() {
		return billMfCd;
	}
	public void setBillMfCd(String billMfCd) {
		this.billMfCd = billMfCd;
	}
	public List<ProjectContractSalesVO> getProjectContractSalesVOList() {
		return projectContractSalesVOList;
	}
	public void setProjectContractSalesVOList(List<ProjectContractSalesVO> projectContractSalesVOList) {
		this.projectContractSalesVOList = projectContractSalesVOList;
	}
	public String getStatusCd() {
		return statusCd;
	}
	public void setStatusCd(String statusCd) {
		this.statusCd = statusCd;
	}
}
