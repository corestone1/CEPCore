/**
 * 
 */
package com.cep.maintenance.contract.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.cmm.util.CepDateUtil;
import com.cmm.util.CepStringUtil;
@SuppressWarnings("serial")
@Alias("mtContractVO")
/**
 * @File Name : MtContractVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 11. 3.
 * @version   : 1.0
 * @Description : 유지보수 계약 관련 vo MT_CONTRACT_TB 테이블 참조
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 3.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtContractVO extends MtDefaultVO implements Serializable{
//	private String mtOption; // 등록(w), 조회(r)
	private String mtIntegrateKey; //유지보수 계약 PK
	private String mtCtKey; //유지보수 계약관리키
	private int mtSeq; //유지보수 순번
	private String mtAcKey;//사업자 번호
	private String mtAcNm;//거래처명
	private String mtAcDirectorKey;//유지보수 거래처 담당자 관리키
	private String acDirectorInfo;//유지보수 거래처 담당자 정보
	private String mtNm;//유지보수 계약명
	private String mtCtDt;//유지보수 계약일자
	private String mtStartDt;//유지보수 시작일자
	private String mtEndDt;//유지보수 종료일자
	private String mtRgInspectCnt;//유지보수 정기 검수 횟수
	private String mtImCd;//유지보수 검수방법
	private String mtSbCtYn; //백계약 여부
	private String gbYn; // 보증증권 여부
	private String mtSaleEmpKey; //유지보수 영업 직원 관리키
	private String saleEmpNm; //유지보수 영업 직원 이름
	private String mtMngEmpKey; //유지보수 관리 직원 관리키
	private String mngEmpNm; //유지보수 관리 직원 이름
	private String mtSupportEmpKey; // 유지보수 지원 직원 관리키
	private String supportEmpNm; // 유지보수 지원 직원 이름
	private long mtAmount; //유지보수 금액
	private String taxYn; //부가세포함여부
	private String mtPayTerms; //유지보수 결재조건
	private String remark; // 유지보수 비고
	private String deleteYn;//유지보수 삭제여부
	private String regDt; // 유지보수 등록일자
	private String regTm; // 유지보수 등록시간
	private String regEmpKey; //유지보수 등록직원 관리키
	private String modDt; // 유지보수 수정일자
	private String modTm; // 유지보수 수정시간
	private String modEmpKey; //유지보수 수정직원 관리키
	/**
	 * @return the mtIntegrateKey
	 */
	public String getMtIntegrateKey() {
		return mtIntegrateKey;
	}
	/**
	 * @param mtIntegrateKey the mtIntegrateKey to set
	 */
	public void setMtIntegrateKey(String mtIntegrateKey) {
		this.mtIntegrateKey = mtIntegrateKey;
	}
	/**
	 * @return the mtCtKey
	 */
	public String getMtCtKey() {
		return mtCtKey;
	}
	/**
	 * @param mtCtKey the mtCtKey to set
	 */
	public void setMtCtKey(String mtCtKey) {
		this.mtCtKey = mtCtKey;
	}
	/**
	 * @return the mtSeq
	 */
	public int getMtSeq() {
		return mtSeq;
	}
	/**
	 * @param mtSeq the mtSeq to set
	 */
	public void setMtSeq(int mtSeq) {
		this.mtSeq = mtSeq;
	}
	/**
	 * @return the mtAcKey
	 */
	public String getMtAcKey() {
		return mtAcKey;
	}
	/**
	 * @param mtAcKey the mtAcKey to set
	 */
	public void setMtAcKey(String mtAcKey) {
		this.mtAcKey = mtAcKey;
	}
	/**
	 * @return the acDirectorKey
	 */
	public String getMtAcDirectorKey() {
		return mtAcDirectorKey;
	}
	/**
	 * @param acDirectorKey the acDirectorKey to set
	 */
	public void setMtAcDirectorKey(String mtAcDirectorKey) {
		this.mtAcDirectorKey = mtAcDirectorKey;
	}
	/**
	 * @return the mtNm
	 */
	public String getMtNm() {
		return mtNm;
	}
	/**
	 * @param mtNm the mtNm to set
	 */
	public void setMtNm(String mtNm) {
		this.mtNm = mtNm;
	}

	


	/**
	 * @return the mtStartDt
	 */
	public String getMtStartDt() {
		return mtStartDt;
	}
	
	public String getDbStartDt() {
		return CepDateUtil.convertDate(mtStartDt, null, null, "D");
	}
	
	public String getViewStartDt() {
		return CepDateUtil.convertDate(mtStartDt, null, null, "V");
	}
	/**
	 * @param startDt the startDt to set
	 */
	public void setMtStartDt(String mtStartDt) {
		this.mtStartDt = mtStartDt;
	}
	/**
	 * @return the endDt
	 */
	public String getMtEndDt() {
		
		return mtEndDt;
	}
	
	public String getDbEndDt() {
		
		return CepDateUtil.convertDate(mtEndDt, null, null, "D");
	}
	
	public String getViewEndDt() {
		
		return CepDateUtil.convertDate(mtEndDt, null, null, "V");
	}
	/**
	 * @param endDt the endDt to set
	 */
	public void setMtEndDt(String mtEndDt) {
		this.mtEndDt = mtEndDt;
	}
	/**
	 * @return the rgInspectCnt
	 */
	public String getMtRgInspectCnt() {
		return mtRgInspectCnt;
	}
	/**
	 * @param rgInspectCnt the rgInspectCnt to set
	 */
	public void setMtRgInspectCnt(String mtRgInspectCnt) {
		this.mtRgInspectCnt = mtRgInspectCnt;
	}
	/**
	 * @return the imCd
	 */
	public String getMtImCd() {
		return mtImCd;
	}
	/**
	 * @param imCd the imCd to set
	 */
	public void setMtImCd(String mtImCd) {
		this.mtImCd = mtImCd;
	}
	/**
	 * @return the sbCtYn
	 */
	public String getMtSbCtYn() {
		return mtSbCtYn;
	}
	/**
	 * @param sbCtYn the sbCtYn to set
	 */
	public void setMtSbCtYn(String mtSbCtYn) {
		this.mtSbCtYn = mtSbCtYn;
	}
	/**
	 * @return the saleEmpKey
	 */
	public String getMtSaleEmpKey() {
		return mtSaleEmpKey;
	}
	/**
	 * @param saleEmpKey the saleEmpKey to set
	 */
	public void setMtSaleEmpKey(String mtSaleEmpKey) {
		this.mtSaleEmpKey = mtSaleEmpKey;
	}
	/**
	 * @return the saleEmpNm
	 */
	public String getSaleEmpNm() {
		return saleEmpNm;
	}
	/**
	 * @param saleEmpNm the saleEmpNm to set
	 */
	public void setSaleEmpNm(String saleEmpNm) {
		this.saleEmpNm = saleEmpNm;
	}
	/**
	 * @return the mngEmpKey
	 */
	public String getMtMngEmpKey() {
		return mtMngEmpKey;
	}
	/**
	 * @param mngEmpKey the mngEmpKey to set
	 */
	public void setMtMngEmpKey(String mtMngEmpKey) {
		this.mtMngEmpKey = mtMngEmpKey;
	}
	/**
	 * @return the mngEmpNm
	 */
	public String getMngEmpNm() {
		return mngEmpNm;
	}
	/**
	 * @param mngEmpNm the mngEmpNm to set
	 */
	public void setMngEmpNm(String mngEmpNm) {
		this.mngEmpNm = mngEmpNm;
	}
	/**
	 * @return the supportEmpKey
	 */
	public String getMtSupportEmpKey() {
		return mtSupportEmpKey;
	}
	/**
	 * @param supportEmpKey the supportEmpKey to set
	 */
	public void setSupportEmpKey(String mtSupportEmpKey) {
		this.mtSupportEmpKey = mtSupportEmpKey;
	}
	/**
	 * @return the supportEmpNm
	 */
	public String getSupportEmpNm() {
		return supportEmpNm;
	}
	/**
	 * @param supportEmpNm the supportEmpNm to set
	 */
	public void setSupportEmpNm(String supportEmpNm) {
		this.supportEmpNm = supportEmpNm;
	}
	/**
	 * @return the amount
	 */
	public long getMtAmount() {
		return mtAmount;
	}
	
	public String getDbAmount() {
		return String.valueOf(mtAmount).replace(",", "");
	}
	public String getViewAmount() {
		return CepStringUtil.getCommaString(String.valueOf(mtAmount));
	}
	/**
	 * @param amount the amount to set
	 */
	public void setMtAmount(long mtAmount) {
		this.mtAmount = mtAmount;
	}
	/**
	 * @return the payTerms
	 */
	public String getMtPayTerms() {
		return mtPayTerms;
	}
	/**
	 * @param payTerms the payTerms to set
	 */
	public void setMtPayTerms(String mtPayTerms) {
		this.mtPayTerms = mtPayTerms;
	}
	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * @return the deleteYn
	 */
	public String getDeleteYn() {
		return deleteYn;
	}
	/**
	 * @param deleteYn the deleteYn to set
	 */
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	/**
	 * @return the regDt
	 */
	public String getRegDt() {
		return regDt;
	}
	/**
	 * @param regDt the regDt to set
	 */
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	/**
	 * @return the regTm
	 */
	public String getRegTm() {
		return regTm;
	}
	/**
	 * @param regTm the regTm to set
	 */
	public void setRegTm(String regTm) {
		this.regTm = regTm;
	}
	/**
	 * @return the regEmpKey
	 */
	public String getRegEmpKey() {
		return regEmpKey;
	}
	/**
	 * @param regEmpKey the regEmpKey to set
	 */
	public void setRegEmpKey(String regEmpKey) {
		this.regEmpKey = regEmpKey;
	}
	/**
	 * @return the modDt
	 */
	public String getModDt() {
		return modDt;
	}
	/**
	 * @param modDt the modDt to set
	 */
	public void setModDt(String modDt) {
		this.modDt = modDt;
	}
	/**
	 * @return the modTm
	 */
	public String getModTm() {
		return modTm;
	}
	/**
	 * @param modTm the modTm to set
	 */
	public void setModTm(String modTm) {
		this.modTm = modTm;
	}
	/**
	 * @return the modEmpKey
	 */
	public String getModEmpKey() {
		return modEmpKey;
	}
	/**
	 * @param modEmpKey the modEmpKey to set
	 */
	public void setModEmpKey(String modEmpKey) {
		this.modEmpKey = modEmpKey;
	}
	/**
	 * @return the mtAcNm
	 */
	public String getMtAcNm() {
		return mtAcNm;
	}
	/**
	 * @param mtAcNm the mtAcNm to set
	 */
	public void setMtAcNm(String mtAcNm) {
		this.mtAcNm = mtAcNm;
	}
	/**
	 * @return the gbYn
	 */
	public String getGbYn() {
		return gbYn;
	}
	/**
	 * @param gbYn the gbYn to set
	 */
	public void setGbYn(String gbYn) {
		this.gbYn = gbYn;
	}
	/**
	 * @return the taxYn
	 */
	public String getTaxYn() {
		return taxYn;
	}
	/**
	 * @param taxYn the taxYn to set
	 */
	public void setTaxYn(String taxYn) {
		this.taxYn = taxYn;
	}
	/**
	 * @return the mtOption
	 */
