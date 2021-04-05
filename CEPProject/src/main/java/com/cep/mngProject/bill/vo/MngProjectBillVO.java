<<<<<<< HEAD
package com.cep.mngProject.bill.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("mngProjectBillVO")
public class MngProjectBillVO implements Serializable {
	
	private static final long serialVersionUID = 6249212047489119229L;
	
	private String billNo;
	private String billCtFkKey;
	
	private String pjKey;
	private String billCallKey;
	private String acKey;
	
	private String billAcDirectorKey;
	private String billAcDirectorTel;
	private int    billTurnNo;
	private int    billAmount;
	private String billIssueDt;
	private String billIssueEmail;
	private String billIssueType; 
	private String billIssueStatus;
	private String billMappingYn;
	private String billRequestDt;
	private String billTaxYn;
	private String remark;
	private String regDt;
	private String regTm;
	private String regEmpKey;
	private String modDt;
	private String modTm;
	private String modEmpKey;
	
	private String salesKey;
	
	private List<MngProjectBillVO> mngBillInsertVOList;
	
	/**
	 * @return the billNo
	 */
	public String getBillNo() {
		return billNo;
	}
	/**
	 * @param billNo the billNo to set
	 */
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	/**
	 * @return the billCtFkKey
	 */
	public String getBillCtFkKey() {
		return billCtFkKey;
	}
	/**
	 * @param billCtFkKey the billCtFkKey to set
	 */
	public void setBillCtFkKey(String billCtFkKey) {
		this.billCtFkKey = billCtFkKey;
	}
	/**
	 * @return the pjKey
	 */
	public String getPjKey() {
		return pjKey;
	}
	/**
	 * @param pjKey the pjKey to set
	 */
	public void setPjKey(String pjKey) {
		this.pjKey = pjKey;
	}
	/**
	 * @return the billCallKey
	 */
	public String getBillCallKey() {
		return billCallKey;
	}
	/**
	 * @param billCallKey the billCallKey to set
	 */
	public void setBillCallKey(String billCallKey) {
		this.billCallKey = billCallKey;
	}
	
