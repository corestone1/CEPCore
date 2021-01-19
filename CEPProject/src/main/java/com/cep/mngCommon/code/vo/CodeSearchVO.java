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

public class CodeSearchVO implements Serializable {

	private static final long serialVersionUID = 5100355601792971040L;
	
	private String cdClass; //코드구분
	private String cdNm;    //코드명
	private String cdUpCd;  //코드 상위 코드
	
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
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
