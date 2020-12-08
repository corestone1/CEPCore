/**
 * 
 */
package com.cep.maintenance.contract.vo;

import java.io.Serializable;

/**
 * @File Name : MtSalesAmountVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 12. 7.
 * @version   : 1.0
 * @Description : 유지보수 매출금액 관리
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 12. 7.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtSalesAmountVO extends MtDefaultVO implements Serializable{

	private static final long serialVersionUID = 1L;

	// 유지보수 통합 관리키 유지보수계약 PK
    private String mtIntegrateKey;

    // 유지보수 매출 년도 yyyy
    private String mtSalesYear;

    // 유지보수 매출 개월 mm
    private String mtSalesMonth;
    
    //매출 회차.
    private int salesTurn;

    // 유지보수 매출 금액 
    private int mtSalesAmount;

    // 유지보수 매출 요청 여부 매출요청여부
    private String mtSalesCallYn;

    // 등록 일자 
    private String regDt;

    // 등록 시간 
    private String regTm;

    // 등록 직원 관리키 
    private String regEmpKey;

    // 비고 
    private String remark;

    // 수정 일자 
    private String modDt;

    // 수정 직원 관리키 
    private String modEmpKey;

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
	 * @return the mtSalesYear
	 */
	public String getMtSalesYear() {
		return mtSalesYear;
	}

	/**
	 * @param mtSalesYear the mtSalesYear to set
	 */
	public void setMtSalesYear(String mtSalesYear) {
		this.mtSalesYear = mtSalesYear;
	}

	/**
	 * @return the mtSalesMonth
	 */
	public String getMtSalesMonth() {
		return mtSalesMonth;
	}

	/**
	 * @param mtSalesMonth the mtSalesMonth to set
	 */
	public void setMtSalesMonth(String mtSalesMonth) {
		this.mtSalesMonth = mtSalesMonth;
	}

	/**
	 * @return the mtSalesAmount
	 */
	public int getMtSalesAmount() {
		return mtSalesAmount;
	}

	/**
	 * @param mtSalesAmount the mtSalesAmount to set
	 */
	public void setMtSalesAmount(int mtSalesAmount) {
		this.mtSalesAmount = mtSalesAmount;
	}

	/**
	 * @return the mtSalesCallYn
	 */
	public String getMtSalesCallYn() {
		return mtSalesCallYn;
	}

	/**
	 * @param mtSalesCallYn the mtSalesCallYn to set
	 */
	public void setMtSalesCallYn(String mtSalesCallYn) {
		this.mtSalesCallYn = mtSalesCallYn;
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
	 * @return the salesTurn
	 */
	public int getSalesTurn() {
		return salesTurn;
	}

	/**
	 * @param salesTurn the salesTurn to set
	 */
	public void setSalesTurn(int salesTurn) {
		this.salesTurn = salesTurn;
	}
}
