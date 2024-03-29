package com.cep.project.service.impl;

import java.util.List;

import com.cep.mngProject.order.vo.MngOrderSearchVO;
import com.cep.project.vo.ProjectBiddingVO;
import com.cep.project.vo.ProjectBuildVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectContractVO;
import com.cep.project.vo.ProjectGuarantyBondVO;
import com.cep.project.vo.ProjectOrderProductVO;
import com.cep.project.vo.ProjectOrderVO;
import com.cep.project.vo.ProjectVO;
import com.cep.project.vo.ProjectWorkVO;
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
	
	public int requestGuarantyBond(ProjectGuarantyBondVO guarantyBondVO) throws Exception;
	
	public void endGuarantyBond(ProjectGuarantyBondVO guarantyBondVO) throws Exception;
	
	public void modifyGuarantyBond(GuarantyBondVO guarantyBondVO) throws Exception;
	
	public EgovMap selectBdGbInfo(ProjectVO projectVO) throws Exception;
	
	public void requestBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception;
	
	public void endBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception;
	
	public void modifyBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception;
	
	public void deleteBidding(ProjectVO projectVO) throws Exception;
	
	public void deleteContract(ProjectContractVO projectContractVO) throws Exception;
	
	public void deleteSalesDetail(ProjectContractSalesVO projectContractSalesVO) throws Exception;
		
	public void deleteGuarantyBond(ProjectGuarantyBondVO projectGuarantyBondVO) throws Exception;
	
	public int isMappedOrder(ProjectOrderVO projectOrderVO) throws Exception;
	
	public void deleteOrder(ProjectOrderVO projectOrderVO) throws Exception;
	
	public void deleteOrderProduct(ProjectOrderProductVO projectOrderProductVO) throws Exception;
	
	public void deleteInstallBase(ProjectBuildVO projectBuildVO) throws Exception;
	
	public void deleteWork(ProjectWorkVO projectWorkVO) throws Exception;
}
