package com.cmm.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.cep.example.vo.SampleDefaultVO;

@SuppressWarnings("serial")
@Alias("SalesVO")
public class SalesVO extends SampleDefaultVO implements Serializable {
	
	private String salesKey;
	private String salesCtFkKey;
	private String salesCtClass;
	private int salesTurn;
	private int salesCollectRate;
	private int salesTurnAmount;
	private String salesChargeDt;
	private String salesBillFcDt;
	private String salesCollectFcDt;
	private String salesCollectFinishDt;
	private String salesGbYn;
	private String salesStatusCd;
	private String regEmpKey;
	private String modEmpKey;
	private List<GuarantyBondVO> guarantyList;
	
	public String getSalesKey() {
		return salesKey;
	}
	public void setSalesKey(String salesKey) {
		this.salesKey = salesKey;
	}
	public String getSalesCtFkKey() {
		return salesCtFkKey;
	}
	public void setSalesCtFkKey(String salesCtFkKey) {
		this.salesCtFkKey = salesCtFkKey;
	}
	public String getSalesCtClass() {
		return salesCtClass;
	}
	public void setSalesCtClass(String salesCtClass) {
		this.salesCtClass = salesCtClass;
	}
	public int getSalesTurn() {
		return salesTurn;
	}
	public void setSalesTurn(int salesTurn) {
		this.salesTurn = salesTurn;
	}
	public int getSalesCollectRate() {
		return salesCollectRate;
	}
	public void setSalesCollectRate(int salesCollectRate) {
		this.salesCollectRate = salesCollectRate;
	}
	public int getSalesTurnAmount() {
		return salesTurnAmount;
	}
	public void setSalesTurnAmount(int salesTurnAmount) {
		this.salesTurnAmount = salesTurnAmount;
	}
	public String getSalesChargeDt() {
		return salesChargeDt;
	}
	public void setSalesChargeDt(String salesChargeDt) {
		this.salesChargeDt = salesChargeDt;
	}
	public String getSalesBillFcDt() {
		return salesBillFcDt;
	}
	public void setSalesBillFcDt(String salesBillFcDt) {
		this.salesBillFcDt = salesBillFcDt;
	}
	public String getSalesCollectFcDt() {
		return salesCollectFcDt;
	}
	public void setSalesCollectFcDt(String salesCollectFcDt) {
		this.salesCollectFcDt = salesCollectFcDt;
	}
	public String getSalesCollectFinishDt() {
		return salesCollectFinishDt;
	}
	public void setSalesCollectFinishDt(String salesCollectFinishDt) {
		this.salesCollectFinishDt = salesCollectFinishDt;
	}
	public String getSalesGbYn() {
		return salesGbYn;
	}
	public void setSalesGbYn(String salesGbYn) {
		this.salesGbYn = salesGbYn;
	}
	public String getSalesStatusCd() {
		return salesStatusCd;
	}
	public void setSalesStatusCd(String salesStatusCd) {
		this.salesStatusCd = salesStatusCd;
	}
	public String getRegEmpKey() {
		return regEmpKey;
	}
	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}
	public String getModEmpKey() {
		return modEmpKey;
	}
	public void setModEmpKey(String modEmpKey) {
		this.modEmpKey = modEmpKey;
	}
	public List<GuarantyBondVO> getGuarantyList() {
		return guarantyList;
	}
	public void setGuarantyList(List<GuarantyBondVO> guarantyList) {
		this.guarantyList = guarantyList;
	}
	
}
