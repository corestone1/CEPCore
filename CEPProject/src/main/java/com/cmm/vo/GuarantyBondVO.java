package com.cmm.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.cep.project.vo.ProjectContractVO;

@SuppressWarnings("serial")
@Alias("guarantyBondVO")
public class GuarantyBondVO extends SalesVO implements Serializable {
	
	private String gbKey;
	private String ctKey;
	private String gbClass;
	private String gbKindCd;
	private String gbStartDt;
	private String gbEndDt;
	private String gbIssueYn;
	private int gbAmount;
	
	public String getGbKey() {
		return gbKey;
	}
	public void setGbKey(String gbKey) {
		this.gbKey = gbKey;
	}
	public String getCtKey() {
		return ctKey;
	}
	public void setCtKey(String ctKey) {
		this.ctKey = ctKey;
	}
	public String getGbClass() {
		return gbClass;
	}
	public void setGbClass(String gbClass) {
		this.gbClass = gbClass;
	}
	public String getGbKindCd() {
		return gbKindCd;
	}
	public void setGbKindCd(String gbKindCd) {
		this.gbKindCd = gbKindCd;
	}
	public String getGbStartDt() {
		return gbStartDt;
	}
	public void setGbStartDt(String gbStartDt) {
		this.gbStartDt = gbStartDt;
	}
	public String getGbEndDt() {
		return gbEndDt;
	}
	public void setGbEndDt(String gbEndDt) {
		this.gbEndDt = gbEndDt;
	}
	public String getGbIssueYn() {
		return gbIssueYn;
	}
	public void setGbIssueYn(String gbIssueYn) {
		this.gbIssueYn = gbIssueYn;
	}
	public int getGbAmount() {
		return gbAmount;
	}
	public void setGbAmount(int gbAmount) {
		this.gbAmount = gbAmount;
	}
}
