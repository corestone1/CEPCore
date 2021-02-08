package com.cmm.vo;

/**
 * 지급 클래스
 * @author sylim
 * @since 2021.01.29
 * @version 1.0
 * 
 * <pre>
 * << 개정 이력 >>
 * 
 * 수정일			수정자		수정내용
 * -------			-------		---------------------------------------
 * 2021.01.29	sylim			최초 생성
 * */

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.cmm.util.CepDateUtil;
import com.cmm.util.CepStringUtil;

@Alias("purchaseVO")
public class PurchaseVO implements Serializable {
	private static final long serialVersionUID  = 1L;
	
	private String buyKey;
	private String buyOrderFkKey;
	private String buyClass;
	private int buyAmount;
	private int donePaymentAmount;
	private int yetPaymentAmount;
	private String buyTurn;
	private String deleteYn;
	
	public String getBuyKey() {
		return buyKey;
	}
	public void setBuyKey(String buyKey) {
		this.buyKey = buyKey;
	}
	public String getBuyOrderFkKey() {
		return buyOrderFkKey;
	}
	public void setBuyOrderFkKey(String buyOrderFkKey) {
		this.buyOrderFkKey = buyOrderFkKey;
	}
	public String getBuyClass() {
		return buyClass;
	}
	public void setBuyClass(String buyClass) {
		this.buyClass = buyClass;
	}
	public int getBuyAmount() {
		return buyAmount;
	}
	public void setBuyAmount(int buyAmount) {
		this.buyAmount = buyAmount;
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
	public String getBuyTurn() {
		return buyTurn;
	}
	public void setBuyTurn(String buyTurn) {
		this.buyTurn = buyTurn;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	
}
