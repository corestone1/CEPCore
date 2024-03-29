/**
 * 
 */
package com.cep.project.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cep.mngProject.order.vo.MngOrderSearchVO;
import com.cep.project.vo.ProjectBiddingVO;
import com.cep.project.vo.ProjectBuildVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectContractVO;
import com.cep.project.vo.ProjectGuarantyBondVO;
import com.cep.project.vo.ProjectOrderVO;
import com.cep.project.vo.ProjectVO;
import com.cep.project.vo.ProjectWorkVO;
import com.cmm.vo.GuarantyBondVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @File Name : ProjectDetailService.java
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

public interface ProjectDetailService {
	
	/**
	  * @Method Name : selectProjectDatil
	  * @Cdate       : 2021. 1. 27.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description : 프로젝트 기본정보를 조회한다.
	  * @param projectVO
	  * @return
	  * @throws Exception
	  */
	public EgovMap selectProjectDetail(ProjectVO projectVO) throws Exception;
	
	
	/**
	  * @Method Name : updateBasicInfo
	  * @Cdate       : 2021. 1. 27.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description :
	  * @param projectVO
	  * @throws Exception
	  */
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
	
	public Map<String, Object> requestGuarantyBond(HttpServletRequest request, ProjectGuarantyBondVO guarantyBondVO) throws Exception;
	
	public Map<String, Object> endGuarantyBond(HttpServletRequest request, ProjectGuarantyBondVO guarantyBondVO) throws Exception;
	
	public void modifyGuarantyBond(GuarantyBondVO guarantyBondVO) throws Exception;
	
	public EgovMap selectBdGbInfo(ProjectVO projectVO) throws Exception;
	
	public void requestBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception;
	
	public Map<String, Object> endBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception;
	
	public void modifyBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception;
	
	public void deleteBidding(ProjectBiddingVO projectBiddingVO) throws Exception;
	
	public void deleteContract(ProjectContractVO projectContractVO) throws Exception;
	
	public int isMappedOrder(ProjectOrderVO projectOrderVO) throws Exception;
	
	public void deleteOrder(ProjectOrderVO projectOrderVO) throws Exception;
	
	public void deleteInstallBase(ProjectBuildVO projectBuildVO) throws Exception;
	
	public void deleteWork(ProjectWorkVO projectWorkVO) throws Exception;
}
