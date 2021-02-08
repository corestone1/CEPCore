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
	public String docTypeNm;
	public String docUpTypeCd;
	public String docValidPeriod;
	public String docReqYn;
	public String fileWorkClass;
	public String fileCtKey;
	public String regDt;
	public String regTm;
	public String regEmpKey;
	public String modDt;
	public String modTm;
	public String modEmpKey;
	
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
	public String getDocTypeNm() {
		return docTypeNm;
	}
	public void setDocTypeNm(String docTypeNm) {
		this.docTypeNm = docTypeNm;
	}
	public String getDocUpTypeCd() {
		return docUpTypeCd;
	}
	public void setDocUpTypeCd(String docUpTypeCd) {
		this.docUpTypeCd = docUpTypeCd;
	}
	public String getDocValidPeriod() {
		return docValidPeriod;
	}
	public void setDocValidPeriod(String docValidPeriod) {
		this.docValidPeriod = docValidPeriod;
	}
	public String getDocReqYn() {
		return docReqYn;
	}
	public void setDocReqYn(String docReqYn) {
		this.docReqYn = docReqYn;
	}
	public String getFileWorkClass() {
		return fileWorkClass;
	}
	public void setFileWorkClass(String fileWorkClass) {
		this.fileWorkClass = fileWorkClass;
	}
	public String getFileCtKey() {
		return fileCtKey;
	}
	public void setFileCtKey(String fileCtKey) {
		this.fileCtKey = fileCtKey;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getRegTm() {
		return regTm;
	}
	public void setRegTm(String regTm) {
		this.regTm = regTm;
	}
	public String getRegEmpKey() {
		return regEmpKey;
	}
	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}
	public String getModDt() {
		return modDt;
	}
	public void setModDt(String modDt) {
		this.modDt = modDt;
	}
	public String getModTm() {
		return modTm;
	}
	public void setModTm(String modTm) {
		this.modTm = modTm;
	}
	public String getModEmpKey() {
		return modEmpKey;
	}
	public void setModEmpKey(String modEmpKey) {
		this.modEmpKey = modEmpKey;
	}
	
}
