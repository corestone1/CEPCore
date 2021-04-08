/**
 * 
 */
package com.cep.maintenance.work.vo;

import org.apache.ibatis.type.Alias;

import com.cep.maintenance.contract.vo.MtDefaultVO;
@SuppressWarnings("serial")
@Alias("mtOrderProductVO")
/**
 * @File Name : MtOrderProductVO.java
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
public class MtOrderProductVO extends MtDefaultVO{
	//유지보수 발주관리키
	private String mtOrderKey;

	//발주 제품순번
	private int orderSeq;

	//발주 제품 FK 관리키
	private String orderPmFkKey;
	
	//제품명
	private String orderPmFkNm;

	//발주 수량
	private int orderQuantity;

	//발주 단가
	private int orderUprice;

	//발주입고일자
	private String orderReceiptDt;

	//유지보수 비율(유지보수에서는 장애시 발생하므로 0)
	private int mtRate;
	
	//매입구분 코드
	private String orderKind;
	
	//매입구분 코드명
	private String orderKindNm;
	
	//제품상세
	private String orderPmDetail;

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
	 * @return the orderSeq
	 */
	public int getOrderSeq() {
		return orderSeq;
	}

	/**
	 * @param orderSeq the orderSeq to set
	 */
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}

	/**
	 * @return the orderPmFkKey
	 */
	public String getOrderPmFkKey() {
		return orderPmFkKey;
	}

	/**
	 * @param orderPmFkKey the orderPmFkKey to set
	 */
	public void setOrderPmFkKey(String orderPmFkKey) {
		this.orderPmFkKey = orderPmFkKey;
	}

	/**
	 * @return the orderPmFkNm
	 */
	public String getOrderPmFkNm() {
		return orderPmFkNm;
	}

	/**
	 * @param orderPmFkNm the orderPmFkNm to set
	 */
	public void setOrderPmFkNm(String orderPmFkNm) {
		this.orderPmFkNm = orderPmFkNm;
	}

	/**
	 * @return the orderQuantity
	 */
	public int getOrderQuantity() {
		return orderQuantity;
	}

	/**
	 * @param orderQuantity the orderQuantity to set
	 */
	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	/**
	 * @return the orderUprice
	 */
	public int getOrderUprice() {
		return orderUprice;
	}

	/**
	 * @param orderUprice the orderUprice to set
	 */
	public void setOrderUprice(int orderUprice) {
		this.orderUprice = orderUprice;
	}

	/**
	 * @return the orderReceiptDt
	 */
	public String getOrderReceiptDt() {
		return orderReceiptDt;
	}

	/**
	 * @param orderReceiptDt the orderReceiptDt to set
	 */
	public void setOrderReceiptDt(String orderReceiptDt) {
		this.orderReceiptDt = orderReceiptDt;
	}

	/**
	 * @return the mtRate
	 */
	public int getMtRate() {
		return mtRate;
	}

	/**
	 * @param mtRate the mtRate to set
	 */
	public void setMtRate(int mtRate) {
		this.mtRate = mtRate;
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
	 * @return the orderKind
	 */
	public String getOrderKind() {
		return orderKind;
	}

	/**
	 * @param orderKind the orderKind to set
	 */
	public void setOrderKind(String orderKind) {
		this.orderKind = orderKind;
	}

	/**
	 * @return the orderPmDetail
	 */
	public String getOrderPmDetail() {
		return orderPmDetail;
	}

	/**
	 * @param orderPmDetail the orderPmDetail to set
	 */
	public void setOrderPmDetail(String orderPmDetail) {
		this.orderPmDetail = orderPmDetail;
	}

	/**
	 * @return the orderKindNm
	 */
	public String getOrderKindNm() {
		return orderKindNm;
	}

	/**
	 * @param orderKindNm the orderKindNm to set
	 */
	public void setOrderKindNm(String orderKindNm) {
		this.orderKindNm = orderKindNm;
	}

}
