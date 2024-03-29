package com.cmm.vo;

/**
 * 공통 VO 클래스
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

import com.cmm.util.CepDateUtil;
import com.cmm.util.CepStringUtil;

@Alias("comDefaultVO")
public class ComDefaultVO implements Serializable {
	private static final long serialVersionUID  = 1L;
	
	private String regDt;
	private String regTm;
	private String modDt;
	private String modTm;
	
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
	
	///////////////////////////////////////////////////////////////////////////
	
	
	public String makeTotalAmount(String mtPmQuantity, String mtPmUprice){
		String totalAmount = "0";
		totalAmount = String.valueOf(Integer.parseInt(mtPmQuantity)*Integer.parseInt(mtPmUprice));
		return totalAmount;
	}
	
	public String makeDisplayDate(String date){
		return CepDateUtil.convertDate(date, null, null, "V");
	}
	
	public String makeDisplayAmount(String amount) {
		return CepStringUtil.getCommaString(amount);
	}
}
