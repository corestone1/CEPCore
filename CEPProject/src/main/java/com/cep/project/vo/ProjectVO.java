package com.cep.project.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("projectVO")
public class ProjectVO implements Serializable {
	
	private String pjKey;
	private String acKey;
	private String pjNm;
	private String pjStartDt;
	private String pjEndDt;
	private String pjStatusCd;
	private String pjSaleEmpKey;
	
	public String getPjKey() {
		return pjKey;
	}
	public void setPjKey(String pjKey) {
		this.pjKey = pjKey;
	}
	public String getAcKey() {
		return acKey;
	}
	public void setAcKey(String acKey) {
		this.acKey = acKey;
	}
	public String getPjNm() {
		return pjNm;
	}
	public void setPjNm(String pjNm) {
		this.pjNm = pjNm;
	}
	public String getPjStartDt() {
		return pjStartDt;
	}
	public void setPjStartDt(String pjStartDt) {
		this.pjStartDt = pjStartDt;
	}
	public String getPjEndDt() {
		return pjEndDt;
	}
	public void setPjEndDt(String pjEndDt) {
		this.pjEndDt = pjEndDt;
	}
	public String getPjStatusCd() {
		return pjStatusCd;
	}
	public void setPjStatusCd(String pjStatusCd) {
		this.pjStatusCd = pjStatusCd;
	}
	public String getPjSaleEmpKey() {
		return pjSaleEmpKey;
	}
	public void setPjSaleEmpKey(String pjSaleEmpKey) {
		this.pjSaleEmpKey = pjSaleEmpKey;
	}
	
}
