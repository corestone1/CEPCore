package com.cep.project.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.cep.example.vo.SampleDefaultVO;
import com.cmm.util.CepDateUtil;

@SuppressWarnings("serial")
@Alias("projectVO")
public class ProjectVO extends SampleDefaultVO implements Serializable {
	
	private String pjKey;
	private String acKey;
	private int    acDirectorKey;
	private String pjNm;
	private String pjStartDt;
	private String pjInspectDt;
	private String pjEndDt;
	private String pjStatusCd;
	private String pjSaleEmpKey;
	private String pjSupportEmpKey;
	private String remark;
	private String deleteYn;
	private String regEmpKey;
	private String spKey;
	
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
	public int getAcDirectorKey() {
		return acDirectorKey;
	}
	public void setAcDirectorKey(int acDirectorKey) {
		this.acDirectorKey = acDirectorKey;
	}
	public String getPjNm() {
		return pjNm;
	}
	public void setPjNm(String pjNm) {
		this.pjNm = pjNm;
	}
	public String getPjStartDt() {
		return CepDateUtil.convertDate(pjStartDt, null, null, "D");
	}
	public void setPjStartDt(String pjStartDt) {
		this.pjStartDt = pjStartDt;
	}
	public String getPjInspectDt() {
		return pjInspectDt;
	}
	public void setPjInspectDt(String pjInspectDt) {
		this.pjInspectDt = pjInspectDt;
	}
	public String getPjEndDt() {
		return CepDateUtil.convertDate(pjEndDt, null, null, "D");
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
	public String getPjSupportEmpKey() {
		return pjSupportEmpKey;
	}
	public void setPjSupportEmpKey(String pjSupportEmpKey) {
		this.pjSupportEmpKey = pjSupportEmpKey;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getRegEmpKey() {
		return regEmpKey;
	}
	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}
	public String getSpKey() {
		return spKey;
	}
	public void setSpKey(String spKey) {
		this.spKey = spKey;
	}
	
}
