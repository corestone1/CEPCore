package com.cep.project.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("projectBiddingFileVO")
public class ProjectBiddingFileVO extends ProjectBiddingVO implements Serializable {
	
	private String bdKey;
	private int bdSeq;
	private String bdFileDocNm;
	private String bdFileKindCd;
	private int bdDocCnt;
	private String bdGuarantyCheck;
	
	public String getBdKey() {
		return bdKey;
	}
	public void setBdKey(String bdKey) {
		this.bdKey = bdKey;
	}
	public int getBdSeq() {
		return bdSeq;
	}
	public void setBdSeq(int bdSeq) {
		this.bdSeq = bdSeq;
	}
	public String getBdFileDocNm() {
		return bdFileDocNm;
	}
	public void setBdFileDocNm(String bdFileDocNm) {
		this.bdFileDocNm = bdFileDocNm;
	}
	public String getBdFileKindCd() {
		return bdFileKindCd;
	}
	public void setBdFileKindCd(String bdFileKindCd) {
		this.bdFileKindCd = bdFileKindCd;
	}
	public int getBdDocCnt() {
		return bdDocCnt;
	}
	public void setBdDocCnt(int bdDocCnt) {
		this.bdDocCnt = bdDocCnt;
	}
	public String getBdGuarantyCheck() {
		return bdGuarantyCheck;
	}
	public void setBdGuarantyCheck(String bdGuarantyCheck) {
		this.bdGuarantyCheck = bdGuarantyCheck;
	}
	
}
