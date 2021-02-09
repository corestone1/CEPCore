/**
 * 
 */
package com.cep.maintenance.contract.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;
@SuppressWarnings("serial")
@Alias("mtBackOrderProductVO")

/**
 * @File Name : MtBackOrderProductVO.java
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
public class MtBackOrderProductVO implements Serializable {

    // 유지보수 발주 제품 관리키 
    private int mtOrderPmKey;

    // 유지보수 발주 관리키 
    private String mtOrderKey;

    // 유지보수 제품 관리키 유지보수 제품 관리키
    private int mtPmKey;
    
    //유지보수 제품명
    private String mtPmKeyNm;

    // 유지보수 발주 제품 수량 
    private int mtOrderPmQuantity;

    // 유지보수 발주 제품 단가 
    private int mtOrderPmUprice;

    // 금액 구분 단가/소가 구분
//    private String amountClass;
    
    // 유지보수 제품 시리얼 번호 
    private String mtPmSerialNum;
    
 // 유지보수 제품 상세 
    private String mtPmDetail;

    // 유지보수 시작 일자 
    private String mtStartDt;

    // 유지보수 종료 일자 
    private String mtEndDt;

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
    
    //해당 제품 유지보수계약 시작일자
    private String mtPmStartDt;
    
    //해당 제품 유지보수계약 종료일자.
    private String mtPmEndDt;

	/**
	 * @return the mtOrderPmKey
	 */
	public int getMtOrderPmKey() {
		return mtOrderPmKey;
	}

	/**
	 * @param mtOrderPmKey the mtOrderPmKey to set
	 */
	public void setMtOrderPmKey(int mtOrderPmKey) {
		this.mtOrderPmKey = mtOrderPmKey;
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

	/**
	 * @return the mtPmKey
	 */
	public int getMtPmKey() {
		return mtPmKey;
	}

	/**
	 * @param mtPmKey the mtPmKey to set
	 */
	public void setMtPmKey(int mtPmKey) {
		this.mtPmKey = mtPmKey;
	}

	/**
	 * @return the mtOrderPmQuantity
	 */
	public int getMtOrderPmQuantity() {
		return mtOrderPmQuantity;
	}

	/**
	 * @param mtOrderPmQuantity the mtOrderPmQuantity to set
	 */
	public void setMtOrderPmQuantity(int mtOrderPmQuantity) {
		this.mtOrderPmQuantity = mtOrderPmQuantity;
	}

	/**
	 * @return the mtOrderPmUprice
	 */
	public int getMtOrderPmUprice() {
		return mtOrderPmUprice;
	}

	/**
	 * @param mtOrderPmUprice the mtOrderPmUprice to set
	 */
	public void setMtOrderPmUprice(int mtOrderPmUprice) {
		this.mtOrderPmUprice = mtOrderPmUprice;
	}

	/**
	 * @return the mtStartDt
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
	 * @return the mtEndDt
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
	 * @return the mtPmKeyNm
	 */
	public String getMtPmKeyNm() {
		return mtPmKeyNm;
	}

	/**
	 * @param mtPmKeyNm the mtPmKeyNm to set
	 */
	public void setMtPmKeyNm(String mtPmKeyNm) {
		this.mtPmKeyNm = mtPmKeyNm;
	}

	/**
	 * @return the mtPmSerialNum
	 */
	public String getMtPmSerialNum() {
		return mtPmSerialNum;
	}

	/**
	 * @param mtPmSerialNum the mtPmSerialNum to set
	 */
	public void setMtPmSerialNum(String mtPmSerialNum) {
		this.mtPmSerialNum = mtPmSerialNum;
	}

	/**
	 * @return the mtPmDetail
	 */
	public String getMtPmDetail() {
		return mtPmDetail;
	}

	/**
	 * @param mtPmDetail the mtPmDetail to set
	 */
	public void setMtPmDetail(String mtPmDetail) {
		this.mtPmDetail = mtPmDetail;
	}

	/**
	 * @return the mtPmStartDt
	 */
	public String getMtPmStartDt() {
		return mtPmStartDt;
	}

	/**
	 * @param mtPmStartDt the mtPmStartDt to set
	 */
	public void setMtPmStartDt(String mtPmStartDt) {
		this.mtPmStartDt = mtPmStartDt;
	}

	/**
	 * @return the mtPmEndDt
	 */
	public String getMtPmEndDt() {
		return mtPmEndDt;
	}

	/**
	 * @param mtPmEndDt the mtPmEndDt to set
	 */
	public void setMtPmEndDt(String mtPmEndDt) {
		this.mtPmEndDt = mtPmEndDt;
	}


}
