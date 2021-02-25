package com.cep.project.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("projectBiddingVO")
public class ProjectBiddingVO extends ProjectVO implements Serializable {
	
	private String bdKey;
	private String bdGbYn;
	private String bdGbStartDt;
	private String bdGbEndDt;
	private String bdGbFinishDt;
	private String bdGbFinishYn;
	private int bdGbAmount;
	private String bdLimitDt;
	private String bdLimitTm;
	private String bdProposalDueDt;
	private String bdProposalDueTm;
	private String bdProposalPresentDt;
	private String bdProposalPresentTm;
	private String bdProposalPresentYn;
	private String bdProposalYn;
	private List<ProjectBiddingFileVO> biddingFileVOList;
	
	public String getBdKey() {
		return bdKey;
	}
	public void setBdKey(String bdKey) {
		this.bdKey = bdKey;
	}
	public String getBdGbYn() {
		return bdGbYn;
	}
	public void setBdGbYn(String bdGbYn) {
		this.bdGbYn = bdGbYn;
	}
	public String getBdGbStartDt() {
		return bdGbStartDt;
	}
	public void setBdGbStartDt(String bdGbStartDt) {
		this.bdGbStartDt = bdGbStartDt;
	}
	public String getBdGbEndDt() {
		return bdGbEndDt;
	}
	public void setBdGbEndDt(String bdGbEndDt) {
		this.bdGbEndDt = bdGbEndDt;
	}
	public String getBdGbFinishDt() {
		return bdGbFinishDt;
	}
	public void setBdGbFinishDt(String bdGbFinishDt) {
		this.bdGbFinishDt = bdGbFinishDt;
	}
	public String getBdGbFinishYn() {
		return bdGbFinishYn;
	}
	public void setBdGbFinishYn(String bdGbFinishYn) {
		this.bdGbFinishYn = bdGbFinishYn;
	}
	public int getBdGbAmount() {
		return bdGbAmount;
	}
	public void setBdGbAmount(int bdGbAmount) {
		this.bdGbAmount = bdGbAmount;
	}
	public String getBdLimitDt() {
		return bdLimitDt;
	}
	public void setBdLimitDt(String bdLimitDt) {
		this.bdLimitDt = bdLimitDt;
	}
	public String getBdLimitTm() {
		return bdLimitTm;
	}
	public void setBdLimitTm(String bdLimitTm) {
		this.bdLimitTm = bdLimitTm;
	}
	public String getBdProposalDueDt() {
		return bdProposalDueDt;
	}
	public void setBdProposalDueDt(String bdProposalDueDt) {
		this.bdProposalDueDt = bdProposalDueDt;
	}
	public String getBdProposalDueTm() {
		return bdProposalDueTm;
	}
	public void setBdProposalDueTm(String bdProposalDueTm) {
		this.bdProposalDueTm = bdProposalDueTm;
	}
	public String getBdProposalPresentDt() {
		return bdProposalPresentDt;
	}
	public void setBdProposalPresentDt(String bdProposalPresentDt) {
		this.bdProposalPresentDt = bdProposalPresentDt;
	}
	public String getBdProposalPresentTm() {
		return bdProposalPresentTm;
	}
	public void setBdProposalPresentTm(String bdProposalPresentTm) {
		this.bdProposalPresentTm = bdProposalPresentTm;
	}
	public String getBdProposalPresentYn() {
		return bdProposalPresentYn;
	}
	public void setBdProposalPresentYn(String bdProposalPresentYn) {
		this.bdProposalPresentYn = bdProposalPresentYn;
	}
	public String getBdProposalYn() {
		return bdProposalYn;
	}
	public void setBdProposalYn(String bdProposalYn) {
		this.bdProposalYn = bdProposalYn;
	}
	public List<ProjectBiddingFileVO> getBiddingFileVOList() {
		return biddingFileVOList;
	}
	public void setBiddingFileVOList(List<ProjectBiddingFileVO> biddingFileVOList) {
		this.biddingFileVOList = biddingFileVOList;
	}
	
}
