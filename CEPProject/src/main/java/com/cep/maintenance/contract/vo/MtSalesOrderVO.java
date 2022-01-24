package com.cep.maintenance.contract.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;
@SuppressWarnings("serial")
@Alias("mtSalesOrderVO")

/**
 * 매출품목관리 VO
 * <pre>
 * </pre>
 *
 * @title MtSalesOrderVO
 * @desc 
 * @programID MtSalesOrderVO.java
 * @cdate 2021. 11. 26.
 * @version 1.0
 * @author aranghoo
 * @see 
 *
 */
public class MtSalesOrderVO extends MtDefaultVO implements Serializable {

	private String mtSalesOrderKey; //매출계약 관리키
	
	// 유지보수 통합 관리키 유지보수 계약 PK
    private String mtIntegrateKey;
    
    //매출거래처 관리키
    private String mtSalesAcKey;
    
    //매출거래처 명
    private String mtSalesAcNm;
    
    //매출거래처 담당자 관리키
    private String mtSalesAcDirectorKey;
    
    //매출거래처 담당자 명
    private String mtSalesAcDirectorNm;
    
    //결재조건 (당월 25일/매월25 /역발행 등)
    private String mtSalesPayTerms;
    
    //유지보수 매출합계금액
    private int mtSalesAmount;
    
    //계산서 구분(Y:정발행, N:역발행)
    private String billIssueType;
    
    //유지보수 매출구분코드
    private String billSalesCd;
    
    //유지보수 매출구분명
    private String billSalesNm;
    
    //유지보수 제조사구분코드
    private String billMfCd;

    //유지보수 제조사구분명
    private String billMfNm;
    
    // 비고 
    private String remark;

    // 등록 일자 
    private String regDt;

    // 등록 시간 
    private String regTm;

    // 등록 직원 관리키 
    private String regEmpKey;

    // 수정 일자 
    private String modDt;

    // 수정 시간 
    private String modTm;

    // 수정 직원 관리키 
    private String modEmpKey;

    // 삭제 여부 초기값 (N)
    private String deleteYn;
    
    private int yetCollectAmount; //미수금금액    
    private int doneCollectAmount; //수금완료금액    
    private int callTotalAmount; //수금요청 총금액(계산서발행요청금액)
    
    //계산서 발행규칙(BF:이전평일, BD:계산서일자, AF:이후평일)
  	private String billIssueRule;
    
    private List<MtContractProductVO> mtSalesOrderProductVoList;

	public String getMtSalesOrderKey() {
		return mtSalesOrderKey;
	}

	public void setMtSalesOrderKey(String mtSalesOrderKey) {
		this.mtSalesOrderKey = mtSalesOrderKey;
	}

	public String getMtIntegrateKey() {
		return mtIntegrateKey;
	}

	public void setMtIntegrateKey(String mtIntegrateKey) {
		this.mtIntegrateKey = mtIntegrateKey;
	}

	public String getMtSalesAcKey() {
		return mtSalesAcKey;
	}

	public void setMtSalesAcKey(String mtSalesAcKey) {
		this.mtSalesAcKey = mtSalesAcKey;
	}

	public String getMtSalesAcDirectorKey() {
		return mtSalesAcDirectorKey;
	}

	public void setMtSalesAcDirectorKey(String mtSalesAcDirectorKey) {
		this.mtSalesAcDirectorKey = mtSalesAcDirectorKey;
	}

	public String getMtSalesPayTerms() {
		return mtSalesPayTerms;
	}

	public void setMtSalesPayTerms(String mtSalesPayTerms) {
		this.mtSalesPayTerms = mtSalesPayTerms;
	}

	public int getMtSalesAmount() {
		return mtSalesAmount;
	}

	public void setMtSalesAmount(int mtSalesAmount) {
		this.mtSalesAmount = mtSalesAmount;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getRegTm() {
		return regTm;
	}

	public void setRegTm(String regTm) {
		this.regTm = regTm;
	}

	public String getRegEmpKey() {
		return regEmpKey;
	}

	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	public String getModTm() {
		return modTm;
	}

	public void setModTm(String modTm) {
		this.modTm = modTm;
	}

	public String getModEmpKey() {
		return modEmpKey;
	}

	public void setModEmpKey(String modEmpKey) {
		this.modEmpKey = modEmpKey;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	public int getYetCollectAmount() {
		return yetCollectAmount;
	}

	public void setYetCollectAmount(int yetCollectAmount) {
		this.yetCollectAmount = yetCollectAmount;
	}

	public int getDoneCollectAmount() {
		return doneCollectAmount;
	}

	public void setDoneCollectAmount(int doneCollectAmount) {
		this.doneCollectAmount = doneCollectAmount;
	}

	public int getCallTotalAmount() {
		return callTotalAmount;
	}

	public void setCallTotalAmount(int callTotalAmount) {
		this.callTotalAmount = callTotalAmount;
	}

	public List<MtContractProductVO> getMtSalesOrderProductVoList() {
		return mtSalesOrderProductVoList;
	}

	public void setMtSalesOrderProductVoList(List<MtContractProductVO> mtSalesOrderProductVoList) {
		this.mtSalesOrderProductVoList = mtSalesOrderProductVoList;
	}

	public String getMtSalesAcNm() {
		return mtSalesAcNm;
	}

	public void setMtSalesAcNm(String mtSalesAcNm) {
		this.mtSalesAcNm = mtSalesAcNm;
	}

	public String getMtSalesAcDirectorNm() {
		return mtSalesAcDirectorNm;
	}

	public void setMtSalesAcDirectorNm(String mtSalesAcDirectorNm) {
		this.mtSalesAcDirectorNm = mtSalesAcDirectorNm;
	}

	public String getBillSalesCd() {
		return billSalesCd;
	}

	public void setBillSalesCd(String billSalesCd) {
		this.billSalesCd = billSalesCd;
	}

	public String getBillMfCd() {
		return billMfCd;
	}

	public void setBillMfCd(String billMfCd) {
		this.billMfCd = billMfCd;
	}

	public String getBillSalesNm() {
		return billSalesNm;
	}

	public void setBillSalesNm(String billSalesNm) {
		this.billSalesNm = billSalesNm;
	}

	public String getBillMfNm() {
		return billMfNm;
	}

	public void setBillMfNm(String billMfNm) {
		this.billMfNm = billMfNm;
	}

	public String getBillIssueRule() {
		return billIssueRule;
	}

	public void setBillIssueRule(String billIssueRule) {
		this.billIssueRule = billIssueRule;
	}

	public String getBillIssueType() {
		return billIssueType;
	}

	public void setBillIssueType(String billIssueType) {
		this.billIssueType = billIssueType;
	}
}
