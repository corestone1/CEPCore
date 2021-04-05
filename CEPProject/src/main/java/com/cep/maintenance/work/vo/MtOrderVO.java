/**
 * 
 */
package com.cep.maintenance.work.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import com.cep.maintenance.contract.vo.MtDefaultVO;

@SuppressWarnings("serial")
@Alias("mtOrderVO")

/**
 * @File Name : MtOrderVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2021. 3. 9.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 3. 9.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtOrderVO extends MtDefaultVO {
	//유지보수 발주 관리키
	private String mtOrderKey;
	
	 // 유지보수 통합 관리키 유지보수 계약 PK
    private String mtIntegrateKey;
	
	//유지보수 작업관리키
	private String orderCtFkKey;
	
	//발주 일자
	private String orderDt;
	
	//발주 거래처 관리키
	private String orderAcKey;
	
	//발주 거래처 명
	private String orderAcKeyNm;
	
	//발주 거래처 담당자 관리키
	private String orderAcDirectorKey;
	
	//발주 거래처 담당자 명
	private String orderAcDirectorNm;
	
	//발주 결제 조건
	private String orderPayTerms;
	
	//발주 합계
	private int orderAmount;
	
	//부가세 포함여부
	private String taxYn;
	
	//계산서 맵핑 횟수
	private int billMappingNum;

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
    
    // 발주품목리스트.
    private List<MtOrderProductVO> mtOrderProductVoList;

	/**
	 * @return the mtOrderKey
	 */
	public String getMtOrderKey() {
		return mtOrderKey;
	}

	/**
	 * @param mtOrderKey the mtOrderKey to set
	 */
	public void setMtOrderKey(String mtOrderKey) {
		this.mtOrderKey = mtOrderKey;
	}

	/**
	 * @return the mtIntegrateKey
	 */
	public String getMtIntegrateKey() {
		return mtIntegrateKey;
	}

	/**
	 * @param mtIntegrateKey the mtIntegrateKey to set
	 */
	public void setMtIntegrateKey(String mtIntegrateKey) {
		this.mtIntegrateKey = mtIntegrateKey;
	}

	/**
	 * @return the orderCtFkKey
	 */
	public String getOrderCtFkKey() {
		return orderCtFkKey;
	}

	/**
	 * @param orderCtFkKey the orderCtFkKey to set
	 */
	public void setOrderCtFkKey(String orderCtFkKey) {
		this.orderCtFkKey = orderCtFkKey;
	}

	/**
	 * @return the orderDt
	 */
	public String getOrderDt() {
		return orderDt;
	}

	/**
	 * @param orderDt the orderDt to set
	 */
	public void setOrderDt(String orderDt) {
		this.orderDt = orderDt;
	}

	/**
	 * @return the orderAcKey
	 */
	public String getOrderAcKey() {
		return orderAcKey;
	}

	/**
	 * @param orderAcKey the orderAcKey to set
	 */
	public void setOrderAcKey(String orderAcKey) {
		this.orderAcKey = orderAcKey;
	}

	/**
	 * @return the orderAcKeyNm
	 */
	public String getOrderAcKeyNm() {
		return orderAcKeyNm;
	}

	/**
	 * @param orderAcKeyNm the orderAcKeyNm to set
	 */
	public void setOrderAcKeyNm(String orderAcKeyNm) {
		this.orderAcKeyNm = orderAcKeyNm;
	}

	/**
	 * @return the orderAcDirectorKey
	 */
	public String getOrderAcDirectorKey() {
		return orderAcDirectorKey;
	}

	/**
	 * @param orderAcDirectorKey the orderAcDirectorKey to set
	 */
	public void setOrderAcDirectorKey(String orderAcDirectorKey) {
		this.orderAcDirectorKey = orderAcDirectorKey;
	}

	/**
	 * @return the orderAcDirectorNm
	 */
	public String getOrderAcDirectorNm() {
		return orderAcDirectorNm;
	}

	/**
	 * @param orderAcDirectorNm the orderAcDirectorNm to set
	 */
	public void setOrderAcDirectorNm(String orderAcDirectorNm) {
		this.orderAcDirectorNm = orderAcDirectorNm;
	}

	/**
	 * @return the orderPayTerms
	 */
	public String getOrderPayTerms() {
		return orderPayTerms;
	}

	/**
	 * @param orderPayTerms the orderPayTerms to set
	 */
	public void setOrderPayTerms(String orderPayTerms) {
		this.orderPayTerms = orderPayTerms;
	}

	/**
	 * @return the orderAmount
	 */
	public int getOrderAmount() {
		return orderAmount;
	}

	/**
	 * @param orderAmount the orderAmount to set
	 */
	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	/**
	 * @return the taxYn
	 */
	public String getTaxYn() {
		return taxYn;
	}

	/**
	 * @param taxYn the taxYn to set
	 */
	public void setTaxYn(String taxYn) {
		this.taxYn = taxYn;
	}

	/**
	 * @return the billMappingNum
	 */
	public int getBillMappingNum() {
		return billMappingNum;
	}

	/**
	 * @param billMappingNum the billMappingNum to set
	 */
	public void setBillMappingNum(int billMappingNum) {
		this.billMappingNum = billMappingNum;
	}

	/**
	 * @return the regDt
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
	 * @return the regTm
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
	 * @return the regEmpKey
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
	 * @return the modDt
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
	 * @return the modTm
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
	 * @return the modEmpKey
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
	 * @return the deleteYn
	 */
	public String getDeleteYn() {
		return deleteYn;
	}

	/**
	 * @param deleteYn the deleteYn to set
	 */
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	/**
	 * @return the mtOrderProductVoList
	 */
	public List<MtOrderProductVO> getMtOrderProductVoList() {
		return mtOrderProductVoList;
	}

	/**
	 * @param mtOrderProductVoList the mtOrderProductVoList to set
	 */
	public void setMtOrderProductVoList(List<MtOrderProductVO> mtOrderProductVoList) {
		this.mtOrderProductVoList = mtOrderProductVoList;
	}

}
