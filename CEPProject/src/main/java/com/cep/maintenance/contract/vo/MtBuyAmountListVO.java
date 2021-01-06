/**
 * 
 */
package com.cep.maintenance.contract.vo;

import java.io.Serializable;
import java.util.List;

/**
 * @File Name : MtBuyAmountListVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 12. 23.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 12. 23.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtBuyAmountListVO implements Serializable {

	private static final long serialVersionUID = 1L;
	// 유지보수 통합 관리키 유지보수 계약 PK
	private String mtIntegrateKey;
	// 유지보수 발주 관리키
	private String mtOrderKey;
	// 유지보수계약 매입 삭제 관리키 
	private String deleteKeys;
	// 등록자 관리키
	private String regEmpKey;
	// 수정자 관리키
	private String modEmpKey;
	
	private int purchaseInitCnt;
	
	//유지보수 매입 금액 리스트.
	private List<MtBuyAmountVO> mtBuyAmountVOList;

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
	 * @return the deleteKeys
	 */
	public String getDeleteKeys() {
		return deleteKeys;
	}

	/**
	 * @param deleteKeys the deleteKeys to set
	 */
	public void setDeleteKeys(String deleteKeys) {
		this.deleteKeys = deleteKeys;
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
	 * @return the mtBuyAmountVOList
	 */
	public List<MtBuyAmountVO> getMtBuyAmountVOList() {
		return mtBuyAmountVOList;
	}

	/**
	 * @param mtBuyAmountVOList the mtBuyAmountVOList to set
	 */
	public void setMtBuyAmountVOList(List<MtBuyAmountVO> mtBuyAmountVOList) {
		this.mtBuyAmountVOList = mtBuyAmountVOList;
	}

	/**
	 * @return the purchaseInitCnt
	 */
	public int getPurchaseInitCnt() {
		return purchaseInitCnt;
	}

	/**
	 * @param purchaseInitCnt the purchaseInitCnt to set
	 */
	public void setPurchaseInitCnt(int purchaseInitCnt) {
		this.purchaseInitCnt = purchaseInitCnt;
	}

}
