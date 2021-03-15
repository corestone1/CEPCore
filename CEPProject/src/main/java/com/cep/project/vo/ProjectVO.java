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
	private String acNm;
	private String acDirectorKey;
	private String pjNm;
	private String pjStartDt;
	private String pjInspectDt;
	private String pjEndDt;
	private String ctDt;
	private String pjStatusCd;
	private String pjSaleEmpKey;
	private String pjSupportEmpKey;
	private String remark;
	private String finishRemark;
	private String deleteYn;
	private String spKey;
	private String pjLoseCause;
	private String pjSjYn;
	
	private String bdKey;  //ynk
	private String regEmpKey;
	
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
	public String getAcNm() {
		return acNm;
	}
	public void setAcNm(String acNm) {
		this.acNm = acNm;
	}
	public String getAcDirectorKey() {
		return acDirectorKey;
	}
	public void setAcDirectorKey(String acDirectorKey) {
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
	public String getCtDt() {
		return CepDateUtil.convertDate(ctDt, null, null, "D");
	}
	public void setCtDt(String ctDt) {
		this.ctDt = ctDt;
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
	public String getFinishRemark() {
		return finishRemark;
	}
	public void setFinishRemark(String finishRemark) {
		this.finishRemark = finishRemark;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getSpKey() {
		return spKey;
	}
	public void setSpKey(String spKey) {
		this.spKey = spKey;
	}
	public String getPjLoseCause() {
		return pjLoseCause;
	}
	public void setPjLoseCause(String pjLoseCause) {
		this.pjLoseCause = pjLoseCause;
	}
	public String getPjSjYn() {
		return pjSjYn;
	}
	public void setPjSjYn(String pjSjYn) {
		this.pjSjYn = pjSjYn;
	}
	
	/**
	 * @return the bdKey
	 */
	public String getBdKey() {
		return bdKey;
	}
	/**
	 * @param bdKey the bdKey to set
	 */
	public void setBdKey(String bdKey) {
		this.bdKey = bdKey;
	}
	
	
	/**
	 * @return the regEmpKey
	 */
	public String getRegEmpKey() {
		return regEmpKey;
	}
	/**
	 * @param regEmpKey the regEmpKey to set
	 */
	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}
	@Override
	public String toString() {
		return "ProjectVO [pjKey=" + pjKey + ", acKey=" + acKey + ", acDirectorKey=" + acDirectorKey + ", pjNm=" + pjNm
				+ ", pjStartDt=" + pjStartDt + ", pjInspectDt=" + pjInspectDt + ", pjEndDt=" + pjEndDt + ", ctDt="
				+ ctDt + ", pjStatusCd=" + pjStatusCd + ", pjSaleEmpKey=" + pjSaleEmpKey + ", pjSupportEmpKey="
				+ pjSupportEmpKey + ", remark=" + remark + ", finishRemark=" + finishRemark + ", deleteYn=" + deleteYn
				+ ", spKey=" + spKey + ", pjLoseCause=" + pjLoseCause + ", pjSjYn=" + pjSjYn + "]";
	}
	
}
