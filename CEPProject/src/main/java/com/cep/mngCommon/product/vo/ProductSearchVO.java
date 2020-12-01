package com.cep.mngCommon.product.vo;

import java.io.Serializable;

/**
 * 
 * @File Name : ProuctSearchVO.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2020. 11. 25.
 * @version   : 1.0
 * @Description : 제품 검색 조건에 사용되는 변수 정의.
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 25.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class ProductSearchVO implements Serializable {

	private static final long serialVersionUID = -842598062348714683L;
	private String productDivision; //제품 구분(S/W, H/W, 용역, 기타)
	private String productFlag;     //제품 상태
	private String productMake;     //제조사
	private String productName;     //제품명
	
	public String getProductDivision() {
		return productDivision;
	}
	public void setProductDivision(String productDivision) {
		this.productDivision = productDivision;
	}
	public String getProductFlag() {
		return productFlag;
	}
	public void setProductFlag(String productFlag) {
		this.productFlag = productFlag;
	}
	public String getProductMake() {
		return productMake;
	}
	public void setProductMake(String productMake) {
		this.productMake = productMake;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
