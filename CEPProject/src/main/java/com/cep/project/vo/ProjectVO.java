package com.cep.project.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.cep.example.vo.SampleDefaultVO;

@SuppressWarnings("serial")
@Alias("projectVO")
public class ProjectVO extends SampleDefaultVO implements Serializable {
	
	private String pjKey;
	private String acKey;
	private String pjNm;
	private String pjStartDt;
	private String pjEndDt;
	private String pjStatusCd;
	private String pjSaleEmpKey;
	private String bdLimitDt;
	private String bdProposalYn;
	private String bdProposalDueDt;
	private String bdProposalPresentYn;
	private String bdProposalPresentDt;
	
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
	public String getBdLimitDt() {
		return bdLimitDt;
	}
	public void setBdLimitDt(String bdLimitDt) {
		this.bdLimitDt = bdLimitDt;
	}
	public String getBdProposalYn() {
		return bdProposalYn;
	}
	public void setBdProposalYn(String bdProposalYn) {
		this.bdProposalYn = bdProposalYn;
	}
	public String getBdProposalDueDt() {
		return bdProposalDueDt;
	}
	public void setBdProposalDueDt(String bdProposalDueDt) {
		this.bdProposalDueDt = bdProposalDueDt;
	}
	public String getBdProposalPresentYn() {
		return bdProposalPresentYn;
	}
	public void setBdProposalPresentYn(String bdProposalPresentYn) {
		this.bdProposalPresentYn = bdProposalPresentYn;
	}
	public String getBdProposalPresentDt() {
		return bdProposalPresentDt;
	}
	public void setBdProposalPresentDt(String bdProposalPresentDt) {
		this.bdProposalPresentDt = bdProposalPresentDt;
	}
	
}
