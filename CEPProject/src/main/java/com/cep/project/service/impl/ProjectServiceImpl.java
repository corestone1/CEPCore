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
import com.cep.forecast.service.impl.ForecastMapper;
import com.cep.forecast.vo.ForecastVO;
import com.cep.mngProject.bill.service.impl.MngProjectBillMapper;
import com.cep.mngProject.bill.vo.MngProjectBillVO;
import com.cep.project.service.ProjectService;
import com.cep.project.vo.ProjectBiddingFileVO;
import com.cep.project.vo.ProjectBiddingVO;
import com.cep.project.vo.ProjectBuildVO;
import com.cep.project.vo.ProjectContractSalesVO;
import com.cep.project.vo.ProjectContractVO;
import com.cep.project.vo.ProjectGuarantyBondVO;
import com.cep.project.vo.ProjectOrderProductVO;
import com.cep.project.vo.ProjectOrderVO;
import com.cep.project.vo.ProjectPaymentVO;
import com.cep.project.vo.ProjectPurchaseVO;
import com.cep.project.vo.ProjectVO;
import com.cep.project.vo.ProjectWorkVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.service.ComService;
import com.cmm.service.FileMngService;
import com.cmm.service.impl.ComMapper;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.FileVO;
import com.cmm.vo.PurchaseVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("projectService")
public class ProjectServiceImpl implements ProjectService {
	
	@Resource(name="projectMapper")
	private ProjectMapper mapper;
	
	@Resource(name="projectDetailMapper")
	private ProjectDetailMapper detailMapper;
	
	@Resource(name="forecastMapper")
	private ForecastMapper forecastMapper;
	
	@Resource(name="comMapper")
	private ComMapper comMapper;
	
