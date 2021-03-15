package com.cmm.util;

import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CepStringUtil {
	private static final Logger LOGGER = LoggerFactory.getLogger(CepStringUtil.class);
	
	/**
     * 인자로 받은 String이 null일 경우 ""로 리턴
     * @param String 값
     * @return String이 null 값일 경우 ""로 바꾼 String 값
     */
//	public static String nullConvert(String src) {
//		if(src == null || src.equals("null") || "".equals(src) || " ".equals(src)) {
//			return "";
//		} else {
//			return src.trim();
//		}
//	}
//	
//	 /**
//     * 객체가 null인 경우 "" 로 바꾸는 메서드
//     * @param 원본 객체
//     * @return result 문자열
//     */
//	public static String nullToString(Object object) {
//		String string = "";
//		
//		if(object != null) {
//			string = nullConvert(object.toString().trim());
//		}
//		
//		return string;
//	}
	
	/**
	 * 
	  * @Method Name : getDefaultValue
	  * @Cdate       : 2020. 12. 17.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : object가 null,"","null" 인경우  defaultStr을 return한다. 
	  *                      ex) CepStringUtil.getDefaultValue(searchVO.amount(), "0");
	  *                      ==> amount값이  null인경우 "0"을 리턴함.
	  * @param object
	  * @param defaultStr
	  * @return
	 */
	public static String getDefaultValue(Object object, String defaultStr) {
		String returnValue = null;
		if(object != null) {
			if(object.toString().length()==0 || object.toString().equalsIgnoreCase("null")) {
				returnValue = defaultStr;
			}else {
				returnValue = object.toString();
			}
		} else {
			returnValue = defaultStr;
		}
		
		return returnValue;
	}
	
	/**
	 * 
	  * @Method Name : getCommaString
	  * @Cdate       : 2020. 12. 17.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 해당 문자를 3자리 단위로 , 를 추가함.
	  *                       ex) 123456789 ==> 123,456,789
	  * @param str
	  * @return
	 */
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
	
    public static String replace(String source, String subject, String object) {
        StringBuffer rtnStr = new StringBuffer();
        String preStr = "";
        String nextStr = source;
        String srcStr  = source;

        while (srcStr.indexOf(subject) >= 0) {
            preStr = srcStr.substring(0, srcStr.indexOf(subject));
            nextStr = srcStr.substring(srcStr.indexOf(subject) + subject.length(), srcStr.length());
            srcStr = nextStr;
            rtnStr.append(preStr).append(object);
        }
        rtnStr.append(nextStr);
        return rtnStr.toString();
    }
    
    public static String getUrl(HttpServletRequest request) {
    	String uri = request.getRequestURI();
    	String query = request.getQueryString();
    	
    	if(getDefaultValue(query, "").equals("")) {
    		query = "";
    	} else {
    		query = "?" + query;
    	}
    	
    	return (uri + query);
    	
    }
}
