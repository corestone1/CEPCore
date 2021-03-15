package com.cep.project.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("projectBuildVO")
public class ProjectBuildVO extends ProjectVO implements Serializable {
	
	private String pjKey;
	private int inbSeq;
	private String inbPlace;
	private String inbClass;
	private String inbPmKey;
	private String inbPmNm;
	private String inbPmSerialNo;
	private String inbDeliveryDt;
	private String inbPmVer;
	private String inbSpecInfo;
	private int inbCacheMem;
	private String inbPortInfo;
	private String inbMngIp;
	private String inbPmType;
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
	public int getInbSeq() {
		return inbSeq;
	}
	public void setInbSeq(int inbSeq) {
		this.inbSeq = inbSeq;
	}
	public String getInbPlace() {
		return inbPlace;
	}
	public void setInbPlace(String inbPlace) {
		this.inbPlace = inbPlace;
	}
	public String getInbClass() {
		return inbClass;
	}
	public void setInbClass(String inbClass) {
		this.inbClass = inbClass;
	}
	public String getInbPmKey() {
		return inbPmKey;
	}
	public void setInbPmKey(String inbPmKey) {
		this.inbPmKey = inbPmKey;
	}
	public String getInbPmNm() {
		return inbPmNm;
	}
	public void setInbPmNm(String inbPmNm) {
		this.inbPmNm = inbPmNm;
	}
	public String getInbPmSerialNo() {
		return inbPmSerialNo;
	}
	public void setInbPmSerialNo(String inbPmSerialNo) {
		this.inbPmSerialNo = inbPmSerialNo;
	}
	public String getInbDeliveryDt() {
		return inbDeliveryDt;
	}
	public void setInbDeliveryDt(String inbDeliveryDt) {
		this.inbDeliveryDt = inbDeliveryDt;
	}
	public String getInbPmVer() {
		return inbPmVer;
	}
	public void setInbPmVer(String inbPmVer) {
		this.inbPmVer = inbPmVer;
	}
	public String getInbSpecInfo() {
		return inbSpecInfo;
	}
	public void setInbSpecInfo(String inbSpecInfo) {
		this.inbSpecInfo = inbSpecInfo;
	}
	public int getInbCacheMem() {
		return inbCacheMem;
	}
	public void setInbCacheMem(int inbCacheMem) {
		this.inbCacheMem = inbCacheMem;
	}
	public String getInbPortInfo() {
		return inbPortInfo;
	}
	public void setInbPortInfo(String inbPortInfo) {
		this.inbPortInfo = inbPortInfo;
	}
	public String getInbMngIp() {
		return inbMngIp;
	}
	public void setInbMngIp(String inbMngIp) {
		this.inbMngIp = inbMngIp;
	}
	public String getInbPmType() {
		return inbPmType;
	}
	public void setInbPmType(String inbPmType) {
		this.inbPmType = inbPmType;
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
