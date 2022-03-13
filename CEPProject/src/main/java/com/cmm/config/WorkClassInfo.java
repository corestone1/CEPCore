/**
 * 
 */
package com.cmm.config;

/**
 * @File Name : WorkClassInfo.java
 * @Project   : CEPProject
 * @Author    : sylim
 * @Cdate     : 2021. 08. 02.
 * @version   : 1.0
 * @Description : 첨부 파일 정보
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2022. 01. 02.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public enum WorkClassInfo {
	
	PROJECT("프로젝트")
	;
	
	private String value;
	
	private WorkClassInfo(String value){
		this.value = value;
	}
	public String getValue(){
		return this.value;
	}
}
