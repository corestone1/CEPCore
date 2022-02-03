/**
 * 
 */
package com.cep.mngProject.perform.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

/**
 * @File Name : MngOrderSearchVO.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2021. 2. 15.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 2. 15.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
@Alias("mngOrderSearchVO")
public class MngProjectPerformSearchVO implements Serializable {

	private static final long serialVersionUID = -3046214326120107255L;
	
	private String pjKey;
	private String pjNm;
	private String performDtFrom;
	private String performDtTo;
	
	private String regEmpKey;

	
	public String getPjKey() {
		return pjKey;
	}

	public void setPjKey(String pjKey) {
		this.pjKey = pjKey;
	}

	public String getPjNm() {
		return pjNm;
	}

	public void setPjNm(String pjNm) {
		this.pjNm = pjNm;
	}

	public String getPerformDtFrom() {
		return performDtFrom;
	}

	public void setPerformDtFrom(String performDtFrom) {
		this.performDtFrom = performDtFrom;
	}

	public String getPerformDtTo() {
		return performDtTo;
	}

	public void setPerformDtTo(String performDtTo) {
		this.performDtTo = performDtTo;
	}

	public String getRegEmpKey() {
		return regEmpKey;
	}

	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}

}
