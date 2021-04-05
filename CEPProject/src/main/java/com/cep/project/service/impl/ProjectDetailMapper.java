package com.cep.project.service.impl;

import java.util.List;

import com.cep.mngProject.order.vo.MngOrderSearchVO;
import com.cep.project.vo.ProjectBiddingVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectVO;
import com.cmm.vo.GuarantyBondVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 프로젝트에 관한 데이터처리 매퍼 클래스
 *
 * @author  sylim
 * @since 2020.11.05
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2020.11.05        sylim          최초 생성
 *
 * </pre>
 */
@Mapper("projectDetailMapper")
public interface ProjectDetailMapper {
	
	public EgovMap selectProjectDetail(ProjectVO projectVO) throws Exception;
	
	public void updateBasicInfo(ProjectVO projectVO) throws Exception;
	
	public List<EgovMap> selectEmployeeList() throws Exception;
	
	public EgovMap selectBiddingInfo(ProjectVO projectVO) throws Exception;
	
	public List<EgovMap> selectBiddingFileInfo(ProjectVO projectVO) throws Exception;
	
	public EgovMap selectBiddingGbInfo(ProjectVO projectVO) throws Exception;
	
	public EgovMap selectContractInfo(ProjectVO projectVO) throws Exception;
	
	public List<EgovMap> selectOrderList(ProjectVO projectVO) throws Exception;
	
	public List<EgovMap> selectOrderProductList(MngOrderSearchVO orderSearchVO);
	
	public List<EgovMap> selectInstallBaseList(ProjectVO projectVO) throws Exception;
	
	public List<EgovMap> selectWorkList(ProjectVO projectVO) throws Exception;
	
	public List<EgovMap> selectSalesDetailList(ProjectVO projectVO) throws Exception;
	
	public List<EgovMap> selectGuarantyBondList(ProjectContractSalesVO salesVO) throws Exception;
	
	public EgovMap selectGuarantyBondInfo(GuarantyBondVO guarantyBondVO) throws Exception;
	
	public void requestGuarantyBond(GuarantyBondVO guarantyBondVO) throws Exception;
	
	public void endGuarantyBond(GuarantyBondVO guarantyBondVO) throws Exception;
	
	public void modifyGuarantyBond(GuarantyBondVO guarantyBondVO) throws Exception;
	
	public EgovMap selectBdGbInfo(ProjectVO projectVO) throws Exception;
	
	public void requestBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception;
	
	public void endBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception;
	
	public void modifyBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception;
	
}
