/**
 * 
 */
package com.cep.mngProject.order.vo;

import java.io.Serializable;
import java.util.List;

/**
 * @File Name : MngOrderInsertVO.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2021. 2. 17.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 2. 17.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */

public class MngOrderInsertVO implements Serializable{

	private static final long serialVersionUID = -9206520198434166323L;
	
	private String orderKey;
	private String orderCtClass;
	private String orderCtFkKey;
	private String orderDt;
	private String orderAcKey;
	private String orderAcDirectorKey;
	private String orderPayTerms;
	private String taxYn;
	private String regDt;
	private String regTm;
	private String regEmpKey;
	private int    orderAmount;
	private String billMappingNum;
	
	private int    orderSeq;
	private String orderPmFkKey;
	private int    orderQuantity;
	private int    orderUprice;
	private int    totalAmount;
	private int    mtRate;
	private String orderCategory;
	private String remark;
	private String freeMtStartDt;
	private String freeMtEndDt;
	private String orderReceiptDt;
	
	private List<MngOrderInsertVO> mngOrderInsertVOList;

	/**
	 * @return the orderKey
	 */
	public String getOrderKey() {
		return orderKey;
	}

	/**
	 * @param orderKey the orderKey to set
	 */
	public void setOrderKey(String orderKey) {
		this.orderKey = orderKey;
	}

	/**
	 * @return the orderCtClass
	 */
	public String getOrderCtClass() {
		return orderCtClass;
	}

	/**
	 * @param orderCtClass the orderCtClass to set
	 */
	public void setOrderCtClass(String orderCtClass) {
		this.orderCtClass = orderCtClass;
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
	 * @return the taxYn
	 */
	public String getTaxYn() {
		return taxYn;
	}

	/**
	 * @param taxTn the taxYn to set
	 */
	public void setTaxYn(String taxYn) {
		this.taxYn = taxYn;
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
	 * @return the billMappingNum
	 */
	public String getBillMappingNum() {
		return billMappingNum;
	}

	/**
	 * @param billMappingNum the billMappingNum to set
	 */
	public void setBillMappingNum(String billMappingNum) {
		this.billMappingNum = billMappingNum;
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
	 * @return the totalAmount
	 */
	public int getTotalAmount() {
		return totalAmount;
	}

	/**
	 * @param totalAmount the totalAmount to set
	 */
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
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
	 * @return the orderCategory
	 */
	public String getOrderCategory() {
		return orderCategory;
	}

	/**
	 * @param orderCategory the orderCategory to set
	 */
	public void setOrderCategory(String orderCategory) {
		this.orderCategory = orderCategory;
	}

	/**
	 * @return the remark
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
	 * @return the freeMtStartDt
	 */
	public String getFreeMtStartDt() {
		return freeMtStartDt;
	}

	/**
	 * @param freeMtStartDt the freeMtStartDt to set
	 */
	public void setFreeMtStartDt(String freeMtStartDt) {
		this.freeMtStartDt = freeMtStartDt;
	}

	/**
	 * @return the freeMtEndDt
	 */
	public String getFreeMtEndDt() {
		return freeMtEndDt;
	}

	/**
	 * @param freeMtEndDt the freeMtEndDt to set
	 */
	public void setFreeMtEndDt(String freeMtEndDt) {
		this.freeMtEndDt = freeMtEndDt;
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
	 * @return the mngOrderInsertVOList
	 */
	public List<MngOrderInsertVO> getMngOrderInsertVOList() {
		return mngOrderInsertVOList;
	}

	/**
	 * @param mngOrderInsertVOList the mngOrderInsertVOList to set
	 */
	public void setMngOrderInsertVOList(List<MngOrderInsertVO> mngOrderInsertVOList) {
		this.mngOrderInsertVOList = mngOrderInsertVOList;
	}

	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
