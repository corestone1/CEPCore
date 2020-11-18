/**
 * 
 */
package com.cep.maintenance.vo;



import java.io.Serializable;

import org.apache.ibatis.type.Alias;
@SuppressWarnings("serial")
@Alias("mtWorkVO")

/**
 * @File Name : MtWorkVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 11. 10.
 * @version   : 1.0
 * @Description : 유지보수 작업 관리 VO
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 10.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtWorkVO extends MaintenanceDefaultVO implements Serializable{


	private String mtAcNm;//거래처명
	private String mtNm;//유지보수 계약명
	private String mtWorkEmpNm; // 작업담당자명
	private String acDirectorNm; //거래처담당자명
	private String acDirectorInfo; //거래처 담당자정보

    // 유지보수 작업 관리키 업무(작업)
    private int mtWorkKey;

    // 유지보수 통합 관리키 유지보수가 연장되면 해당 키는 같으며 순번이 증가
    private int mtIntegrateKey;

    // 유지보수 작업 직원 관리키 
    private String mtWorkEmpKey;

    // 유지보수 작업 거래처 담당자 관리키 
    private String mtWorkAcDirectorKey;

    // 유지보수 작업 시작 일자 
    private String mtWorkStartDt;

    // 유지보수 작업 시작 시간 
    private String mtWorkStartTm;

    // 유지보수 작업 종료 일자 
    private String mtWorkEndDt;

    // 유지보수 작업 종료 시간 
    private String mtWorkEndTm;

    // 유지보수 작업 유형 코드 준비/진행중/종료 등
    private String mtWorkTypeCd;

    // 유지보수 작업 결과 코드 
    private String mtWorkResultCd;

    // 유지보수 작업 내용 
    private String mtWorkCont;

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

	/**
	 * @return the mtWorkKey
	 */
	public int getMtWorkKey() {
		return mtWorkKey;
	}

	/**
	 * @param mtWorkKey the mtWorkKey to set
	 */
	public void setMtWorkKey(int mtWorkKey) {
		this.mtWorkKey = mtWorkKey;
	}

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
	 * @return the mtWorkEmpKey
	 */
	public String getMtWorkEmpKey() {
		return mtWorkEmpKey;
	}

	/**
	 * @param mtWorkEmpKey the mtWorkEmpKey to set
	 */
	public void setMtWorkEmpKey(String mtWorkEmpKey) {
		this.mtWorkEmpKey = mtWorkEmpKey;
	}

	/**
	 * @return the mtWorkAcDirectorKey
	 */
	public String getMtWorkAcDirectorKey() {
		return mtWorkAcDirectorKey;
	}

	/**
	 * @param mtWorkAcDirectorKey the mtWorkAcDirectorKey to set
	 */
	public void setMtWorkAcDirectorKey(String mtWorkAcDirectorKey) {
		this.mtWorkAcDirectorKey = mtWorkAcDirectorKey;
	}

	/**
	 * @return the mtWorkStartDt
	 */
	public String getMtWorkStartDt() {
		return mtWorkStartDt;
	}

	/**
	 * @param mtWorkStartDt the mtWorkStartDt to set
	 */
	public void setMtWorkStartDt(String mtWorkStartDt) {
		this.mtWorkStartDt = mtWorkStartDt;
	}

	/**
	 * @return the mtWorkStartTm
	 */
	public String getMtWorkStartTm() {
		return mtWorkStartTm;
	}

	/**
	 * @param mtWorkStartTm the mtWorkStartTm to set
	 */
	public void setMtWorkStartTm(String mtWorkStartTm) {
		this.mtWorkStartTm = mtWorkStartTm;
	}

	/**
	 * @return the mtWorkEndDt
	 */
	public String getMtWorkEndDt() {
		return mtWorkEndDt;
	}

	/**
	 * @param mtWorkEndDt the mtWorkEndDt to set
	 */
	public void setMtWorkEndDt(String mtWorkEndDt) {
		this.mtWorkEndDt = mtWorkEndDt;
	}

	/**
	 * @return the mtWorkEndTm
	 */
	public String getMtWorkEndTm() {
		return mtWorkEndTm;
	}

	/**
	 * @param mtWorkEndTm the mtWorkEndTm to set
	 */
	public void setMtWorkEndTm(String mtWorkEndTm) {
		this.mtWorkEndTm = mtWorkEndTm;
	}

	/**
	 * @return the mtWorkTypeCd
	 */
	public String getMtWorkTypeCd() {
		return mtWorkTypeCd;
	}

	/**
	 * @param mtWorkTypeCd the mtWorkTypeCd to set
	 */
	public void setMtWorkTypeCd(String mtWorkTypeCd) {
		this.mtWorkTypeCd = mtWorkTypeCd;
	}

	/**
	 * @return the mtWorkResultCd
	 */
	public String getMtWorkResultCd() {
		return mtWorkResultCd;
	}

	/**
	 * @param mtWorkResultCd the mtWorkResultCd to set
	 */
	public void setMtWorkResultCd(String mtWorkResultCd) {
		this.mtWorkResultCd = mtWorkResultCd;
	}

	/**
	 * @return the mtWorkCont
	 */
	public String getMtWorkCont() {
		return mtWorkCont;
	}

	/**
	 * @param mtWorkCont the mtWorkCont to set
	 */
	public void setMtWorkCont(String mtWorkCont) {
		this.mtWorkCont = mtWorkCont;
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
	 * @return the mtWorkEmpNm
	 */
	public String getMtWorkEmpNm() {
		return mtWorkEmpNm;
	}

	/**
	 * @param mtWorkEmpNm the mtWorkEmpNm to set
	 */
	public void setMtWorkEmpNm(String mtWorkEmpNm) {
		this.mtWorkEmpNm = mtWorkEmpNm;
	}

	/**
	 * @return the acDirectorNm
	 */
	public String getAcDirectorNm() {
		return acDirectorNm;
	}

	/**
	 * @param acDirectorNm the acDirectorNm to set
	 */
	public void setAcDirectorNm(String acDirectorNm) {
		this.acDirectorNm = acDirectorNm;
	}

	/**
	 * @return the acDirectorInfo
	 */
	public String getAcDirectorInfo() {
		return acDirectorInfo;
	}

	/**
	 * @param acDirectorInfo the acDirectorInfo to set
	 */
	public void setAcDirectorInfo(String acDirectorInfo) {
		this.acDirectorInfo = acDirectorInfo;
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
}
