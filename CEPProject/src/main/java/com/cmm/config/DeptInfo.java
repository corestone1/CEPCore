/**
 * 
 */
package com.cmm.config;

/**
 * @File Name : DeptInfo.java
 * @Project   : CEPProject
 * @Author    : sylim
 * @Cdate     : 2021. 08. 02.
 * @version   : 1.0
 * @Description : 부서 정보
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 08. 02.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public enum DeptInfo {
	/*
	 * MAIL_SERVER : 메일 서버
	 * MAIL_PORT : 메일 포트
	 * MAIL_FROM : 보내는 이 메일 계정
	 * MAIL_SEND_NAME : 보내는 이 메일 이름
	 * MAIL_SUBJECT : 메일 제목(기본)
	 */
	DEPT_OPER_L1("OPER_000")
	, DEPT_OPER_L2("OPER_101")
	, DEPT_SALE_L1("SALE_000")
	, DEPT_SALE_L2("SALE_101")
	, DEPT_TECH_L1("TECH_000")
	, DEPT_TECH_L2("TECH_101")
	;
	
	private String value;
	
	private DeptInfo(String value){
		this.value = value;
	}
	public String getValue(){
		return this.value;
	}
}
