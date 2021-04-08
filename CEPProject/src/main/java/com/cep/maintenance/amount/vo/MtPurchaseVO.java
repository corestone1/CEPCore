/**
 * 
 */
package com.cep.maintenance.amount.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.cep.project.vo.ProjectPurchaseVO;

/**
 * @File Name : MtPurchaseVO.java
 * @Project   : CEPProject
 * @Author    : aranghoo
 * @Cdate     : 2021. 3. 30.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 3. 30.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
@Alias("mtPurchaseVO")
public class MtPurchaseVO extends ProjectPurchaseVO implements Serializable{

	//유지보수 계약키
	public static final String MT_CONTRACT_FK_TYPE="MC";
	//유지보수 작업.
	public static final String MT_WORK_FK_TYPE="MW";
	
	private static final long serialVersionUID = 1L;
	
	/*
	 * buyFkPjKey 연계 key값 구분.
	 * 'MC : 유지보수계약(백계약), MW:유지보수작업(발주)'
	 */
	private String fkPjKeyType;

	/**
	 * @return the fkPjKeyType
	 */
	public String getFkPjKeyType() {
		return fkPjKeyType;
	}

	/**
	 * @param fkPjKeyType the fkPjKeyType to set
	 */
	public void setFkPjKeyType(String fkPjKeyType) {
		this.fkPjKeyType = fkPjKeyType;
	}
	

}
