package com.cep.mngMaint.bill.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.cmm.util.CepStringUtil;

@SuppressWarnings("serial")
@Alias("mngMaintBillVO")
public class MngMaintBillVO implements Serializable {
	private static final long serialVersionUID = 6249212047489119229L;
	
	private String billGroup; // 매입(PC), 매출(SD) 구분
	private String billNo; //계산서 번호  MT_SD_BILLING_TB PK,  MT_SD_BILLING_OP_TB fk,
	private String billCtFkKey; //매출관리키 MT_SD_BILLING_TB ,  MT_SD_BILLING_OP_TB ==> MT_SALES_DETAIL_TB PK
	private String salesKey; //MT_SALES_DETAIL_TB PK
	
	private String billFkMtKey;//유지보수관리키(MT_INTEGRATE_KEY)
	private String pjKey; //유지보수관리키(MT_INTEGRATE_KEY)
	private String billCallKey; //계산서 요청 관리키(MT_SD_BILLING_OP_TB PK)
	private String billAcKey; //사업자번호
	private String acKey;//사업자번호
	
	private String billAcDirectorKey; //계산서 거래처 담당자 관리키
	private String billAcDirectorName; //계산서 거래처 담당자 명
	private String billAcDirectorTel;
	private int    billTurnNo; //계산서 회차 번호
	private int    billAmount; //계산서 금액
	private String billIssueDt; //계산서 발급일자
	private String billIssueEmail;//계산서 발급 이메일
	private String billIssueType; // 정발행/역발행.
	private String billIssueStatus; //'요청한 계산서 발급 상태 - R:요청, I:발급, M:매핑, E:지급완료', (발급은 필요없고 매핑만 있으면 될듯)
	private String currentBillIssueStatus; //현재 계산서 발급상태
	private String billMappingYn;//계산서 맵핑 여부
	private String billRequestDt; //계산서 발급요청일자.
	private String billTaxYn;
	private String remark;
	private String regDt;
	private String regTm;
	private String regEmpKey;
	private String modDt;
	private String modTm;
	private String modEmpKey;
	
	private String mtNm;//유지보수명.
	
	
	private String salesCollectFinishDt; // 수금완료일자
	
	private List<MngMaintBillVO> mngBillInsertVOList;
	
	//2021-11-23
	private String billSalesCd; //매출구분
	private String billMfCd; //제조사구분.
		
	//2021-12-03
	private String mtSalesOrderKey; //매출계약관리키(MT_SALES_ORDER_TB.MT_SALES_ORDER_KEY)

	/**
	 * @return String - the billNo
	 */
	public String getBillNo() {
		return billNo;
	}

	/**
	 * @param billNo the billNo to set
	 */
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	/**
	 * @return String - the billCtFkKey
	 */
	public String getBillCtFkKey() {
		return billCtFkKey;
	}

	/**
	 * @param billCtFkKey the billCtFkKey to set
	 */
	public void setBillCtFkKey(String billCtFkKey) {
		this.billCtFkKey = billCtFkKey;
		this.salesKey = billCtFkKey;
	}

	/**
	 * @return String - the salesKey
	 */
	public String getSalesKey() {
		return salesKey;
	}

	/**
	 * @param salesKey the salesKey to set
	 */
	public void setSalesKey(String salesKey) {
		this.salesKey = salesKey;
		this.billCtFkKey = salesKey;
	}

	public String getBillFkMtKey() {
		if(!"".equals(CepStringUtil.getDefaultValue(billFkMtKey, ""))) {
			billFkMtKey = pjKey;
		}
		return billFkMtKey;
	}
	/**
	 * @param billFkMtKey the billFkMtKey to set
	 */
	public void setBillFkMtKey(String billFkMtKey) {
		this.billFkMtKey = billFkMtKey;
		this.pjKey = billFkMtKey;
	}
	/**
	 * @return String - the pjKey
	 */
	public String getPjKey() {
		if(!"".equals(CepStringUtil.getDefaultValue(pjKey, ""))) {
			pjKey = billFkMtKey;
		}
		return pjKey;
	}
	/**
	 * @param pjKey the pjKey to set
	 */
	public void setPjKey(String pjKey) {
		this.pjKey = pjKey;
		this.billFkMtKey = pjKey;
	}

