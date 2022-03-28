/**
 * 
 */
package com.cmm.config;

/**
 * @File Name : EmailInfo.java
 * @Project   : CEPProject
 * @Author    : sylim
 * @Cdate     : 2020. 03. 07.
 * @version   : 1.0
 * @Description : 이메일 전송 정보
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 24.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public enum EmailInfo {
	/*
	 * MAIL_SERVER : 메일 서버
	 * MAIL_PORT : 메일 포트
	 * MAIL_FROM : 보내는 이 메일 계정
	 * MAIL_SEND_NAME : 보내는 이 메일 이름
	 * MAIL_SUBJECT : 메일 제목(기본)
	 */
	MAIL_SERVER("smtp.gmail.com")
	, MAIL_PORT("465")
	, MAIL_SEND_NAME("corestone1602")
	, MAIL_FROM("corestone1602@gmail.com")
	, MAIL_SEND_PW("zhdjtmxhs16*")
	, MAIL_SUBJECT("업무 협조 요청")
	, PAGE_URL("http://172.10.122.10:8888/");
	
	private String value;
	
	private EmailInfo(String value){
		this.value = value;
	}
	public String getValue(){
		return this.value;
	}
}
