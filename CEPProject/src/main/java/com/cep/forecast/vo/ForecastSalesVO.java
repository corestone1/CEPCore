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
@Alias("forecastSalesVO")
public class ForecastSalesVO extends ForecastVO implements Serializable {

	private static final long serialVersionUID = -6756383864911581845L;
	
	private String salesKey;         //매출관리키
	private String salesSpFkKey;         //forecast 관리키
	private String salesAcKey;  //매출 거래처 관리키
	private String fcSalesDt;      //예상 매출 일자
	private String fcCollectDt;         //예상 수금 일자
	private int fcSalesAmount;      //예상 매출 금액
	
	public String getSalesKey() {
		return salesKey;
	}
	public void setSalesKey(String salesKey) {
		this.salesKey = salesKey;
	}
	public String getSalesSpFkKey() {
		return salesSpFkKey;
	}
	public void setSalesSpFkKey(String salesSpFkKey) {
		this.salesSpFkKey = salesSpFkKey;
	}
	public String getSalesAcKey() {
		return salesAcKey;
	}
	public void setSalesAcKey(String salesAcKey) {
		this.salesAcKey = salesAcKey;
	}
	public String getFcSalesDt() {
		return fcSalesDt;
	}
	public void setFcSalesDt(String fcSalesDt) {
		this.fcSalesDt = fcSalesDt;
	}
	public String getFcCollectDt() {
		return fcCollectDt;
	}
	public void setFcCollectDt(String fcCollectDt) {
		this.fcCollectDt = fcCollectDt;
	}
	public int getFcSalesAmount() {
		return fcSalesAmount;
	}
	public void setFcSalesAmount(int fcSalesAmount) {
		this.fcSalesAmount = fcSalesAmount;
	}
	
}
