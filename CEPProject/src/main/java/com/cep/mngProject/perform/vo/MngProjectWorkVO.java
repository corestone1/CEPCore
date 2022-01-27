package com.cep.mngProject.perform.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.cep.project.vo.ProjectVO;

@SuppressWarnings("serial")
@Alias("mngProjectPerformVO")
public class MngProjectWorkVO extends ProjectVO implements Serializable {
	private String pjKey;
	private int pjWorkSeq;
	private String pjWorkClassCd;
	private String pjWorkDt;
	private String pjWorkTm;
	private String pjWorkTakeTm;
	private String pjWorkNm;
	private String pjWorkCont;
	private String pjWorkResult;
	private String remark;
	private String regEmpKey;
	private String modEmpKey;
	private String StatusCd;
	
	public String getPjKey() {
		return pjKey;
	}
	public void setPjKey(String pjKey) {
		this.pjKey = pjKey;
	}
	public int getPjWorkSeq() {
		return pjWorkSeq;
	}
	public void setPjWorkSeq(int pjWorkSeq) {
		this.pjWorkSeq = pjWorkSeq;
	}
	public String getPjWorkClassCd() {
		return pjWorkClassCd;
	}
	public void setPjWorkClassCd(String pjWorkClassCd) {
		this.pjWorkClassCd = pjWorkClassCd;
	}
	public String getPjWorkDt() {
		return pjWorkDt;
	}
	public void setPjWorkDt(String pjWorkDt) {
		this.pjWorkDt = pjWorkDt;
	}
	public String getPjWorkTm() {
		return pjWorkTm;
	}
	public void setPjWorkTm(String pjWorkTm) {
		this.pjWorkTm = pjWorkTm;
	}
	public String getPjWorkTakeTm() {
		return pjWorkTakeTm;
	}
	public void setPjWorkTakeTm(String pjWorkTakeTm) {
		this.pjWorkTakeTm = pjWorkTakeTm;
	}
	public String getPjWorkNm() {
		return pjWorkNm;
	}
	public void setPjWorkNm(String pjWorkNm) {
		this.pjWorkNm = pjWorkNm;
	}
	public String getPjWorkCont() {
		return pjWorkCont;
	}
	public void setPjWorkCont(String pjWorkCont) {
		this.pjWorkCont = pjWorkCont;
	}
	public String getPjWorkResult() {
		return pjWorkResult;
	}
	public void setPjWorkResult(String pjWorkResult) {
		this.pjWorkResult = pjWorkResult;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getRegEmpKey() {
		return regEmpKey;
	}
	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}
	public String getModEmpKey() {
		return modEmpKey;
	}
	public void setModEmpKey(String modEmpKey) {
		this.modEmpKey = modEmpKey;
	}
	public String getStatusCd() {
		return StatusCd;
	}
	public void setStatusCd(String statusCd) {
		StatusCd = statusCd;
	}
}
