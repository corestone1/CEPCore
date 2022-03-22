/**
 * 
 */
package com.cep.project.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.main.service.MainService;
import com.cep.mngProject.order.vo.MngOrderSearchVO;
import com.cep.project.service.ProjectDetailService;
import com.cep.project.vo.ProjectBiddingVO;
import com.cep.project.vo.ProjectBuildVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectContractVO;
import com.cep.project.vo.ProjectGuarantyBondVO;
import com.cep.project.vo.ProjectOrderProductVO;
import com.cep.project.vo.ProjectOrderVO;
import com.cep.project.vo.ProjectPurchaseVO;
import com.cep.project.vo.ProjectVO;
import com.cep.project.vo.ProjectWorkVO;
import com.cmm.config.DeptInfo;
import com.cmm.config.EmailInfo;
import com.cmm.service.ComService;
import com.cmm.vo.GuarantyBondVO;
import com.cmm.vo.MailVO;
import com.cmm.vo.PurchaseVO;

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
	
	@Resource(name="projectMapper")
	private ProjectMapper projectMapper;
	
	@Resource(name="comService")
	private ComService comService;
	
	@Resource(name="mainService")
	private MainService mainService;
	
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
	@SuppressWarnings("unchecked")
	public Map<String, Object> requestGuarantyBond(HttpServletRequest request, ProjectGuarantyBondVO guarantyBondVO) throws Exception {
		int result = 0;
		MailVO mailVO = new MailVO();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		HashMap<String, String> userMap = new HashMap<String, String>();
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		String pjNm = "";
		
		try {
			ProjectVO projectVO = new ProjectVO();
			projectVO.setPjKey(guarantyBondVO.getPjKey());
			pjNm = mapper.selectProjectDetail(projectVO).get("pjNm").toString();
			
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			userMap.put("empKey", sessionMap.get("empKey"));
			String name = mainService.selectName(userMap);
			
			String dept = DeptInfo.DEPT_OPER_L3.getValue();
			List<String> toList = new ArrayList<String>();
			
			for(Object obj : comService.selectDeptEmployeeList(dept)) {
				String email = obj.toString().substring(obj.toString().indexOf("=") + 1, obj.toString().length() - 1);
				toList.add(email);
			} 
			
			String tmail = StringUtils.join(toList, ";");
			mailVO.setEmpKey(tmail);
			mailVO.setLink(EmailInfo.PAGE_URL.getValue() + "project/detail/contractMin2.do?pjKey="+guarantyBondVO.getPjKey()+ "");
			String subject = pjNm + "건 보증 증권 요청";
			String content = String.join(
					                System.getProperty("line.separator"),
					                "["+guarantyBondVO.getPjKey()+"] " + pjNm +" 프로젝트 건에 보증 증권 요청 정보가 있습니다. <br>(요청자: " + name + ",",
					                " 요청 일자: " + format.format(System.currentTimeMillis()) + ")<br><br>");
			
			mailVO.setSubject(subject);
			mailVO.setContent(content);
			mailVO.setIsNewPw(false);
			
			result = comService.sendMail(request, mailVO);
			
			/* 테스트 서버 운영 종료 후 주석 해제*/
			/*if(result != 0) { */
				returnMap.put("mailSuccessYN", "Y");
				returnMap.put("successYN", "Y");
				mapper.requestGuarantyBond(guarantyBondVO);
			/*} else {
				throw new Exception();
			}*/
			
			returnMap.put("mailList", toList);
			
		} catch(Exception e) {
			e.printStackTrace();
			returnMap.put("mailSuccessYN", "N");
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> endGuarantyBond(HttpServletRequest request, ProjectGuarantyBondVO guarantyBondVO) throws Exception {
		
		int result = 0;
		MailVO mailVO = new MailVO();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		ProjectVO projectVO = new ProjectVO();
		String salesEmpKey = "";
		HashMap<String, String> sessionMap = null;
		HashMap<String, String> userMap = new HashMap<String, String>();
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		String pjNm = "";
		
		try {
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			userMap.put("empKey", sessionMap.get("empKey"));
			String name = mainService.selectName(userMap);
			
			projectVO.setPjKey(guarantyBondVO.getPjKey());
			salesEmpKey = mapper.selectProjectDetail(projectVO).get("regEmpKey").toString();
			pjNm = mapper.selectProjectDetail(projectVO).get("pjNm").toString();
					
			mailVO.setEmpKey(salesEmpKey);
			mailVO.setLink(EmailInfo.PAGE_URL.getValue() + "project/detail/contractMin2.do?pjKey="+guarantyBondVO.getPjKey()+ "");
			String subject = pjNm + "건 보증 증권 발행 완료";
			String content = String.join(
					                System.getProperty("line.separator"),
					                "["+guarantyBondVO.getPjKey()+"] " + pjNm +" 프로젝트 건에 보증 증권 발행이 완료되었습니다. <br>(완료자: " + name + ",",
					                " 완료 일자: " + format.format(System.currentTimeMillis()) + ")<br><br>");
			
			mailVO.setSubject(subject);
			mailVO.setContent(content);
			mailVO.setIsNewPw(false);
			
			result = comService.sendMail(request, mailVO);
			
			/* 테스트 서버 운영 종료 후 주석 해제*/
			/*if(result != 0) {*/
				returnMap.put("mailSuccessYN", "Y");
				returnMap.put("successYN", "Y");
				mapper.endGuarantyBond(guarantyBondVO);
			/*} else {
				throw new Exception();
			}*/
			
			returnMap.put("mailList", salesEmpKey);
			
		} catch(Exception e) {
			e.printStackTrace();
			returnMap.put("mailSuccessYN", "N");
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
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
	public Map<String, Object> endBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			mapper.endBiddingGb(projectBiddingVO);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			e.printStackTrace();
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	@Override
	public void modifyBiddingGb(ProjectBiddingVO projectBiddingVO) throws Exception
	{
		mapper.modifyBiddingGb(projectBiddingVO);
	}
	
	@Override
	public void deleteBidding(ProjectBiddingVO projectBiddingVO) throws Exception {
		mapper.deleteBidding(projectBiddingVO);
	}
	
	@Override
	@Transactional
	public void deleteContract(ProjectContractVO projectContractVO) throws Exception {
		
		//PJ_GUARANTY_BOND_TB - CT_KEY
		ProjectGuarantyBondVO projectGuarantyBondVO = new ProjectGuarantyBondVO();
		projectGuarantyBondVO.setCtKey(projectContractVO.getCtKey());
		projectGuarantyBondVO.setRegEmpKey(projectContractVO.getRegEmpKey());
		
		mapper.deleteGuarantyBond(projectGuarantyBondVO);
		
		//PJ_SALES_DETAIL_TB - PJ_KEY
		ProjectContractSalesVO projectContractSalesVO = new ProjectContractSalesVO();
		projectContractSalesVO.setPjKey(projectContractVO.getPjKey());
		projectContractSalesVO.setRegEmpKey(projectContractVO.getRegEmpKey());
		
		mapper.deleteSalesDetail(projectContractSalesVO);
		
		//PJ_CONTRACT_TB - CT_KEY
		mapper.deleteContract(projectContractVO);
	}
	
	@Override
	@Transactional
	public int isMappedOrder(ProjectOrderVO projectOrderVO) throws Exception {
		int result = 0;
		try {
			result = mapper.isMappedOrder(projectOrderVO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	@Transactional
	public void deleteOrder(ProjectOrderVO projectOrderVO) throws Exception {
		 
		//PJ_ORDER_PRODUCT_TB
		ProjectOrderProductVO projectOrderProductVO = new ProjectOrderProductVO();
		
		projectOrderProductVO.setPjOrderKey(projectOrderVO.getPjOrderKey());
		projectOrderProductVO.setRegEmpKey(projectOrderVO.getRegEmpKey());
		
		mapper.deleteOrderProduct(projectOrderProductVO);
		
		//PJ_ORDER_TB
		mapper.deleteOrder(projectOrderProductVO);
		
		ProjectPurchaseVO purchaseVO = new ProjectPurchaseVO();
		purchaseVO.setBuyOrderFkKey(projectOrderVO.getPjOrderKey());
		
		ProjectPurchaseVO resultVO = projectMapper.selectPurchaseDetail(purchaseVO);
		
		projectMapper.deletePurchaseInfo(resultVO);
		
	}
	
	@Override
	public void deleteInstallBase(ProjectBuildVO projectBuildVO) throws Exception {
		mapper.deleteInstallBase(projectBuildVO);
	}
	
	@Override
	public void deleteWork(ProjectWorkVO projectWorkVO) throws Exception {
		mapper.deleteWork(projectWorkVO);
	}
}
