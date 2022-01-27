/**
 * 
 */
package com.cmm.util;


/**
 * @File Name : DisplayUtil.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 12. 14.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 12. 14.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class CepDisplayUtil {
	/**
	 * 
	  * @Method Name : displayDate
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 화면에 날짜 타입으로 변경 yyyyMMdd ==> yyyy-MM-dd
	  * @param date
	  * @return
	 */
	public static String displayDate(String date){
		String convertDate = null;
//		System.out.println("date========================>"+date);
		if(!"".equals(CepStringUtil.getDefaultValue(date, ""))){
			if(date.length()==8){
				try {
					convertDate =  CepDateUtil.convertDisplayFormat(date, "yyyyMMdd", "yyyy-MM-dd");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(date.length()==6)
			{
				try {
					convertDate =  CepDateUtil.convertDisplayFormat(date, "yyyyMM", "yyyy-MM");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				convertDate = date;
			}
			
		}
		return convertDate;
	}
	
	/**
	 * 
	  * @Method Name : displayTime
	  * @Cdate       : 2021. 1. 27.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :시분을 시:분 형식으로 표시.
	  * @param time
	  * @return
	 */
	public static String displayTime(String time) {
		StringBuffer sb = null;
		if(!"".equals(CepStringUtil.getDefaultValue(time, "")) && time.length()>2) {
			sb = new StringBuffer();
			sb.append(time.substring(0, 2));
			sb.append(":");
			sb.append(time.substring(2, time.length()));
			return sb.toString();
		} else {
			return time;
		}
	}
	
	/**
	 * 
	  * @Method Name : getCommaString
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 3자리마다 컴마를 설정함.
	  * @param str
	  * @return
	 */
	public static String commaStr(String str){
		
		return CepStringUtil.getCommaString(str);
	}
	
	/**
	 * 
	  * @Method Name : makeMultiNumber
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :입력한 값을 모두 곱해서 값을 넘겨줌
	  * @param numbers
	  * @return
	 */
	public static String makeMultiNumber(int... numbers){
		int multiVal = 0;
		
		for (int i = 0; i < numbers.length; i++) {
			if(i==0) {
				multiVal = numbers[i];
			} else {
//				multiVal = multiVal*numbers[i];
				multiVal *=numbers[i];
			}
			
		}
		return commaStr(String.valueOf(multiVal));
	}
	
	/**
	 * 
	  * @Method Name : makeAddNumber
	  * @Cdate       : 2020. 12. 16.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 입력한 값을 모두 더해서 넘겨줌.
	  * @param numbers
	  * @return
	 */
	public static String makeAddNumber(int... numbers){
		int multiVal = 0;
		
		for (int i = 0; i < numbers.length; i++) {
			multiVal += numbers[i];			
		}
		return commaStr(String.valueOf(multiVal));
	}
	
	/**
	 * ##-##-##### 형식으로 변경해 주는 메서드
	 * <pre>
	 * </pre>
	 * 
	 * @param acKey
	 * @return
	 * @cdate 2021. 9. 1. 오후 6:58:59
	 * @author aranghoo
	 */
	public static String makeActypeForm(String acKey) {
		String acType = null;
		String acFormat = "(\\d{3})(\\d{2})(\\d{5})";
		acType = acKey.replaceAll(acFormat, "$1-$2-$3");
		return acType;
	}
	
	/**
	 * 전화번호 형식으로 변경해주는 메서드
	 * <pre>
	 * </pre>
	 * 
	 * @param telVal
	 * @return
	 * @cdate 2021. 12. 31 
	 * @author sylim
	 * */
	public static String displayTel(String telVal) {

		if (!CepStringUtil.getDefaultValue(telVal, "").equals("")) {
			if (telVal.length() == 11) {
				// 010-1234-1234
				telVal = telVal.substring(0, 3) + "-" + telVal.substring(3, 7) + "-" + telVal.substring(7);

			} else if (telVal.length() == 8) {
				// 1588-1234
				telVal = telVal.substring(0, 4) + "-" + telVal.substring(4);
			} else {
				if (telVal.startsWith("02")) { // 서울은 02-123-1234
					if(telVal.length() == 9) {
						telVal = telVal.substring(0, 2) + "-" + telVal.substring(2, 5) + "-" + telVal.substring(5);
					} else if(telVal.length() == 10) {
						telVal = telVal.substring(0, 2) + "-" + telVal.substring(2, 6) + "-" + telVal.substring(6);
					}
				} else { // 그외는 012-123-1345
					telVal = telVal.substring(0, 3) + "-" + telVal.substring(3, 6) + "-" + telVal.substring(6);
				}
			}

		}

		return telVal;
	}
}
