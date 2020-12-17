package com.cmm.util;

import java.text.DecimalFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CepStringUtil {
	private static final Logger LOGGER = LoggerFactory.getLogger(CepStringUtil.class);
	
	/**
     * 인자로 받은 String이 null일 경우 ""로 리턴
     * @param String 값
     * @return String이 null 값일 경우 ""로 바꾼 String 값
     */
	public static String nullConvert(String src) {
		if(src == null || src.equals("null") || "".equals(src) || " ".equals(src)) {
			return "";
		} else {
			return src.trim();
		}
	}
	
	 /**
     * 객체가 null인 경우 "" 로 바꾸는 메서드
     * @param 원본 객체
     * @return result 문자열
     */
	public static String nullToString(Object object) {
		String string = "";
		
		if(object != null) {
			string = nullConvert(object.toString().trim());
		}
		
		return string;
	}
	
	public static String getDefaultValue(String str, String defaultStr) {
		String returnValue = null;
		
		if(null == str || str.length()==0 || str.equalsIgnoreCase("null")) {
			returnValue = defaultStr;
		}else {
			returnValue = str;
		}
		return returnValue;
	}
	
	public static String getCommaString(String str){
		String pattern = "###,###,###,###,###";
		DecimalFormat df = null;
		String returnValue = null;
		try{
			df = new DecimalFormat (pattern);
			double d = Double.parseDouble(str);
			returnValue = df.format(d);
		} catch (Exception e) {
			returnValue = str;
		}
		return returnValue;
	}
}
