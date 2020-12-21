/**
 * 
 */
package com.cep.maintenance.work.vo;

import java.io.Serializable;
import java.util.List;


import org.apache.ibatis.type.Alias;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepStringUtil;
@SuppressWarnings("serial")
@Alias("mtWorkProductVO")
/**
 * @File Name : MtWorkProductVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2020. 12. 1.
 * @version   : 1.0
 * @Description : 유지보수작업 제품목록 VO (MtWorkProductTb )
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 12. 1.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
public class MtWorkProductVO extends MtDefaultVO implements Serializable{

//	private static final long serialVersionUID = 1L;

	// 유지보수 통합 관리키 
    private String mtIntegrateKey;
    
    // 유지보수 작업 관리키 업무(작업)
    private String mtWorkKey;

    // 유지보수작업 제품 작업 순번 
    private int mtWorkSeq;

    // 유지보수작업 제품 관리키 
    private int mtPmKey;
    
    // 유지보수작업  제품명
    private String mtPmKeyNm;
    
    private String mtPmDetail;
    
    //유지보수 장비 시리얼번호
    private String mtPmSerialNum;

    // 유지보수작업 제품 작업 내용 
    private String mtPmWorkCont;
    

    // 삭제 여부 초기값 (N)
    private String deleteYn;

    // 등록 일자 
    private String regDt;

    // 등록 시간 
    private String regTm;

    // 등록 직원 관리키 
    private String regEmpKey;

    // 수정 일자 
    private String modDt;

    // 수정 시간 
    private String modTm;

    // 수정 직원 관리키 
    private String modEmpKey;

    
    private List<MtWorkProductVO> mtWorkProductVoList;

    public String getMtWorkKey() {
        return mtWorkKey;
    }

    public void setMtWorkKey(String mtWorkKey) {
        this.mtWorkKey = mtWorkKey;
    }

    public int getMtWorkSeq() {
        return mtWorkSeq;
    }

    public void setMtWorkSeq(int mtWorkSeq) {
        this.mtWorkSeq = mtWorkSeq;
    }

    public int getMtPmKey() {
        return mtPmKey;
    }

    public void setMtPmKey(int mtPmKey) {
        this.mtPmKey = mtPmKey;
    }

    public String getMtPmWorkCont() {
        return mtPmWorkCont;
    }

    public void setMtPmWorkCont(String mtPmWorkCont) {
        this.mtPmWorkCont = mtPmWorkCont;
    }

	/**
	 * @return the mtWorkProductVoList
	 */
	public List<MtWorkProductVO> getMtWorkProductVoList() {
		return mtWorkProductVoList;
	}

	/**
	 * @param mtWorkProductVoList the mtWorkProductVoList to set
	 */
	public void setMtWorkProductVoList(List<MtWorkProductVO> mtWorkProductVoList) {
		this.mtWorkProductVoList = mtWorkProductVoList;
	}

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
	 * @return the mtPmSerialNum
	 */
	public String getMtPmSerialNum() {
		return mtPmSerialNum;
	}

	/**
	 * @param mtPmSerialNum the mtPmSerialNum to set
	 */
	public void setMtPmSerialNum(String mtPmSerialNum) {
		this.mtPmSerialNum = mtPmSerialNum;
	}

	/**
	 * @return the mtPmDetail
	 */
	public String getMtPmDetail() {
		return mtPmDetail;
	}

	/**
	 * @param mtPmDetail the mtPmDetail to set
	 */
	public void setMtPmDetail(String mtPmDetail) {
		this.mtPmDetail = mtPmDetail;
	}

	/**
	 * @return the mtPmKeyNm
	 */
	public String getMtPmKeyNm() {
		return mtPmKeyNm;
	}

	/**
	 * @param mtPmKeyNm the mtPmKeyNm to set
	 */
	public void setMtPmKeyNm(String mtPmKeyNm) {
		this.mtPmKeyNm = mtPmKeyNm;
	}

}