	/**
	 * @return the billTaxYn
	 */
	public String getBillTaxYn() {
		return billTaxYn;
	}
	/**
	 * @param billTaxYn the billTaxYn to set
	 */
	public void setBillTaxYn(String billTaxYn) {
		this.billTaxYn = billTaxYn;
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
	 * @return the billAcDirectorKey
	 */
	public String getBillAcDirectorKey() {
		return billAcDirectorKey;
	}
	/**
	 * @param billAcDirectorKey the billAcDirectorKey to set
	 */
	public void setBillAcDirectorKey(String billAcDirectorKey) {
		this.billAcDirectorKey = billAcDirectorKey;
	}
	/**
	 * @return the billAcDirectorTel
	 */
	public String getBillAcDirectorTel() {
		return billAcDirectorTel;
	}
	/**
	 * @param billAcDirectorTel the billAcDirectorTel to set
	 */
	public void setBillAcDirectorTel(String billAcDirectorTel) {
		this.billAcDirectorTel = billAcDirectorTel;
	}
	
	/**
	 * @return the billIssueStatus
	 */
	public String getBillIssueStatus() {
		return billIssueStatus;
	}
	/**
	 * @param billIssueStatus the billIssueStatus to set
	 */
	public void setBillIssueStatus(String billIssueStatus) {
		this.billIssueStatus = billIssueStatus;
	}
	/**
	 * @return the billTurnNo
	 */
	public int getBillTurnNo() {
		return billTurnNo;
	}
	/**
	 * @param billTurnNo the billTurnNo to set
	 */
	public void setBillTurnNo(int billTurnNo) {
		this.billTurnNo = billTurnNo;
	}
	/**
	 * @return the billAmount
	 */
	public int getBillAmount() {
		return billAmount;
	}
	/**
	 * @param billAmount the billAmount to set
	 */
	public void setBillAmount(int billAmount) {
		this.billAmount = billAmount;
	}
	/**
	 * @return the billIssueDt
	 */
	public String getBillIssueDt() {
		return billIssueDt;
	}
	/**
	 * @param billIssueDt the billIssueDt to set
	 */
	public void setBillIssueDt(String billIssueDt) {
		this.billIssueDt = billIssueDt;
	}
	/**
	 * @return the billIssueEmail
	 */
	public String getBillIssueEmail() {
		return billIssueEmail;
	}
	/**
	 * @param billIssueEmail the billIssueEmail to set
	 */
	public void setBillIssueEmail(String billIssueEmail) {
		this.billIssueEmail = billIssueEmail;
	}
	/**
	 * @return the billIssueType
	 */
	public String getBillIssueType() {
		return billIssueType;
	}
	/**
	 * @param billIssueType the billIssueType to set
	 */
	public void setBillIssueType(String billIssueType) {
		this.billIssueType = billIssueType;
	}
	/**
	 * @return the billMappingYn
	 */
	public String getBillMappingYn() {
		return billMappingYn;
	}
	/**
	 * @param billMappingYn the billMappingYn to set
	 */
	public void setBillMappingYn(String billMappingYn) {
		this.billMappingYn = billMappingYn;
	}
	/**
	 * @return the billRequestDt
	 */
	public String getBillRequestDt() {
		return billRequestDt;
	}
	/**
	 * @param billRequestDt the billRequestDt to set
	 */
	public void setBillRequestDt(String billRequestDt) {
		this.billRequestDt = billRequestDt;
	}
	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
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
	/**
	 * @return the salesKey
	 */
	public String getSalesKey() {
		return salesKey;
	}
	/**
	 * @param salesKey the salesKey to set
	 */
	public void setSalesKey(String salesKey) {
		this.salesKey = salesKey;
	}
	/**
	 * @return the mngBillInsertVOList
	 */
	public List<MngProjectBillVO> getMngBillInsertVOList() {
		return mngBillInsertVOList;
	}
	/**
	 * @param mngBillInsertVOList the mngBillInsertVOList to set
	 */
	public void setMngBillInsertVOList(List<MngProjectBillVO> mngBillInsertVOList) {
		this.mngBillInsertVOList = mngBillInsertVOList;
	}
	
	

}
=======
package com.cep.mngProject.bill.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("mngProjectBillVO")
public class MngProjectBillVO implements Serializable {
	
	private static final long serialVersionUID = 6249212047489119229L;
	
	private String billNo;
	private String billCtFkKey;
	
	private String pjKey;
	private String billCallKey;
	private String acKey;
	
	private String billAcDirectorKey;
	private String billAcDirectorTel;
	private int    billTurnNo;
	private int    billAmount;
	private String billIssueDt;
	private String billIssueEmail;
	private String billIssueType; 
	private String billIssueStatus;
	private String billMappingYn;
	private String billRequestDt;
	private String billTaxYn;
	private String remark;
	private String regDt;
	private String regTm;
	private String regEmpKey;
	private String modDt;
	private String modTm;
	private String modEmpKey;
	
	private String salesKey;
	
	/**
	 * @return the billNo
	 */
	public String getBillNo() {
		return billNo;
	}
	/**
	 * @param billNo the billNo to set
	 */
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	/**
	 * @return the billCtFkKey
	 */
	public String getBillCtFkKey() {
		return billCtFkKey;
	}
	/**
	 * @param billCtFkKey the billCtFkKey to set
	 */
	public void setBillCtFkKey(String billCtFkKey) {
		this.billCtFkKey = billCtFkKey;
	}
	/**
	 * @return the pjKey
	 */
	public String getPjKey() {
		return pjKey;
	}
	/**
	 * @param pjKey the pjKey to set
	 */
	public void setPjKey(String pjKey) {
		this.pjKey = pjKey;
	}
	/**
	 * @return the billCallKey
	 */
	public String getBillCallKey() {
		return billCallKey;
	}
	/**
	 * @param billCallKey the billCallKey to set
	 */
	public void setBillCallKey(String billCallKey) {
		this.billCallKey = billCallKey;
	}
	
