package com.cep.mngMaint.mapping.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.cmm.vo.DepartmentVO;
import com.cmm.vo.OrderProductVO;

@SuppressWarnings("serial")
@Alias("mtOrderBillVO")
public class MtOrderBillVO extends DepartmentVO implements Serializable {
	
	private String mtIntegrateKey; //유지보수 key
	private String mtOrderType;    //백계약(BO) , 유지보수 작업 발주(PO)
	private String mtWorkKey;      //유지보수 작업관리키 유지보수 작업관리키(MT_WORK_TB.MT_WORK_KEY = MT_ORDER.ORDER_CT_FK_KEY)
	private String mtOrderKey;     //발주 관리키 ( MT_BACK_ORDER.MT_ORDER_KEY(백계약), MT_ORDER.MT_ORDER_KEY(작업발주))
	private String mtOrderAcKey;   //매입처 관리키(매입처사업자번호)
	private String mtOrderAcKeyNm; //매입처명
	private String mtOrderDt;      //발주일자
	private String mtOrderPayTerms;//발주결재조건
	private int mtOrderAmount;     //발주금액
	private String orderEmpNm;     //발주등록자.
	private int donePaymentAmount; //지급완료금액
	private int yetPaymentAmount;  //미지급금액
	private int billMappingNum;    //계산서 맵핑횟수
	private int billMappedAmount;  //계산서 맵핑총금액
	private String mtNm;           //유지보수 명
	private String mtAcKey;        //고객사 관리키(고객사 사업자번호)
	private String mtAcNm;         //고객사명
	
	//검색조건 추가.
	private String orderDtFrom; //발주일자
	private String orderDtTo;   //발주일자
	private String searchWord; //검색어
	private String searchGubun; //검색어 구분 (PJ:프로젝트, CU:고색사, BA:매입처)
	

	private String billDtFrom; //계산서일자 검색시작일
	private String billDtTo;   //계산서일자 검색종료일.
	
	private String mtPmNm; //발주품목
	
	/*
	 * 발주금액이 완료 여부
	 * Y : mtOrderAmount(발주금액) == billMappedAmount(맵핑금액)
	 * N : mtOrderAmount(발주금액) != billMappedAmount(맵핑금액)
	 */
	private String mappingCompleteYn;
	
	public String getMtIntegrateKey() {
		return mtIntegrateKey;
	}
	public void setMtIntegrateKey(String mtIntegrateKey) {
		this.mtIntegrateKey = mtIntegrateKey;
	}
	public String getMtOrderType() {
		return mtOrderType;
	}
	public void setMtOrderType(String mtOrderType) {
		this.mtOrderType = mtOrderType;
	}
	public String getMtWorkKey() {
		return mtWorkKey;
	}
	public void setMtWorkKey(String mtWorkKey) {
		this.mtWorkKey = mtWorkKey;
	}
	public String getMtOrderKey() {
		return mtOrderKey;
	}
	public void setMtOrderKey(String mtOrderKey) {
		this.mtOrderKey = mtOrderKey;
	}
	public String getMtOrderAcKey() {
		return mtOrderAcKey;
	}
	public void setMtOrderAcKey(String mtOrderAcKey) {
		this.mtOrderAcKey = mtOrderAcKey;
	}
	public String getMtOrderAcKeyNm() {
		return mtOrderAcKeyNm;
	}
	public void setMtOrderAcKeyNm(String mtOrderAcKeyNm) {
		this.mtOrderAcKeyNm = mtOrderAcKeyNm;
	}
	public String getMtOrderDt() {
		return mtOrderDt;
	}
	public void setMtOrderDt(String mtOrderDt) {
		this.mtOrderDt = mtOrderDt;
	}
	public String getMtOrderPayTerms() {
		return mtOrderPayTerms;
	}
	public void setMtOrderPayTerms(String mtOrderPayTerms) {
		this.mtOrderPayTerms = mtOrderPayTerms;
	}
	public int getMtOrderAmount() {
		return mtOrderAmount;
	}
	public void setMtOrderAmount(int mtOrderAmount) {
		this.mtOrderAmount = mtOrderAmount;
	}
	public String getOrderEmpNm() {
		return orderEmpNm;
	}
	public void setOrderEmpNm(String orderEmpNm) {
		this.orderEmpNm = orderEmpNm;
	}
	public int getDonePaymentAmount() {
		return donePaymentAmount;
	}
	public void setDonePaymentAmount(int donePaymentAmount) {
		this.donePaymentAmount = donePaymentAmount;
	}
	public int getYetPaymentAmount() {
		return yetPaymentAmount;
	}
	public void setYetPaymentAmount(int yetPaymentAmount) {
		this.yetPaymentAmount = yetPaymentAmount;
	}
	public int getBillMappingNum() {
		return billMappingNum;
	}
	public void setBillMappingNum(int billMappingNum) {
		this.billMappingNum = billMappingNum;
	}
	public int getBillMappedAmount() {
		return billMappedAmount;
	}
	public void setBillMappedAmount(int billMappedAmount) {
		this.billMappedAmount = billMappedAmount;
	}
	public String getMtNm() {
		return mtNm;
	}
	public void setMtNm(String mtNm) {
		this.mtNm = mtNm;
	}
	public String getMtAcKey() {
		return mtAcKey;
	}
	public void setMtAcKey(String mtAcKey) {
		this.mtAcKey = mtAcKey;
	}
	public String getOrderDtFrom() {
		return orderDtFrom;
	}
	public void setOrderDtFrom(String orderDtFrom) {
		this.orderDtFrom = orderDtFrom;
	}
	public String getOrderDtTo() {
		return orderDtTo;
	}
	public void setOrderDtTo(String orderDtTo) {
		this.orderDtTo = orderDtTo;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchGubun() {
		return searchGubun;
	}
	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
	}
	public String getBillDtFrom() {
		return billDtFrom;
	}
	public void setBillDtFrom(String billDtFrom) {
		this.billDtFrom = billDtFrom;
	}
	public String getBillDtTo() {
		return billDtTo;
	}
	public void setBillDtTo(String billDtTo) {
		this.billDtTo = billDtTo;
	}
	public String getMtAcNm() {
		return mtAcNm;
	}
	public void setMtAcNm(String mtAcNm) {
		this.mtAcNm = mtAcNm;
	}
	public String getMtPmNm() {
		return mtPmNm;
	}
	public void setMtPmNm(String mtPmNm) {
		this.mtPmNm = mtPmNm;
	}
	public String getMappingCompleteYn() {
		return mappingCompleteYn;
	}
	public void setMappingCompleteYn(String mappingCompleteYn) {
		this.mappingCompleteYn = mappingCompleteYn;
	}
	
}
