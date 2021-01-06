package com.cep.maintenance.contract.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("mtBuyAmountVO")
/**
 * @File Name : MtBuyAmountVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 12. 23.
 * @version   : 1.0
 * @Description : 유지보수 매입금액 관리
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 12. 23.               최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtBuyAmountVO extends MtDefaultVO implements Serializable{


    // 유지보수 통합 관리키 유지보수계약 PK
    private String mtIntegrateKey;
    
    //유지보수 매입 관리키
    private String mtBuyKey;
    
    // 유지보수 발주 관리키
 	private String mtOrderKey;

    // 유지보수 매입 년도 yyyy
    private String mtBuyYear;

    // 유지보수 매입 1월 금액 
    private int mtBuyJanAmount;

    // 유지보수 매입 1월 요청 여부 
    private String mtBuyJanCallYn;

    // 유지보수 매입 2월 금액 
    private int mtBuyFebAmount;

    // 유지보수 매입 2월 요청 여부 
    private String mtBuyFebCallYn;

    // 유지보수 매입 3월 금액 
    private int mtBuyMarAmount;

    // 유지보수 매입 3월 요청 여부 
    private String mtBuyMarCallYn;

    // 유지보수 매입 4월 금액 
    private int mtBuyAprAmount;

    // 유지보수 매입 4월 요청 여부 
    private String mtBuyAprCallYn;

    // 유지보수 매입 5월 금액 
    private int mtBuyMayAmount;

    // 유지보수 매입 5월 요청 여부 
    private String mtBuyMayCallYn;

    // 유지보수 매입 6월 금액 
    private int mtBuyJunAmount;

    // 유지보수 매입 6월 요청 여부 
    private String mtBuyJunCallYn;

    // 유지보수 매입 7월 금액 
    private int mtBuyJulAmount;

    // 유지보수 매입 7월 요청 여부 
    private String mtBuyJulCallYn;

    // 유지보수 매입 8월 금액 
    private int mtBuyAugAmount;

    // 유지보수 매입 8월 요청 여부 
    private String mtBuyAugCallYn;

    // 유지보수 매입 9월 금액 
    private int mtBuySepAmount;

    // 유지보수 매입 9월 요청 여부 
    private String mtBuySepCallYn;

    // 유지보수 매입 10월 금액 
    private int mtBuyOctAmount;

    // 유지보수 매입 10월 요청 여부 
    private String mtBuyOctCallYn;

    // 유지보수 매입 11월 금액 
    private int mtBuyNovAmount;

    // 유지보수 매입 11월 요청 여부 
    private String mtBuyNovCallYn;

    // 유지보수 매입 12월 금액 
    private int mtBuyDecAmount;

    // 유지보수 매입 12월 요청 여부 
    private String mtBuyDecCallYn;

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
	 * @return the mtBuyKey
	 */
	public String getMtBuyKey() {
		return mtBuyKey;
	}

	/**
	 * @param mtBuyKey the mtBuyKey to set
	 */
	public void setMtBuyKey(String mtBuyKey) {
		this.mtBuyKey = mtBuyKey;
	}

	/**
	 * @return the mtBuyYear
	 */
	public String getMtBuyYear() {
		return mtBuyYear;
	}

	/**
	 * @param mtBuyYear the mtBuyYear to set
	 */
	public void setMtBuyYear(String mtBuyYear) {
		this.mtBuyYear = mtBuyYear;
	}

	/**
	 * @return the mtBuyJanAmount
	 */
	public int getMtBuyJanAmount() {
		return mtBuyJanAmount;
	}

	/**
	 * @param mtBuyJanAmount the mtBuyJanAmount to set
	 */
	public void setMtBuyJanAmount(int mtBuyJanAmount) {
		this.mtBuyJanAmount = mtBuyJanAmount;
	}

	/**
	 * @return the mtBuyJanCallYn
	 */
	public String getMtBuyJanCallYn() {
		return mtBuyJanCallYn;
	}

	/**
	 * @param mtBuyJanCallYn the mtBuyJanCallYn to set
	 */
	public void setMtBuyJanCallYn(String mtBuyJanCallYn) {
		this.mtBuyJanCallYn = mtBuyJanCallYn;
	}

	/**
	 * @return the mtBuyFebAmount
	 */
	public int getMtBuyFebAmount() {
		return mtBuyFebAmount;
	}

	/**
	 * @param mtBuyFebAmount the mtBuyFebAmount to set
	 */
	public void setMtBuyFebAmount(int mtBuyFebAmount) {
		this.mtBuyFebAmount = mtBuyFebAmount;
	}

	/**
	 * @return the mtBuyFebCallYn
	 */
	public String getMtBuyFebCallYn() {
		return mtBuyFebCallYn;
	}

	/**
	 * @param mtBuyFebCallYn the mtBuyFebCallYn to set
	 */
	public void setMtBuyFebCallYn(String mtBuyFebCallYn) {
		this.mtBuyFebCallYn = mtBuyFebCallYn;
	}

	/**
	 * @return the mtBuyMarAmount
	 */
	public int getMtBuyMarAmount() {
		return mtBuyMarAmount;
	}

	/**
	 * @param mtBuyMarAmount the mtBuyMarAmount to set
	 */
	public void setMtBuyMarAmount(int mtBuyMarAmount) {
		this.mtBuyMarAmount = mtBuyMarAmount;
	}

	/**
	 * @return the mtBuyMarCallYn
	 */
	public String getMtBuyMarCallYn() {
		return mtBuyMarCallYn;
	}

	/**
	 * @param mtBuyMarCallYn the mtBuyMarCallYn to set
	 */
	public void setMtBuyMarCallYn(String mtBuyMarCallYn) {
		this.mtBuyMarCallYn = mtBuyMarCallYn;
	}

	/**
	 * @return the mtBuyAprAmount
	 */
	public int getMtBuyAprAmount() {
		return mtBuyAprAmount;
	}

	/**
	 * @param mtBuyAprAmount the mtBuyAprAmount to set
	 */
	public void setMtBuyAprAmount(int mtBuyAprAmount) {
		this.mtBuyAprAmount = mtBuyAprAmount;
	}

	/**
	 * @return the mtBuyAprCallYn
	 */
	public String getMtBuyAprCallYn() {
		return mtBuyAprCallYn;
	}

	/**
	 * @param mtBuyAprCallYn the mtBuyAprCallYn to set
	 */
	public void setMtBuyAprCallYn(String mtBuyAprCallYn) {
		this.mtBuyAprCallYn = mtBuyAprCallYn;
	}

	/**
	 * @return the mtBuyMayAmount
	 */
	public int getMtBuyMayAmount() {
		return mtBuyMayAmount;
	}

	/**
	 * @param mtBuyMayAmount the mtBuyMayAmount to set
	 */
	public void setMtBuyMayAmount(int mtBuyMayAmount) {
		this.mtBuyMayAmount = mtBuyMayAmount;
	}

	/**
	 * @return the mtBuyMayCallYn
	 */
	public String getMtBuyMayCallYn() {
		return mtBuyMayCallYn;
	}

	/**
	 * @param mtBuyMayCallYn the mtBuyMayCallYn to set
	 */
	public void setMtBuyMayCallYn(String mtBuyMayCallYn) {
		this.mtBuyMayCallYn = mtBuyMayCallYn;
	}

	/**
	 * @return the mtBuyJunAmount
	 */
	public int getMtBuyJunAmount() {
		return mtBuyJunAmount;
	}

	/**
	 * @param mtBuyJunAmount the mtBuyJunAmount to set
	 */
	public void setMtBuyJunAmount(int mtBuyJunAmount) {
		this.mtBuyJunAmount = mtBuyJunAmount;
	}

	/**
	 * @return the mtBuyJunCallYn
	 */
	public String getMtBuyJunCallYn() {
		return mtBuyJunCallYn;
	}

	/**
	 * @param mtBuyJunCallYn the mtBuyJunCallYn to set
	 */
	public void setMtBuyJunCallYn(String mtBuyJunCallYn) {
		this.mtBuyJunCallYn = mtBuyJunCallYn;
	}

	/**
	 * @return the mtBuyJulAmount
	 */
	public int getMtBuyJulAmount() {
		return mtBuyJulAmount;
	}

	/**
	 * @param mtBuyJulAmount the mtBuyJulAmount to set
	 */
	public void setMtBuyJulAmount(int mtBuyJulAmount) {
		this.mtBuyJulAmount = mtBuyJulAmount;
	}

	/**
	 * @return the mtBuyJulCallYn
	 */
	public String getMtBuyJulCallYn() {
		return mtBuyJulCallYn;
	}

	/**
	 * @param mtBuyJulCallYn the mtBuyJulCallYn to set
	 */
	public void setMtBuyJulCallYn(String mtBuyJulCallYn) {
		this.mtBuyJulCallYn = mtBuyJulCallYn;
	}

	/**
	 * @return the mtBuyAugAmount
	 */
	public int getMtBuyAugAmount() {
		return mtBuyAugAmount;
	}

	/**
	 * @param mtBuyAugAmount the mtBuyAugAmount to set
	 */
	public void setMtBuyAugAmount(int mtBuyAugAmount) {
		this.mtBuyAugAmount = mtBuyAugAmount;
	}

	/**
	 * @return the mtBuyAugCallYn
	 */
	public String getMtBuyAugCallYn() {
		return mtBuyAugCallYn;
	}

	/**
	 * @param mtBuyAugCallYn the mtBuyAugCallYn to set
	 */
	public void setMtBuyAugCallYn(String mtBuyAugCallYn) {
		this.mtBuyAugCallYn = mtBuyAugCallYn;
	}

	/**
	 * @return the mtBuySepAmount
	 */
	public int getMtBuySepAmount() {
		return mtBuySepAmount;
	}

	/**
	 * @param mtBuySepAmount the mtBuySepAmount to set
	 */
	public void setMtBuySepAmount(int mtBuySepAmount) {
		this.mtBuySepAmount = mtBuySepAmount;
	}

	/**
	 * @return the mtBuySepCallYn
	 */
	public String getMtBuySepCallYn() {
		return mtBuySepCallYn;
	}

	/**
	 * @param mtBuySepCallYn the mtBuySepCallYn to set
	 */
	public void setMtBuySepCallYn(String mtBuySepCallYn) {
		this.mtBuySepCallYn = mtBuySepCallYn;
	}

	/**
	 * @return the mtBuyOctAmount
	 */
	public int getMtBuyOctAmount() {
		return mtBuyOctAmount;
	}

	/**
	 * @param mtBuyOctAmount the mtBuyOctAmount to set
	 */
	public void setMtBuyOctAmount(int mtBuyOctAmount) {
		this.mtBuyOctAmount = mtBuyOctAmount;
	}

	/**
	 * @return the mtBuyOctCallYn
	 */
	public String getMtBuyOctCallYn() {
		return mtBuyOctCallYn;
	}

	/**
	 * @param mtBuyOctCallYn the mtBuyOctCallYn to set
	 */
	public void setMtBuyOctCallYn(String mtBuyOctCallYn) {
		this.mtBuyOctCallYn = mtBuyOctCallYn;
	}

	/**
	 * @return the mtBuyNovAmount
	 */
	public int getMtBuyNovAmount() {
		return mtBuyNovAmount;
	}

	/**
	 * @param mtBuyNovAmount the mtBuyNovAmount to set
	 */
	public void setMtBuyNovAmount(int mtBuyNovAmount) {
		this.mtBuyNovAmount = mtBuyNovAmount;
	}

	/**
	 * @return the mtBuyNovCallYn
	 */
	public String getMtBuyNovCallYn() {
		return mtBuyNovCallYn;
	}

	/**
	 * @param mtBuyNovCallYn the mtBuyNovCallYn to set
	 */
	public void setMtBuyNovCallYn(String mtBuyNovCallYn) {
		this.mtBuyNovCallYn = mtBuyNovCallYn;
	}

	/**
	 * @return the mtBuyDecAmount
	 */
	public int getMtBuyDecAmount() {
		return mtBuyDecAmount;
	}

	/**
	 * @param mtBuyDecAmount the mtBuyDecAmount to set
	 */
	public void setMtBuyDecAmount(int mtBuyDecAmount) {
		this.mtBuyDecAmount = mtBuyDecAmount;
	}

	/**
	 * @return the mtBuyDecCallYn
	 */
	public String getMtBuyDecCallYn() {
		return mtBuyDecCallYn;
	}

	/**
	 * @param mtBuyDecCallYn the mtBuyDecCallYn to set
	 */
	public void setMtBuyDecCallYn(String mtBuyDecCallYn) {
		this.mtBuyDecCallYn = mtBuyDecCallYn;
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

    
}
