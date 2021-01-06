/**
 * 
 */
package com.cep.maintenance.contract.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.cmm.util.CepDateUtil;
import com.cmm.util.CepStringUtil;
@SuppressWarnings("serial")
@Alias("mtContractProductVO")
/**
 * @File Name : MtProductVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 12. 3.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 12. 3.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtContractProductVO extends MtDefaultVO implements Serializable{

//	private static final long serialVersionUID = 1L;

	// 유지보수 제품 관리키 
    private int mtPmKey;

    // 유지보수 통합 관리키 유지보수 계약 PK
    private String mtIntegrateKey;

    // 유지보수 제품 FK 관리키 
    private String mtPmFkKey;
    
    // 유지보수 제품명
//    private String mtPmFkKeyNm;
    private String mtPmNmCd;

    // 유지보수 제품 상세 
    private String mtPmDetail;

    // 유지보수 제품 시리얼 번호 
    private String mtPmSerialNum;

    // 유지보수 제품 수량 
    private String mtPmQuantity;

    // 유지보수 제품 단가 
    private String mtPmUprice;

    // 유지보수 제품 시작 일자 
    private String mtPmStartDt;

    // 유지보수 제품 종료 일자 
    private String mtPmEndDt;

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
    
    private List<MtContractProductVO> mtContractProductVoList;

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
	 * @return the mtPmFkKey
	 */
	public String getMtPmFkKey() {
		return mtPmFkKey;
	}

	/**
	 * @param mtPmFkKey the mtPmFkKey to set
	 */
	public void setMtPmFkKey(String mtPmFkKey) {
		this.mtPmFkKey = mtPmFkKey;
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
	 * @return the mtPmQuantity
	 */
	public String getMtPmQuantity() {
		return mtPmQuantity;
	}
	
	public int getDbPmQuantity() {
		
		return Integer.parseInt(CepStringUtil.getDefaultValue(mtPmQuantity, "0").replace(",", ""));
	}
	
	public String getViewPmQuantity() {
		return CepStringUtil.getCommaString(String.valueOf(mtPmQuantity));
	}

	/**
	 * @param mtPmQuantity the mtPmQuantity to set
	 */
	public void setMtPmQuantity(String mtPmQuantity) {
		this.mtPmQuantity = mtPmQuantity;
	}

	/**
	 * @return the mtPmUprice
	 */
	public String getMtPmUprice() {
		return mtPmUprice;
	}
	public int getDbPmUprice() {
		return Integer.parseInt(CepStringUtil.getDefaultValue(mtPmUprice, "0").replace(",", ""));		
	}
	public String getViewPmUprice() {
		return CepStringUtil.getCommaString(String.valueOf(mtPmUprice));
	}

	/**
	 * @param mtPmUprice the mtPmUprice to set
	 */
	public void setMtPmUprice(String mtPmUprice) {
		this.mtPmUprice = mtPmUprice;
	}
	
	public String getTotalAmount(){
		String totalAmount = "0";
		totalAmount = String.valueOf(Integer.parseInt(mtPmQuantity)*Integer.parseInt(mtPmUprice));
		return totalAmount;
	}

	/**
	 * @return the mtPmStartDt
	 */
	public String getMtPmStartDt() {
		return mtPmStartDt;
	}
	public String getDbPmStartDt() {
		return CepDateUtil.convertDate(mtPmStartDt, null, null,"D");
	}
	public String getViewPmStartDt() {
		return CepDateUtil.convertDate(mtPmStartDt, null, null,"V");
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
	public String getDbPmEndDt() {
		return CepDateUtil.convertDate(mtPmEndDt, null, null,"D");
	}
	public String getViewPmEndDt() {
		return CepDateUtil.convertDate(mtPmEndDt, null, null,"V");
	}

	/**
	 * @param mtPmEndDt the mtPmEndDt to set
	 */
	public void setMtPmEndDt(String mtPmEndDt) {
		this.mtPmEndDt = mtPmEndDt;
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

//	/**
//	 * @return the mtPmFkKeyNm
//	 */
//	public String getMtPmFkKeyNm() {
//		return mtPmFkKeyNm;
//	}
//
//	/**
//	 * @param mtPmFkKeyNm the mtPmFkKeyNm to set
//	 */
//	public void setMtPmFkKeyNm(String mtPmFkKeyNm) {
//		this.mtPmFkKeyNm = mtPmFkKeyNm;
//	}

	/**
	 * @return the mtContractProductVoList
	 */
	public List<MtContractProductVO> getMtContractProductVoList() {
		return mtContractProductVoList;
	}

	/**
	 * @param mtContractProductVoList the mtContractProductVoList to set
	 */
	public void setMtContractProductVoList(List<MtContractProductVO> mtContractProductVoList) {
		this.mtContractProductVoList = mtContractProductVoList;
	}

	/**
	 * @return the mtPmNmCd
	 */
	public String getMtPmNmCd() {
		return mtPmNmCd;
	}

	/**
	 * @param mtPmNmCd the mtPmNmCd to set
	 */
	public void setMtPmNmCd(String mtPmNmCd) {
		this.mtPmNmCd = mtPmNmCd;
	}



}
