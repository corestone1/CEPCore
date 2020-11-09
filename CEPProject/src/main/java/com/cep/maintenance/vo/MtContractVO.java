/**
 * 
 */
package com.cep.maintenance.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;
@SuppressWarnings("serial")
@Alias("mtContractVO")
/**
 * @File Name : MtContractVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 11. 3.
 * @version   : 1.0
 * @Description : 유지보수 계약 관련 vo MT_CONTRACT_TB 테이블 참조
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 3.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtContractVO extends MaintenanceDefaultVO implements Serializable{
	private int rowNum;
	private int mtIntegrateKey; //유지보수 계약 PK
	private String mtCtKey; //유지보수 계약관리키
	private int mtSeq; //유지보수 순번
	private String mtAcKey;//사업자 번호
	private String mtAcNm;//거래처명
	private String acDirectorKey;//유지보수 거래처 담당자 관리키
	private String mtNm;//유지보수 계약명
	private String ctDt;//유지보수 계약일자
	private String startDt;//유지보수 시작일자
	private String endDt;//유지보수 종료일자
	private String rgInspectCnt;//유지보수 정기 검수 횟수
	private String imCd;//유지보수 검수방법
	private String sbCtYn; //백계약 여부
	private String gbYn; // 보증증권 여부
	private String saleEmpKey; //유지보수 영업 직원 관리키
	private String saleEmpNm; //유지보수 영업 직원 이름
	private String mngEmpKey; //유지보수 관리 직원 관리키
	private String mngEmpNm; //유지보수 관리 직원 이름
	private String supportEmpKey; // 유지보수 지원 직원 관리키
	private String supportEmpNm; // 유지보수 지원 직원 이름
	private long amount; //유지보수 금액
	private String payTerms; //유지보수 결재조건
	private String remark; // 유지보수 비고
	private String deleteYn;//유지보수 삭제여부
	private String regDt; // 유지보수 등록일자
	private String regTm; // 유지보수 등록시간
	private String regEmpKey; //유지보수 등록직원 관리키
	private String modDt; // 유지보수 수정일자
	private String modTm; // 유지보수 수정시간
	private String modEmpKey; //유지보수 수정직원 관리키
	/**
	 * @return the mtIntegrateKey
	 */
	public int getMtIntegrateKey() {
		return mtIntegrateKey;
	}
	/**
	 * @param mtIntegrateKey the mtIntegrateKey to set
	 */
	public void setMtIntegrateKey(int mtIntegrateKey) {
		this.mtIntegrateKey = mtIntegrateKey;
	}
	/**
	 * @return the mtCtKey
	 */
	public String getMtCtKey() {
		return mtCtKey;
	}
	/**
	 * @param mtCtKey the mtCtKey to set
	 */
	public void setMtCtKey(String mtCtKey) {
		this.mtCtKey = mtCtKey;
	}
	/**
	 * @return the mtSeq
	 */
	public int getMtSeq() {
		return mtSeq;
	}
	/**
	 * @param mtSeq the mtSeq to set
	 */
	public void setMtSeq(int mtSeq) {
		this.mtSeq = mtSeq;
	}
	/**
	 * @return the mtAcKey
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
	 * @return the acDirectorKey
	 */
	public String getAcDirectorKey() {
		return acDirectorKey;
	}
	/**
	 * @param acDirectorKey the acDirectorKey to set
	 */
	public void setAcDirectorKey(String acDirectorKey) {
		this.acDirectorKey = acDirectorKey;
	}
	/**
	 * @return the mtNm
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
	 * @return the ctDt
	 */
	public String getCtDt() {
		return ctDt;
	}
	/**
	 * @param ctDt the ctDt to set
	 */
	public void setCtDt(String ctDt) {
		this.ctDt = ctDt;
	}
	/**
	 * @return the startDt
	 */
	public String getStartDt() {
		return startDt;
	}
	/**
	 * @param startDt the startDt to set
	 */
	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}
	/**
	 * @return the endDt
	 */
	public String getEndDt() {
		return endDt;
	}
	/**
	 * @param endDt the endDt to set
	 */
	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}
	/**
	 * @return the rgInspectCnt
	 */
	public String getRgInspectCnt() {
		return rgInspectCnt;
	}
	/**
	 * @param rgInspectCnt the rgInspectCnt to set
	 */
	public void setRgInspectCnt(String rgInspectCnt) {
		this.rgInspectCnt = rgInspectCnt;
	}
	/**
	 * @return the imCd
	 */
	public String getImCd() {
		return imCd;
	}
	/**
	 * @param imCd the imCd to set
	 */
	public void setImCd(String imCd) {
		this.imCd = imCd;
	}
	/**
	 * @return the sbCtYn
	 */
	public String getSbCtYn() {
		return sbCtYn;
	}
	/**
	 * @param sbCtYn the sbCtYn to set
	 */
	public void setSbCtYn(String sbCtYn) {
		this.sbCtYn = sbCtYn;
	}
	/**
	 * @return the saleEmpKey
	 */
	public String getSaleEmpKey() {
		return saleEmpKey;
	}
	/**
	 * @param saleEmpKey the saleEmpKey to set
	 */
	public void setSaleEmpKey(String saleEmpKey) {
		this.saleEmpKey = saleEmpKey;
	}
	/**
	 * @return the saleEmpNm
	 */
	public String getSaleEmpNm() {
		return saleEmpNm;
	}
	/**
	 * @param saleEmpNm the saleEmpNm to set
	 */
	public void setSaleEmpNm(String saleEmpNm) {
		this.saleEmpNm = saleEmpNm;
	}
	/**
	 * @return the mngEmpKey
	 */
	public String getMngEmpKey() {
		return mngEmpKey;
	}
	/**
	 * @param mngEmpKey the mngEmpKey to set
	 */
	public void setMngEmpKey(String mngEmpKey) {
		this.mngEmpKey = mngEmpKey;
	}
	/**
	 * @return the mngEmpNm
	 */
	public String getMngEmpNm() {
		return mngEmpNm;
	}
	/**
	 * @param mngEmpNm the mngEmpNm to set
	 */
	public void setMngEmpNm(String mngEmpNm) {
		this.mngEmpNm = mngEmpNm;
	}
	/**
	 * @return the supportEmpKey
	 */
	public String getSupportEmpKey() {
		return supportEmpKey;
	}
	/**
	 * @param supportEmpKey the supportEmpKey to set
	 */
	public void setSupportEmpKey(String supportEmpKey) {
		this.supportEmpKey = supportEmpKey;
	}
	/**
	 * @return the supportEmpNm
	 */
	public String getSupportEmpNm() {
		return supportEmpNm;
	}
	/**
	 * @param supportEmpNm the supportEmpNm to set
	 */
	public void setSupportEmpNm(String supportEmpNm) {
		this.supportEmpNm = supportEmpNm;
	}
	/**
	 * @return the amount
	 */
	public long getAmount() {
		return amount;
	}
	/**
	 * @param amount the amount to set
	 */
	public void setAmount(long amount) {
		this.amount = amount;
	}
	/**
	 * @return the payTerms
	 */
	public String getPayTerms() {
		return payTerms;
	}
	/**
	 * @param payTerms the payTerms to set
	 */
	public void setPayTerms(String payTerms) {
		this.payTerms = payTerms;
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
	 * @return the deleteYn
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
	 * @return the mtAcNm
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
	 * @return the gbYn
	 */
	public String getGbYn() {
		return gbYn;
	}
	/**
	 * @param gbYn the gbYn to set
	 */
	public void setGbYn(String gbYn) {
		this.gbYn = gbYn;
	}
}
