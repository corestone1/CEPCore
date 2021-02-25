/**
 * 
 */
package com.cep.maintenance.contract.vo;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("mtContractLinkVO")

/**
 * @File Name : MtContractLinkVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 11. 3.
 * @version   : 1.0
 * @Description : 유지보수계약링크 관련 vo MT_CONTRACT_LINK_TB 테이블 참조
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 3.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtContractLinkVO extends MtDefaultVO {
	public static final String FORECAST_LINK_CT_TYPE="S";
	public static final String PROJECT_LINK_CT_TYPE="P"; 
	public static final String ALL_LINK_CT_TYPE="A";
	public static final String NOT_SELECT_LINK_CT_TYPE="N"; 
    // 유지보수 연계 관리키 
    private Integer mtLinkKey;

    // 유지보수 통합 관리키 유지보수 계약 PK
    private String mtIntegrateKey;

    // 유지보수 연계 계약 구분 코드 상품(P), FORECAST(S) 구분 : PrimaryKeyType 값 사용
    private String mtLinkCtClassCd;

    // 유지보수 연계 계약 관리키 상품, FORECAST계약키
    private String mtLinkCtKey;
    
    private String mtLinkCtKeyNm; //계약명

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

    // 비고 
    private String remark;
    
    private String linkDeleteKey; //링크삭제키

	/**
	 * @return the mtLinkKey
	 */
	public Integer getMtLinkKey() {
		return mtLinkKey;
	}

	/**
	 * @param mtLinkKey the mtLinkKey to set
	 */
	public void setMtLinkKey(Integer mtLinkKey) {
		this.mtLinkKey = mtLinkKey;
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
	 * @return the mtLinkCtClassCd
	 */
	public String getMtLinkCtClassCd() {
		return mtLinkCtClassCd;
	}

	/**
	 * @param mtLinkCtClassCd the mtLinkCtClassCd to set
	 */
	public void setMtLinkCtClassCd(String mtLinkCtClassCd) {
		this.mtLinkCtClassCd = mtLinkCtClassCd;
	}

	/**
	 * @return the mtLinkCtKey
	 */
	public String getMtLinkCtKey() {
		return mtLinkCtKey;
	}

	/**
	 * @param mtLinkCtKey the mtLinkCtKey to set
	 */
	public void setMtLinkCtKey(String mtLinkCtKey) {
		this.mtLinkCtKey = mtLinkCtKey;
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
	 * @return the mtLinkCtKeyNm
	 */
	public String getMtLinkCtKeyNm() {
		return mtLinkCtKeyNm;
	}

	/**
	 * @param mtLinkCtKeyNm the mtLinkCtKeyNm to set
	 */
	public void setMtLinkCtKeyNm(String mtLinkCtKeyNm) {
		this.mtLinkCtKeyNm = mtLinkCtKeyNm;
	}

	/**
	 * @return the linkDeleteKey
	 */
	public String getLinkDeleteKey() {
		return linkDeleteKey;
	}

	/**
	 * @param linkDeleteKey the linkDeleteKey to set
	 */
	public void setLinkDeleteKey(String linkDeleteKey) {
		this.linkDeleteKey = linkDeleteKey;
	}
}
