/**
 * 
 */
package com.cep.mngCommon.product.vo;

import java.io.Serializable;

/**
 * @File Name : ProductVO.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2020. 11. 25.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 25.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */

public class ProductVO implements Serializable{
	
	private static final long serialVersionUID = -6795070489606679128L;
	private int    rowNum;
	private String pmKey;
	private String pmClassCd;
	private String pmDetailClassCd;
	private String pmLineCd;
	private String pmNmCd;
	private String mfAcKey;
	private String pmReleaseDt;
	private String eolDt;
	private String eoslDt;
	private String pmRemark;
	private String regDt;
	private String regTm;
	private String regEmpKey;
	private String modDt;
	private String modTm;
	private String modEmpKey;
	
	//제조사명을 포기하기 위한 CMM_ACCOUNT_TB.AC_NM
	private String acNm;
	
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public String getPmKey() {
		return pmKey;
	}
	public void setPmKey(String pmKey) {
		this.pmKey = pmKey;
	}
	public String getPmClassCd() {
		return pmClassCd;
	}
	public void setPmClassCd(String pmClassCd) {
		this.pmClassCd = pmClassCd;
	}
	public String getPmDetailClassCd() {
		return pmDetailClassCd;
	}
	public void setPmDetailClassCd(String pmDetailClassCd) {
		this.pmDetailClassCd = pmDetailClassCd;
	}
	public String getPmLineCd() {
		return pmLineCd;
	}
	public void setPmLineCd(String pmLineCd) {
		this.pmLineCd = pmLineCd;
	}
	public String getPmNmCd() {
		return pmNmCd;
	}
	public void setPmNmCd(String pmNmCd) {
		this.pmNmCd = pmNmCd;
	}
	public String getMfAcKey() {
		return mfAcKey;
	}
	public void setMfAcKey(String mfAcKey) {
		this.mfAcKey = mfAcKey;
	}
	public String getPmReleaseDt() {
		return pmReleaseDt;
	}
	public void setPmReleaseDt(String pmReleaseDt) {
		this.pmReleaseDt = pmReleaseDt.replaceAll("-", "");
	}
	public String getEolDt() {
		return eolDt;
	}
	public void setEolDt(String eolDt) {
		this.eolDt = eolDt.replaceAll("-", "");
	}
	public String getEoslDt() {
		return eoslDt;
	}
	public void setEoslDt(String eoslDt) {
		this.eoslDt = eoslDt.replaceAll("-", "");
	}
	public String getPmRemark() {
		return pmRemark;
	}
	public void setPmRemark(String pmRemark) {
		this.pmRemark = pmRemark;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getAcNm() {
		return acNm;
	}
	public void setAcNm(String acNm) {
		this.acNm = acNm;
	}
	
	
	
}
