/**
 * 
 */
package com.cep.mngCommon.account.vo;

import java.io.Serializable;

import com.cep.example.vo.SampleDefaultVO;

/**
 * @File Name : AccountVO.java
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

public class AccountDirectorVO extends AccountVO implements Serializable {

	private static final long serialVersionUID = -2709806820615818683L;

	private String acDirectorKey;
	private String acDirectorNm;
	private String acDirectorMbNum;
	private String acDirectorTelNum;
	private String acDirectorEmail;
	private String acDirectorDeptNm;
	private String acDirectorPositionNm;
	private String acDirectorDesc;
	
	public String getAcDirectorKey() {
		return acDirectorKey;
	}
	public void setAcDirectorKey(String acDirectorKey) {
		this.acDirectorKey = acDirectorKey;
	}
	public String getAcDirectorNm() {
		return acDirectorNm;
	}
	public void setAcDirectorNm(String acDirectorNm) {
		this.acDirectorNm = acDirectorNm;
	}
	public String getAcDirectorMbNum() {
		return acDirectorMbNum;
	}
	public void setAcDirectorMbNum(String acDirectorMbNum) {
		this.acDirectorMbNum = acDirectorMbNum;
	}
	public String getAcDirectorTelNum() {
		return acDirectorTelNum;
	}
	public void setAcDirectorTelNum(String acDirectorTelNum) {
		this.acDirectorTelNum = acDirectorTelNum;
	}
	public String getAcDirectorEmail() {
		return acDirectorEmail;
	}
	public void setAcDirectorEmail(String acDirectorEmail) {
		this.acDirectorEmail = acDirectorEmail;
	}
	public String getAcDirectorDeptNm() {
		return acDirectorDeptNm;
	}
	public void setAcDirectorDeptNm(String acDirectorDeptNm) {
		this.acDirectorDeptNm = acDirectorDeptNm;
	}
	public String getAcDirectorPositionNm() {
		return acDirectorPositionNm;
	}
	public void setAcDirectorPositionNm(String acDirectorPositionNm) {
		this.acDirectorPositionNm = acDirectorPositionNm;
	}
	public String getAcDirectorDesc() {
		return acDirectorDesc;
	}
	public void setAcDirectorDesc(String acDirectorDesc) {
		this.acDirectorDesc = acDirectorDesc;
	}
	
}
