package com.cep.maintenance.work.service;

import java.util.List;
import java.util.Map;

import com.cep.maintenance.contract.vo.MtBackOrderProductVO;
import com.cep.maintenance.contract.vo.MtBackOrderVO;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.work.vo.MtOrderProductVO;
import com.cep.maintenance.work.vo.MtOrderVO;
import com.cep.maintenance.work.vo.MtWorkProductVO;
import com.cep.maintenance.work.vo.MtWorkVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;


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
	 * 유지보수 작업 기본정보 등록자와 지원담당정보를 조회한다.
	 * <pre>
	 * </pre>
	 * 
	 * @param mtWorkKey
	 * @return
	 * @throws Exception
	 * @cdate 2022. 2. 9. 오전 11:04:33
	 * @author aranghoo
	 */
	MtWorkVO mtWorkAuthInfo(String mtWorkKey) throws Exception;
	
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
	
	/**
	 * 
	  * @Method Name : updateWorkProductList
	  * @Cdate       : 2021. 1. 28.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업 제품목록를 수정한다.
	  * @param updateParam
	  * @throws Exception
	 */
//	void updateWorkProductList(Map<String, Object> updateParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteWorkProductList
	  * @Cdate       : 2021. 1. 28.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수작업 제품목록을 삭제한다.
	  * @param modEmpKey
	  * @param mtWorkKey
	  * @param deleteKeyList
	  * @throws Exception
	 */
	void deleteWorkProductList(String modEmpKey, String mtWorkKey, String[] deleteKeyList)throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteWorkProductAll
	  * @Cdate       : 2021. 1. 28.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 작업별 제품정보 전체삭제
	  * @param modEmpKey
	  * @param mtWorkKey
	  * @throws Exception
	 */
	void deleteWorkProductAll(String modEmpKey, String mtWorkKey)throws Exception;
	
	

	
	/* ============================== 유지보수작업 발주  ======================================*/
		
	/**
	 * 
	  * @Method Name : writeMtWorkOrder
	  * @Cdate       : 2021. 3. 10.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 발주를 등록한다(발주메인, 발주품목)
	  * @param orderVo
	  * @return 발주키
	  * @throws Exception
	 */
	 String writeMtWorkOrder(MtOrderVO orderVo) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : selectWorkOrderSelectBoxList
	   * @Cdate       : 2021. 3. 10.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수작업별 발주메인 등록 SELECT_BOX 리스트조회 
	   * @param orderCtFkKey
	   * @return
	   * @throws Exception
	  */

	 List<EgovMap> selectWorkOrderSelectBoxList(String orderCtFkKey) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : selectWorkOrderDetail
	   * @Cdate       : 2021. 3. 10.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수작업 발주 메인상세
	   * @param mtOrderKey
	   * @return
	   * @throws Exception
	  */
	 MtOrderVO selectWorkOrderDetail(String mtOrderKey) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : selectWorkOrderList
	   * @Cdate       : 2021. 3. 10.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description : 유지보수 작업 발주 메인리스트
	   * @param searchParam ({mtIntegrateKey}, {orderCtFkKey}) 조건검색.
	   * @return
	   * @throws Exception
	  */
	 List<MtOrderVO> selectWorkOrderList(Map<String, Object> searchParam) throws Exception;
	 
	 
	 /**
	  * 
	   * @Method Name : selectWorkOrderProductList
	   * @Cdate       : 2021. 3. 10.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수작업별 발주별 제품목록 조회
	   * @param mtOrderKey
	   * @return
	   * @throws Exception
	  */
	 List<MtOrderProductVO> selectWorkOrderProductList(String mtOrderKey) throws Exception;
	 
	 /**
	  * 
	   * @Method Name : deleteWorkOrder
	   * @Cdate       : 2021. 3. 10.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수작업별 거래처별 발주 메인, 발주 품목, 매입정보를 삭제한다.
	   *                       MT_PURCHASE_TB(매입..개발해야함.), deleteWorkOrderProductAll, deleteWorkOrder 수행
	   * @param modEmpKey : 수정자
	   * @param mtOrderKey : 수정키
	   * @throws Exception
	  */
	 void deleteWorkOrder(String modEmpKey, String mtOrderKey)  throws Exception;
	 
	 /**
	  * 
	   * @Method Name : updateWorkOrder
	   * @Cdate       : 2021. 3. 10.
	   * @Author      : aranghoo
	   * @Modification: 
	   * @Method Description :유지보수작업별 발주 정보수정 
	   *         deleteWorkOrderProductList, updateWorkOrderProductList, updateWorkOrder 수행, MT_PURCHASE_TB(매입테이블 업데이트 수행해야함..개발해야함)
	   * @param mtOrderVO
	   * @throws Exception
	  */
//	 void updateWorkOrder(MtOrderVO mtOrderVO) throws Exception;
	 
	 
	
	
}
