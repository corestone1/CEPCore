package com.cmm.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("guarantyBondVO")
public class GuarantyBondVO extends SalesVO implements Serializable {
	
	private String gbKey;
	private String ctKey;
	private String salesKey;
	private String gbKindCd;
	private String gbStartDt;
	private String gbEndDt;
	private String gbIssueStatus;
	private String gbPublishDt;
	private String gbReqDt;
	private int gbAmount;
	private int gbContractAmount;
	private String ctGbKey;
	private String dfGbKey;
	private String ppGbKey;
	private String ctGuarantyYN;
	private String dfGuarantyYN;
	private String ppGuarantyYN;
	private String ctGuarantyStartDt;
	private String dfGuarantyStartDt;
	private String ppGuarantyStartDt;
	private String ctGuarantyEndDt;
	private String dfGuarantyEndDt;
	private String ppGuarantyEndDt;
	private String ctGbIssueYn;
	private String dfGbIssueYn;
	private String ppGbIssueYn;
	private String ctGbPublishDt;
	private String dfGbPublishDt;
	private String ppGbPublishDt;
	private int ctGuarantyAmount;
	private int dfGuarantyAmount;
	private int ppGuarantyAmount;
	private int collectTurn;
	
	private int gbRate;
	private String gbInspectDt;
	private int gbSkAmount;
	
