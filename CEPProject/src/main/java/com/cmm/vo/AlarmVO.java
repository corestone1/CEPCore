package com.cmm.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("alarmVO")
public class AlarmVO implements Serializable {
	
	public String alarmKey;
	public String alarmTitle;
	public String alarmKind;
	public String alarmHit;
	public String alarmTo;
	public String pjMtKey;
	public String regDt;
	public String regTm;
	public String regEmpKey;
	public String modDt;
	public String modTm;
	public String modEmpKey;
	public String deleteYn;
	public String zeroHit;
	
	public String getAlarmKey() {
		return alarmKey;
	}
	public void setAlarmKey(String alarmKey) {
		this.alarmKey = alarmKey;
	}
	public String getAlarmTitle() {
		return alarmTitle;
	}
	public void setAlarmTitle(String alarmTitle) {
		this.alarmTitle = alarmTitle;
	}
	public String getAlarmKind() {
		return alarmKind;
	}
	public void setAlarmKind(String alarmKind) {
		this.alarmKind = alarmKind;
	}
	public String getAlarmHit() {
		return alarmHit;
	}
	public void setAlarmHit(String alarmHit) {
		this.alarmHit = alarmHit;
	}
	public String getAlarmTo() {
		return alarmTo;
	}
	public void setAlarmTo(String alarmTo) {
		this.alarmTo = alarmTo;
	}
	public String getPjMtKey() {
		return pjMtKey;
	}
	public void setPjMtKey(String pjMtKey) {
		this.pjMtKey = pjMtKey;
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
	public String getZeroHit() {
		return zeroHit;
	}
	public void setZeroHit(String zeroHit) {
		this.zeroHit = zeroHit;
	}
	
	
}
