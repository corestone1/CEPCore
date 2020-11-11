package com.cep.maintenance.service;

import java.util.List;

import com.cep.maintenance.vo.MaintenanceDefaultVO;
import com.cep.maintenance.vo.MtContractVO;
import com.cep.maintenance.vo.MtWorkVO;

public interface MaintenanceService {
	
	/**
	 * 
	  * @Method Name : selectMtList
	  * @Cdate       : 2020. 11. 4.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 목록을 조회한다.
	  * @param searchVO
	  * @return
	  * @throws Exception
	 */
	List<MtContractVO> selectMtContractList(MaintenanceDefaultVO searchVO) throws Exception;
	
	/**
	 * selectbox용 직원 리스트
	  * @Method Name : selectEmployeeList
	  * @Cdate       : 2020. 11. 4.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :
	  * @return
	  * @throws Exception
	 */
	List<?> selectEmployeeList() throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtContract
	  * @Cdate       : 2020. 11. 4.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 계약 삭제(update)
	  * @param deleteVo
	  * @throws Exception
	 */
	void deleteMtContract(MtContractVO deleteVo) throws Exception;
	
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
	List<?> selectMtWorkList(MaintenanceDefaultVO searchVO) throws Exception;
	
	
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
	
	
	
	/**
	 * 
	  * @Method Name : selectAcDirectorList
	  * @Cdate       : 2020. 11. 6.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 사업자코드(업체관리코드)를 이용하여 담당직원 목록을 조회한다.
	  * @param acKey
	  * @return
	  * @throws Exception
	 */
	List<?> selectAcDirectorList(String acKey)  throws Exception;
	
}
