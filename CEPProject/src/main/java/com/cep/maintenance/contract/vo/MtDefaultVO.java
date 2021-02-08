package com.cep.maintenance.contract.vo;

import java.io.Serializable;

import com.cmm.util.CepDateUtil;
import com.cmm.util.CepStringUtil;

/**
 * 
 * @File Name : MaintenanceDefaultVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 11. 3.
 * @version   : 1.0
 * @Description : 유지보수 검색 조건에 사용되는 변수 정의.
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 3.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtDefaultVO implements Serializable{
	private static final long serialVersionUID = -858838578081269359L;
	private int rowNum;
	private String fromDate; // from
	private String toDate; //to
	private String searchSaleEmpKey; //영업담당자 키 
	private String searchSaleEmpNm; //영업담당자 명
	private String searchMtName;//조회 검색어 유지보수  프로젝트명
	private String searchWord;//조회 검색어 (유지보수  프로젝트명/고객사명)
	private String btnOption; //저장(ss), 저장하고 다음화면(sn)
	private String selectKey; //선택한 항목의 key값
	private String searchWorkEmpNm; //유지보수 작업(지원)담당자
	private String searchWorkResult; // 작업결과(진행중/완료)
	private String selectIntegrateKey;
	private String selectWorkKey;
	private String parmMtSbCtYn; //백계약여부
	private String updateYn; //업데이트 여부(Y:업데이트, N:등록)
	private int mtSaveCnt; //여러개 저장하는 경우 저장되어있는 목록숫자.
	
	private String deleteListKeys; //리스트 항목에서 삭제를 선택한 목록의 관리키.
	
	private String searchPmNmCd; //제품명
	private String searchSerialNum; // 시리얼번호
	private String whereNum; //리스트에서 선택한 row번호
	private String codeId;//팝업에서 사용할 code필드 id
	private String nameId;//팝업에서 사용할 name 필드 id
	private String searchGubun;//검색어 구분(고객사(CU) or 프로젝트명(PJ)) 
	
	/**
	 * @return the fromDate
	 */
	public String getFromDate() {
		return fromDate;
	}
	/**
	 * @param fromDate the fromDate to set
	 */
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	/**
	 * @return the toDate
	 */
	public String getToDate() {
		return toDate;
	}
	/**
	 * @param toDate the toDate to set
	 */
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	/**
	 * @return the searchSaleEmpKey
	 */
	public String getSearchSaleEmpKey() {
		return searchSaleEmpKey;
	}
	/**
	 * @param searchSaleEmpKey the searchSaleEmpKey to set
	 */
	public void setSearchSaleEmpKey(String searchSaleEmpKey) {
		this.searchSaleEmpKey = searchSaleEmpKey;
	}
	/**
	 * @return the searchMtName
	 */
	public String getSearchMtName() {
		return searchMtName;
	}
	/**
	 * @param searchMtName the searchMtName to set
	 */
	public void setSearchMtName(String searchMtName) {
		this.searchMtName = searchMtName;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	/**
	 * @return the btnOption
	 */
	public String getBtnOption() {
		return btnOption;
	}
	/**
	 * @param btnOption the btnOption to set
	 */
	public void setBtnOption(String btnOption) {
		this.btnOption = btnOption;
	}
	/**
	 * @return the selectKey
	 */
	public String getSelectKey() {
		return selectKey;
	}
	/**
	 * @param selectKey the selectKey to set
	 */
	public void setSelectKey(String selectKey) {
		this.selectKey = selectKey;
	}
	/**
	 * @return the searchWorkEmpKey
	 */
	/*public String getSearchWorkEmpKey() {
		return searchWorkEmpKey;
	}*/
	/**
	 * @param searchWorkEmpKey the searchWorkEmpKey to set
	 */
	/*public void setSearchWorkEmpKey(String searchWorkEmpKey) {
		this.searchWorkEmpKey = searchWorkEmpKey;
	}*/
	/**
	 * @return the searchWorkResult
	 */
	public String getSearchWorkResult() {
		return searchWorkResult;
	}
	/**
	 * @param searchWorkResult the searchWorkResult to set
	 */
	public void setSearchWorkResult(String searchWorkResult) {
		this.searchWorkResult = searchWorkResult;
	}
	/**
	 * @return the rowNum
	 */
	public int getRowNum() {
		return rowNum;
	}
	/**
	 * @param rowNum the rowNum to set
	 */
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	/**
	 * @return the selectIntegrateKey
	 */
	public String getSelectIntegrateKey() {
		return selectIntegrateKey;
	}
	/**
	 * @param selectIntegrateKey the selectIntegrateKey to set
	 */
	public void setSelectIntegrateKey(String selectIntegrateKey) {
		this.selectIntegrateKey = selectIntegrateKey;
	}
	/**
	 * @return the selectWorkKey
	 */
	public String getSelectWorkKey() {
		return selectWorkKey;
	}
	/**
	 * @param selectWorkKey the selectWorkKey to set
	 */
	public void setSelectWorkKey(String selectWorkKey) {
		this.selectWorkKey = selectWorkKey;
	}
	/**
	 * @return the parmMtSbCtYn
	 */
	public String getParmMtSbCtYn() {
		return parmMtSbCtYn;
	}
	/**
	 * @param parmMtSbCtYn the parmMtSbCtYn to set
	 */
	public void setParmMtSbCtYn(String parmMtSbCtYn) {
		this.parmMtSbCtYn = parmMtSbCtYn;
	}
	/**
	 * @return the updateYn
	 */
	public String getUpdateYn() {
		return updateYn;
	}
	/**
	 * @param updateYn the updateYn to set
	 */
	public void setUpdateYn(String updateYn) {
		this.updateYn = updateYn;
	}
	
	
	///////////////////////////////////
	
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
	/**
	 * @return the deleteListKeys
	 */
	public String getDeleteListKeys() {
		return deleteListKeys;
	}
	/**
	 * @param deleteListKeys the deleteListKeys to set
	 */
	public void setDeleteListKeys(String deleteListKeys) {
		this.deleteListKeys = deleteListKeys;
	}
	/**
	 * @return the mtSaveCnt
	 */
	public int getMtSaveCnt() {
		return mtSaveCnt;
	}
	/**
	 * @param mtSaveCnt the mtSaveCnt to set
	 */
	public void setMtSaveCnt(int mtSaveCnt) {
		this.mtSaveCnt = mtSaveCnt;
	}
	/**
	 * @return the searchPmNmCd
	 */
	public String getSearchPmNmCd() {
		return searchPmNmCd;
	}
	/**
	 * @param searchPmNmCd the searchPmNmCd to set
	 */
	public void setSearchPmNmCd(String searchPmNmCd) {
		this.searchPmNmCd = searchPmNmCd;
	}
	/**
	 * @return the searchSerialNum
	 */
	public String getSearchSerialNum() {
		return searchSerialNum;
	}
	/**
	 * @param searchSerialNum the searchSerialNum to set
	 */
	public void setSearchSerialNum(String searchSerialNum) {
		this.searchSerialNum = searchSerialNum;
	}
	/**
	 * @return the whereNum
	 */
	public String getWhereNum() {
		return whereNum;
	}
	/**
	 * @param whereNum the whereNum to set
	 */
	public void setWhereNum(String whereNum) {
		this.whereNum = whereNum;
	}
	/**
	 * @return the codeId
	 */
	public String getCodeId() {
		return codeId;
	}
	/**
	 * @param codeId the codeId to set
	 */
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	/**
	 * @return the nameId
	 */
	public String getNameId() {
		return nameId;
	}
	/**
	 * @param nameId the nameId to set
	 */
	public void setNameId(String nameId) {
		this.nameId = nameId;
	}
	/**
	 * @return the searchGubun
	 */
	public String getSearchGubun() {
		return searchGubun;
	}
	/**
	 * @param searchGubun the searchGubun to set
	 */
	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
	}
	/**
	 * @return the searchSaleEmpNm
	 */
	public String getSearchSaleEmpNm() {
		return searchSaleEmpNm;
	}
	/**
	 * @param searchSaleEmpNm the searchSaleEmpNm to set
	 */
	public void setSearchSaleEmpNm(String searchSaleEmpNm) {
		this.searchSaleEmpNm = searchSaleEmpNm;
	}
	/**
	 * @return the searchWord
	 */
	public String getSearchWord() {
		return searchWord;
	}
	/**
	 * @param searchWord the searchWord to set
	 */
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	/**
	 * @return the searchWorkEmpNm
	 */
	public String getSearchWorkEmpNm() {
		return searchWorkEmpNm;
	}
	/**
	 * @param searchWorkEmpNm the searchWorkEmpNm to set
	 */
	public void setSearchWorkEmpNm(String searchWorkEmpNm) {
		this.searchWorkEmpNm = searchWorkEmpNm;
	}
	
}
