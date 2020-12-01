/**
 * 
 */
package com.cmm.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;
import java.util.TimeZone;

/**
 * @File Name : CepDateUtil.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 11. 23.
 * @version   : 1.0
 * @Description :  날짜 관련 유틸
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 23.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class CepDateUtil {
	
	public static final String YEAR_GUBUN = "Y";
	public static final String MONTH_GUBUN = "M";
	public static final String DAY_GUBUN = "D";
	
	/**
	 *  dateFormat :리턴 받을 날짜 형식 지정 yyyyMMdd, yyyyMMddHHmmss, yyyy-MM-dd, yyyy/MM/dd HH:mm:ss등
	 * <pre>
	 * </pre>
	 * 
	 * @param dateTime
	 * @param dateFormat
	 * @return
	 * @cdate 2020. 7. 3. 오후 3:44:56
	 * @author 최윤창(ycchoi@corestone.co.kr)
	 */
	public static String getDateString(long dateTime, String dateFormat) throws Exception{
		Date date = null;
		String dateStr = null;
		SimpleDateFormat dateFormatType = null;
		try {
			if("".equals(StringUtil.getDefaultValue(dateFormat, ""))) {
				dateFormat = "yyyy-MM-dd HH:mm:ss";
			}
			dateFormatType = new SimpleDateFormat(dateFormat);
			date = new Date(dateTime);
			
			dateStr = dateFormatType.format(date);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return dateStr;
	}
	
	public static int getSecondForBetweenDate(String fromDate, String toDate, String dateFormat) throws Exception{
		Date fromTime 	= null;
		Date toTime 	= null;
		int gapSecond 	= 0;
		try {
			fromTime = new SimpleDateFormat(dateFormat).parse(fromDate);
			toTime = new SimpleDateFormat(dateFormat).parse(toDate);
			// 밀리센컨드 단위이므로 1000으로 나눠주면 초가된다.
			gapSecond = (int)((toTime.getTime() - fromTime.getTime())/1000);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return gapSecond;
	}
	
	public static String convertDisplayFormat(String strDate, String nowFormat, String changeFormate) throws Exception{
		String changeDate = null;
		double standardVersion = 1.5;
		double checkVersion = 0;
		Calendar calendar = null;

		SimpleDateFormat baseDateFormat = null;

		SimpleDateFormat changeDateFormat = null;
		TimeZone tz = TimeZone.getTimeZone("GMT");
		try {
			checkVersion = Double.parseDouble(System.getProperty("java.version").substring(0, 3));
			
			calendar = Calendar.getInstance(tz);
			if(!"".equals(StringUtil.getDefaultValue(nowFormat, ""))){
				baseDateFormat = new SimpleDateFormat(nowFormat);
			} else {
				baseDateFormat = new SimpleDateFormat("yyyyMMdd");
			}
			
			calendar.setTime(baseDateFormat.parse(strDate));
			
			if(!"".equals(StringUtil.getDefaultValue(changeFormate, ""))){
				changeDateFormat = new SimpleDateFormat(changeFormate);
			} else {
				changeDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			}
			
			changeDate = changeDateFormat.format(calendar.getTime());
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		return changeDate;
	}
	
	/**
	 * String 일자의 Calendar 객체 구하기
	 * <pre>
	 * </pre>
	 * 
	 * @param dateStr( yyyyMMdd )
	 * @param gubun(S:dateStr의 시작시간으로 Calendar return, E: dateStr의 끝시간으로 Calendar return)
	 * @return
	 * @throws Exception
	 * @cdate 2019. 5. 15. 오후 7:12:51
	 * @author 최윤창(ycchoi@corestone.co.kr)
	 */
	public static Calendar convertDisplayToCalendar(String dateStr, String gubun) throws Exception{
		Calendar calendar = null;
		try {
			if(dateStr.length() !=8){
				throw new IllegalArgumentException("You have to write yyyyMMdd format ("+dateStr+").");
			}
			
			calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
			calendar.set(Calendar.YEAR, Integer.parseInt(dateStr.substring(0,4)));
			calendar.set(Calendar.MONTH, Integer.parseInt(dateStr.substring(4,6))-1);
			calendar.set(Calendar.DATE, Integer.parseInt(dateStr.substring(6,8)));
			if("S".equals(gubun)){
				calendar.set(
						Integer.parseInt(dateStr.substring(0,4)), //년도
						Integer.parseInt(dateStr.substring(4,6))-1, //월
						Integer.parseInt(dateStr.substring(6,8)), //일
						0, //시
						0, //분
						0);//초
			}else if("E".equals(gubun)){
				calendar.set(
						Integer.parseInt(dateStr.substring(0,4)), //년도
						Integer.parseInt(dateStr.substring(4,6))-1, //월
						Integer.parseInt(dateStr.substring(6,8)), //일
						23, //시
						59, //분
						59);//초
			}
			
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return calendar;
	}
	
	/**
	 * String 일자와 시간을 Calendar 타입으로 변환시켜주는 메서드
	 *  2019년 5월 15일 7시27분40초 => 2019.5.15.19.27.40 (24시간 기준)
	 * <pre>
	 * </pre>
	 * 
	 * @param pDateTime
	 * @return
	 * @throws IllegalArgumentException
	 * @cdate 2019. 5. 15. 오후 7:27:40
	 * @author 최윤창(ycchoi@corestone.co.kr)
	 */
	public static Calendar convertDisplayToCalendar(String pDateTime)
			throws IllegalArgumentException {

		Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
		StringTokenizer st = new StringTokenizer(pDateTime, ".");

		if (st.countTokens() != 6){
			throw new IllegalArgumentException("Invalid argument.");
		}

		calendar.set(Calendar.YEAR, Integer.parseInt(st.nextToken()));
		calendar.set(Calendar.MONTH, Integer.parseInt(st.nextToken())-1);
		calendar.set(Calendar.DATE, Integer.parseInt(st.nextToken()));
		calendar.set(Calendar.HOUR, Integer.parseInt(st.nextToken()));
		calendar.set(Calendar.MINUTE, Integer.parseInt(st.nextToken()));
		calendar.set(Calendar.SECOND, Integer.parseInt(st.nextToken()));

		return calendar;
	}
	
	public static List makeDayListFormToEndDate(String startDay, String endDay) throws Exception{
		List dayList = null;
		int startYear = 0;
		int startMonth = 0;
		int startDate = 0;
		Calendar calendar = null;
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		try {
			startDay = startDay.replaceAll("-", "").replaceAll("/", "");
			endDay = endDay.replaceAll("-", "").replaceAll("/", "");
			if(startDay.length() != 8) {
				throw new Exception("must write start(from) date yyyyMMdd format !!!");
			}
			
			if(endDay.length() != 8) {
				throw new Exception("must write end(to) date yyyyMMdd format !!!");
			}
			
			if(Integer.parseInt(startDay)>Integer.parseInt(endDay)) {
				throw new Exception("The start date is in the future than the end date.");
			}		
			
			//시작일에 대해 년/월/일을 구한다.
			startYear = Integer.parseInt(startDay.substring(0, 4));
			startMonth = Integer.parseInt(startDay.substring(4, 6));
			startDate = Integer.parseInt(startDay.substring(6, 8));
			
			calendar = Calendar.getInstance();
			
			
			/*
			 * 시작일 셋팅
			 * Calendar의 Month는 0부터 시작하므로 -1 해준다.
			 */
			calendar.set(startYear, startMonth-1, startDate);
			
			dayList = new ArrayList();
			while(true) {
//				System.out.println("====>"+simpleDateFormat.format(calendar.getTime()));
				dayList.add(simpleDateFormat.format(calendar.getTime()));
				//1씩 증가시킨다.
				calendar.add(Calendar.DATE, 1);
//				System.out.println(simpleDateFormat.format(calendar.getTime()));
//				System.out.println("====>"+simpleDateFormat.format(calendar.getTime()));
				/*
				 * 6월 30일까지만 달력에 있는데 6월31일 을 입력한 경우
				 * 6월30일까지만 리스트에 add한다.
				 */
				if(Integer.parseInt(simpleDateFormat.format(calendar.getTime())) == Integer.parseInt(endDay)) {
//					System.out.println("====>"+simpleDateFormat.format(calendar.getTime()));
					dayList.add(simpleDateFormat.format(calendar.getTime()));
					break;
				}else if (Integer.parseInt(simpleDateFormat.format(calendar.getTime())) > Integer.parseInt(endDay)) {
					break;
				}
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return dayList;
	}
	
	/**
	 * 오늘 날짜를 format 형식의 문자열로 return
	 * <pre>
	 * </pre>
	 * 
	 * @param dateFormat :리턴 받을 날짜 형식 지정 yyyyMMdd, yyyyMMddHHmmss, yyyy-MM-dd, yyyy/MM/dd HH:mm:ss등
	 * @return
	 * @cdate 2019. 6. 12. 오후 2:40:29
	 * @author 최윤창(ycchoi@corestone.co.kr)
	 */
//	public static String getToday(String dateFormat) throws Exception{
//		String toDay = null;
//		SimpleDateFormat sDateFormat = null;
//		Calendar calendar = null;
//		try {
//			if(!"".equals(FcoreStringUtil.getDefaultValue(dateFormat, ""))){
//				sDateFormat = new SimpleDateFormat(dateFormat);
//			} else {
//				sDateFormat = new SimpleDateFormat("yyyyMMdd");
//			}
////			calendar = Calendar.getInstance();
//			calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
//			
//			toDay = sDateFormat.format(calendar.getTime());
//		} catch (Exception e) {
//			throw new Exception(e);
//		}
//		return toDay;
//	}
	
	public static String getToday(String dateFormat) throws Exception{
		String toDay = null;
		try {
			if("".equals(StringUtil.getDefaultValue(dateFormat, ""))){
				dateFormat = "yyyyMMdd";
			}
			toDay =calculatorDateFromToDay(dateFormat, "D", 0);
		} catch (Exception e) {
			throw new Exception(e);
		}
//		System.out.println("toDay===>"+toDay);
		return toDay;

	}
	/**
	 * 
	 * <pre>
	 * </pre>
	 * 
	 * @param baseDate : yyyyMMdd형식의 일짜로 기준이 되는 일자. TODAY면 현재일자 적용.
	 * @param dateFormat :리턴 받을 날짜 형식 지정 yyyyMMdd, yyyyMMddHHmmss, yyyy-MM-dd, yyyy/MM/dd HH:mm:ss등
	 * @param calculatorGubun (Y:년도 계산, M 월계산, D: 일 계산
	 * @param term : calculatorGubun에 의한 계산을 위한 숫자.
	 * @return
	 * @throws Exception
	 * @cdate 2019. 6. 12. 오후 3:00:04
	 * @author 최윤창(ycchoi@corestone.co.kr)
	 */
	public static String calculatorDate(String baseDate, String dateFormat, String calculatorGubun, int term) throws Exception{
		String calculatorDate = null;
		SimpleDateFormat sDateFormat = null;
		SimpleDateFormat baseDateFormat = null;
		Calendar calendar = null;
		TimeZone tz = TimeZone.getTimeZone("GMT");
		double standardVersion = 1.5;
		double checkVersion = 0;
		try {
			checkVersion = Double.parseDouble(System.getProperty("java.version").substring(0, 3));
			if(!"".equals(StringUtil.getDefaultValue(dateFormat, ""))){
				sDateFormat = new SimpleDateFormat(dateFormat);
			} else {
				sDateFormat = new SimpleDateFormat("yyyyMMdd");
			}
			
			//기준일자를 지정한다.
			if("".equals(StringUtil.getDefaultValue(baseDate, "")) || baseDate.equalsIgnoreCase("TODAY")) {
				//오늘 날짜로 지정.
				calendar = Calendar.getInstance(tz);
			}else {
				calendar = Calendar.getInstance(tz);
				baseDateFormat = new SimpleDateFormat("yyyyMMdd");
				calendar.setTime(baseDateFormat.parse(baseDate));
			}
			
			
			if(calculatorGubun.equalsIgnoreCase(YEAR_GUBUN)) {
				calendar.add(Calendar.YEAR, term);
			} else if (calculatorGubun.equalsIgnoreCase(MONTH_GUBUN)) {
				calendar.add(Calendar.MONTH, term);
			} else if (calculatorGubun.equalsIgnoreCase(DAY_GUBUN)) {
				calendar.add(Calendar.DAY_OF_MONTH, term);
			}
			//java 1.5버전 이하에서는 9시간이 느리다>>>
			if(standardVersion>checkVersion) {
				calendar.add(Calendar.HOUR_OF_DAY,9);
			}
			
			calculatorDate = sDateFormat.format(calendar.getTime());
		} catch (Exception e) {
			throw new Exception(e);
		}
		return calculatorDate;
	}
	
	
	
	public static String calculatorDateFromToDay(String dateFormat, String calculatorGubun, int term) throws Exception{
		String calculatorDate = null;
		try {
			calculatorDate = calculatorDate("TODAY", dateFormat, calculatorGubun, term);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return calculatorDate;
	}
	
	public static String getDateWithLongDate(String dateFormat, long longDate) throws Exception{
		String dateStr = null;
		Date date = null;
		SimpleDateFormat simpleDateFormat = null;
		try {
			simpleDateFormat = new SimpleDateFormat(dateFormat);
			date = new Date(longDate);
			dateStr = simpleDateFormat.format(date);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return dateStr;
	}

}
