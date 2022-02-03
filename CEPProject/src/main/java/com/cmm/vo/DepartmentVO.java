package com.cmm.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("departmentVO")
public class DepartmentVO implements Serializable {
	
	public String deptKey;
	public String deptUpKey;
	public int deptLevel;
	public String deptNm;
	public String regDt;
	public String regTm;
	public String regEmpKey;
	public String modDt;
	public String modTm;
	public String modEmpKey;
	public String deleteYn;
	
	
	
	public String getDeptKey() {
		return deptKey;
	}
	
	public void setDeptKey(String deptKey) {
		this.deptKey = deptKey;
	}
	
	public String getDeptUpKey() {
		return deptUpKey;
	}
	
	public void setDeptUpKey(String deptUpKey) {
		this.deptUpKey = deptUpKey;
	}
	
	public int getDeptLevel() {
		return deptLevel;
	}
	
	public void setDeptLevel(int deptLevel) {
		this.deptLevel = deptLevel;
	}
	
	public String getDeptNm() {
		return deptNm;
	}
	
	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
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
