package com.cep.main.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.cmm.vo.ComDefaultVO;

@SuppressWarnings("serial")
@Alias("empVO")
public class EmpVO extends ComDefaultVO implements Serializable {
	private String empKey;
	private String empPw;
	private Boolean isNewPw;
	
	public String getEmpKey() {
		return empKey;
	}
	public void setEmpKey(String empKey) {
		this.empKey = empKey;
	}
	public String getEmpPw() {
		return empPw;
	}
	public void setEmpPw(String empPw) {
		this.empPw = empPw;
	}
	public Boolean getIsNewPw() {
		return isNewPw;
	}
	public void setIsNewPw(Boolean isNewPw) {
		this.isNewPw = isNewPw;
	}
	
}
