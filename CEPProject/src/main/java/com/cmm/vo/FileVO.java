package com.cmm.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("fileVO")
public class FileVO implements Serializable {
	public String fileKey;
	public String fileOrgNm;
	public String serverFilePath;
	public String serverFileNm;
	public String docTypeKey;
	public String regDt;
	
	public String getFileKey() {
		return fileKey;
	}
	public void setFileKey(String fileKey) {
		this.fileKey = fileKey;
	}
	public String getFileOrgNm() {
		return fileOrgNm;
	}
	public void setFileOrgNm(String fileOrgNm) {
		this.fileOrgNm = fileOrgNm;
	}
	public String getServerFilePath() {
		return serverFilePath;
	}
	public void setServerFilePath(String serverFilePath) {
		this.serverFilePath = serverFilePath;
	}
	public String getServerFileNm() {
		return serverFileNm;
	}
	public void setServerFileNm(String serverFileNm) {
		this.serverFileNm = serverFileNm;
	}
	public String getDocTypeKey() {
		return docTypeKey;
	}
	public void setDocTypeKey(String docTypeKey) {
		this.docTypeKey = docTypeKey;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
}
