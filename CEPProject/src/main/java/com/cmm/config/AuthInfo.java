/**
 * 
 */
package com.cmm.config;

/**
 * @File Name : AuthInfo.java
 * @Project   : CEPProject
 * @Author    : sylim
 * @Cdate     : 2021. 08. 02.
 * @version   : 1.0
 * @Description : 권한 정보
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 08. 02.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public enum AuthInfo {
	/*
	 * MAIL_SERVER : 메일 서버
	 * MAIL_PORT : 메일 포트
	 * MAIL_FROM : 보내는 이 메일 계정
	 * MAIL_SEND_NAME : 보내는 이 메일 이름
	 * MAIL_SUBJECT : 메일 제목(기본)
	 */
	AUTH_ADMIN("EMAU1001")
	, AUTH_SUPER_USER("EMAU1002")
	, AUTH_USER("EMAU1003")
	;
	
	private String value;
	
	private AuthInfo(String value){
		this.value = value;
	}
	public String getValue(){
		return this.value;
	}
}
