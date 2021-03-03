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

public class AccountDepositVO extends AccountVO implements Serializable {

	private static final long serialVersionUID = -2709806820615818683L;

	private String acKey;
	private int acAdSeq;
	private String acBankNm;
	private String acBkno;
	private String acAcholder;
	private String acRepBknoYn;
	
	public String getAcKey() {
		return acKey;
	}
	public void setAcKey(String acKey) {
		this.acKey = acKey;
	}
	public int getAcAdSeq() {
		return acAdSeq;
	}
	public void setAcAdSeq(int acAdSeq) {
		this.acAdSeq = acAdSeq;
	}
	public String getAcBankNm() {
		return acBankNm;
	}
	public void setAcBankNm(String acBankNm) {
		this.acBankNm = acBankNm;
	}
	public String getAcBkno() {
		return acBkno;
	}
	public void setAcBkno(String acBkno) {
		this.acBkno = acBkno;
	}
	public String getAcAcholder() {
		return acAcholder;
	}
	public void setAcAcholder(String acAcholder) {
		this.acAcholder = acAcholder;
	}
	public String getAcRepBknoYn() {
		return acRepBknoYn;
	}
	public void setAcRepBknoYn(String acRepBknoYn) {
		this.acRepBknoYn = acRepBknoYn;
	}
	
}
