package com.cmm.vo;

/**
 * 메일 VO 클래스
 * @author sylim
 * @since 2020.11.23
 * @version 1.0
 * 
 * <pre>
 * << 개정 이력 >>
 * 
 * 수정일			수정자		수정내용
 * -------			-------		---------------------------------------
 * 2020.11.23	sylim			최초 생성
 * */

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("mailVO")
public class MailVO extends ComDefaultVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String fromEmail;
	private String subject;
	private String content;
	private String toEmail;
	private String successYn;
	
	public String getFromEmail() {
		return fromEmail;
	}
	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getToEmail() {
		return toEmail;
	}
	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}
	public String getSuccessYn() {
		return successYn;
	}
	public void setSuccessYn(String successYn) {
		this.successYn = successYn;
	}
}
