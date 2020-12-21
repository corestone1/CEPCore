/**
 * 
 */
package com.cep.maintenance.contract.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("mtSalesAmountVO")
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


    // 유지보수 통합 관리키 유지보수계약 PK
    private String mtIntegrateKey;
    
    //유지보수 매출 관리키
    private String mtSalesKey;

    // 유지보수 매출 년도 yyyy
    private String mtSalesYear;

    // 유지보수 매출 1월 금액 
    private int mtSalesJanAmount;

    // 유지보수 매출 1월 요청 여부 
    private String mtSalesJanCallYn;

    // 유지보수 매출 2월 금액 
    private int mtSalesFebAmount;

    // 유지보수 매출 2월 요청 여부 
    private String mtSalesFebCallYn;

    // 유지보수 매출 3월 금액 
    private int mtSalesMarAmount;

    // 유지보수 매출 3월 요청 여부 
    private String mtSalesMarCallYn;

    // 유지보수 매출 4월 금액 
    private int mtSalesAprAmount;

    // 유지보수 매출 4월 요청 여부 
    private String mtSalesAprCallYn;

    // 유지보수 매출 5월 금액 
    private int mtSalesMayAmount;

    // 유지보수 매출 5월 요청 여부 
    private String mtSalesMayCallYn;

    // 유지보수 매출 6월 금액 
    private int mtSalesJunAmount;

    // 유지보수 매출 6월 요청 여부 
    private String mtSalesJunCallYn;

    // 유지보수 매출 7월 금액 
    private int mtSalesJulAmount;

    // 유지보수 매출 7월 요청 여부 
    private String mtSalesJulCallYn;

    // 유지보수 매출 8월 금액 
    private int mtSalesAugAmount;

    // 유지보수 매출 8월 요청 여부 
    private String mtSalesAugCallYn;

    // 유지보수 매출 9월 금액 
    private int mtSalesSepAmount;

    // 유지보수 매출 9월 요청 여부 
    private String mtSalesSepCallYn;

    // 유지보수 매출 10월 금액 
    private int mtSalesOctAmount;

    // 유지보수 매출 10월 요청 여부 
    private String mtSalesOctCallYn;

    // 유지보수 매출 11월 금액 
    private int mtSalesNovAmount;

    // 유지보수 매출 11월 요청 여부 
    private String mtSalesNovCallYn;

    // 유지보수 매출 12월 금액 
    private int mtSalesDecAmount;

    // 유지보수 매출 12월 요청 여부 
    private String mtSalesDecCallYn;

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
	 * @return the mtSalesKey
	 */
	public String getMtSalesKey() {
		return mtSalesKey;
	}

	/**
	 * @param mtSalesKey the mtSalesKey to set
	 */
	public void setMtSalesKey(String mtSalesKey) {
		this.mtSalesKey = mtSalesKey;
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
	 * @return the mtSalesJanAmount
	 */
	public int getMtSalesJanAmount() {
		return mtSalesJanAmount;
	}

	/**
	 * @param mtSalesJanAmount the mtSalesJanAmount to set
	 */
	public void setMtSalesJanAmount(int mtSalesJanAmount) {
		this.mtSalesJanAmount = mtSalesJanAmount;
	}

	/**
	 * @return the mtSalesJanCallYn
	 */
	public String getMtSalesJanCallYn() {
		return mtSalesJanCallYn;
	}

	/**
	 * @param mtSalesJanCallYn the mtSalesJanCallYn to set
	 */
	public void setMtSalesJanCallYn(String mtSalesJanCallYn) {
		this.mtSalesJanCallYn = mtSalesJanCallYn;
	}

	/**
	 * @return the mtSalesFebAmount
	 */
	public int getMtSalesFebAmount() {
		return mtSalesFebAmount;
	}

	/**
	 * @param mtSalesFebAmount the mtSalesFebAmount to set
	 */
	public void setMtSalesFebAmount(int mtSalesFebAmount) {
		this.mtSalesFebAmount = mtSalesFebAmount;
	}

	/**
	 * @return the mtSalesFebCallYn
	 */
	public String getMtSalesFebCallYn() {
		return mtSalesFebCallYn;
	}

	/**
	 * @param mtSalesFebCallYn the mtSalesFebCallYn to set
	 */
	public void setMtSalesFebCallYn(String mtSalesFebCallYn) {
		this.mtSalesFebCallYn = mtSalesFebCallYn;
	}

	/**
	 * @return the mtSalesMarAmount
	 */
	public int getMtSalesMarAmount() {
		return mtSalesMarAmount;
	}

	/**
	 * @param mtSalesMarAmount the mtSalesMarAmount to set
	 */
	public void setMtSalesMarAmount(int mtSalesMarAmount) {
		this.mtSalesMarAmount = mtSalesMarAmount;
	}

	/**
	 * @return the mtSalesMarCallYn
	 */
	public String getMtSalesMarCallYn() {
		return mtSalesMarCallYn;
	}

	/**
	 * @param mtSalesMarCallYn the mtSalesMarCallYn to set
	 */
	public void setMtSalesMarCallYn(String mtSalesMarCallYn) {
		this.mtSalesMarCallYn = mtSalesMarCallYn;
	}

	/**
	 * @return the mtSalesAprAmount
	 */
	public int getMtSalesAprAmount() {
		return mtSalesAprAmount;
	}

	/**
	 * @param mtSalesAprAmount the mtSalesAprAmount to set
	 */
	public void setMtSalesAprAmount(int mtSalesAprAmount) {
		this.mtSalesAprAmount = mtSalesAprAmount;
	}

	/**
	 * @return the mtSalesAprCallYn
	 */
	public String getMtSalesAprCallYn() {
		return mtSalesAprCallYn;
	}

	/**
	 * @param mtSalesAprCallYn the mtSalesAprCallYn to set
	 */
	public void setMtSalesAprCallYn(String mtSalesAprCallYn) {
		this.mtSalesAprCallYn = mtSalesAprCallYn;
	}

	/**
	 * @return the mtSalesMayAmount
	 */
	public int getMtSalesMayAmount() {
		return mtSalesMayAmount;
	}

	/**
	 * @param mtSalesMayAmount the mtSalesMayAmount to set
	 */
	public void setMtSalesMayAmount(int mtSalesMayAmount) {
		this.mtSalesMayAmount = mtSalesMayAmount;
	}

	/**
	 * @return the mtSalesMayCallYn
	 */
	public String getMtSalesMayCallYn() {
		return mtSalesMayCallYn;
	}

	/**
	 * @param mtSalesMayCallYn the mtSalesMayCallYn to set
	 */
	public void setMtSalesMayCallYn(String mtSalesMayCallYn) {
		this.mtSalesMayCallYn = mtSalesMayCallYn;
	}

	/**
	 * @return the mtSalesJunAmount
	 */
	public int getMtSalesJunAmount() {
		return mtSalesJunAmount;
	}

	/**
	 * @param mtSalesJunAmount the mtSalesJunAmount to set
	 */
	public void setMtSalesJunAmount(int mtSalesJunAmount) {
		this.mtSalesJunAmount = mtSalesJunAmount;
	}

	/**
	 * @return the mtSalesJunCallYn
	 */
	public String getMtSalesJunCallYn() {
		return mtSalesJunCallYn;
	}

	/**
	 * @param mtSalesJunCallYn the mtSalesJunCallYn to set
	 */
	public void setMtSalesJunCallYn(String mtSalesJunCallYn) {
		this.mtSalesJunCallYn = mtSalesJunCallYn;
	}

	/**
	 * @return the mtSalesJulAmount
	 */
	public int getMtSalesJulAmount() {
		return mtSalesJulAmount;
	}

	/**
	 * @param mtSalesJulAmount the mtSalesJulAmount to set
	 */
	public void setMtSalesJulAmount(int mtSalesJulAmount) {
		this.mtSalesJulAmount = mtSalesJulAmount;
	}

	/**
	 * @return the mtSalesJulCallYn
	 */
	public String getMtSalesJulCallYn() {
		return mtSalesJulCallYn;
	}

	/**
	 * @param mtSalesJulCallYn the mtSalesJulCallYn to set
	 */
	public void setMtSalesJulCallYn(String mtSalesJulCallYn) {
		this.mtSalesJulCallYn = mtSalesJulCallYn;
	}

	/**
	 * @return the mtSalesAugAmount
	 */
	public int getMtSalesAugAmount() {
		return mtSalesAugAmount;
	}

	/**
	 * @param mtSalesAugAmount the mtSalesAugAmount to set
	 */
	public void setMtSalesAugAmount(int mtSalesAugAmount) {
		this.mtSalesAugAmount = mtSalesAugAmount;
	}

	/**
	 * @return the mtSalesAugCallYn
	 */
	public String getMtSalesAugCallYn() {
		return mtSalesAugCallYn;
	}

	/**
	 * @param mtSalesAugCallYn the mtSalesAugCallYn to set
	 */
	public void setMtSalesAugCallYn(String mtSalesAugCallYn) {
		this.mtSalesAugCallYn = mtSalesAugCallYn;
	}

	/**
	 * @return the mtSalesSepAmount
	 */
	public int getMtSalesSepAmount() {
		return mtSalesSepAmount;
	}

	/**
	 * @param mtSalesSepAmount the mtSalesSepAmount to set
	 */
	public void setMtSalesSepAmount(int mtSalesSepAmount) {
		this.mtSalesSepAmount = mtSalesSepAmount;
	}

	/**
	 * @return the mtSalesSepCallYn
	 */
	public String getMtSalesSepCallYn() {
		return mtSalesSepCallYn;
	}

	/**
	 * @param mtSalesSepCallYn the mtSalesSepCallYn to set
	 */
	public void setMtSalesSepCallYn(String mtSalesSepCallYn) {
		this.mtSalesSepCallYn = mtSalesSepCallYn;
	}

	/**
	 * @return the mtSalesOctAmount
	 */
	public int getMtSalesOctAmount() {
		return mtSalesOctAmount;
	}

	/**
	 * @param mtSalesOctAmount the mtSalesOctAmount to set
	 */
	public void setMtSalesOctAmount(int mtSalesOctAmount) {
		this.mtSalesOctAmount = mtSalesOctAmount;
	}

	/**
	 * @return the mtSalesOctCallYn
	 */
	public String getMtSalesOctCallYn() {
		return mtSalesOctCallYn;
	}

	/**
	 * @param mtSalesOctCallYn the mtSalesOctCallYn to set
	 */
	public void setMtSalesOctCallYn(String mtSalesOctCallYn) {
		this.mtSalesOctCallYn = mtSalesOctCallYn;
	}

	/**
	 * @return the mtSalesNovAmount
	 */
	public int getMtSalesNovAmount() {
		return mtSalesNovAmount;
	}

	/**
	 * @param mtSalesNovAmount the mtSalesNovAmount to set
	 */
	public void setMtSalesNovAmount(int mtSalesNovAmount) {
		this.mtSalesNovAmount = mtSalesNovAmount;
	}

	/**
	 * @return the mtSalesNovCallYn
	 */
	public String getMtSalesNovCallYn() {
		return mtSalesNovCallYn;
	}

	/**
	 * @param mtSalesNovCallYn the mtSalesNovCallYn to set
	 */
	public void setMtSalesNovCallYn(String mtSalesNovCallYn) {
		this.mtSalesNovCallYn = mtSalesNovCallYn;
	}

	/**
	 * @return the mtSalesDecAmount
	 */
	public int getMtSalesDecAmount() {
		return mtSalesDecAmount;
	}

	/**
	 * @param mtSalesDecAmount the mtSalesDecAmount to set
	 */
	public void setMtSalesDecAmount(int mtSalesDecAmount) {
		this.mtSalesDecAmount = mtSalesDecAmount;
	}

	/**
	 * @return the mtSalesDecCallYn
	 */
	public String getMtSalesDecCallYn() {
		return mtSalesDecCallYn;
	}

	/**
	 * @param mtSalesDecCallYn the mtSalesDecCallYn to set
	 */
	public void setMtSalesDecCallYn(String mtSalesDecCallYn) {
		this.mtSalesDecCallYn = mtSalesDecCallYn;
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
    
}
