package com.cep.maintenance.amount.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.cep.maintenance.contract.vo.MtDefaultVO;

@SuppressWarnings("serial")
@Alias("mtPaymentPlanVO")

/**
 * 유지보수 지급(매입)계획 VO
 * <pre>
 * </pre>
 *
 * @title MtPaymentPlanVO
 * @desc 
 * @programID MtPaymentPlanVO.java
 * @cdate 2021. 12. 9.
 * @version 1.0
 * @author aranghoo
 * @see 
 *
 */
public class MtPaymentPlanVO extends MtDefaultVO implements Serializable{

	private static final long serialVersionUID = 3416086411653717138L;

	private List<MtPaymentPlanVO> mtPaymentPlanVOList;
	//지급계약관리키
	private String paymentKey;

	//유지보수 백계약관리키(MT_BACK_ORDER_TB.MT_ORDER_KEY)
	private String mtOrderKey;

	//유지보수 관리키(salesCtFkKey)
	private String mtIntegrateKey;

	//지급년월(yyyyMM)
	private String paymentYearMonth;

	//매입 회차
	private int paymentTurn;

	//매입 지급 비율
	private int paymentRate;

	//매입 회차 금액
	private int paymentTurnAmount;

	//매입 지급 예상 일자
	private String paymentFcDt;

	//매입 지급 완료 일자
	private String paymentFinishDt;

	//매입 상태 코드
	private String paymentStatusCd;

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

	public String getPaymentKey() {
		return paymentKey;
	}

	public void setPaymentKey(String paymentKey) {
		this.paymentKey = paymentKey;
	}

	public String getMtOrderKey() {
		return mtOrderKey;
	}

	public void setMtOrderKey(String mtOrderKey) {
		this.mtOrderKey = mtOrderKey;
	}

	public String getPaymentYearMonth() {
		return paymentYearMonth;
	}

	public void setPaymentYearMonth(String paymentYearMonth) {
		this.paymentYearMonth = paymentYearMonth;
	}

	public int getPaymentTurn() {
		return paymentTurn;
	}

	public void setPaymentTurn(int paymentTurn) {
		this.paymentTurn = paymentTurn;
	}

	public int getPaymentRate() {
		return paymentRate;
	}

	public void setPaymentRate(int paymentRate) {
		this.paymentRate = paymentRate;
	}

	public int getPaymentTurnAmount() {
		return paymentTurnAmount;
	}

	public void setPaymentTurnAmount(int paymentTurnAmount) {
		this.paymentTurnAmount = paymentTurnAmount;
	}

	public String getPaymentFcDt() {
		return paymentFcDt;
	}

	public void setPaymentFcDt(String paymentFcDt) {
		this.paymentFcDt = paymentFcDt;
	}

	public String getPaymentFinishDt() {
		return paymentFinishDt;
	}

	public void setPaymentFinishDt(String paymentFinishDt) {
		this.paymentFinishDt = paymentFinishDt;
	}

	public String getPaymentStatusCd() {
		return paymentStatusCd;
	}

	public void setPaymentStatusCd(String paymentStatusCd) {
		this.paymentStatusCd = paymentStatusCd;
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

	public List<MtPaymentPlanVO> getMtPaymentPlanVOList() {
		return mtPaymentPlanVOList;
	}

	public void setMtPaymentPlanVOList(List<MtPaymentPlanVO> mtPaymentPlanVOList) {
		this.mtPaymentPlanVOList = mtPaymentPlanVOList;
	}

	public String getMtIntegrateKey() {
		return mtIntegrateKey;
	}

	public void setMtIntegrateKey(String mtIntegrateKey) {
		this.mtIntegrateKey = mtIntegrateKey;
	}
}
