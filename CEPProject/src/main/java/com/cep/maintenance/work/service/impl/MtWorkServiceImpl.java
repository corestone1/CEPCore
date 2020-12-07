package com.cep.maintenance.work.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.maintenance.contract.service.MtContractService;
import com.cep.maintenance.contract.service.impl.MtContractMapper;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.work.service.MtWorkService;
import com.cep.maintenance.work.vo.MtWorkProductVO;
import com.cep.maintenance.work.vo.MtWorkVO;
import com.cmm.config.PrimaryKeyType;



@Service("mtWorkService")
public class MtWorkServiceImpl implements MtWorkService {
	
	@Resource(name="mtContractService")
	private MtContractService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MtWorkServiceImpl.class);
	
	@Resource(name="mtWorkMapper")
	private MtWorkMapper mtwMapper;
	
	@Resource(name="mtContractMapper")
	private MtContractMapper mtMapper;

	/* (non-Javadoc) 
	 * @see com.cep.maintenance.service.MaintenanceService#selectMtWorkList(com.cep.maintenance.vo.MaintenanceDefaultVO)
	 */
	@Override
	public List<MtWorkVO> selectMtWorkList(MtDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return mtwMapper.selectWorkList(searchVO);
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#deleteMtWork(java.lang.String)
	 */
	@Override
	public void deleteMtWork(MtWorkVO deleteVo) throws Exception {
		mtwMapper.deleteMtWork(deleteVo);
		
	}


	/* (non-Javadoc)
	 * @see com.cep.maintenance.service.MaintenanceService#writeWorkBasic(com.cep.maintenance.vo.MtWorkVO)
	 */
	@Override
	public String writeWorkBasic(MtWorkVO mtWorkVO) throws Exception {
		
		String mtWorkKey = null;
		try {
			mtWorkKey = service.makePrimaryKey(PrimaryKeyType.MAINTENACE_WORK);
			
			mtWorkVO.setMtWorkKey(mtWorkKey);
			
			
			mtwMapper.writeWorkBasic(mtWorkVO);
			
		} catch (Exception e) {
			mtWorkKey = null;
			throw new Exception(e);
		}
		return mtWorkKey;
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#selectWorkDetail(java.lang.String)
	 */
	@Override
	public MtWorkVO selectWorkDetail(String mtWorkKey) throws Exception {
		// TODO Auto-generated method stub
		return mtwMapper.selectWorkDetail(mtWorkKey);
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#updateWorkBasic(com.cep.maintenance.work.vo.MtWorkVO)
	 */
	@Override
	public void updateWorkBasic(MtWorkVO mtWorkVO) throws Exception {
		mtwMapper.updateWorkBasic(mtWorkVO);
		
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#writeWorkProductList(com.cep.maintenance.work.vo.MtWorkProductVO)
	 */
	@Override
	public void writeWorkProductList(MtWorkProductVO mtWorkProductVO) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new HashMap<>();
			insertParam.put("mtWorkKey", mtWorkProductVO.getMtWorkKey());
			insertParam.put("regEmpKey", mtWorkProductVO.getRegEmpKey());
			insertParam.put("mtWorkProductVoList", mtWorkProductVO.getMtWorkProductVoList());
			

			mtwMapper.writeWorkProductList(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		
	}

	/* (non-Javadoc)
	 * @see com.cep.maintenance.work.service.MtWorkService#selectWorkProductList(java.lang.String)
	 */
	@Override
	public List<MtWorkProductVO> selectWorkProductList(String mtWorkKey) throws Exception {
		// TODO Auto-generated method stub
		return mtwMapper.selectWorkProductList(mtWorkKey);
	}

	
	

	
}