	/**
	 * @return String - the billCallKey
	 */
	public String getBillCallKey() {
		return billCallKey;
	}

	/**
	 * @param billCallKey the billCallKey to set
	 */
	public void setBillCallKey(String billCallKey) {
		this.billCallKey = billCallKey;
	}


	/**
	 * @return String - the billAcDirectorKey
	 */
	public String getBillAcDirectorKey() {
		return billAcDirectorKey;
	}

	/**
	 * @param billAcDirectorKey the billAcDirectorKey to set
	 */
	public void setBillAcDirectorKey(String billAcDirectorKey) {
		this.billAcDirectorKey = billAcDirectorKey;
	}

	/**
	 * @return String - the billAcDirectorTel
	 */
	public String getBillAcDirectorTel() {
		return billAcDirectorTel;
	}

	/**
	 * @param billAcDirectorTel the billAcDirectorTel to set
	 */
	public void setBillAcDirectorTel(String billAcDirectorTel) {
		this.billAcDirectorTel = billAcDirectorTel;
	}

	/**
	 * @return int - the billTurnNo
	 */
	public int getBillTurnNo() {
		return billTurnNo;
	}

	/**
	 * @param billTurnNo the billTurnNo to set
	 */
	public void setBillTurnNo(int billTurnNo) {
		this.billTurnNo = billTurnNo;
	}

	/**
	 * @return int - the billAmount
	 */
	public int getBillAmount() {
		return billAmount;
	}

	/**
	 * @param billAmount the billAmount to set
	 */
	public void setBillAmount(int billAmount) {
		this.billAmount = billAmount;
	}

	/**
	 * @return String - the billIssueDt
	 */
	public String getBillIssueDt() {
		return billIssueDt;
	}

	/**
	 * @param billIssueDt the billIssueDt to set
	 */
	public void setBillIssueDt(String billIssueDt) {
		this.billIssueDt = billIssueDt;
	}

	/**
	 * @return String - the billIssueEmail
	 */
	public String getBillIssueEmail() {
		return billIssueEmail;
	}

	/**
	 * @param billIssueEmail the billIssueEmail to set
	 */
	public void setBillIssueEmail(String billIssueEmail) {
		this.billIssueEmail = billIssueEmail;
	}

	/**
	 * @return String - the billIssueType
	 */
	public String getBillIssueType() {
		return billIssueType;
	}

	/**
	 * @param billIssueType the billIssueType to set
	 */
	public void setBillIssueType(String billIssueType) {
		this.billIssueType = billIssueType;
	}

	/**
	 * @return String - the billIssueStatus
	 */
	public String getBillIssueStatus() {
		return billIssueStatus;
	}

	/**
	 * @param billIssueStatus the billIssueStatus to set
	 */
	public void setBillIssueStatus(String billIssueStatus) {
		this.billIssueStatus = billIssueStatus;
	}

	/**
	 * @return String - the billMappingYn
	 */
	public String getBillMappingYn() {
		return billMappingYn;
	}

	/**
	 * @param billMappingYn the billMappingYn to set
	 */
	public void setBillMappingYn(String billMappingYn) {
		this.billMappingYn = billMappingYn;
	}

	/**
	 * @return String - the billRequestDt
	 */
	public String getBillRequestDt() {
		return billRequestDt;
	}

	/**
	 * @param billRequestDt the billRequestDt to set
	 */
	public void setBillRequestDt(String billRequestDt) {
		this.billRequestDt = billRequestDt;
	}

	/**
	 * @return String - the billTaxYn
	 */
	public String getBillTaxYn() {
		return billTaxYn;
	}

