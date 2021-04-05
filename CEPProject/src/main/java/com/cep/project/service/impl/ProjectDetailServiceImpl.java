/**
 * 
 */
package com.cep.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cep.mngProject.order.vo.MngOrderSearchVO;
import com.cep.project.service.ProjectDetailService;
import com.cep.project.vo.ProjectBiddingVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectVO;
import com.cmm.vo.GuarantyBondVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @File Name : ProjectDetailServiceImpl.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2021. 1. 27.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2021. 1. 27.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */

@Service("projectDetailService")
public class ProjectDetailServiceImpl implements ProjectDetailService {

	@Resource(name="projectDetailMapper")
	private ProjectDetailMapper mapper;
	
	@Override
	public EgovMap selectProjectDetail(ProjectVO projectVO) throws Exception {
		
		return mapper.selectProjectDetail(projectVO);
	}
	
	@Override
	public void updateBasicInfo(ProjectVO projectVO) throws Exception {
		mapper.updateBasicInfo(projectVO);
	}

	
	@Override
	public List<EgovMap> selectEmployeeList() throws Exception {
		return mapper.selectEmployeeList();
	}
	
	
	@Override
	public EgovMap selectBiddingInfo(ProjectVO projectVO) throws Exception
	{
		return mapper.selectBiddingInfo(projectVO);
	}
	
	@Override
	public List<EgovMap> selectBiddingFileInfo(ProjectVO projectVO) throws Exception
	{
		return mapper.selectBiddingFileInfo(projectVO);
	}
	
	@Override
	public EgovMap selectBiddingGbInfo(ProjectVO projectVO) throws Exception
	{
		return mapper.selectBiddingGbInfo(projectVO);
	}
	
	@Override
	public EgovMap selectContractInfo(ProjectVO projectVO) throws Exception
	{
		return mapper.selectContractInfo(projectVO);
	}
	
	@Override
	public List<EgovMap> selectOrderList(ProjectVO projectVO) throws Exception
	{
		return mapper.selectOrderList(projectVO);
	}
	
	@Override
	public List<EgovMap> selectOrderProductList(MngOrderSearchVO orderSearchVO)
	{
		return mapper.selectOrderProductList(orderSearchVO);
	}
	
	@Override
	public List<EgovMap> selectInstallBaseList(ProjectVO projectVO) throws Exception
	{
		return mapper.selectInstallBaseList(projectVO) ;
	}
	
	@Override
	public List<EgovMap> selectWorkList(ProjectVO projectVO) throws Exception
	{
		return mapper.selectWorkList(projectVO);
	}
	
	@Override
	public List<EgovMap> selectSalesDetailList(ProjectVO projectVO) throws Exception
	{
		return mapper.selectSalesDetailList(projectVO);
	}
	
	@Override
	public List<EgovMap> selectGuarantyBondList(ProjectContractSalesVO salesVO) throws Exception {
		return mapper.selectGuarantyBondList(salesVO);
	}
	
	@Override
	public EgovMap selectGuarantyBondInfo(GuarantyBondVO guarantyBondVO) throws Exception {
		return mapper.selectGuarantyBondInfo(guarantyBondVO);
	}
	
	@Override
	public void requestGuarantyBond(GuarantyBondVO guarantyBondVO) throws Exception {
		mapper.requestGuarantyBond(guarantyBondVO);
	}
	
	@Override
	public void endGuarantyBond(GuarantyBondVO guarantyBondVO) throws Exception {
		mapper.endGuarantyBond(guarantyBondVO);
	}
	
	@Override
	public void modifyGuarantyBond(GuarantyBondVO guarantyBondVO) throws Exception {
		mapper.modifyGuarantyBond(guarantyBondVO);
	}
	
	@Override
	public EgovMap selectBdGbInfo(ProjectVO projectVO) throws Exception {
		return mapper.selectBdGbInfo(projectVO);
	}
	
	
	@Override
	public void requestBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception
	{
		mapper.requestBiddingGb(projectBiddingVO);
	}
	
	@Override
	public void endBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception
	{
		mapper.endBiddingGb(projectBiddingVO);
	}
	
	@Override
	public void modifyBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception
	{
		mapper.modifyBiddingGb(projectBiddingVO);
	}
}
