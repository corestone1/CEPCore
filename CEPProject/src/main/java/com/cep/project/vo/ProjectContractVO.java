package com.cep.project.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("projectContractVO")
public class ProjectContractVO extends ProjectVO implements Serializable {
	
	private String ctKey;
	private int ctAmount;
	private String ctPayTerms;
	private String taxYn;
	private String mtCtDt;
	private int ctTurnNo;
	private String regDt;
	private String regTm;
	private String regEmpKey;
	private String modDt;
	private String modTm;
	private String modEmpKey;
	private String deleteYn;
	
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
	public String getCtPayTerms() {
		return ctPayTerms;
	}
	public void setCtPayTerms(String ctPayTerms) {
		this.ctPayTerms = ctPayTerms;
	}
	public String getTaxYn() {
		return taxYn;
	}
	public void setTaxYn(String taxYn) {
		this.taxYn = taxYn;
	}
	public String getMtCtDt() {
		return mtCtDt;
	}
	public void setMtCtDt(String mtCtDt) {
		this.mtCtDt = mtCtDt;
	}
	public int getCtTurnNo() {
		return ctTurnNo;
	}
	public void setCtTurnNo(int ctTurnNo) {
		this.ctTurnNo = ctTurnNo;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getRegTm() {
		return regTm;
	}
	public void setRegTm(String regTm) {
		this.regTm = regTm;
	}
	public String getRegEmpKey() {
		return regEmpKey;
	}
	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}
	public String getModDt() {
		return modDt;
	}
	public void setModDt(String modDt) {
		this.modDt = modDt;
	}
	public String getModTm() {
		return modTm;
	}
	public void setModTm(String modTm) {
		this.modTm = modTm;
	}
	public String getModEmpKey() {
		return modEmpKey;
	}
	public void setModEmpKey(String modEmpKey) {
		this.modEmpKey = modEmpKey;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
}
