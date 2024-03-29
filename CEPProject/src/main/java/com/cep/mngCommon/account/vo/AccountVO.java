/**
 * 
 */
package com.cep.mngCommon.account.vo;

import java.io.Serializable;
import java.util.List;

import com.cep.example.vo.SampleDefaultVO;

/**
 * @File Name : AccountVO.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2021. 1. 6.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 1. 6.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */

public class AccountVO extends SampleDefaultVO implements Serializable {

	private static final long serialVersionUID = -2709806820615818683L;

	private int    rowNum;
	private String acKey;
	private String acBusiNum;
	private String acSalesYn;
	private String acBuyYn;
	private String acNm;
	private String acAddr;
	private String acAddrDetail;
	private String acCeoNm;
	private String acRepTel;
	private String acRepFax;
	private String regDt;
	private String regTm;
	private String regEmpKey;
	private String modDt;
	private String modTm;
	private String modEmpKey;
	private String deleteDirectorList;
	private String deleteDepositList;
	private List<AccountDirectorVO> accountDirectorVO;
	private List<AccountDepositVO> accountDepositVO;
	
	/**
	 * @return the rowNum
	 */
	public int getRowNum() {
		return rowNum;
	}
	/**
	 * @param rowNum the rowNum to set
	 */
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	/**
	 * @return the acBusiNum
	 */
	public String getAcBusiNum() {
		return acBusiNum;
	}
	/**
	 * @param acBusiNum the acBusiNum to set
	 */
	public void setAcBusiNum(String acBusiNum) {
		this.acBusiNum = acBusiNum;
	}
	/**
	 * @return the acKey
	 */
	public String getAcKey() {
		return acKey;
	}
	/**
	 * @param acKey the acKey to set
	 */
	public void setAcKey(String acKey) {
		this.acKey = acKey;
	}
	/**
	 * @return the acSalesYN
	 */
	public String getAcSalesYn() {
		return acSalesYn;
	}
	/**
	 * @param acSalesYN the acSalesYN to set
	 */
	public void setAcSalesYn(String acSalesYn) {
		this.acSalesYn = acSalesYn;
	}
	/**
	 * @return the acBuyYN
	 */
	public String getAcBuyYn() {
		return acBuyYn;
	}
	/**
	 * @param acBuyYN the acBuyYN to set
	 */
	public void setAcBuyYn(String acBuyYn) {
		this.acBuyYn = acBuyYn;
	}
	/**
	 * @return the acNm
	 */
	public String getAcNm() {
		return acNm;
	}
	/**
	 * @param acNm the acNm to set
	 */
	public void setAcNm(String acNm) {
		this.acNm = acNm;
	}
	/**
	 * @return the acAddr
	 */
	public String getAcAddr() {
		return acAddr;
	}
	/**
	 * @param acAddr the acAddr to set
	 */
	public void setAcAddr(String acAddr) {
		this.acAddr = acAddr;
	}
	/**
	 * @return the acAddrDetail
	 */
	public String getAcAddrDetail() {
		return acAddrDetail;
	}
	/**
	 * @param acAddrDetail the acAddrDetail to set
	 */
	public void setAcAddrDetail(String acAddrDetail) {
		this.acAddrDetail = acAddrDetail;
	}
	/**
	 * @return the acCeoNm
	 */
	public String getAcCeoNm() {
		return acCeoNm;
	}
	/**
	 * @param acCeoNm the acCeoNm to set
	 */
	public void setAcCeoNm(String acCeoNm) {
		this.acCeoNm = acCeoNm;
	}
	/**
	 * @return the acRepTel
	 */
	public String getAcRepTel() {
		return acRepTel;
	}
	/**
	 * @param acRepTel the acRepTel to set
	 */
	public void setAcRepTel(String acRepTel) {
		this.acRepTel = acRepTel;
	}
	/**
	 * @return the acRepFax
	 */
	public String getAcRepFax() {
		return acRepFax;
	}
	/**
	 * @param acRepFax the acRepFax to set
	 */
	public void setAcRepFax(String acRepFax) {
		this.acRepFax = acRepFax;
	}
	/**
	 * @return the regDt
	 */
	public String getRegDt() {
		return regDt;
	}
	/**
	 * @param regDt the regDt to set
	 */
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	/**
	 * @return the regTm
	 */
	public String getRegTm() {
		return regTm;
	}
	/**
	 * @param regTm the regTm to set
	 */
	public void setRegTm(String regTm) {
		this.regTm = regTm;
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
	/**
	 * @return the modDt
	 */
	public String getModDt() {
		return modDt;
	}
	/**
	 * @param modDt the modDt to set
	 */
	public void setModDt(String modDt) {
		this.modDt = modDt;
	}
	/**
	 * @return the modTm
	 */
	public String getModTm() {
		return modTm;
	}
	/**
	 * @param modTm the modTm to set
	 */
	public void setModTm(String modTm) {
		this.modTm = modTm;
	}
	/**
	 * @return the modEmpKey
	 */
	public String getModEmpKey() {
		return modEmpKey;
	}
	/**
	 * @param modEmpKey the modEmpKey to set
	 */
	public void setModEmpKey(String modEmpKey) {
		this.modEmpKey = modEmpKey;
	}
	/**
	 * @return the serialversionuid
	 */
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	public String getDeleteDirectorList() {
		return deleteDirectorList;
	}
	
	public void setDeleteDirectorList(String deleteDirectorList) {
		this.deleteDirectorList = deleteDirectorList;
	}
	
	public String getDeleteDepositList() {
		return deleteDepositList;
	}
	
	public void setDeleteDepositList(String deleteDepositList) {
		this.deleteDepositList = deleteDepositList;
	}
	public List<AccountDirectorVO> getAccountDirectorVO() {
		return accountDirectorVO;
	}
	
	public void setAccountDirectorVO(List<AccountDirectorVO> accountDirectorVO) {
		this.accountDirectorVO = accountDirectorVO;
	}
	
	public List<AccountDepositVO> getAccountDepositVO() {
		return accountDepositVO;
	}
	
	public void setAccountDepositVO(List<AccountDepositVO> accountDepositVO) {
		this.accountDepositVO = accountDepositVO;
	}
	
}