	@Resource(name="mngProjectBillMapper")
	private MngProjectBillMapper projectBillMapper;
	
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
		List<?> resultList = new ArrayList<>();
		try {
			resultList = mapper.selectProjectDetail(pjKey);
		} catch(Exception e) {
			throw new Exception(e);
		}
		return resultList;
	}
	
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertBasicInfo(HttpServletRequest request, ProjectVO projectVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		String pjKey = null;
		String orderKey = null;
		
		ForecastVO forecastVO = new ForecastVO();
		List<EgovMap> resultList = new ArrayList<EgovMap>();
		
		ProjectOrderVO orderVO = new ProjectOrderVO();
		ProjectPurchaseVO purchaseVO = new ProjectPurchaseVO();
		
		try {
			if(!CepStringUtil.getDefaultValue(projectVO.getPjKey(), "").equals("")) {
				projectVO.setModEmpKey(session.get("empKey"));
				mapper.updateBasicInfo(projectVO);
			} else {
				pjKey = comService.makePrimaryKey(PrimaryKeyType.PROJECT);
				projectVO.setPjKey(pjKey);
				projectVO.setRegEmpKey(session.get("empKey"));
				
			    mapper.insertBasicInfo(projectVO);
			    
			    forecastVO.setSpState("S");
			    forecastVO.setSpKey(projectVO.getSpKey());
			    forecastMapper.updateBasic(forecastVO);
			    
			    resultList =  forecastMapper.selectPcInfo(forecastVO);
			    for(int i = 0; i < resultList.size(); i++) {
			    	orderVO.setOrderAcKey(resultList.get(i).get("buyAcKey").toString());
			    	orderVO.setOrderCtFkKey(pjKey);
			    	orderVO.setOrderAmount(Integer.parseInt(resultList.get(i).get("fcBuyAmount").toString()));
			    	orderVO.setPjKey(pjKey);
			    	orderVO.setRegEmpKey(projectVO.getRegEmpKey());
			    	
			    	orderKey = writeOrderInfo(projectVO.getRegEmpKey(), orderVO);
			    	
			    	purchaseVO.setBuyOrderFkKey(orderKey);
			    	purchaseVO.setBuyFkPjKey(pjKey);
			    	purchaseVO.setBuyAmount(Integer.parseInt(resultList.get(i).get("fcBuyAmount").toString()));
			    	purchaseVO.setDonePaymentAmount(0);
			    	purchaseVO.setYetPaymentAmount(Integer.parseInt(resultList.get(i).get("fcBuyAmount").toString()));
			    	insertPurchaseInfo(request, purchaseVO);
			    }
			    
			}
			returnMap.put("pjKey", projectVO.getPjKey());
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			returnMap.put("successYN", "N");
			throw new Exception(e);
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
	@Transactional
	@SuppressWarnings("unchecked")
	public Map<String, Object> deleteProject(HttpServletRequest request, ProjectVO projectVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		ProjectVO deleteVo = null;
		ForecastVO forecastVO = new ForecastVO();
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			
			deleteVo = new ProjectVO();
			deleteVo.setModEmpKey(session.get("empKey"));
			deleteVo.setPjKey(projectVO.getPjKey());
			
			mapper.deleteProject(deleteVo);
			
			mapper.deleteContract(deleteVo);
			
			String spKey = detailMapper.selectProjectDetail(deleteVo).get("spKey").toString();
			forecastVO.setSpKey(spKey);
			forecastVO.setSpState("A");
			forecastVO.setRegEmpKey(session.get("empKey"));
			
			forecastMapper.updateBasic(forecastVO);
			
	    	returnMap.put("successYN", "Y");
			
		} catch(Exception e) {
			returnMap.put("successYN", "N");
		}
		return returnMap;	
		
	}
	
	@Override
	public ProjectBiddingVO selectBiddingDetail(ProjectBiddingVO projectBiddingVO) throws Exception {
		return mapper.selectBiddingDetail(projectBiddingVO);
	}
	
	@Override
	public List<?> selectBiddingFileList(ProjectBiddingFileVO projectBiddingFileVO) throws Exception {
		return mapper.selectBiddingFileList(projectBiddingFileVO);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> insertBiddingInfo(HttpServletRequest request, ProjectBiddingVO projectBiddingVO) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		String bdKey = null;
		int listCnt = 0;
		List<ProjectBiddingFileVO> insertList =  new ArrayList<>();
		List<ProjectBiddingFileVO> updateList =  new ArrayList<>();
		
		try {
			
			listCnt = projectBiddingVO.getBiddingFileVOList().size();
			
			if(!CepStringUtil.getDefaultValue(projectBiddingVO.getBdKey(), "").equals("")) {
				// 업데이트
				projectBiddingVO.setModEmpKey(session.get("empKey"));
				mapper.updateBiddingInfo(projectBiddingVO);
				
				for(int i = 0; i <listCnt; i++) {
					if(CepStringUtil.getDefaultValue(projectBiddingVO.getBiddingFileVOList().get(i).getBdSeq(), "0").equals("0") && 
							projectBiddingVO.getBiddingFileVOList().get(i).getBdFileCheck().equals("Y")) {
						// 새로 등록되는 입찰 파일
						insertList.add(projectBiddingVO.getBiddingFileVOList().get(i));
					} else if(!CepStringUtil.getDefaultValue(projectBiddingVO.getBiddingFileVOList().get(i).getBdSeq(), "0").equals("0")) {
						// 수정 되는 입찰 파일
						updateList.add(projectBiddingVO.getBiddingFileVOList().get(i));
					}
				}
				
				if(insertList != null && insertList.size() != 0) {
					writeBiddingFileInfo(projectBiddingVO.getBdKey(), insertList);
				}
				
				if(updateList != null && updateList.size() != 0) {
					updateBiddingFileInfo(projectBiddingVO.getBdKey(), updateList);
				}
				
			} else {
				bdKey = comService.makePrimaryKey(PrimaryKeyType.PROJECT_BIDDING);
				projectBiddingVO.setBdKey(bdKey);
				projectBiddingVO.setRegEmpKey(session.get("empKey"));
			    
			    mapper.insertBiddingInfo(projectBiddingVO);
			    
			    for(int i = 0; i <listCnt; i++) {
					if(CepStringUtil.getDefaultValue(projectBiddingVO.getBiddingFileVOList().get(i).getBdSeq(), "0").equals("0") && 
							projectBiddingVO.getBiddingFileVOList().get(i).getBdFileCheck().equals("Y")) {
						// 새로 등록되는 입찰 파일
						insertList.add(projectBiddingVO.getBiddingFileVOList().get(i));
					} 
				}
			    if(insertList.size() != 0) {
			    	writeBiddingFileInfo(bdKey, insertList);
			    }
			}
			
			mapper.updateStatusCd(projectBiddingVO.getPjKey(), projectBiddingVO.getPjStatusCd());
			
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			returnMap.put("successYN", "N");
			throw new Exception(e);
		}
		
		return returnMap;		
		
	}
	
	private void writeBiddingFileInfo(String bdKey, List<?> insertList) throws Exception {
		Map<String, Object> insertParam = null;
		
		try {
			insertParam = new Hashtable<>();
			
			insertParam.put("bdKey", bdKey);
			insertParam.put("biddingFileVOList", insertList);
		
			mapper.insertBiddingFileInfo(insertParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	private void updateBiddingFileInfo(String bdKey, List<?> insertList) throws Exception {
		Map<String, Object> updateParam = null;
		
		try {
			updateParam = new Hashtable<>();
			
			updateParam.put("bdKey", bdKey);
			updateParam.put("biddingFileVOList", insertList);
		
			mapper.updateBiddingFileInfo(updateParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> insertContractInfo(HttpServletRequest request, ProjectContractSalesVO projectContractSalesVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		List<ProjectContractSalesVO> insertList =  new ArrayList<>();
		List<ProjectContractSalesVO> updateList =  new ArrayList<>();
		int listCnt = 0;
		ProjectContractSalesVO contractSalesVO = null;
		List<Object> ctKeyList = new ArrayList<Object>();
		List<Object> salesKeyList = new ArrayList<Object>();
		
		
		try {
			
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			projectContractSalesVO.setRegEmpKey(session.get("empKey"));
			projectContractSalesVO.setModEmpKey(session.get("empKey"));
			
			listCnt = projectContractSalesVO.getProjectContractSalesVOList().size();
			
			for (int i = 0; i < listCnt; i++) {
				projectContractSalesVO.getProjectContractSalesVOList().get(i).setSalesAcKey(projectContractSalesVO.getSalesAcKey());
			}

			if(!"".equals(CepStringUtil.getDefaultValue(projectContractSalesVO.getSelectKey(), ""))){
				// 업데이트 대상
				if(projectContractSalesVO.getProjectContractSalesVOList() != null && projectContractSalesVO.getProjectContractSalesVOList().size() > 0) {
					for (int i = 0; i < listCnt; i++) {
						contractSalesVO = projectContractSalesVO.getProjectContractSalesVOList().get(i);
						
						if("N".equals(projectContractSalesVO.getProjectContractSalesVOList().get(i).getIsNew())) {
							// 업데이트
							updateList.add(contractSalesVO);
							
							updateSalesInfo(projectContractSalesVO.getModEmpKey(), updateList);
							updateBillOpInfo(projectContractSalesVO.getModEmpKey(), updateList, projectContractSalesVO.getPjKey());
						} else {
							// 신규등록
							insertList.add(contractSalesVO);
							writeSalesInfo(projectContractSalesVO.getRegEmpKey(), projectContractSalesVO.getPjKey(), insertList);
						}
					}
					
					updateContractInfo(projectContractSalesVO);
				}
				
				/*if(insertList != null && insertList.size() > 0) {
					insertContractList(projectContractSalesVO.getPjKey(), projectContractSalesVO.getRegEmpKey(), insertList);
					insertSalesList(projectContractSalesVO.getPjKey(), projectContractSalesVO.getRegEmpKey(), insertList);
				}
				
				if(updateList != null && updateList.size() > 0) {
					updateContractList(projectContractSalesVO.getModEmpKey(), updateList);
					updateSalesList(projectContractSalesVO.getModEmpKey(), updateList);
				}*/
				
			} else {
				// 신규등록대상
				insertList.add(contractSalesVO);
				
				writeSalesInfo(projectContractSalesVO.getRegEmpKey(), projectContractSalesVO.getPjKey(), projectContractSalesVO.getProjectContractSalesVOList());
				writeContractInfo(projectContractSalesVO);
			}
			
        	returnMap.put("pjKey", projectContractSalesVO.getPjKey());
        	
        	for(int i = 0; i < listCnt; i++) {
        		/*ctKeyList.add(projectContractSalesVO.getProjectContractSalesVOList().get(i).getCtKey());*/
        		salesKeyList.add(projectContractSalesVO.getProjectContractSalesVOList().get(i).getSalesKey());
        	}
        	
        	mapper.updateStatusCd(projectContractSalesVO.getPjKey(), projectContractSalesVO.getStatusCd());
        	
        	/*returnMap.put("ctKey", ctKeyList);*/
        	returnMap.put("salesKey", salesKeyList);
        	returnMap.put("ctKey", projectContractSalesVO.getCtKey());
        	/*returnMap.put("salesKey", projectContractSalesVO.getSalesKey());*/
        	returnMap.put("successYN", "Y");
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;		
	}
	
	/**
	 * 
	  * @Method Name : insertContractInfo
	  * @Cdate       : 2021. 01. 21.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 프로젝트 계약 회차별 정보를 등록한다.
	  * @param projectContractSalesVO
	  * @throws Exception
	 */
	private void writeContractInfo(ProjectContractSalesVO projectContractSalesVO) throws Exception {
		try {
			mapper.insertContractInfo(projectContractSalesVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	/**
	 * 
	  * @Method Name : selectSalesList
	  * @Cdate       : 2021. 02. 13.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 프로젝트 매출 정보를 조회한다.
	  * @param pjKey
	  * @throws Exception
	 */
	@Override
	public List<?> selectSalesList(String pjKey) throws Exception {
		List<?> resultList = null;
		try {
			resultList = mapper.selectSalesList(pjKey);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return resultList;
	}
	
	/**
	 * 
	  * @Method Name : selectPurchaseList
	  * @Cdate       : 2021. 02. 13.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 프로젝트 매입 정보를 조회한다.
	  * @param pjKey
	  * @throws Exception
	 */
	@Override
	public List<?> selectPurchaseList(String pjKey) throws Exception {
		List<?> resultList = null;
		try {
			resultList = mapper.selectPurchaseList(pjKey);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return resultList;
	}
	
	/**
	 * 
	  * @Method Name : insertContractInfo
	  * @Cdate       : 2021. 01. 21.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 프로젝트 계약 회차별 정보를 등록한다.
	  * @param projectContractSalesVO
	  * @throws Exception
	 */
	private void writeSalesInfo(String regEmpKey, String pjKey, List<?> projectContractSalesVOList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			
			insertParam = new Hashtable<>();
			
			insertParam.put("salesCtFkKey", pjKey);			
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("SalesVOList", projectContractSalesVOList);
			
			mapper.insertSalesInfo(insertParam);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	/**
	 * 
	  * @Method Name : updateSalesInfo
	  * @Cdate       : 2021. 01. 21.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 프로젝트 매출 회차별 정보를 수정한다.
	  * @param projectContractSalesVO
	  * @throws Exception
	 */
	private void updateSalesInfo(String modEmpKey, List<?> projectContractSalesVOList) throws Exception {
		Map<String, Object> updateParam = null;
		try {
			updateParam = new Hashtable<>();
			
			updateParam.put("modEmpKey", modEmpKey);
			updateParam.put("projectContractSalesVOList", projectContractSalesVOList);
			
			mapper.updateSalesInfo(updateParam);
			
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	/**
	 * 
	  * @Method Name : updateContractList
	  * @Cdate       : 2021. 01. 21.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 프로젝트 계약 회차별 정보를 수정한다.
	  * @param projectContractSalesVO
	  * @throws Exception
	 */
	private void updateContractInfo(ProjectContractSalesVO projectContractSalesVO) throws Exception {
		try {
			mapper.updateContractInfo(projectContractSalesVO);
			
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	/**
	 * 
	  * @Method Name : updateBillOpInfo
	  * @Cdate       : 2021. 10. 19.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 프로젝트 계산서 요청 정보를 수정한다.
	  * @param projectContractSalesVO
	  * @throws Exception
	 */
	private void updateBillOpInfo(String modEmpKey, List<ProjectContractSalesVO> projectContractSalesVOList, String pjKey) throws Exception {
		MngProjectBillVO mngProjectBillVO = new MngProjectBillVO();
		try {
			for(int i = 0; i < projectContractSalesVOList.size(); i++) {
				mngProjectBillVO.setBillAmount(projectContractSalesVOList.get(i).getSalesTurnAmount());
				mngProjectBillVO.setModEmpKey(modEmpKey);
				mngProjectBillVO.setPjKey(pjKey);
				mngProjectBillVO.setBillTurnNo(projectContractSalesVOList.get(i).getSalesTurn());
				
				projectBillMapper.updateBillRequest(mngProjectBillVO);
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	public ProjectContractVO selectContractDetail(String pjKey) throws Exception {
		return mapper.selectContractDetail(pjKey);
	}
	
	/**
	 * 
	  * @Method Name : selectGuarantyList
	  * @Cdate       : 2021. 02. 13.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 프로젝트 보증 증권 정보를 조회한다.
	  * @param pjKey
	  * @throws Exception
	 */
	@Override
	public List<?> selectGuarantyList(String pjKey) throws Exception {
		List<?> guarantyList = null;
		try {
			guarantyList = mapper.selectGuarantyList(pjKey);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return guarantyList;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> insertGuarantyInfo(HttpServletRequest request, ProjectGuarantyBondVO guarantyBondVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		List<ProjectGuarantyBondVO> updateList = new ArrayList<ProjectGuarantyBondVO>();
		int isCtUpt = 1, isDfUpt = 1, isPpUpt = 1;
		int result = 0;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			guarantyBondVO.setModEmpKey(session.get("empKey"));
			/*mapper.updateSalesInfo(guarantyBondVO);*/
			
			for(int i = 0; i < guarantyBondVO.getGuarantyList().size(); i++) {
				
				guarantyBondVO.setCtKey(guarantyBondVO.getGuarantyList().get(i).getCtKey());
				guarantyBondVO.setSalesKey(guarantyBondVO.getGuarantyList().get(i).getSalesKey());
				
				updateList.add(guarantyBondVO.getGuarantyList().get(i));
				if(guarantyBondVO.getGuarantyList().get(i).getCtGuarantyYN().equals("Y")) {
					
					guarantyBondVO.setGbKindCd("계약");
					guarantyBondVO.setGbStartDt(guarantyBondVO.getGuarantyList().get(i).getCtGuarantyStartDt());
					guarantyBondVO.setGbEndDt(guarantyBondVO.getGuarantyList().get(i).getCtGuarantyEndDt());
					guarantyBondVO.setGbIssueYn(guarantyBondVO.getGuarantyList().get(i).getCtGbIssueYn());
					guarantyBondVO.setGbPublishDt(guarantyBondVO.getGuarantyList().get(i).getCtGbPublishDt());
					guarantyBondVO.setGbAmount(guarantyBondVO.getGuarantyList().get(i).getCtGuarantyAmount());
					
					if(!"".equals(CepStringUtil.getDefaultValue(guarantyBondVO.getGuarantyList().get(i).getCtGbKey(), ""))) {
						// 업데이트
						isCtUpt = isCtUpt + 1;
						guarantyBondVO.setGbKey(guarantyBondVO.getGuarantyList().get(i).getCtGbKey());
						mapper.updateGuarantyInfo(guarantyBondVO);
					} else {
						isCtUpt = 0;
						
						String gbKey = comService.makePrimaryKey(PrimaryKeyType.GUARANTY_BOND);
						guarantyBondVO.setGbKey(gbKey);
						
						mapper.insertGuarantyInfo(guarantyBondVO);
					}
				} else if(!"".equals(CepStringUtil.getDefaultValue(guarantyBondVO.getGuarantyList().get(i).getCtGbKey(), "")) && 
						guarantyBondVO.getGuarantyList().get(i).getCtGuarantyYN().equals("N")) {
					isCtUpt = isCtUpt + 1;
					// 삭제
					guarantyBondVO.setGbKey(guarantyBondVO.getGuarantyList().get(i).getCtGbKey());
					mapper.deleteGuarantyInfo(guarantyBondVO);
				}
				
				if(guarantyBondVO.getGuarantyList().get(i).getDfGuarantyYN().equals("Y")) {
					
					guarantyBondVO.setGbKindCd("하자");
					guarantyBondVO.setGbStartDt(guarantyBondVO.getGuarantyList().get(i).getDfGuarantyStartDt());
					guarantyBondVO.setGbEndDt(guarantyBondVO.getGuarantyList().get(i).getDfGuarantyEndDt());
					guarantyBondVO.setGbIssueYn(guarantyBondVO.getGuarantyList().get(i).getDfGbIssueYn());
					guarantyBondVO.setGbPublishDt(guarantyBondVO.getGuarantyList().get(i).getDfGbPublishDt());
					guarantyBondVO.setGbAmount(guarantyBondVO.getGuarantyList().get(i).getDfGuarantyAmount());
					
					if(!"".equals(CepStringUtil.getDefaultValue(guarantyBondVO.getGuarantyList().get(i).getDfGbKey(), ""))) {
						isDfUpt = isDfUpt + 1;
						// 업데이트
						guarantyBondVO.setGbKey(guarantyBondVO.getGuarantyList().get(i).getDfGbKey());
						mapper.updateGuarantyInfo(guarantyBondVO);
					} else {
						isDfUpt = 0;
						
						String gbKey = comService.makePrimaryKey(PrimaryKeyType.GUARANTY_BOND);
						guarantyBondVO.setGbKey(gbKey);
						
						mapper.insertGuarantyInfo(guarantyBondVO);
					}
				} else if(!"".equals(CepStringUtil.getDefaultValue(guarantyBondVO.getGuarantyList().get(i).getDfGbKey(), "")) && 
						guarantyBondVO.getGuarantyList().get(i).getDfGuarantyYN().equals("N")) {
					isDfUpt = isDfUpt + 1;
					// 삭제
					guarantyBondVO.setGbKey(guarantyBondVO.getGuarantyList().get(i).getDfGbKey());
					mapper.deleteGuarantyInfo(guarantyBondVO);
				}
				
				if(guarantyBondVO.getGuarantyList().get(i).getPpGuarantyYN().equals("Y")) {
					
					guarantyBondVO.setGbKindCd("선급금");
					guarantyBondVO.setGbStartDt(guarantyBondVO.getGuarantyList().get(i).getPpGuarantyStartDt());
					guarantyBondVO.setGbEndDt(guarantyBondVO.getGuarantyList().get(i).getPpGuarantyEndDt());
					guarantyBondVO.setGbIssueYn(guarantyBondVO.getGuarantyList().get(i).getPpGbIssueYn());
					guarantyBondVO.setGbPublishDt(guarantyBondVO.getGuarantyList().get(i).getPpGbPublishDt());
					guarantyBondVO.setGbAmount(guarantyBondVO.getGuarantyList().get(i).getPpGuarantyAmount());
					
					if(!"".equals(CepStringUtil.getDefaultValue(guarantyBondVO.getGuarantyList().get(i).getPpGbKey(), ""))) {
						isPpUpt = isPpUpt + 1;
						// 업데이트
						guarantyBondVO.setGbKey(guarantyBondVO.getGuarantyList().get(i).getPpGbKey());
						mapper.updateGuarantyInfo(guarantyBondVO);
					} else {
						isPpUpt = 0;
						
						String gbKey = comService.makePrimaryKey(PrimaryKeyType.GUARANTY_BOND);
						guarantyBondVO.setGbKey(gbKey);
						
						mapper.insertGuarantyInfo(guarantyBondVO);
					}
				} else if(!"".equals(CepStringUtil.getDefaultValue(guarantyBondVO.getGuarantyList().get(i).getPpGbKey(), "")) && 
						guarantyBondVO.getGuarantyList().get(i).getPpGuarantyYN().equals("N")) {
					isPpUpt = isPpUpt + 1;
					// 삭제
					guarantyBondVO.setGbKey(guarantyBondVO.getGuarantyList().get(i).getPpGbKey());
					mapper.deleteGuarantyInfo(guarantyBondVO);
				}
				
				updateSalesInfo(guarantyBondVO.getModEmpKey(), updateList);
			}
			
/*			if(isCtUpt == 0 || isDfUpt == 0 || isPpUpt == 0) {
				
				String dept = DeptInfo.DEPT_OPER_L2.getValue();
				List<String> toList = new ArrayList<String>();
				
				for(Object obj : comService.selectDeptEmployeeList(dept)) {
					String email = obj.toString().substring(obj.toString().indexOf("=") + 1, obj.toString().length() - 1);
					toList.add(email);
				}
				
				String tmail = StringUtils.join(toList, ";");
				mailVO.setEmpKey(tmail);
				mailVO.setLink(EmailInfo.PAGE_URL.getValue() + "project/detail/contractMin2.do?pjKey="+guarantyBondVO.getPjKey()+ "");
				String subject = "보증 증권 정보";
				String content = String.join(
						                System.getProperty("line.separator"),
						                "프로젝트 "+guarantyBondVO.getPjKey()+"건에 보증 증권 정보가 있습니다.<br><br>");
				
				mailVO.setSubject(subject);
				mailVO.setContent(content);
				mailVO.setIsNewPw(false);
				
				result = comService.sendMail(request, mailVO);
				if(result != 0) {
					returnMap.put("mailSuccessYN", "Y");
				} else {
					returnMap.put("mailSuccessYN", "N");
				}
				
				returnMap.put("mailList", toList);
			} else {
				returnMap.put("mailSuccessYN", "Y");
			}
*/			
			returnMap.put("successYN", "Y");
	    	returnMap.put("pjKey", guarantyBondVO.getPjKey());
	    	
	    	mapper.updateStatusCd(guarantyBondVO.getSalesCtFkKey(), guarantyBondVO.getStatusCd());
			
		} catch(Exception e) {
			e.printStackTrace();
			returnMap.put("successYN", "N");
		}
		return returnMap;	
	}
	
	@Override
	public Map<String, Object> selectFileList(FileVO fileVO) throws Exception {
		return mapper.selectFileList(fileVO);
	}
	
	@Override
	public Map<String, Object> updateBiddingInfo(MultipartHttpServletRequest multiRequest) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		ProjectVO projectVO = new ProjectVO();
		FileVO fileVO = new FileVO();
		int result = 0;
		
		/*fileMngService.insertFile(multiRequest);*/
		
		return returnMap;	
	}
	
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public String insertOrderInfo(HttpServletRequest request, ProjectOrderVO orderVO) throws Exception {
		
		String[] deleteKeyList = null;
		List<ProjectOrderProductVO> insertList = null;
		List<ProjectOrderProductVO> updateList = null;
		int listCnt = 0;
		ProjectOrderProductVO productVO = null;
		HashMap<String, String> session = null;
		ProjectPurchaseVO purchaseVO = new ProjectPurchaseVO();
		
		String orderKey = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			orderVO.setRegEmpKey(session.get("empKey"));
			orderVO.setModEmpKey(session.get("empKey"));
			
			if((CepStringUtil.getDefaultValue((orderVO.getPjOrderKey()), "")).equals("")) {
				
				// 해당 내용 신규등록
				orderKey = writeOrderInfo(orderVO.getRegEmpKey(), orderVO);
				
				// 매입 정보 생성
				purchaseVO.setBuyOrderFkKey(orderVO.getPjOrderKey());
				purchaseVO.setBuyFkPjKey(orderVO.getOrderCtFkKey());
				purchaseVO.setBuyAmount(orderVO.getOrderAmount());
				purchaseVO.setDonePaymentAmount(0);
				purchaseVO.setYetPaymentAmount(orderVO.getOrderAmount());
				purchaseVO.setBillPurchaseCd(orderVO.getBillPurchaseCd());
				purchaseVO.setBillMfCd(orderVO.getBillMfCd());
				insertPurchaseInfo(request, purchaseVO);
				
			} else {
				if(orderVO.getOrderProductVOList() != null && orderVO.getOrderProductVOList().size() > 0) {
					listCnt = orderVO.getOrderProductVOList().size();
					insertList = new ArrayList<>();
					updateList = new ArrayList<>();
					for (int i = 0; i < listCnt; i++) {
						productVO = orderVO.getOrderProductVOList().get(i);
						if(!"".equals(CepStringUtil.getDefaultValue(productVO.getIsNew(), ""))){
							// 업데이트
							updateList.add(productVO);
						} else {
							// 신규등록
							insertList.add(productVO);
						}
					}
				}
				
				if(!CepStringUtil.getDefaultValue(orderVO.getDeleteListKeys(), "").equals("")) {
					deleteKeyList = orderVO.getDeleteListKeys().split(":");
				}
				
				if(deleteKeyList != null && deleteKeyList.length > 0) {
					deleteOrderProductList(orderVO.getModEmpKey(), orderVO.getPjOrderKey(), deleteKeyList);
				}
				
				if(insertList != null && insertList.size() > 0) {
					writeOrderList(orderVO.getPjOrderKey(), orderVO.getRegEmpKey(), insertList);
				}
				
				if(updateList != null && updateList.size() > 0) {
					updateOrderList(orderVO.getModEmpKey(), updateList);
				}
				
				mapper.updateOrderInfo(orderVO);
				
				// 매입 정보 수정
				purchaseVO.setBuyOrderFkKey(orderVO.getPjOrderKey());
				purchaseVO.setBuyFkPjKey(orderVO.getOrderCtFkKey());
				purchaseVO.setBuyAmount(orderVO.getOrderAmount());
				purchaseVO.setBuyKey(orderVO.getBuyKey());
				purchaseVO.setYetPaymentAmount(orderVO.getOrderProductVOList().get(0).getYetPaymentAmount());
				purchaseVO.setBillPurchaseCd(orderVO.getBillPurchaseCd());
				purchaseVO.setBillMfCd(orderVO.getBillMfCd());
				
				updatePurchaseInfo(request, purchaseVO);
			}
			
			mapper.updateStatusCd(orderVO.getOrderCtFkKey(), orderVO.getStatusCd());
			
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
	private String writeOrderInfo(String regEmpKey, ProjectOrderVO orderVO) throws Exception {
		
		String orderKey = null;
		Map<String, Object> insertParam = null;
		try {
			orderKey = comService.makePrimaryKey(PrimaryKeyType.PROJECT_ORDER);
			
			if(!"".equals(CepStringUtil.getDefaultValue(orderKey, ""))){
				orderVO.setPjOrderKey(orderKey);
				// 발주 메인을 등록한다.
				mapper.insertOrderInfo(orderVO);
				
				insertParam = new HashMap<>();
				insertParam.put("regEmpKey", regEmpKey);
				insertParam.put("pjOrderKey", orderKey);
				insertParam.put("orderProductVOList", orderVO.getOrderProductVOList());
				
				if(orderVO.getOrderProductVOList() != null) {
					// 제품목록을 등록한다.
					mapper.insertOrderProductInfo(insertParam);
				}
				
			} else {
				throw new Exception("Can't make PJ_ORDER_TB.PJ_ORDER_KEY !!!! ..");
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		return orderKey;
	}
	
	private void writeOrderList(String orderKey, String regEmpKey, List<ProjectOrderProductVO> insertList) throws Exception {
		Map<String, Object> insertParam = null;
		try {
			insertParam = new HashMap<>();
			insertParam.put("pjOrderKey", orderKey);
			insertParam.put("regEmpKey", regEmpKey);
			insertParam.put("orderProductVOList", insertList);
			
			mapper.insertOrderProductInfo(insertParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	private void updateOrderList(String modEmpKey, List<ProjectOrderProductVO> updateList) throws Exception {
		Map<String, Object> updateParam = null;
		try {
			updateParam = new HashMap<>();
			updateParam.put("modEmpKey", modEmpKey);
			updateParam.put("orderProductVOList", updateList);
			
			mapper.updateOrderProductInfo(updateParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	private void deleteOrderProductList(String modEmpKey, String orderKey, String[] deleteKeyList) throws Exception {
		Map<String, Object> deleteParam = null;
		try {
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", modEmpKey);
			deleteParam.put("pjOrderKey", orderKey);
			deleteParam.put("deleteKeyList", deleteKeyList);
			mapper.deleteOrderProductInfo(deleteParam);
		} catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	public ProjectOrderVO selectOrderDetail(String orderKey) throws Exception {
		ProjectOrderVO vo = null;
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
	public ProjectPurchaseVO selectPurchaseDetail(ProjectPurchaseVO purchaseVO) throws Exception {
		ProjectPurchaseVO vo = null;
		try {
			vo = mapper.selectPurchaseDetail(purchaseVO);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return vo;
	}
	
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public Map<String, Object> deleteOrderInfo(HttpServletRequest request, ProjectOrderVO orderVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Map<String, Object> deleteParam = null;
		HashMap<String, String> session = null;
		ProjectPurchaseVO purchaseVO = new ProjectPurchaseVO();
		
		try {
			
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			orderVO.setModEmpKey(session.get("empKey"));
			
			deleteParam = new HashMap<>();
			deleteParam.put("modEmpKey", orderVO.getModEmpKey());
			deleteParam.put("pjOrderKey", orderVO.getPjOrderKey());
			
			mapper.deleteOrderProductAll(deleteParam);
			
			mapper.deleteOrderInfo(orderVO);
			
			purchaseVO.setBuyOrderFkKey(orderVO.getPjOrderKey());
			purchaseVO.setBuyKey(orderVO.getBuyKey());
			/*매입 목록 삭제*/
			deletePurchaseInfo(request, purchaseVO);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			returnMap.put("successsYN", "N");
			throw new Exception(e);
		}
		
		return returnMap;
	}
	
	@Override
	public List<ProjectOrderProductVO> selectOrderProductList(String orderKey) throws Exception {
		return mapper.selectOrderProductList(orderKey);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertPurchaseInfo(HttpServletRequest request, ProjectPurchaseVO purchaseVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		String buyKey = "";
		
		try {
			buyKey = comService.makePrimaryKey(PrimaryKeyType.PROJECT_PURCHASE);
			purchaseVO.setBuyKey(buyKey);
			
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			purchaseVO.setRegEmpKey(session.get("empKey"));
			
			mapper.insertPurchaseInfo(purchaseVO);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			throw new Exception(e);
		}
		return returnMap;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> updatePurchaseInfo(HttpServletRequest request, ProjectPurchaseVO purchaseVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			purchaseVO.setModEmpKey(session.get("empKey"));
			
			mapper.updatePurchaseInfo(purchaseVO);
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			throw new Exception(e);
		}
		return returnMap;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public void deletePurchaseInfo(HttpServletRequest request, ProjectPurchaseVO purchaseVO) throws Exception {
		ProjectPaymentVO paymentVO = new ProjectPaymentVO();
		HashMap<String, String> session = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			purchaseVO.setModEmpKey(session.get("empKey"));
			
			paymentVO.setPaymentBuyFkKey(purchaseVO.getBuyKey());
			paymentVO.setModEmpKey(purchaseVO.getModEmpKey());
			
			mapper.deletePaymentAllInfo(paymentVO);
			/* 지급 정보 삭제 */
			mapper.deletePurchaseInfo(purchaseVO);
			
			/* 발주 계산서 매핑 정보 삭제*/
			
			
		} catch(Exception e) {
			throw new Exception(e);
		}
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
			buildVO.setModEmpKey(session.get("empKey"));
			
			if(!"".equals(CepStringUtil.getDefaultValue(buildVO.getSelectKey(), ""))){
				mapper.updateBuildInfo(buildVO);
			} else {
				mapper.insertBuildInfo(buildVO);
			}
			
			mapper.updateStatusCd(buildVO.getPjKey(), buildVO.getStatusCd());
			
	    	returnMap.put("successYN", "Y");
	    	returnMap.put("inbSeq", buildVO.getInbSeq());
	    	returnMap.put("pjKey", buildVO.getPjKey());
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;		
		
	}
	
	@Override
	public List<?> selectBuildDetail(ProjectBuildVO buildVO) throws Exception {
		return mapper.selectBuildDetail(buildVO);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertWorkInfo(HttpServletRequest request, ProjectWorkVO workVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			workVO.setRegEmpKey(session.get("empKey"));
			workVO.setModEmpKey(session.get("empKey"));
			
			if(!"".equals(CepStringUtil.getDefaultValue(workVO.getSelectKey(), ""))){
				mapper.updateWorkInfo(workVO);
			} else {
				mapper.insertWorkInfo(workVO);
			}
			
			mapper.updateStatusCd(workVO.getPjKey(), workVO.getStatusCd());
			
	    	returnMap.put("successYN", "Y");
	    	returnMap.put("workSeq", workVO.getPjWorkSeq());
	    	returnMap.put("pjKey", workVO.getPjKey());
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return returnMap;		
	}
	
	@Override
	public List<?> selectWorkDetail(ProjectWorkVO workVO) throws Exception {
		return mapper.selectWorkDetail(workVO);
	}
}
