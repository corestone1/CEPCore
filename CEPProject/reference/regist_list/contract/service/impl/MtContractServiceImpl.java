package com.cep.maintenance.contract.service.impl;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.maintenance.contract.service.MtContractService;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cmm.config.PrimaryKeyType;
import com.cep.maintenance.contract.vo.MtContractProductVO;
import com.cep.maintenance.contract.vo.MtContractVO;



@Service("mtContractService")
public class MtContractServiceImpl implements MtContractService {
	



	/* (non-Javadoc)
	 * @see com.cep.maintenance.contract.service.MtContractService#writeMtContractProductList(java.util.Map)
	 */
	@Override
	public void writeMtContractProductList(String mtIntegrateKey, String regEmpKey, List<MtContractProductVO> mtContractProductVoList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
//			insertParam = new HashMap<>();
//			insertParam = new HashedMap();
			insertParam = new Hashtable<>();

			insertParam.put("mtIntegrateKey", mtIntegrateKey);
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("mtContractProductVoList", mtContractProductVoList);
			mtMapper.writeMtContractProductList(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	
}
