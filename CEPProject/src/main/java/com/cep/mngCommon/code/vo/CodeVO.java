/**
 * 
 */
package com.cep.mngCommon.code.vo;

import java.io.Serializable;

/**
 * @File Name : CodeSearchVO.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2021. 1. 6.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 1. 6.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */

public class CodeVO implements Serializable {

	private static final long serialVersionUID = 8168680373228209460L;
	
	private String rowNum;    //순번
	private String cdKey;     //코드 관리키
	private String cdClass;   //코드구분
	private String cdNm;      //코드명
	private String cdUpCd;    //코드 상위 코드
	private String cdDesc;    //코드 설명
	private String regDt;     //등록일
	private String regTm;     //등록시간
	private String regEmpKey; //등록자
	private String modDt;     //수정일
	private String modTm;     //수정시간
	private String modEmpKey; //수정자
	
	
	/**
	 * @return the rowNum
	 */
	public String getRowNum() {
		return rowNum;
	}
	/**
	 * @param rowNum the rowNum to set
	 */
	public void setRowNum(String rowNum) {
		this.rowNum = rowNum;
	}
	/**
	 * @return the cdKey
	 */
	public String getCdKey() {
		return cdKey;
	}
	/**
	 * @param cdKey the cdKey to set
	 */
	public void setCdKey(String cdKey) {
		this.cdKey = cdKey;
	}
	/**
	 * @return the cdClass
	 */
	public String getCdClass() {
		return cdClass;
	}
	/**
	 * @param cdClass the cdClass to set
	 */
	public void setCdClass(String cdClass) {
		this.cdClass = cdClass;
	}
	/**
	 * @return the cdNm
	 */
	public String getCdNm() {
		return cdNm;
	}
	/**
	 * @param cdNm the cdNm to set
	 */
	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}
	/**
	 * @return the cdUpCd
	 */
	public String getCdUpCd() {
		return cdUpCd;
	}
	/**
	 * @param cdUpCd the cdUpCd to set
	 */
	public void setCdUpCd(String cdUpCd) {
		this.cdUpCd = cdUpCd;
	}
	/**
	 * @return the cdDesc
	 */
	public String getCdDesc() {
		return cdDesc;
	}
	/**
	 * @param cdDesc the cdDesc to set
	 */
	public void setCdDesc(String cdDesc) {
		this.cdDesc = cdDesc;
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
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
