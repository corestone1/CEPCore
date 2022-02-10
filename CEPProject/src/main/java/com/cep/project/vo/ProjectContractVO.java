package com.cep.project.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("projectContractVO")
public class ProjectContractVO extends ProjectVO implements Serializable {
	
	private String ctKey;
	private int ctAmount;
	private String ctDt;
	private String ctPayTerms;
	private int collectTurn;
	private String billSalesCd;
	private String billMfCd;
	private List<ProjectContractVO> projectContractVOList;
	
	public String getCtKey() {
		return ctKey;
	}
	public void setCtKey(String ctKey) {
		this.ctKey = ctKey;
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
	public List<ProjectContractVO> getProjectContractVOList() {
		return projectContractVOList;
	}
	public void setProjectContractVOList(List<ProjectContractVO> projectContractVOList) {
		this.projectContractVOList = projectContractVOList;
	}
	
}
