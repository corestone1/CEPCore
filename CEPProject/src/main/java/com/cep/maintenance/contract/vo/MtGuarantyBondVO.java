package com.cep.maintenance.contract.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("mtGuarantyBondVO")
/**
 * 계약보증증권 VO
 * <pre>
 * </pre>
 *
 * @title MtGuarantyBondVO
 * @desc 
 * @programID MtGuarantyBondVO.java
 * @cdate 2021. 8. 19.
 * @version 1.0
 * @author aranghoo
 * @see 
 *
 */
public class MtGuarantyBondVO  extends MtDefaultVO implements Serializable{
	//보증증권 관리키
	private String gbKey;

	// 유지보수 통합 관리키 유지보수계약 PK
	private String mtIntegrateKey;
	
	//계약/하자보증/선급금 등 구분
	private String gbKindCd;
	
	//보증증권 시작 일자
	private String gbStartDt;
	
	//보증 증권 종료 일자
	private String gbEndDt;
	
	//보증 증권 발급 여부(R요청,Y발급완료,N발행전)
	private String gbIssueYn;
	
	//보증증권 금액
	private int gbAmount;
	
	//보증증권 요율(계약금액의 X%)
	private int gbRate;
	
	//보증증권 발행 일자
	private String gbPublishDt;
	
	//발급요청사항
	private String remark;

    // 등록 일자 
    private String regDt;

    // 등록 시간 
    private String regTm;

    // 등록 직원 관리키 
    private String regEmpKey;

    // 수정 일자 
    private String modDt;

    // 수정 시간 
    private String modTm;

    // 수정 직원 관리키 
    private String modEmpKey;

    // 삭제 여부 초기값 (N)
    private String deleteYn;
    
    //JOIN 부가적인값.	
   	private String mtNm;//유지보수 계약명
   	private String mtAcKey;//사업자 번호
   	private String mtAcNm;//거래처명
	private String mtStartDt;//유지보수 시작일자
	private String mtEndDt;//유지보수 종료일자
	private String taxYn; //부가세포함여부
	private long mtAmount; //유지보수 금액
	/**
	 * @return String - the gbKey
	 */
	public String getGbKey() {
		return gbKey;
	}
	/**
	 * @param gbKey the gbKey to set
	 */
	public void setGbKey(String gbKey) {
		this.gbKey = gbKey;
	}
	/**
	 * @return String - the mtIntegrateKey
	 */
	public String getMtIntegrateKey() {
		return mtIntegrateKey;
	}
	/**
	 * @param mtIntegrateKey the mtIntegrateKey to set
	 */
	public void setMtIntegrateKey(String mtIntegrateKey) {
		this.mtIntegrateKey = mtIntegrateKey;
	}
	/**
	 * @return String - the gbKindCd
	 */
	public String getGbKindCd() {
		return gbKindCd;
	}
	/**
	 * @param gbKindCd the gbKindCd to set
	 */
	public void setGbKindCd(String gbKindCd) {
		this.gbKindCd = gbKindCd;
	}
	/**
	 * @return String - the gbStartDt
	 */
	public String getGbStartDt() {
		return gbStartDt;
	}
	/**
	 * @param gbStartDt the gbStartDt to set
	 */
	public void setGbStartDt(String gbStartDt) {
		this.gbStartDt = gbStartDt;
	}
	/**
	 * @return String - the gbEndDt
	 */
	public String getGbEndDt() {
		return gbEndDt;
	}
	/**
	 * @param gbEndDt the gbEndDt to set
	 */
	public void setGbEndDt(String gbEndDt) {
		this.gbEndDt = gbEndDt;
	}
	/**
	 * @return String - the gbIssueYn
	 */
	public String getGbIssueYn() {
		return gbIssueYn;
	}
	/**
	 * @param gbIssueYn the gbIssueYn to set
	 */
	public void setGbIssueYn(String gbIssueYn) {
		this.gbIssueYn = gbIssueYn;
	}
	/**
	 * @return int - the gbAmount
	 */
	public int getGbAmount() {
		return gbAmount;
	}
	/**
	 * @param gbAmount the gbAmount to set
	 */
	public void setGbAmount(int gbAmount) {
		this.gbAmount = gbAmount;
	}
	/**
	 * @return int - the gbRate
	 */
	public int getGbRate() {
		return gbRate;
	}
	/**
	 * @param gbRate the gbRate to set
	 */
	public void setGbRate(int gbRate) {
		this.gbRate = gbRate;
	}
	/**
	 * @return String - the gbPublishDt
	 */
	public String getGbPublishDt() {
		return gbPublishDt;
	}
	/**
	 * @param gbPublishDt the gbPublishDt to set
	 */
	public void setGbPublishDt(String gbPublishDt) {
		this.gbPublishDt = gbPublishDt;
	}
	/**
	 * @return String - the remark
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
	 * @return String - the regDt
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
	 * @return String - the regTm
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
	 * @return String - the regEmpKey
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
	 * @return String - the modDt
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
	 * @return String - the modTm
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
	 * @return String - the modEmpKey
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
	 * @return String - the deleteYn
	 */
	public String getDeleteYn() {
		return deleteYn;
	}
	/**
	 * @param deleteYn the deleteYn to set
	 */
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	/**
	 * @return String - the mtNm
	 */
	public String getMtNm() {
		return mtNm;
	}
	/**
	 * @param mtNm the mtNm to set
	 */
	public void setMtNm(String mtNm) {
		this.mtNm = mtNm;
	}
	/**
	 * @return String - the mtAcKey
	 */
	public String getMtAcKey() {
		return mtAcKey;
	}
	/**
	 * @param mtAcKey the mtAcKey to set
	 */
	public void setMtAcKey(String mtAcKey) {
		this.mtAcKey = mtAcKey;
	}
	/**
	 * @return String - the mtAcNm
	 */
	public String getMtAcNm() {
		return mtAcNm;
	}
	/**
	 * @param mtAcNm the mtAcNm to set
	 */
	public void setMtAcNm(String mtAcNm) {
		this.mtAcNm = mtAcNm;
	}
	/**
	 * @return String - the mtStartDt
	 */
	public String getMtStartDt() {
		return mtStartDt;
	}
	/**
	 * @param mtStartDt the mtStartDt to set
	 */
	public void setMtStartDt(String mtStartDt) {
		this.mtStartDt = mtStartDt;
	}
	/**
	 * @return String - the mtEndDt
	 */
	public String getMtEndDt() {
		return mtEndDt;
	}
	/**
	 * @param mtEndDt the mtEndDt to set
	 */
	public void setMtEndDt(String mtEndDt) {
		this.mtEndDt = mtEndDt;
	}
	/**
	 * @return String - the taxYn
	 */
	public String getTaxYn() {
		return taxYn;
	}
	/**
	 * @param taxYn the taxYn to set
	 */
	public void setTaxYn(String taxYn) {
		this.taxYn = taxYn;
	}
	/**
	 * @return long - the mtAmount
	 */
	public long getMtAmount() {
		return mtAmount;
	}
	/**
	 * @param mtAmount the mtAmount to set
	 */
	public void setMtAmount(long mtAmount) {
		this.mtAmount = mtAmount;
	}
   	
   
    
    
	
	
}
