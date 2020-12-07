package com.cep.maintenance.contract.service;

import java.util.List;
import java.util.Map;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cmm.config.PrimaryKeyType;
import com.cep.maintenance.contract.vo.MtContractProductVO;
import com.cep.maintenance.contract.vo.MtContractVO;



public interface MtContractService {
	
	
	/**
	 * 
	  * @Method Name : writeMtContractProductList
	  * @Cdate       : 2020. 12. 7.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :
	  * @param insertParam
	  * @throws Exception
	 */
	void writeMtContractProductList(String mtIntegrateKey, String regEmpKey, List<MtContractProductVO> mtContractProductVoList) throws Exception;
	

}
