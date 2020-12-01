package com.cep.maintenance.work.service;

import java.util.List;
import java.util.Map;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.work.vo.MtWorkVO;


public interface MtWorkService {
	
		
	/**
	 * 
	  * @Method Name : writeWorkBasic
	  * @Cdate       : 2020. 11. 23.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :
	  * @param mtWorkVO
	  * @return mtWorkKey를 리턴한다.
	  * @throws Exception
	 */
	String writeWorkBasic(MtWorkVO mtWorkVO) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtWorkList
	  * @Cdate       : 2020. 11. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 작업목록 조회
	  * @param searchVO
	  * @return
	  * @throws Exception
	 */
	List<?> selectMtWorkList(MtDefaultVO searchVO) throws Exception;
	
	
	/**
	 * 
	  * @Method Name : deleteMtWork
	  * @Cdate       : 2020. 11. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업목록을 삭제(update)한다.
	  * @param MtWorkVO
	  * @throws Exception
	 */
	void deleteMtWork(MtWorkVO deleteVo) throws Exception;
	
	
	
}