//	public String getMtOption() {
//		return mtOption;
//	}
//	/**
//	 * @param mtOption the mtOption to set
//	 */
//	public void setMtOption(String mtOption) {
//		this.mtOption = mtOption;
//	}
	/**
	 * @return the acDirectorInfo
	 */
	public String getAcDirectorInfo() {
		return acDirectorInfo;
	}
	/**
	 * @param acDirectorInfo the acDirectorInfo to set
	 */
	public void setAcDirectorInfo(String acDirectorInfo) {
		this.acDirectorInfo = acDirectorInfo;
	}
	/**
	 * @return the mtCtDt
	 */
	public String getMtCtDt() {
		return mtCtDt;
	}
	public String getDbCtDt(){
		return CepDateUtil.convertDate(mtCtDt, null, null, "D");
	}
	
	public String getViewCtDt(){
		return CepDateUtil.convertDate(mtCtDt, null, null, "V");
	}
	/**
	 * @param mtCtDt the mtCtDt to set
	 */
	public void setMtCtDt(String mtCtDt) {
		this.mtCtDt = mtCtDt;
	}
	
//	private String convertDate(String date){
//		String convertDate = null;
//		if(!"".equals(StringUtil.getDefaultValue(date, ""))){
//			if("w".equalsIgnoreCase(mtOption)){
//				convertDate =  date.replace("-", "");
//			}else{
//				try {
//					convertDate =  CepDateUtil.convertDisplayFormat(date, null, null);
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
//		}
//		return convertDate;
//	}
}
