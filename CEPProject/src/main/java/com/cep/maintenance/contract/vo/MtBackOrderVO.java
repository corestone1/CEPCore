/**
 * 
 */
package com.cep.maintenance.contract.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;
@SuppressWarnings("serial")
@Alias("mtBackOrderVO")
/**
 * @File Name : MtBackOrderVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 12. 14.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 12. 14.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtBackOrderVO extends MtDefaultVO implements Serializable{
	// 유지보수 발주 관리키
	private String mtOrderKey;

    // 유지보수 통합 관리키 유지보수 계약 PK
    private String mtIntegrateKey;

    // 유지보수 발주 거래처 관리키 사업자번호
    private String mtOrderAcKey;
    
    //유지보수 발주 거래처 명
    private String mtOrderAcKeyNm;

    // 유지보수 발주 거래처 담당자 관리키 
    private String mtOrderAcDirectorKey;
    // 유지보수 발주거래처 담당자 명
    private String mtOrderAcDirectorNm;

    // 유지보수 발주 결제 조건 당월 25일/매월25 /역발행 등
    private String mtOrderPayTerms;

    // 유지보수 발주 금액 
    private int mtOrderAmount;

    // 부가세 여부 부가세 포함여부
    private String taxYn;

    // 유지보수 발주 일자 
    private String mtOrderDt;

    // 비고 
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
    
    private List<MtBackOrderProductVO> mtBackOrderProductVoList;

	/**
	 * @return the mtOrderKey
	 */
	public String getMtOrderKey() {
		return mtOrderKey;
	}

	/**
	 * @param mtOrderKey the mtOrderKey to set
	 */
	public void setMtOrderKey(String mtOrderKey) {
		this.mtOrderKey = mtOrderKey;
	}

	/**
	 * @return the mtIntegrateKey
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
	 * @return the mtOrderAcKey
	 */
	public String getMtOrderAcKey() {
		return mtOrderAcKey;
	}

	/**
	 * @param mtOrderAcKey the mtOrderAcKey to set
	 */
	public void setMtOrderAcKey(String mtOrderAcKey) {
		this.mtOrderAcKey = mtOrderAcKey;
	}

	/**
	 * @return the mtOrderAcDirectorKey
	 */
	public String getMtOrderAcDirectorKey() {
		return mtOrderAcDirectorKey;
	}

	/**
	 * @param mtOrderAcDirectorKey the mtOrderAcDirectorKey to set
	 */
	public void setMtOrderAcDirectorKey(String mtOrderAcDirectorKey) {
		this.mtOrderAcDirectorKey = mtOrderAcDirectorKey;
	}

	/**
	 * @return the mtOrderPayTerms
	 */
	public String getMtOrderPayTerms() {
		return mtOrderPayTerms;
	}

	/**
	 * @param mtOrderPayTerms the mtOrderPayTerms to set
	 */
	public void setMtOrderPayTerms(String mtOrderPayTerms) {
		this.mtOrderPayTerms = mtOrderPayTerms;
	}

	/**
	 * @return the mtOrderAmount
	 */
	public int getMtOrderAmount() {
		return mtOrderAmount;
	}

	/**
	 * @param mtOrderAmount the mtOrderAmount to set
	 */
	public void setMtOrderAmount(int mtOrderAmount) {
		this.mtOrderAmount = mtOrderAmount;
	}

	/**
	 * @return the taxYn
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
	 * @return the mtOrderDt
	 */
	public String getMtOrderDt() {
		return mtOrderDt;
	}

	/**
	 * @param mtOrderDt the mtOrderDt to set
	 */
	public void setMtOrderDt(String mtOrderDt) {
		this.mtOrderDt = mtOrderDt;
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
	 * @return the mtBackOrderProductVoList
	 */
	public List<MtBackOrderProductVO> getMtBackOrderProductVoList() {
		return mtBackOrderProductVoList;
	}

	/**
	 * @param mtBackOrderProductVoList the mtBackOrderProductVoList to set
	 */
	public void setMtBackOrderProductVoList(List<MtBackOrderProductVO> mtBackOrderProductVoList) {
		this.mtBackOrderProductVoList = mtBackOrderProductVoList;
	}

	/**
	 * @return the mtOrderAcKeyNm
	 */
	public String getMtOrderAcKeyNm() {
		return mtOrderAcKeyNm;
	}

	/**
	 * @param mtOrderAcKeyNm the mtOrderAcKeyNm to set
	 */
	public void setMtOrderAcKeyNm(String mtOrderAcKeyNm) {
		this.mtOrderAcKeyNm = mtOrderAcKeyNm;
	}

	/**
	 * @return the mtOrderAcDirectorNm
	 */
	public String getMtOrderAcDirectorNm() {
		return mtOrderAcDirectorNm;
	}

	/**
	 * @param mtOrderAcDirectorNm the mtOrderAcDirectorNm to set
	 */
	public void setMtOrderAcDirectorNm(String mtOrderAcDirectorNm) {
		this.mtOrderAcDirectorNm = mtOrderAcDirectorNm;
	}
}
