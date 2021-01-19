/**
 * 
 */
package com.cep.forecast.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

/**
 * @File Name : ForecastSearchVO.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2020. 12. 1.
 * @version   : 1.0
 * @Description : Forecast Search용 VO
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 12. 1.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
@Alias("forecastSearchVO")
public class ForecastSearchVO implements Serializable {
   
   private static final long serialVersionUID = -8199715870875240847L;
   
   private String spKey;       //Forecast Key
   private String spState;     //진행상태
   private String pjFlag;      //구분(프로젝트/유지보수/기타)
   private String searchFlag;  //검색조건 (사업명, 고객사, 제품) 추후 추가
   private String searchValue; //검색조건 값
   
   private String spKeyDomId;     //Search Popup Return값을 넘기는 객체의 ID(Forecast키)
   private String spBusiNmDomId;  //Search Popup Return값을 넘기는 객체의 ID(사업명)
   
   
   
   
   /**
    * @return the spKey
    */
   public String getSpKey() {
      return spKey;
   }
   /**
    * @param spKey the spKey to set
    */
   public void setSpKey(String spKey) {
      this.spKey = spKey;
   }
   /**
    * @return the pjFlag
    */
   public String getPjFlag() {
      return pjFlag;
   }
   /**
    * @return the spState
    */
   public String getSpState() {
      return spState;
   }
   /**
    * @param spState the spState to set
    */
   public void setSpState(String spState) {
      this.spState = spState;
   }
   /**
    * @param pjFlag the pjFlag to set
    */
   public void setPjFlag(String pjFlag) {
      this.pjFlag = pjFlag;
   }
   /**
    * @return the searchFlag
    */
   public String getSearchFlag() {
      return searchFlag;
   }
   /**
    * @param searchFlag the searchFlag to set
    */
   public void setSearchFlag(String searchFlag) {
      this.searchFlag = searchFlag;
   }
   /**
    * @return the searchValue
    */
   public String getSearchValue() {
      return searchValue;
   }
   /**
    * @param searchValue the searchValue to set
    */
   public void setSearchValue(String searchValue) {
      this.searchValue = searchValue;
   }
   /**
    * @return the serialversionuid
    */
   public static long getSerialversionuid() {
      return serialVersionUID;
   }
   /**
    * @return the spKeyDomId
    */
   public String getSpKeyDomId() {
      return spKeyDomId;
   }
   /**
    * @param spKeyDomId the spKeyDomId to set
    */
   public void setSpKeyDomId(String spKeyDomId) {
      this.spKeyDomId = spKeyDomId;
   }
   /**
    * @return the spBusiNmDomId
    */
   public String getSpBusiNmDomId() {
      return spBusiNmDomId;
   }
   /**
    * @param spBusiNmDomId the spBusiNmDomId to set
    */
   public void setSpBusiNmDomId(String spBusiNmDomId) {
      this.spBusiNmDomId = spBusiNmDomId;
   }

   
   
}