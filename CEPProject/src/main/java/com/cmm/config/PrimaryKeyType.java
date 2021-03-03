/**
 * 
 */
package com.cmm.config;

/**
 * @File Name : PrimaryKeyType.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 11. 24.
 * @version   : 1.0
 * @Description : 관리키를 생성하기 위한 keyType을 지정하는 객체.
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 24.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public enum PrimaryKeyType {
	/*
	 * PROJECT : 프로젝트 관리키 구분
	 * MAINTENACE_CONTRACT_ALL : 유지보수 계약 통합키
	 * MAINTENACE_CONTRACT : 유지보수 계약 관리키
	 * MAINTENACE_BACK_ORDER : 유지보수 계약  백계약 관리키
	 * MAINTENACE_WORK : 유지보수 작업 관리키.
	 * FORECAST : FORECAST 관리키.
	 */
	PROJECT("PJ")
	, PROJECT_CONTRACT("CT")
	, GUARANTY_BOND("GB")
	, MAINTENACE_CONTRACT_ALL("MA")
	, MAINTENACE_CONTRACT("MT") 
	, MAINTENACE_BACK_ORDER("MB")
	, MAINTENACE_WORK("MW")
	, SALES_DETAIL("SD")
	, PROJECT_ORDER("PO")
	, PAYMENT("PY")
	, FORECAST("SP")
	, PROJECT_PURCHASE("PP")
	, PROJECT_BIDDING("BD");
	
	private String value;
	
	private PrimaryKeyType(String value){
		this.value = value;
	}
	public String getValue(){
		return this.value;
	}
}
