/**
 * 
 */
package com.cep.mngCommon.account.vo;

import java.io.Serializable;

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

public class AccountSearchVO implements Serializable {

	private static final long serialVersionUID = -2709806820615818683L;
	
	private String acNm;
	private String acSalesYN;
	private String acBuyYN;
	/**
	 * @return the acNm
	 */
	public String getAcNm() {
		return acNm;
	}
	/**
	 * @param acNm the acNm to set
	 */
	public void setAcNm(String acNm) {
		this.acNm = acNm;
	}
	/**
	 * @return the acSalesYN
	 */
	public String getAcSalesYN() {
		return acSalesYN;
	}
	/**
	 * @param acSalesYN the acSalesYN to set
	 */
	public void setAcSalesYN(String acSalesYN) {
		this.acSalesYN = acSalesYN;
	}
	/**
	 * @return the acBuyYN
	 */
	public String getAcBuyYN() {
		return acBuyYN;
	}
	/**
	 * @param acBuyYN the acBuyYN to set
	 */
	public void setAcBuyYN(String acBuyYN) {
		this.acBuyYN = acBuyYN;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
