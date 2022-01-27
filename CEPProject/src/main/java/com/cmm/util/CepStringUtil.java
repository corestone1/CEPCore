package com.cmm.util;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public class CepStringUtil {
	private static final Logger logger = LoggerFactory.getLogger(CepStringUtil.class);
	
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
    
    /**
     * 매출/매입 제조사 구분
     *
     * <pre>
     * </pre>
     * 
     * @return
     * @cdate 2021. 12. 6. 오후 9:04:25
     * @author aranghoo
     */
    public static List<Map<String, String>> getManuFacturerList() {
    	List<Map<String, String>> manufacturerList = new ArrayList<>();
    	
    	Map<String, String> manufactureCode = null;
    	try {
    		manufactureCode = new HashMap<String, String>();
    		manufactureCode.put("codeKey", "EMC");
    		manufactureCode.put("codeNm", "EMC");
    		manufacturerList.add(manufactureCode);
    		manufactureCode = new HashMap<String, String>();
    		manufactureCode.put("codeKey", "IBM");
    		manufactureCode.put("codeNm", "IBM");
    		manufacturerList.add(manufactureCode);
    		manufactureCode = new HashMap<String, String>();
    		manufactureCode.put("codeKey", "Hitachi");
    		manufactureCode.put("codeNm", "Hitachi");
    		manufacturerList.add(manufactureCode);
    		manufactureCode = new HashMap<String, String>();
    		manufactureCode.put("codeKey", "FCoreXCM");
    		manufactureCode.put("codeNm", "FCoreXCM");
    		manufacturerList.add(manufactureCode);
    		manufactureCode = new HashMap<String, String>();
    		manufactureCode.put("codeKey", "FCoreXMA");
    		manufactureCode.put("codeNm", "FCoreXMA");
    		manufacturerList.add(manufactureCode);
    		manufactureCode = new HashMap<String, String>();
    		manufactureCode.put("codeKey", "F5");
    		manufactureCode.put("codeNm", "F5");
    		manufacturerList.add(manufactureCode);
    		manufactureCode = new HashMap<String, String>();
    		manufactureCode.put("codeKey", "HP");
    		manufactureCode.put("codeNm", "HP");
    		manufacturerList.add(manufactureCode);
    		manufactureCode = new HashMap<String, String>();
    		manufactureCode.put("codeKey", "NAC");
    		manufactureCode.put("codeNm", "NAC");
    		manufacturerList.add(manufactureCode);
    		manufactureCode = new HashMap<String, String>();
    		manufactureCode.put("codeKey", "기타");
    		manufactureCode.put("codeNm", "기타");
    		manufacturerList.add(manufactureCode);
    		manufactureCode = new HashMap<String, String>();
    		manufactureCode.put("codeKey", "브로케이드");
    		manufactureCode.put("codeNm", "브로케이드");
    		manufacturerList.add(manufactureCode);
		} catch (Exception e) {
			logger.error("getManuFacturerList err = {}",e);
		}
    	
    	return manufacturerList;
    }
    
    /**
     * 매입구분
     * <pre>
     * </pre>
     * 
     * @return
     * @cdate 2021. 12. 6. 오후 9:24:07
     * @author aranghoo
     */
    public static List<Map<String, String>> getSalesCodeList() {
    	List<Map<String, String>> salesCodeList = new ArrayList<>();
    	Map<String, String>salesCode = null;
    	try {
    		salesCode = new HashMap<>();
    		salesCode.put("cdKey", "HW");
    		salesCode.put("cdNm", "HW");
    		salesCodeList.add(salesCode);
    		salesCode = new HashMap<>();
    		salesCode.put("cdKey", "SW");
    		salesCode.put("cdNm", "SW");
    		salesCodeList.add(salesCode);
    		salesCode = new HashMap<>();
    		salesCode.put("cdKey", "외주용역");
    		salesCode.put("cdNm", "외주용역");
    		salesCodeList.add(salesCode);
    		salesCode = new HashMap<>();
    		salesCode.put("cdKey", "기타");
    		salesCode.put("cdNm", "기타");
    		salesCodeList.add(salesCode);
		} catch (Exception e) {
			logger.error("getSalesCodeList err = {}",e);
		}
    	return salesCodeList;
    }
    
    /**
     * 매입구분
     * <pre>
     * </pre>
     * 
     * @return
     * @cdate 2021. 12. 6. 오후 9:24:07
     * @author aranghoo
     */
    public static List<Map<String, String>> getPurchaseCodeList() {
    	List<Map<String, String>> purchaseCodeList = new ArrayList<>();
    	Map<String, String> purchaseCode = null;
    	try {
    		purchaseCode = new HashMap<>();
    		purchaseCode.put("cdKey", "HW");
    		purchaseCode.put("cdNm", "HW");
    		purchaseCodeList.add(purchaseCode);
    		purchaseCode = new HashMap<>();
    		purchaseCode.put("cdKey", "SW");
    		purchaseCode.put("cdNm", "SW");
    		purchaseCodeList.add(purchaseCode);
    		purchaseCode = new HashMap<>();
    		purchaseCode.put("cdKey", "외주용역");
    		purchaseCode.put("cdNm", "외주용역");
    		purchaseCodeList.add(purchaseCode);
    		purchaseCode = new HashMap<>();
    		purchaseCode.put("cdKey", "기타");
    		purchaseCode.put("cdNm", "기타");
    		purchaseCodeList.add(purchaseCode);
		} catch (Exception e) {
			logger.error("getManuFacturerList err = {}",e);
		}
    	return purchaseCodeList;
    }
    
}
