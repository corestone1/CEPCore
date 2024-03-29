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
	, MAINTENACE_CONTRACT_ALL("MA")//유지보수 통합계약
	, MAINTENACE_CONTRACT("MT") //유지보수 계약
	, MAINTENACE_BACK_ORDER("MB") //유지보수 백계약
	, MAINTENACE_ORDER("MO") //유지보수 발주
	, MAINTENACE_WORK("MW") // 유지보수 작업
	, MAINTENACE_PAYMENT("MP") //지급, 매입
	, MAINTENACE_GUARANTEE("MG") //유지보수 보증보험
	, MAINTENACE_SALES_ORDER("SO") //유지보수 매출 주문메인.(MT_SALES_ORDER_TB)
	, MAINTENACE_SALES_PLAN("MS") //유지보수 매출 계산서계획.(MT_SALES_DETAIL_TB)
	, MAINTENACE_BILLING_OP("MB") //유지보수 세금계산서 요청.(MT_SD_BILLING_OP_TB)
	, MAINTENACE_PAYMENT_PLAN("PP") //유지보수 매입지급계획.(MT_PAYMENT_DETAIL_TB)
	, SALES_DETAIL("SD")
	, PROJECT_ORDER("PO")
	, PAYMENT("PY")
	, FORECAST("SP")
	, FORECAST_SALES("FS")
	, FORECAST_PURCHASE("FP")
	, PROJECT_PURCHASE("PP")
	, PROJECT_BIDDING("BD")
	, ACCOUNT("999")
	, PRODUCT("PM");
	
	private String value;
	
	private PrimaryKeyType(String value){
		this.value = value;
	}
	public String getValue(){
		return this.value;
	}
}
