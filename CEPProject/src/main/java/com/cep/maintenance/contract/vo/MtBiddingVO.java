package com.cep.maintenance.contract.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("mtBiddingVO")
/**
 * @File Name : MtBiddingVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2021. 08. 17.
 * @version   : 1.0
 * @Description : 유지보수 보증증권 VO
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 08. 17.               최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtBiddingVO extends MtDefaultVO implements Serializable{

	//보증증권 관리키
	private String bdKey;

	// 유지보수 통합 관리키 유지보수계약 PK
    private String mtIntegrateKey;
    
    //입찰 보증증권 발행일
    private String bdGbFinishDt;
    
    //입찰 보증 증권 완료 여부 N:발행전, R:발행요청, Y:발행완료
	private String bdGbFinishYn;
	
	//입찰마감일
	private String bdLimitDt;
	
	//입찰 보증 증권 금액
	private int bdGbAmount;
	
	//입찰 보증증권 입찰금액
	private int bdGbBdAmount;
	
	//입찰일로부터 보증 몇 일 보증 기간
	private int bdGbDay;
	
	//입찰 보증증권 요율
	private int bdGbRate;

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
	
	public String getBdKey() {
		return bdKey;
	}

	public void setBdKey(String bdKey) {
		this.bdKey = bdKey;
	}

	public String getMtIntegrateKey() {
		return mtIntegrateKey;
	}

	public void setMtIntegrateKey(String mtIntegrateKey) {
		this.mtIntegrateKey = mtIntegrateKey;
	}

	public String getBdGbFinishDt() {
		return bdGbFinishDt;
	}

	public void setBdGbFinishDt(String bdGbFinishDt) {
		this.bdGbFinishDt = bdGbFinishDt;
	}

	public String getBdGbFinishYn() {
		return bdGbFinishYn;
	}

	public void setBdGbFinishYn(String bdGbFinishYn) {
		this.bdGbFinishYn = bdGbFinishYn;
	}

	public int getBdGbAmount() {
		return bdGbAmount;
	}

	public void setBdGbAmount(int bdGbAmount) {
		this.bdGbAmount = bdGbAmount;
	}

	public int getBdGbBdAmount() {
		return bdGbBdAmount;
	}

	public void setBdGbBdAmount(int bdGbBdAmount) {
		this.bdGbBdAmount = bdGbBdAmount;
	}

	public int getBdGbDay() {
		return bdGbDay;
	}

	public void setBdGbDay(int bdGbDay) {
		this.bdGbDay = bdGbDay;
	}

	public int getBdGbRate() {
		return bdGbRate;
	}

	public void setBdGbRate(int bdGbRate) {
		this.bdGbRate = bdGbRate;
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

	public String getDeleteYn() {
		return deleteYn;
	}

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
	 * @return String - the bdLimitDt
	 */
	public String getBdLimitDt() {
		return bdLimitDt;
	}

	/**
	 * @param bdLimitDt the bdLimitDt to set
	 */
	public void setBdLimitDt(String bdLimitDt) {
		this.bdLimitDt = bdLimitDt;
	}
}