	/**
	 * @param billTaxYn the billTaxYn to set
	 */
	public void setBillTaxYn(String billTaxYn) {
		this.billTaxYn = billTaxYn;
	}

	/**
	 * @return String - the remark
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * @return String - the regDt
	 */
	public String getRegDt() {
		return regDt;
	}

	/**
	 * @param regDt the regDt to set
	 */
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	/**
	 * @return String - the regTm
	 */
	public String getRegTm() {
		return regTm;
	}

	/**
	 * @param regTm the regTm to set
	 */
	public void setRegTm(String regTm) {
		this.regTm = regTm;
	}

	/**
	 * @return String - the regEmpKey
	 */
	public String getRegEmpKey() {
		return regEmpKey;
	}

	/**
	 * @param regEmpKey the regEmpKey to set
	 */
	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}

	/**
	 * @return String - the modDt
	 */
	public String getModDt() {
		return modDt;
	}

	/**
	 * @param modDt the modDt to set
	 */
	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	/**
	 * @return String - the modTm
	 */
	public String getModTm() {
		return modTm;
	}

	/**
	 * @param modTm the modTm to set
	 */
	public void setModTm(String modTm) {
		this.modTm = modTm;
	}

	/**
	 * @return String - the modEmpKey
	 */
	public String getModEmpKey() {
		return modEmpKey;
	}

	/**
	 * @param modEmpKey the modEmpKey to set
	 */
	public void setModEmpKey(String modEmpKey) {
		this.modEmpKey = modEmpKey;
	}

	/**
	 * @return List<MngMaintBillVO> - the mngBillInsertVOList
	 */
	public List<MngMaintBillVO> getMngBillInsertVOList() {
		return mngBillInsertVOList;
	}

	/**
	 * @param mngBillInsertVOList the mngBillInsertVOList to set
	 */
	public void setMngBillInsertVOList(List<MngMaintBillVO> mngBillInsertVOList) {
		this.mngBillInsertVOList = mngBillInsertVOList;
	}


	/**
	 * @return String - the billAcKey
	 */
	public String getBillAcKey() {
		return billAcKey;
	}

	/**
	 * @param billAcKey the billAcKey to set
	 */
	public void setBillAcKey(String billAcKey) {
		this.billAcKey = billAcKey;
		this.acKey = billAcKey;
	}
	

	/**
	 * @return String - the acKey
	 */
	public String getAcKey() {
		return acKey;
	}

	/**
	 * @param acKey the acKey to set
	 */
	public void setAcKey(String acKey) {
		this.acKey = acKey;
		this.billAcKey = acKey;
	}

	/**
	 * @return String - the billAcDirectorName
	 */
	public String getBillAcDirectorName() {
		return billAcDirectorName;
	}

	/**
	 * @param billAcDirectorName the billAcDirectorName to set
	 */
	public void setBillAcDirectorName(String billAcDirectorName) {
		this.billAcDirectorName = billAcDirectorName;
	}

	public String getSalesCollectFinishDt() {
		return salesCollectFinishDt;
	}

	public void setSalesCollectFinishDt(String salesCollectFinishDt) {
		this.salesCollectFinishDt = salesCollectFinishDt;
	}

	public String getBillGroup() {
		return billGroup;
	}

	public void setBillGroup(String billGroup) {
		this.billGroup = billGroup;
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

	public String getMtSalesOrderKey() {
		return mtSalesOrderKey;
	}

	public void setMtSalesOrderKey(String mtSalesOrderKey) {
		this.mtSalesOrderKey = mtSalesOrderKey;
	}

	public String getMtNm() {
		return mtNm;
	}

	public void setMtNm(String mtNm) {
		this.mtNm = mtNm;
	}

	public String getCurrentBillIssueStatus() {
		return currentBillIssueStatus;
	}

	public void setCurrentBillIssueStatus(String currentBillIssueStatus) {
		this.currentBillIssueStatus = currentBillIssueStatus;
	}

}
