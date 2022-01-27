/**
 * 
 */
package com.cep.maintenance.contract.vo;

import java.util.List;
import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("mtSaleAmountListVO")
/**
 * @File Name : MtSaleAmountListVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 12. 10.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 12. 10.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtSaleAmountListVO extends MtDefaultVO {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 1L;
	private List<MtSalesAmountVO> mtSalesAmountVOList;
	private String mtIntegrateKey;
	private String mtSalesOrderKey;
	private String parmMtSbCtYn;
//	private String deleteKeys;
	private String regEmpKey;
	private String modEmpKey;
	/**
	 * @return the mtSalesAmountVOList
	 */
	public List<MtSalesAmountVO> getMtSalesAmountVOList() {
		return mtSalesAmountVOList;
	}
	/**
	 * @param mtSalesAmountVOList the mtSalesAmountVOList to set
	 */
	public void setMtSalesAmountVOList(List<MtSalesAmountVO> mtSalesAmountVOList) {
		this.mtSalesAmountVOList = mtSalesAmountVOList;
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
	 * @return the parmMtSbCtYn
	 */
	public String getParmMtSbCtYn() {
		return parmMtSbCtYn;
	}
	/**
	 * @param parmMtSbCtYn the parmMtSbCtYn to set
	 */
	public void setParmMtSbCtYn(String parmMtSbCtYn) {
		this.parmMtSbCtYn = parmMtSbCtYn;
	}
	/**
	 * @return the deleteKeys
	 */
//	public String getDeleteKeys() {
//		return deleteKeys;
//	}
//	/**
//	 * @param deleteKeys the deleteKeys to set
//	 */
//	public void setDeleteKeys(String deleteKeys) {
//		this.deleteKeys = deleteKeys;
//	}
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
	public String getMtSalesOrderKey() {
		return mtSalesOrderKey;
	}
	public void setMtSalesOrderKey(String mtSalesOrderKey) {
		this.mtSalesOrderKey = mtSalesOrderKey;
	}
}
