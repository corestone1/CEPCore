package com.cep.maintenance.work.service.impl;

import java.util.List;
import java.util.Map;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.work.vo.MtWorkProductVO;
import com.cep.maintenance.work.vo.MtWorkVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mtWorkMapper")
public interface MtWorkMapper {

	
	/**
	 * 
	  * @Method Name : writeWorkBasic
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 작업 등록
	  * @param mtWorkVO
	  * @throws Exception
	 */
	public void writeWorkBasic(MtWorkVO mtWorkVO) throws Exception; 
	
	
	/**
	 * 
	  * @Method Name : updateWorkBasic
	  * @Cdate       : 2020. 11. 30.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 기본정보 수정
	  * @param mtWorkVO
	  * @throws Exception
	 */
	public void updateWorkBasic(MtWorkVO mtWorkVO) throws Exception; 
	
	/**
	 * 
	  * @Method Name : selectWorkDetail
	  * @Cdate       : 2020. 11. 25.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업 상세화면 조회
	  * @param mtWorkKey
	  * @throws Exception
	 */
	public MtWorkVO selectWorkDetail(String mtWorkKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : selectMtWorkList
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업 목록 조회
	  * @param searchVO
	  * @return
	  * @throws Exception
	 */
	public List<MtWorkVO> selectWorkList(MtDefaultVO searchVO) throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteMtWork
	  * @Cdate       : 2020. 11. 24.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수 작업 삭제
	  * @param deleteVo
	  * @throws Exception
	 */
	public void deleteMtWork(MtWorkVO deleteVo) throws Exception;
	
	/**
	 * 
	  * @Method Name : writeWorkProductList
	  * @Cdate       : 2020. 12. 1.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 제품을 등록한다.
	  * @param insertParam
	  * @throws Exception
	 */
	public void writeWorkProductList(Map<String, Object> insertParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : selectWorkProductList
	  * @Cdate       : 2020. 12. 2.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 제품목록을 조회한다.
	  * @param mtWorkKey
	  * @return
	  * @throws Exception
	 */
	public List<MtWorkProductVO> selectWorkProductList(String mtWorkKey) throws Exception;
	
	/**
	 * 
	  * @Method Name : updateWorkProductList
	  * @Cdate       : 2021. 1. 28.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 제품목록를 수정한다.
	  * @param updateParam
	  * @throws Exception
	 */
	public void updateWorkProductList(Map<String, Object> updateParam)throws Exception;
	
	
	/**
	 * 
	  * @Method Name : deleteWorkProductList
	  * @Cdate       : 2021. 1. 28.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수작업 제품목록을 삭제한다.
	  * @param deleteParam
	  * @throws Exception
	 */
	public void deleteWorkProductList(Map<String, Object> deleteParam)throws Exception;
	
	/**
	 * 
	  * @Method Name : deleteWorkProductAll
	  * @Cdate       : 2021. 1. 28.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수 작업별 제품정보 전체삭제
	  * @param deleteVo
	  * @throws Exception
	 */
	public void deleteWorkProductAll(MtWorkVO deleteVo)throws Exception;
	
}