	public String getGbKey() {
		return gbKey;
	}
	public void setGbKey(String gbKey) {
		this.gbKey = gbKey;
	}
	public String getCtKey() {
		return ctKey;
	}
	public void setCtKey(String ctKey) {
		this.ctKey = ctKey;
	}
	public String getSalesKey() {
		return salesKey;
	}
	public void setSalesKey(String salesKey) {
		this.salesKey = salesKey;
	}
	public String getGbKindCd() {
		return gbKindCd;
	}
	public void setGbKindCd(String gbKindCd) {
		this.gbKindCd = gbKindCd;
	}
	public String getGbStartDt() {
		return gbStartDt;
	}
	public void setGbStartDt(String gbStartDt) {
		this.gbStartDt = gbStartDt;
	}
	public String getGbEndDt() {
		return gbEndDt;
	}
	public void setGbEndDt(String gbEndDt) {
		this.gbEndDt = gbEndDt;
	}
	public String getGbIssueStatus() {
		return gbIssueStatus;
	}
	public void setGbIssueStatus(String gbIssueStatus) {
		this.gbIssueStatus = gbIssueStatus;
	}
	public String getGbPublishDt() {
		return gbPublishDt;
	}
	public void setGbPublishDt(String gbPublishDt) {
		this.gbPublishDt = gbPublishDt;
	}
	public String getGbReqDt() {
		return gbReqDt;
	}
	public void setGbReqDt(String gbReqDt) {
		this.gbReqDt = gbReqDt;
	}
	public int getGbAmount() {
		return gbAmount;
	}
	public void setGbAmount(int gbAmount) {
		this.gbAmount = gbAmount;
	}
	public int getGbContractAmount() {
		return gbContractAmount;
	}
	public void setGbContractAmount(int gbContractAmount) {
		this.gbContractAmount = gbContractAmount;
	}
	public String getCtGbKey() {
		return ctGbKey;
	}
	public void setCtGbKey(String ctGbKey) {
		this.ctGbKey = ctGbKey;
	}
	public String getDfGbKey() {
		return dfGbKey;
	}
	public void setDfGbKey(String dfGbKey) {
		this.dfGbKey = dfGbKey;
	}
	public String getPpGbKey() {
		return ppGbKey;
	}
	public void setPpGbKey(String ppGbKey) {
		this.ppGbKey = ppGbKey;
	}
	public String getCtGuarantyYN() {
		return ctGuarantyYN;
	}
	public void setCtGuarantyYN(String ctGuarantyYN) {
		this.ctGuarantyYN = ctGuarantyYN;
	}
	public String getDfGuarantyYN() {
		return dfGuarantyYN;
	}
	public void setDfGuarantyYN(String dfGuarantyYN) {
		this.dfGuarantyYN = dfGuarantyYN;
	}
	public String getPpGuarantyYN() {
		return ppGuarantyYN;
	}
	public void setPpGuarantyYN(String ppGuarantyYN) {
		this.ppGuarantyYN = ppGuarantyYN;
	}
	public String getCtGuarantyStartDt() {
		return ctGuarantyStartDt;
	}
	public void setCtGuarantyStartDt(String ctGuarantyStartDt) {
		this.ctGuarantyStartDt = ctGuarantyStartDt;
	}
	public String getDfGuarantyStartDt() {
		return dfGuarantyStartDt;
	}
	public void setDfGuarantyStartDt(String dfGuarantyStartDt) {
		this.dfGuarantyStartDt = dfGuarantyStartDt;
	}
	public String getPpGuarantyStartDt() {
		return ppGuarantyStartDt;
	}
	public void setPpGuarantyStartDt(String ppGuarantyStartDt) {
		this.ppGuarantyStartDt = ppGuarantyStartDt;
	}
	public String getCtGuarantyEndDt() {
		return ctGuarantyEndDt;
	}
	public void setCtGuarantyEndDt(String ctGuarantyEndDt) {
		this.ctGuarantyEndDt = ctGuarantyEndDt;
	}
	public String getDfGuarantyEndDt() {
		return dfGuarantyEndDt;
	}
	public void setDfGuarantyEndDt(String dfGuarantyEndDt) {
		this.dfGuarantyEndDt = dfGuarantyEndDt;
	}
	public String getPpGuarantyEndDt() {
		return ppGuarantyEndDt;
	}
	public void setPpGuarantyEndDt(String ppGuarantyEndDt) {
		this.ppGuarantyEndDt = ppGuarantyEndDt;
	}
	public String getCtGbIssueYn() {
		return ctGbIssueYn;
	}
	public void setCtGbIssueYn(String ctGbIssueYn) {
		this.ctGbIssueYn = ctGbIssueYn;
	}
	public String getDfGbIssueYn() {
		return dfGbIssueYn;
	}
	public void setDfGbIssueYn(String dfGbIssueYn) {
		this.dfGbIssueYn = dfGbIssueYn;
	}
	public String getPpGbIssueYn() {
		return ppGbIssueYn;
	}
	public void setPpGbIssueYn(String ppGbIssueYn) {
		this.ppGbIssueYn = ppGbIssueYn;
	}
	public String getCtGbPublishDt() {
		return ctGbPublishDt;
	}
	public void setCtGbPublishDt(String ctGbPublishDt) {
		this.ctGbPublishDt = ctGbPublishDt;
	}
	public String getDfGbPublishDt() {
		return dfGbPublishDt;
	}
	public void setDfGbPublishDt(String dfGbPublishDt) {
		this.dfGbPublishDt = dfGbPublishDt;
	}
	public String getPpGbPublishDt() {
		return ppGbPublishDt;
	}
	public void setPpGbPublishDt(String ppGbPublishDt) {
		this.ppGbPublishDt = ppGbPublishDt;
	}
	public int getCtGuarantyAmount() {
		return ctGuarantyAmount;
	}
	public void setCtGuarantyAmount(int ctGuarantyAmount) {
		this.ctGuarantyAmount = ctGuarantyAmount;
	}
	public int getDfGuarantyAmount() {
		return dfGuarantyAmount;
	}
	public void setDfGuarantyAmount(int dfGuarantyAmount) {
		this.dfGuarantyAmount = dfGuarantyAmount;
	}
	public int getPpGuarantyAmount() {
		return ppGuarantyAmount;
	}
	public void setPpGuarantyAmount(int ppGuarantyAmount) {
		this.ppGuarantyAmount = ppGuarantyAmount;
	}
	public int getCollectTurn() {
		return collectTurn;
	}
	public void setCollectTurn(int collectTurn) {
		this.collectTurn = collectTurn;
	}
	/**
	 * @return the gbRate
	 */
	public int getGbRate() {
		return gbRate;
	}
	/**
	 * @param gbRate the gbRate to set
	 */
	public void setGbRate(int gbRate) {
		this.gbRate = gbRate;
	}
	/**
	 * @return the gbInspectDt
	 */
	public String getGbInspectDt() {
		return gbInspectDt;
	}
	/**
	 * @param gbInspectDt the gbInspectDt to set
	 */
	public void setGbInspectDt(String gbInspectDt) {
		this.gbInspectDt = gbInspectDt;
	}
	/**
	 * @return the gbSkAmount
	 */
	public int getGbSkAmount() {
		return gbSkAmount;
	}
	/**
	 * @param gbSkAmount the gbSkAmount to set
	 */
	public void setGbSkAmount(int gbSkAmount) {
		this.gbSkAmount = gbSkAmount;
	}
	
}