	/**
	 * @return the billTaxYn
	 */
	public String getBillTaxYn() {
		return billTaxYn;
	}
	/**
	 * @param billTaxYn the billTaxYn to set
	 */
	public void setBillTaxYn(String billTaxYn) {
		this.billTaxYn = billTaxYn;
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
	 * @return the billAcDirectorKey
	 */
	public String getBillAcDirectorKey() {
		return billAcDirectorKey;
	}
	/**
	 * @param billAcDirectorKey the billAcDirectorKey to set
	 */
	public void setBillAcDirectorKey(String billAcDirectorKey) {
		this.billAcDirectorKey = billAcDirectorKey;
	}
	/**
	 * @return the billAcDirectorTel
	 */
	public String getBillAcDirectorTel() {
		return billAcDirectorTel;
	}
	/**
	 * @param billAcDirectorTel the billAcDirectorTel to set
	 */
	public void setBillAcDirectorTel(String billAcDirectorTel) {
		this.billAcDirectorTel = billAcDirectorTel;
	}
	
	/**
	 * @return the billIssueStatus
	 */
	public String getBillIssueStatus() {
		return billIssueStatus;
	}
	/**
	 * @param billIssueStatus the billIssueStatus to set
	 */
	public void setBillIssueStatus(String billIssueStatus) {
		this.billIssueStatus = billIssueStatus;
	}
	/**
	 * @return the billTurnNo
	 */
	public int getBillTurnNo() {
		return billTurnNo;
	}
	/**
	 * @param billTurnNo the billTurnNo to set
	 */
	public void setBillTurnNo(int billTurnNo) {
		this.billTurnNo = billTurnNo;
	}
	/**
	 * @return the billAmount
	 */
	public int getBillAmount() {
		return billAmount;
	}
	/**
	 * @param billAmount the billAmount to set
	 */
	public void setBillAmount(int billAmount) {
		this.billAmount = billAmount;
	}
	/**
	 * @return the billIssueDt
	 */
	public String getBillIssueDt() {
		return billIssueDt;
	}
	/**
	 * @param billIssueDt the billIssueDt to set
	 */
	public void setBillIssueDt(String billIssueDt) {
		this.billIssueDt = billIssueDt;
	}
	/**
	 * @return the billIssueEmail
	 */
	public String getBillIssueEmail() {
		return billIssueEmail;
	}
	/**
	 * @param billIssueEmail the billIssueEmail to set
	 */
	public void setBillIssueEmail(String billIssueEmail) {
		this.billIssueEmail = billIssueEmail;
	}
	/**
	 * @return the billIssueType
	 */
	public String getBillIssueType() {
		return billIssueType;
	}
	/**
	 * @param billIssueType the billIssueType to set
	 */
	public void setBillIssueType(String billIssueType) {
		this.billIssueType = billIssueType;
	}
	/**
	 * @return the billMappingYn
	 */
	public String getBillMappingYn() {
		return billMappingYn;
	}
	/**
	 * @param billMappingYn the billMappingYn to set
	 */
	public void setBillMappingYn(String billMappingYn) {
		this.billMappingYn = billMappingYn;
	}
	/**
	 * @return the billRequestDt
	 */
	public String getBillRequestDt() {
		return billRequestDt;
	}
	/**
	 * @param billRequestDt the billRequestDt to set
	 */
	public void setBillRequestDt(String billRequestDt) {
		this.billRequestDt = billRequestDt;
	}
	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
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
	/**
	 * @return the salesKey
	 */
	public String getSalesKey() {
		return salesKey;
	}
	/**
	 * @param salesKey the salesKey to set
	 */
	public void setSalesKey(String salesKey) {
		this.salesKey = salesKey;
	}
	
	

}
>>>>>>> branch 'master' of https://github.com/corestone1/CEPCore.git
