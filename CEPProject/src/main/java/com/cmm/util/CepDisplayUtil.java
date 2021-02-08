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
}
