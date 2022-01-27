package com.cep.maintenance.amount.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.cep.project.vo.ProjectSalesVO;
@SuppressWarnings("serial")
@Alias("mtSalesPlanVO")
public class MtSalesPlanVO extends ProjectSalesVO implements Serializable{
	
	private List<MtSalesPlanVO> mtSalesPlanVoList;

	//SALES_YEAR_MONTH(수금년월(yyyyMM))
	private String salesYearMonth;

	private String parmMtSbCtYn; //백계약여부
	// 유지보수 통합 관리키 유지보수계약 PK(=salesCtFkKey)
//    private String mtIntegrateKey;
	
	//계산서 발행규칙(BF:이전평일, BD:계산서일자, AF:이후평일)
	private String billIssueRule;
	
	private String mtSalesOrderKey; //매출계약 관리키.
	
	private String selectMtSalesOrderKey; //매출계약 조회키.
	/**
	 * @return String - the salesYearMonth
	 */
	public String getSalesYearMonth() {
		return salesYearMonth;
	}

	/**
	 * @param salesYearMonth the salesYearMonth to set
	 */
	public void setSalesYearMonth(String salesYearMonth) {
		this.salesYearMonth = salesYearMonth;
	}

	/**
	 * @return String - the mtIntegrateKey
	 */
	public String getMtIntegrateKey() {
//		return mtIntegrateKey;
		return super.getSalesCtFkKey();
	}

	/**
	 * @param mtIntegrateKey the mtIntegrateKey to set
	 */
	public void setMtIntegrateKey(String mtIntegrateKey) {
//		this.mtIntegrateKey = mtIntegrateKey;
		super.setSalesCtFkKey(mtIntegrateKey);
		
	}

	/**
	 * @return String - the parmMtSbCtYn
	 */
	public String getParmMtSbCtYn() {
		return parmMtSbCtYn;
	}

	/**
	 * @param parmMtSbCtYn the parmMtSbCtYn to set
	 */
	public void setParmMtSbCtYn(String parmMtSbCtYn) {
		this.parmMtSbCtYn = parmMtSbCtYn;
	}

	/**
	 * @return List<MtSalesPlanVO> - the mtSalesPlanVoList
	 */
	public List<MtSalesPlanVO> getMtSalesPlanVoList() {
		return mtSalesPlanVoList;
	}

	/**
	 * @param mtSalesPlanVoList the mtSalesPlanVoList to set
	 */
	public void setMtSalesPlanVoList(List<MtSalesPlanVO> mtSalesPlanVoList) {
		this.mtSalesPlanVoList = mtSalesPlanVoList;
	}

	public String getBillIssueRule() {
		return billIssueRule;
	}

	public void setBillIssueRule(String billIssueRule) {
		this.billIssueRule = billIssueRule;
	}

	public String getMtSalesOrderKey() {
		return mtSalesOrderKey;
	}

	public void setMtSalesOrderKey(String mtSalesOrderKey) {
		this.mtSalesOrderKey = mtSalesOrderKey;
	}

	public String getSelectMtSalesOrderKey() {
		return selectMtSalesOrderKey;
	}

	public void setSelectMtSalesOrderKey(String selectMtSalesOrderKey) {
		this.selectMtSalesOrderKey = selectMtSalesOrderKey;
	}
}
