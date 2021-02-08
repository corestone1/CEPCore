package com.cep.project.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cep.example.vo.SampleDefaultVO;
import com.cep.project.service.ProjectService;
import com.cep.project.vo.ProjectBuildVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectVO;
import com.cep.project.vo.ProjectWorkVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.service.ComService;
import com.cmm.service.FileMngService;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.FileVO;
import com.cmm.vo.GuarantyBondVO;
import com.cmm.vo.OrderProductVO;
import com.cmm.vo.OrderVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("projectService")
public class ProjectServiceImpl implements ProjectService {
	
	@Resource(name="projectMapper")
	private ProjectMapper mapper;
	
	@Resource(name="fileMngService")
	private FileMngService fileMngService;
	
	@Resource(name="comService")
	private ComService comService;
	
	/**
	 * 프로젝트 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 프로젝트 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectProjectList(ProjectVO searchVO) throws Exception {
		return mapper.selectProjectList(searchVO);
	}
	
	@Override
	public int selectProjectListTotCnt(SampleDefaultVO searchVO) throws Exception {
		return mapper.selectProjectListTotCnt(searchVO);
	}
	
	@Override
	public List<?> selectProjectDetail(String pjKey) throws Exception {
		return mapper.selectProjectDetail(pjKey);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertBasicInfo(HttpServletRequest request, ProjectVO projectVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		
		int result = 0;
		
		String pjKey = comService.makePrimaryKey(PrimaryKeyType.PROJECT);
		projectVO.setPjKey(pjKey);
		
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		projectVO.setRegEmpKey(session.get("empKey"));
		
	    result = mapper.insertBasicInfo(projectVO);
	    
	    if(result > 0){
	    	returnMap.put("successYN", "Y");
        	returnMap.put("pjKey", pjKey);
		}
		
		return returnMap;		
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateBasicInfo(HttpServletRequest request, ProjectVO projectVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			projectVO.setModEmpKey(session.get("empKey"));
			
			mapper.updateBasicInfo(projectVO);
		    
	    	returnMap.put("successYN", "Y");
			
		} catch(Exception e) {
			returnMap.put("successYN", "N");
		}
		return returnMap;		
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> deleteProject(HttpServletRequest request, ProjectVO projectVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		ProjectVO deleteVo = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			
			deleteVo = new ProjectVO();
			deleteVo.setModEmpKey(session.get("empKey"));
			deleteVo.setPjKey(projectVO.getPjKey());
			
			mapper.deleteProject(deleteVo);
		    
	    	returnMap.put("successYN", "Y");
			
		} catch(Exception e) {
			returnMap.put("successYN", "N");
		}
		return returnMap;	
		
	}
	
	@Override
	@SuppressWarnings("unchecked")
	/*@Transactional*/
	public Map<String, Object> insertContractInfo(HttpServletRequest request, ProjectContractSalesVO projectContractSalesVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		List<ProjectContractSalesVO> insertList = null;
		int listCnt = 0;
		ProjectContractSalesVO contractSalesVO = null;
		List ctKeyList = new ArrayList<Object>();
		List salesKeyList = new ArrayList<Object>();
		
		try {
			
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			projectContractSalesVO.setRegEmpKey(session.get("empKey"));
			
			listCnt = projectContractSalesVO.getProjectContractSalesVOList().size();
			insertList = new ArrayList<>();

			for (int i = 0; i < listCnt; i++) {
				contractSalesVO = projectContractSalesVO.getProjectContractSalesVOList().get(i);
				/*if(!"0".equals(CepStringUtil.getDefaultValue(productVO.getMtPmKey(), "0"))){
					// 업데이트 대상
					updateList.add(mtProductVO);
				} else {*/
					// 신규등록대상
				insertList.add(contractSalesVO);
				/*}*/
			}
			
			comService.insertSalesInfo(projectContractSalesVO.getPjKey(), projectContractSalesVO.getRegEmpKey(), insertList);

			insertContractList(projectContractSalesVO.getPjKey(), projectContractSalesVO.getRegEmpKey(), insertList);
			
			mapper.updateStatusCd(projectContractSalesVO.getPjKey(), projectContractSalesVO.getStatusCd());
        	returnMap.put("pjKey", projectContractSalesVO.getPjKey());
        	
        	for(int i = 0; i < listCnt; i++) {
        		ctKeyList.add(projectContractSalesVO.getProjectContractSalesVOList().get(i).getCtKey());
        	}
        	
        	returnMap.put("ctKey", ctKeyList);
        	returnMap.put("salesKey", projectContractSalesVO.getSalesKey());
        	returnMap.put("successYN", "Y");
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;		
	}
	
	/**
	 * 
	  * @Method Name : insertContractList
	  * @Cdate       : 2021. 01. 21.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 프로젝트 계약 회차별 정보를 등록한다.
	  * @param mtIntegrateKey
	  * @param regEmpKey
	  * @param mtContractProductVoList
	  * @throws Exception
	 */
	private void insertContractList(String pjKey, String regEmpKey, List<?> projectContractSalesVOList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new Hashtable<>();
			insertParam.put("pjKey", pjKey);			
			
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("projectContractSalesVOList", projectContractSalesVOList);
			
			mapper.insertContractInfo(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	public List<?> selectContractDetail(String pjKey) throws Exception {
		return mapper.selectContractDetail(pjKey);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> insertBiddingInfo(HttpServletRequest request, GuarantyBondVO guarantyBondVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		
		int result = 0;
		
		String ctKey = comService.makePrimaryKey(PrimaryKeyType.PROJECT_CONTRACT);
		guarantyBondVO.setCtKey(ctKey);
		
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		guarantyBondVO.setRegEmpKey(session.get("empKey"));
		
//		comService.insertSalesInfo(request, guarantyBondVO);
		
	    result = mapper.insertBiddingInfo(guarantyBondVO);
	    
	    if(result > 0){
        	returnMap.put("successYN", "Y");
        	returnMap.put("pjKey", request.getParameter("pjKey"));
        	returnMap.put("ctKey", guarantyBondVO.getCtKey());
        	returnMap.put("salesKey", guarantyBondVO.getSalesKey());
		}
		
		return returnMap;	
	}
	
	@Override
	public Map<String, Object> selectBiddingDetail(ProjectVO projectVO) throws Exception {
		return mapper.selectBiddingDetail(projectVO);
	}
	
	@Override
	public Map<String, Object> selectFileList(FileVO fileVO) throws Exception {
		return mapper.selectFileList(fileVO);
	}
	
	@Override
	public Map<String, Object> updateBiddingInfo(MultipartHttpServletRequest multiRequest, Map<String, Object> param) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		ProjectVO projectVO = new ProjectVO();
		FileVO fileVO = new FileVO();
		int result = 0;
		
		fileMngService.insertFile(multiRequest, param);
		
	    /*driverInfoVo.setDriverId(StringUtil.nullToString(param.get("driverId")));
	    driverInfoVo.setName(StringUtil.nullToString(param.get("name")));
	    driverInfoVo.setDept(StringUtil.nullToString(param.get("dept")));
    	driverInfoVo.setEmpTitle(StringUtil.nullToString(param.get("empTitle")));
    	driverInfoVo.setEmpPosition(StringUtil.nullToString(param.get("empPosition")));
    	driverInfoVo.setEmail(StringUtil.nullToString(param.get("email")));
    	driverInfoVo.setMobileNo1(StringUtil.nullToString(param.get("mobileNo1")));
    	driverInfoVo.setWorkType(StringUtil.nullToString(param.get("workType")));
    	driverInfoVo.setWorkStatus(StringUtil.nullToString(param.get("workStatus")));
    	driverInfoVo.setDescription(StringUtil.nullToString(param.get("description")));
    	driverInfoVo.setPassword(ChaahnEncryptUtility.PASSWORD(StringUtil.nullToString(param.get("password"))));
    	driverInfoVo.setLogInId(StringUtil.nullToString(param.get("logInId")));
    	driverInfoVo.setUserId(user.getUserId());
    	driverInfoVo.setCreateBy(user.getId());
    	driverInfoVo.setModifyBy(user.getId());
				
	    result = corpMapper.updateDriverDetail(driverInfoVo);*/
	    
	    
		
		return returnMap;	
	}
	
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public String insertOrderInfo(HttpServletRequest request, OrderVO orderVO) throws Exception {
		
		String[] deleteKeyList = null;
		List<OrderProductVO> insertList = null;
		List<OrderProductVO> updateList = null;
		int listCnt = 0;
		OrderProductVO productVO = null;
		HashMap<String, String> session = null;
		
		String orderKey = null;
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			orderVO.setRegEmpKey(session.get("empKey"));
			orderVO.setModEmpKey(session.get("empKey"));
			
			if("".equals(orderVO.getOrderKey())){
				// 해당 내용 신규등록
				orderKey = writeOrderInfo(orderVO);
			} else {
				listCnt = orderVO.getOrderProductVOList().size();
				insertList = new ArrayList<>();
	
				for (int i = 0; i < listCnt; i++) {
					productVO = productVO.getOrderProductVOList().get(i);
					/*if(!"0".equals(CepStringUtil.getDefaultValue(productVO.getMtPmKey(), "0"))){
						// 업데이트 대상
						updateList.add(mtProductVO);
					} else {*/
						// 신규등록대상
					insertList.add(productVO);
					/*}*/
				}
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return orderKey;
		
	}
	
	/**
	 * 
	  * @Method Name : writeOrderInfo
	  * @Cdate       : 2021. 01. 23.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주정보를 등록한다.
	  * @param OrderVO
	  * @return
	  * @throws Exception
	 */
	private String writeOrderInfo(OrderVO orderVO) throws Exception {
		
		String orderKey = null;
		Map<String, Object> insertParam = null;
		try {
			
			orderKey = comService.makePrimaryKey(PrimaryKeyType.ORDER);
			
			if(!"".equals(CepStringUtil.getDefaultValue(orderKey, ""))){
				orderVO.setOrderKey(orderKey);
				// 발주 메인을 등록한다.
				mapper.insertOrderInfo(orderVO);
				
				insertParam = new HashMap<>();

				insertParam.put("orderKey", orderKey);
				insertParam.put("regEmpKey", orderVO.getRegEmpKey());
				insertParam.put("orderProductVOList", orderVO.getOrderProductVOList());
				
				// 제품목록을 등록한다.
				mapper.insertOrderProductInfo(insertParam);
				
			} else {
				throw new Exception("Can't make CMM_ORDER_TB.ORDER_KEY !!!! ..");
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		return orderKey;
	}
	
	@Override
	public OrderVO selectOrderDetail(String orderKey) throws Exception {
		OrderVO vo = null;
		try {
			vo = mapper.selectOrderDetail(orderKey);
			if(vo != null) {
				vo.setOrderProductVOList(selectOrderProductList(orderKey));
			}
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return vo;
	}
	
	@Override
	public List<OrderProductVO> selectOrderProductList(String orderKey) throws Exception {
		return mapper.selectOrderProductList(orderKey);
	}
	
	@Override
	public List<EgovMap> selectOrderSelectBoxList(String key) throws Exception {
		return mapper.selectOrderSelectBoxList(key);
	}
	
	@Override
	public List<?> selectAcDirector(int acDirectorKey) throws Exception {
		return mapper.selectAcDirector(acDirectorKey);
	}
	
	@Override
	public List<?> selectAcDirectorList(String acKey) throws Exception {
		return mapper.selectAcDirectorList(acKey);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertBuildInfo(HttpServletRequest request, ProjectBuildVO buildVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			buildVO.setRegEmpKey(session.get("empKey"));
			
			mapper.insertBuildInfo(buildVO);
			mapper.updateStatusCd(buildVO.getPjKey(), buildVO.getStatusCd());
			
	    	returnMap.put("successYN", "Y");
	    	returnMap.put("pjKey", buildVO.getPjKey());
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;		
	}
	
	@Override
	public List<?> selectBuildDetail(String pjKey) throws Exception {
		return mapper.selectBuildDetail(pjKey);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertWorkInfo(HttpServletRequest request, ProjectWorkVO workVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			workVO.setRegEmpKey(session.get("empKey"));
			
			mapper.insertWorkInfo(workVO);
			mapper.updateStatusCd(workVO.getPjKey(), workVO.getStatusCd());
			
	    	returnMap.put("successYN", "Y");
	    	returnMap.put("pjKey", workVO.getPjKey());
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;		
	}
	
	@Override
	public List<?> selectWorkDetail(String pjKey) throws Exception {
		return mapper.selectWorkDetail(pjKey);
	}
}
