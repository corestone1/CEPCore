package com.cep.maintenance.work.service;

import java.util.List;
import java.util.Map;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.work.vo.MtWorkProductVO;
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
	  * @Method Name : updateWorkBasic
	  * @Cdate       : 2020. 11. 30.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업 기본정보 수정
	  * @param mtWorkVO
	  * @throws Exception
	 */
	void updateWorkBasic(MtWorkVO mtWorkVO) throws Exception;
	
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
	List<MtWorkVO> selectMtWorkList(MtDefaultVO searchVO) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectWorkDetail
	  * @Cdate       : 2020. 11. 30.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업 상세조회.
	  * @param mtWorkKey
	  * @throws Exception
	 */
	MtWorkVO selectWorkDetail(String mtWorkKey) throws Exception;
	
	
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
	  * @Method Name : writeWorkProductList
	  * @Cdate       : 2020. 12. 1.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업 제품등록.
	  * @param mtWorkProductVO
	  * @throws Exception
	 */
	void writeWorkProductList(MtWorkProductVO mtWorkProductVO)throws Exception;
	
	/**
	 * 
	  * @Method Name : selectWorkProductList
	  * @Cdate       : 2020. 12. 2.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업 제품목록을 가져온다.
	  * @param mtWorkKey
	  * @return
	  * @throws Exception
	 */
	List<MtWorkProductVO> selectWorkProductList(String mtWorkKey) throws Exception;
	
}
