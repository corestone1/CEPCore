package com.cep.main.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("empVO")
public class EmpVO implements Serializable {
	private String empKey;
	private String empPw;
	
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
}
