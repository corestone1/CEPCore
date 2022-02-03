package com.cep.forecast.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

/**
 * @File Name : ForecastVO.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2021. 1. 21.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 1. 21.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
@Alias("forecastPcVO")
public class ForecastPcVO extends ForecastVO implements Serializable {

	private static final long serialVersionUID = -6756383864911581845L;
	
	private String buyKey;         //매입
	private String buySpFkKey;         //forecast 관리키
	private String buyAcKey;		// 매입 거래처 관리키
	private String fcBuyDt;
	private String fcBuyPayDt;  //예상 매입 결제 일자
	private int fcBuyAmount;      //예상 매입 금액
	
	public String getBuyKey() {
		return buyKey;
	}
	public void setBuyKey(String buyKey) {
		this.buyKey = buyKey;
	}
	public String getBuySpFkKey() {
		return buySpFkKey;
	}
	public void setBuySpFkKey(String buySpFkKey) {
		this.buySpFkKey = buySpFkKey;
	}
	public String getBuyAcKey() {
		return buyAcKey;
	}
	public void setBuyAcKey(String buyAcKey) {
		this.buyAcKey = buyAcKey;
	}
	public String getFcBuyDt() {
		return fcBuyDt;
	}
	public void setFcBuyDt(String fcBuyDt) {
		this.fcBuyDt = fcBuyDt;
	}
	public String getFcBuyPayDt() {
		return fcBuyPayDt;
	}
	public void setFcBuyPayDt(String fcBuyPayDt) {
		this.fcBuyPayDt = fcBuyPayDt;
	}
	public int getFcBuyAmount() {
		return fcBuyAmount;
	}
	public void setFcBuyAmount(int fcBuyAmount) {
		this.fcBuyAmount = fcBuyAmount;
	}
	
}
