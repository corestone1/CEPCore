package com.cep.mngMaint.bill.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.maintenance.contract.service.MtContractService;
import com.cep.maintenance.contract.vo.MtBuyAmountVO;
import com.cep.maintenance.contract.vo.MtSalesAmountVO;
import com.cep.mngMaint.bill.service.MngMaintBillService;
import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;
import com.cep.mngMaint.bill.vo.MngMaintBillVO;
import com.cep.mngMaint.bill.vo.MtPaymentVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepStringUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngMaintBillService")
public class MngMaintBillServiceImpl implements MngMaintBillService {
	private static final Logger logger = LoggerFactory.getLogger(MngMaintBillServiceImpl.class);
	
	@Resource(name="mtContractService")
	private MtContractService contService;
	
	@Resource(name="mngMaintBillMapper")
	private MngMaintBillMapper mapper;
	
	@Override
	public EgovMap selectBillBasicInfo(MngMaintBillSearchVO searchVO) throws Exception {
		
		return mapper.selectBillBasicInfo(searchVO);
	}

	@Override
	public EgovMap selectBillDetailInfo(MngMaintBillSearchVO searchVO) throws Exception {
		EgovMap billMap = null;
		
		try {
						
			billMap = mapper.selectBillDetailInfo(searchVO);
			
			logger.debug("####1== billMap : {}", billMap);
			if(billMap == null || billMap.get("billCallKey") == null || billMap.get("billCallKey").equals("")) {
				//해당 세금계산서 요청정보가 없는 경우 수금계획 정보(MT_SALES_DETAIL_TB)에서 요청할 정보를 불러온다.
				
				billMap = mapper.selectBillDefaultInfo(searchVO);
				logger.debug("####2== billMap : {}", billMap);
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return billMap;
	}

	@Override
	@Transactional
	public String insertBillRequest(MngMaintBillVO mngMaintBillVO) throws Exception {
		String billCallKey = null;
		EgovMap billStatusInfo = null;
		String targetYear = null;
		String targetMonth = null;
		MtSalesAmountVO mtSalesAmountVO = null;
		String billIssueStatus = null;
		try {
			
			billCallKey = contService.makePrimaryKey(PrimaryKeyType.MAINTENACE_BILLING_OP);
			if(!"".equals(CepStringUtil.getDefaultValue(billCallKey, ""))) {
				
				mngMaintBillVO.setBillCallKey(billCallKey);
				mngMaintBillVO.setBillIssueStatus("R");
				mapper.insertBillRequest(mngMaintBillVO);
				//MT_SALES_DETAIL_TB.SALES_STATUS_CD 업데이트.
				mapper.updateSaleDetailStatusCd(mngMaintBillVO);
				
				//세금계산서 요청에 대한 상태정보를 가져온다.
				billStatusInfo = mapper.selectBillStatusInfo(mngMaintBillVO);
				if(null != billStatusInfo && billStatusInfo.size()>0) {
					targetYear = ((String)billStatusInfo.get("salesYearMonth")).substring(0, 4);
					targetMonth = ((String)billStatusInfo.get("salesYearMonth")).substring(4, 6);
					billIssueStatus = mngMaintBillVO.getBillIssueStatus();
					mtSalesAmountVO = new MtSalesAmountVO();
					mtSalesAmountVO.setMtIntegrateKey((String)billStatusInfo.get("mtIntegrateKey"));
					mtSalesAmountVO.setMtSalesYear(targetYear);
					mtSalesAmountVO.setModEmpKey(mngMaintBillVO.getRegEmpKey());
					
					logger.debug("insertBillRequest===>"+targetYear+"/"+targetMonth+"/"+billIssueStatus);
					if("01".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesJanCallYn(billIssueStatus);
					} else if("02".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesFebCallYn(billIssueStatus);
					} else if("03".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesMarCallYn(billIssueStatus);
					} else if("04".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesAprCallYn(billIssueStatus);
					} else if("05".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesMayCallYn(billIssueStatus);
					} else if("06".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesJunCallYn(billIssueStatus);
					} else if("07".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesJulCallYn(billIssueStatus);
					} else if("08".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesAugCallYn(billIssueStatus);
					} else if("09".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesSepCallYn(billIssueStatus);
					} else if("10".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesOctCallYn(billIssueStatus);
					} else if("11".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesNovCallYn(billIssueStatus);
					} else if("12".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesDecCallYn(billIssueStatus);
					}
					
					//MT_SALES_AMOUNT_TB의 월별 상태코드를 업데이트 한다.
					mapper.updateMtSaleAmountStatus(mtSalesAmountVO);
				}
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		
		return billCallKey;
	}

	@Override
	public void updateBillRequest(MngMaintBillVO mngMaintBillVO) throws Exception {
		mapper.updateBillRequest(mngMaintBillVO);
		
	}

	@Override
	@Transactional
	public void deleteBillRequest(MngMaintBillVO mngMaintBillVO) throws Exception {
		MngMaintBillVO maintBillVO = new MngMaintBillVO();
		

		EgovMap billStatusInfo = null;
		String targetYear = null;
		String targetMonth = null;
		MtSalesAmountVO mtSalesAmountVO = null;
		String billIssueStatus = null;
		try {
			maintBillVO.setBillCallKey(mngMaintBillVO.getBillCallKey());
			maintBillVO.setBillCtFkKey(mngMaintBillVO.getBillCtFkKey());
			maintBillVO.setMtSalesOrderKey(mngMaintBillVO.getMtSalesOrderKey());
			maintBillVO.setBillIssueStatus(null);
			
			//세금계산서 요청에 대한 상태정보를 가져온다.
			billStatusInfo = mapper.selectBillStatusInfo(mngMaintBillVO);
			
			//세금계산서 요청 삭제.
			mapper.deleteBillRequest(maintBillVO);
			
			
			
			//MT_SALES_DETAIL_TB.SALES_STATUS_CD 업데이트.
			mapper.updateSaleDetailStatusCd(maintBillVO);
			
			
			if(null != billStatusInfo && billStatusInfo.size()>0) {
				targetYear = ((String)billStatusInfo.get("salesYearMonth")).substring(0, 4);
				targetMonth = ((String)billStatusInfo.get("salesYearMonth")).substring(4, 6);
				billIssueStatus = "N";
				mtSalesAmountVO = new MtSalesAmountVO();
				mtSalesAmountVO.setMtIntegrateKey((String)billStatusInfo.get("mtIntegrateKey"));
				mtSalesAmountVO.setMtSalesYear(targetYear);
				mtSalesAmountVO.setModEmpKey(mngMaintBillVO.getRegEmpKey());
				
				logger.debug("deleteBillRequest===>"+targetYear+"/"+targetMonth+"/"+billIssueStatus);
				
				if("01".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesJanCallYn(billIssueStatus);
				} else if("02".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesFebCallYn(billIssueStatus);
				} else if("03".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesMarCallYn(billIssueStatus);
				} else if("04".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesAprCallYn(billIssueStatus);
				} else if("05".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesMayCallYn(billIssueStatus);
				} else if("06".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesJunCallYn(billIssueStatus);
				} else if("07".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesJulCallYn(billIssueStatus);
				} else if("08".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesAugCallYn(billIssueStatus);
				} else if("09".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesSepCallYn(billIssueStatus);
				} else if("10".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesOctCallYn(billIssueStatus);
				} else if("11".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesNovCallYn(billIssueStatus);
				} else if("12".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesDecCallYn(billIssueStatus);
				}
				
				//MT_SALES_AMOUNT_TB의 월별 상태코드를 업데이트 한다.
				mapper.updateMtSaleAmountStatus(mtSalesAmountVO);
			} // end if(null != billStatusInfo && billStatusInfo.size()>0) {
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	@Override
	@Transactional
	public String insertBillIssue(MngMaintBillVO mngMaintBillVO) throws Exception{
		String billCallKey = null;
		EgovMap billStatusInfo = null;
		String targetYear = null;
		String targetMonth = null;
		MtSalesAmountVO mtSalesAmountVO = null;
		String billIssueStatus = null;
		try {
			//세금계산서 요청 관리키를 생성한다.
			billCallKey = contService.makePrimaryKey(PrimaryKeyType.MAINTENACE_BILLING_OP);
			
			logger.debug("mngMaintBillVO.getMtSalesOrderKey()====>"+mngMaintBillVO.getMtSalesOrderKey()+"/"+billCallKey);
			if(!"".equals(CepStringUtil.getDefaultValue(billCallKey, ""))) {
				
				mngMaintBillVO.setBillCallKey(billCallKey);
				//세금계산서 요청정보 등록.
				mapper.insertBillIssue(mngMaintBillVO);
				//MT_SALES_DETAIL_TB.SALES_STATUS_CD 업데이트.
				mapper.updateSaleDetailStatusCd(mngMaintBillVO);
				
				//세금계산서 요청에 대한 상태정보를 가져온다.
				billStatusInfo = mapper.selectBillStatusInfo(mngMaintBillVO);
				if(null != billStatusInfo && billStatusInfo.size()>0) {
					targetYear = ((String)billStatusInfo.get("salesYearMonth")).substring(0, 4);
					targetMonth = ((String)billStatusInfo.get("salesYearMonth")).substring(4, 6);
					billIssueStatus = mngMaintBillVO.getBillIssueStatus();
					mtSalesAmountVO = new MtSalesAmountVO();
					mtSalesAmountVO.setMtIntegrateKey((String)billStatusInfo.get("mtIntegrateKey"));
					mtSalesAmountVO.setMtSalesYear(targetYear);
					mtSalesAmountVO.setModEmpKey(mngMaintBillVO.getRegEmpKey());
					
					logger.debug("insertBillRequest===>"+targetYear+"/"+targetMonth+"/"+billIssueStatus);
					if("01".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesJanCallYn(billIssueStatus);
					} else if("02".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesFebCallYn(billIssueStatus);
					} else if("03".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesMarCallYn(billIssueStatus);
					} else if("04".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesAprCallYn(billIssueStatus);
					} else if("05".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesMayCallYn(billIssueStatus);
					} else if("06".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesJunCallYn(billIssueStatus);
					} else if("07".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesJulCallYn(billIssueStatus);
					} else if("08".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesAugCallYn(billIssueStatus);
					} else if("09".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesSepCallYn(billIssueStatus);
					} else if("10".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesOctCallYn(billIssueStatus);
					} else if("11".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesNovCallYn(billIssueStatus);
					} else if("12".equals(targetMonth)) {
						mtSalesAmountVO.setMtSalesDecCallYn(billIssueStatus);
					}
					
					//MT_SALES_AMOUNT_TB의 월별 상태코드를 업데이트 한다. 
					mapper.updateMtSaleAmountStatus(mtSalesAmountVO);
				}
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		
		return billCallKey;
	}

	@Override
	@Transactional
	public void updateBillIssue(MngMaintBillVO mngMaintBillVO) throws Exception {
		
		try {
			mapper.updateBillIssue(mngMaintBillVO);
			
			//MT_SALES_DETAIL_TB.SALES_STATUS_CD 업데이트.
			mapper.updateSaleDetailStatusCd(mngMaintBillVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		
	}
	
	@Override
	@Transactional
	public void updateBillIssueStatus(MngMaintBillVO mngMaintBillVO) throws Exception {
		
		MngMaintBillVO maintBillVO = new MngMaintBillVO();
		

		EgovMap billStatusInfo = null;
		String targetYear = null;
		String targetMonth = null;
		MtSalesAmountVO mtSalesAmountVO = null;
		String billIssueStatus = null;
		try {
			maintBillVO.setBillIssueStatus(mngMaintBillVO.getBillIssueStatus());
			maintBillVO.setModEmpKey(mngMaintBillVO.getModEmpKey());
			
			//where
			maintBillVO.setBillCallKey(mngMaintBillVO.getBillCallKey());
			maintBillVO.setBillCtFkKey(mngMaintBillVO.getBillCtFkKey());
			//이것을 이용해서 스테이터스변경하는 업데이트 프로세스 만드는것도 좋을듯		
			mapper.updatetBillInfo(maintBillVO);
			
			//MT_SALES_DETAIL_TB.SALES_STATUS_CD 업데이트.
			mapper.updateSaleDetailStatusCd(maintBillVO);
			
			//세금계산서 요청에 대한 상태정보를 가져온다.
			billStatusInfo = mapper.selectBillStatusInfo(mngMaintBillVO);
			if(null != billStatusInfo && billStatusInfo.size()>0) {
				targetYear = ((String)billStatusInfo.get("salesYearMonth")).substring(0, 4);
				targetMonth = ((String)billStatusInfo.get("salesYearMonth")).substring(4, 6);
				billIssueStatus = mngMaintBillVO.getBillIssueStatus();
				mtSalesAmountVO = new MtSalesAmountVO();
				mtSalesAmountVO.setMtIntegrateKey((String)billStatusInfo.get("mtIntegrateKey"));
				mtSalesAmountVO.setMtSalesYear(targetYear);
				mtSalesAmountVO.setModEmpKey(mngMaintBillVO.getRegEmpKey());
				
				logger.debug("updateBillIssueStatus===>"+targetYear+"/"+targetMonth+"/"+billIssueStatus);
				
				
				if("01".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesJanCallYn(billIssueStatus);
				} else if("02".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesFebCallYn(billIssueStatus);
				} else if("03".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesMarCallYn(billIssueStatus);
				} else if("04".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesAprCallYn(billIssueStatus);
				} else if("05".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesMayCallYn(billIssueStatus);
				} else if("06".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesJunCallYn(billIssueStatus);
				} else if("07".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesJulCallYn(billIssueStatus);
				} else if("08".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesAugCallYn(billIssueStatus);
				} else if("09".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesSepCallYn(billIssueStatus);
				} else if("10".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesOctCallYn(billIssueStatus);
				} else if("11".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesNovCallYn(billIssueStatus);
				} else if("12".equals(targetMonth)) {
					mtSalesAmountVO.setMtSalesDecCallYn(billIssueStatus);
				}
				
				//MT_SALES_AMOUNT_TB의 월별 상태코드를 업데이트 한다.
				mapper.updateMtSaleAmountStatus(mtSalesAmountVO);
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	public List<EgovMap> selectBillList(MngMaintBillSearchVO searchVO) throws Exception {
		
		return mapper.selectBillList(searchVO);
	}

	@Override
	public List<EgovMap> selectSdBillList(MngMaintBillSearchVO searchVO ) throws Exception {
		return mapper.selectSdBillList(searchVO);
	}
	
	@Override
	@Transactional
	public void insertSdBillingXml(MngMaintBillVO mngMaintBillVO) throws Exception {
		/*
		 * '계산서 발급 상태 - R:요청 >> I:발급 >> M:매핑 >> E: 수금 or 지급 완료'
		 * 매출은 발급를 건너 뛰고 매핑처리한다.
		 */
		String billIssueStatus ="M";
		MngMaintBillVO maintBillVO = new MngMaintBillVO();
		try {
			//세금계산서 정보 셋팅.
			
			maintBillVO.setBillNo(mngMaintBillVO.getBillNo());;
			maintBillVO.setBillIssueDt(mngMaintBillVO.getBillIssueDt());
			maintBillVO.setBillIssueStatus(billIssueStatus);
			maintBillVO.setModEmpKey(mngMaintBillVO.getModEmpKey());
			
			//where
			maintBillVO.setBillCallKey(mngMaintBillVO.getBillCallKey());
			
			maintBillVO.setBillCtFkKey(mngMaintBillVO.getBillCtFkKey());
			
			//1.MT_SD_BILLING_OP_TB 세금계산서 요청 정보 업데이트(계산서 번호, 발행일자, 요청상태)
			mapper.updatetBillInfo(maintBillVO);
			
			/*
			 * 2. 유지보수 매출(수금) 정보 상태를 업데이트 한다.		
			 * MT_SALES_DETAIL_TB.SALES_STATUS_CD 업데이트.	
			 */
			mapper.updateSaleDetailStatusCd(maintBillVO);
		} catch (Exception e) {
			throw new Exception(e);
		}

		
//		2. 
	}
	
	@Override
	@Transactional
	public void cancelSdBillMapping(MngMaintBillVO mngMaintBillVO) throws Exception {
		/*
		 * '계산서 발급 상태 - R:요청 >> I:발급 >> M:매핑 >> E: 수금 or 지급 완료'
		 * 맵핑에서 요청상태로 변경한다. (M ==> R)
		 */
		//String billIssueStatus ="R"; 
//		MngMaintBillVO maintBillVO = new MngMaintBillVO();
		try {
			//세금계산서 정보 셋팅.
			
			//maintBillVO.setBillMappingYn("N"); //매핑취소.
			//maintBillVO.setBillIssueStatus(billIssueStatus);
//			maintBillVO.setModEmpKey(mngMaintBillVO.getModEmpKey());
			
			//where
//			maintBillVO.setBillCallKey(mngMaintBillVO.getBillCallKey());
			
//			maintBillVO.setBillCtFkKey(mngMaintBillVO.getBillCtFkKey());
			
			/*
			 * 1.MT_SD_BILLING_OP_TB 세금계산서 요청 정보 업데이트(계산서 번호, 발행일자, 요청상태)
			 * 계산서번호 = NULL
			 * 발행일자 = NULL
			 * 요청상태 = R
			 */
			mapper.updatetBillInfo(mngMaintBillVO);
			
			/*
			 * 2. 유지보수 매출(수금) 정보 상태를 업데이트 한다.		
			 * MT_SALES_DETAIL_TB.SALES_STATUS_CD 업데이트.	
			 */
			mapper.updateSaleDetailStatusCd(mngMaintBillVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}

	@Override
	@Transactional
	public void updateSdCollectStatus(MngMaintBillVO mngMaintBillVO) throws Exception {
		/*
		 * '계산서 발급 상태 - R:요청 >> I:발급 >> M:매핑 >> E: 수금 or 지급 완료'
		 *  E : 수금완료처리.
		 */
		
		MngMaintBillVO maintBillVO = new MngMaintBillVO();
		try {
			
			
			if("E".equals(CepStringUtil.getDefaultValue(mngMaintBillVO.getBillIssueStatus(), ""))) {
				//수금완료처리인 경우.
				if("".equals(CepStringUtil.getDefaultValue(mngMaintBillVO.getSalesCollectFinishDt(), ""))) {
					maintBillVO.setSalesCollectFinishDt(CepDateUtil.getToday("yyyyMMdd")); //수금완료일자=오늘날짜.
				} else {
					maintBillVO.setSalesCollectFinishDt(mngMaintBillVO.getSalesCollectFinishDt());
				}
				
			} else if("M".equals(CepStringUtil.getDefaultValue(mngMaintBillVO.getBillIssueStatus(), ""))) {
				//수금취소 처리인 경우.
				maintBillVO.setSalesCollectFinishDt(null); //수금완료일자=null.
			} else if("I".equals(CepStringUtil.getDefaultValue(mngMaintBillVO.getBillIssueStatus(), ""))) {
				//수금취소 처리인 경우.
				maintBillVO.setSalesCollectFinishDt(null); //수금완료일자=null.
			}
			maintBillVO.setModEmpKey(mngMaintBillVO.getModEmpKey()); //수정자
			maintBillVO.setBillIssueStatus(mngMaintBillVO.getBillIssueStatus());
			
			//where
			maintBillVO.setBillCallKey(mngMaintBillVO.getBillCallKey());			
			maintBillVO.setBillCtFkKey(mngMaintBillVO.getBillCtFkKey());
			
			logger.debug("salesCollectFinishDt====>"+mngMaintBillVO.getSalesCollectFinishDt()+"/"+maintBillVO.getSalesCollectFinishDt());
			
			//세금계산서 완료처리(MT_SD_BILLING_OP_TB)
			mapper.updatetBillInfo(maintBillVO);
			
			/*
			 * 1. 유지보수 매출세금계산서 정보를 업데이트 한다.		
			 * MT_SALES_DETAIL_TB.SALES_STATUS_CD 업데이트.	
			 * 완료인 경우 완료일자를 넣어준다.
			 */
			mapper.updateSaleDetailStatusCd(maintBillVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	
//	//////////////////////////////// 매입관련  //////////////////////////////////////////////
	
	@Override
	public EgovMap selectPaymentBasicInfo(MngMaintBillSearchVO searchVO) throws Exception {
		EgovMap paymentBasicInfo = null;
		try {
			paymentBasicInfo = mapper.selectPaymentBasicInfo(searchVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return paymentBasicInfo;
	}

	@Override
	public List<EgovMap> selectPaymentRequestList(MngMaintBillSearchVO searchVO) throws Exception {
		List<EgovMap> paymentRequestList = null;
		try {
			paymentRequestList = mapper.selectPaymentRequestList(searchVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return paymentRequestList;
	}

	@Override
	public EgovMap selectPaymentRequestInfo(MngMaintBillSearchVO searchVO) throws Exception {
		EgovMap paymentRequestInfo = null;
		try {
//			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getPaymentKey(), ""))) {
//				paymentRequestInfo = mapper.selectPaymentRequestInfo(searchVO);
//			}			
			
			paymentRequestInfo = mapper.selectPaymentRequestInfo(searchVO);
			
			if(null == paymentRequestInfo || paymentRequestInfo.size()==0) {
				if("BO".equals(searchVO.getMtOrderType())) {
					/*
					 * 백계약인 경우에만 회차별 지급정보를 관리하므로
					 * 백계약인경우에만  수행한다.
					 */
					paymentRequestInfo = mapper.selectPaymentDetailRequestInfo(searchVO);
				} else {
					paymentRequestInfo = new EgovMap();
				}
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return paymentRequestInfo;
	}

	@Override
	public List<EgovMap> selectMappingBillList(MngMaintBillSearchVO searchVO) throws Exception {
		List<EgovMap> billMappingList = null;
		try {
			billMappingList = mapper.selectMappingBillList(searchVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
		return billMappingList;
	}

	@Override
	public String writePaymentRequestInfo(MtPaymentVO mtPaymentVO) throws Exception {
		String paymentKey = null;
		try {
			paymentKey = contService.makePrimaryKey(PrimaryKeyType.MAINTENACE_PAYMENT);
			if(!"".equals(CepStringUtil.getDefaultValue(paymentKey, ""))) {
				mtPaymentVO.setPaymentKey(paymentKey);
				writePaymentRequestInfo2(mtPaymentVO);
			} else {
				throw new Exception("Can't make payment key !! please check DB!!");
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return paymentKey;
	}

	/**
	 * 지급요청정보 등록
	 * 1. 바로 완료처리 하는 경우 (유지보수관리 >>지급요청목록에서 지급완료처리하는 경우)
	 * 2. 유지보수 작업발주에서 요청작업을 통해 하는 경우.
	 * <pre>
	 * </pre>
	 * 
	 * @param mtPaymentVO
	 * @throws Exception
	 * @cdate 2021. 12. 13. 오후 10:02:52
	 * @author aranghoo
	 */
	@Transactional
	private void writePaymentRequestInfo2(MtPaymentVO mtPaymentVO) throws Exception {
		MtBuyAmountVO mtBuyAmountVO = null;
		String targetYear = null;
		String targetMonth = null;
		try {
			//매입요청정보 등록
			mapper.writePaymentRequestInfo(mtPaymentVO);
			
			
			/*
			 * 바로 지급완료처리하는 경우 세금계산서 키가 존재하지 않음
			 * 세금계산서 키(세금계산서번호)가 있는 경우 세금계산서 맵핑정보 업데이트.
			 */
			if(!"".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getBillFkKey(), ""))) {
				mapper.updatePaymentRequestBill(mtPaymentVO);
			}
			
			//1. 지급테이블(MT_PAYMENT_DETAIL_TB) 완료처리 : updatePaymentDetailFinish
			if("BO".equals(mtPaymentVO.getMtOrderType())) {
				//1.1 백계약인경우. MT_PAYMENT_DETAIL_TB
				mapper.updatePaymentDetailStatusCd(mtPaymentVO);
				
				
				targetYear = mtPaymentVO.getPaymentYearMonth().substring(0, 4);
				targetMonth = mtPaymentVO.getPaymentYearMonth().substring(4, 6);
				
				mtBuyAmountVO = new MtBuyAmountVO();
				
				mtBuyAmountVO.setMtIntegrateKey(mtPaymentVO.getMtIntegrateKey());
				mtBuyAmountVO.setMtBuyYear(targetYear);
				if("01".equals(targetMonth)) {
					mtBuyAmountVO.setMtBuyJanCallYn("Y");
				} else if("02".equals(targetMonth)) {
					mtBuyAmountVO.setMtBuyFebCallYn("Y");
				} else if("03".equals(targetMonth)) {
					mtBuyAmountVO.setMtBuyMarCallYn("Y");
				} else if("04".equals(targetMonth)) {
					mtBuyAmountVO.setMtBuyAprCallYn("Y");
				} else if("05".equals(targetMonth)) {
					mtBuyAmountVO.setMtBuyMayCallYn("Y");
				} else if("06".equals(targetMonth)) {
					mtBuyAmountVO.setMtBuyJunCallYn("Y");
				} else if("07".equals(targetMonth)) {
					mtBuyAmountVO.setMtBuyJulCallYn("Y");
				} else if("08".equals(targetMonth)) {
					mtBuyAmountVO.setMtBuyAugCallYn("Y");
				} else if("09".equals(targetMonth)) {
					mtBuyAmountVO.setMtBuySepCallYn("Y");
				} else if("10".equals(targetMonth)) {
					mtBuyAmountVO.setMtBuyOctCallYn("Y");
				} else if("11".equals(targetMonth)) {
					mtBuyAmountVO.setMtBuyNovCallYn("Y");
				} else if("12".equals(targetMonth)) {
					mtBuyAmountVO.setMtBuyDecCallYn("Y");
				}
//				if("01".equals(targetMonth)) {
//					mtBuyAmountVO.setMtBuyJanCallYn(mtPaymentVO.getPaymentStatusCd());
//				} else if("02".equals(targetMonth)) {
//					mtBuyAmountVO.setMtBuyFebCallYn(mtPaymentVO.getPaymentStatusCd());
//				} else if("03".equals(targetMonth)) {
//					mtBuyAmountVO.setMtBuyMarCallYn(mtPaymentVO.getPaymentStatusCd());
//				} else if("04".equals(targetMonth)) {
//					mtBuyAmountVO.setMtBuyAprCallYn(mtPaymentVO.getPaymentStatusCd());
//				} else if("05".equals(targetMonth)) {
//					mtBuyAmountVO.setMtBuyMayCallYn(mtPaymentVO.getPaymentStatusCd());
//				} else if("06".equals(targetMonth)) {
//					mtBuyAmountVO.setMtBuyJunCallYn(mtPaymentVO.getPaymentStatusCd());
//				} else if("07".equals(targetMonth)) {
//					mtBuyAmountVO.setMtBuyJulCallYn(mtPaymentVO.getPaymentStatusCd());
//				} else if("08".equals(targetMonth)) {
//					mtBuyAmountVO.setMtBuyAugCallYn(mtPaymentVO.getPaymentStatusCd());
//				} else if("09".equals(targetMonth)) {
//					mtBuyAmountVO.setMtBuySepCallYn(mtPaymentVO.getPaymentStatusCd());
//				} else if("10".equals(targetMonth)) {
//					mtBuyAmountVO.setMtBuyOctCallYn(mtPaymentVO.getPaymentStatusCd());
//				} else if("11".equals(targetMonth)) {
//					mtBuyAmountVO.setMtBuyNovCallYn(mtPaymentVO.getPaymentStatusCd());
//				} else if("12".equals(targetMonth)) {
//					mtBuyAmountVO.setMtBuyDecCallYn(mtPaymentVO.getPaymentStatusCd());
//				}
				//1.2 MT_BUY_AMOUNT_TB 월별 상태코드를업데이트 수행.
				mapper.updateMtBuyAmountStatus(mtBuyAmountVO);
			}
			
			//지급완료 등록인 경우 (유지보수관리 >> 지급목록리스트에서 완료처리하는 경우)
			if("E".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getPaymentStatusCd(), ""))) {	
				
				//2. 발주 미지급, 지급금액 변경 : updateOrderPaymentAmount
				mapper.updateOrderPaymentAmount(mtPaymentVO);
			}
			
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	public void updatePaymentRequestInfo(MtPaymentVO mtPaymentVO) throws Exception {
		try {
			mapper.updatePaymentRequestInfo(mtPaymentVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	@Transactional
	public void deletePaymentRequest(MtPaymentVO mtPaymentVO) throws Exception {
		try {
//			요청(매핑)취소 (상태가 요청(PYST2000)일때만 가능함)
//			1.1 MT_PAYMENT_TB 삭제처리.
			mapper.deletePaymentRequest(mtPaymentVO);
			
//			1.2 CMM_PC_BILLING_TB 매핑취소처리.(deletePaymentRequestBill)
			mapper.deletePaymentRequestBill(mtPaymentVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	@Transactional
	public void updatePaymentRequestConfirm(MtPaymentVO mtPaymentVO) throws Exception {
		/*
		 * 1. MT_PC_BILLING_OP_TB 테이블의 PAYMENT_STATUS_CD = 'C' 로 업데이트
		 * 2. MT_PAYMENT_DETAIL_TB.PAYMENT_STATUS_CD= 'C'로 업데이트.
		 */
		MtPaymentVO mtPaymentVO2 = null;
		try {
			//1. MT_PC_BILLING_OP_TB 테이블의 PAYMENT_STATUS_CD = 'C' 로 업데이트
			mapper.updatePaymentRequestConfirm(mtPaymentVO);
			
			//2. MT_PAYMENT_DETAIL_TB.PAYMENT_STATUS_CD= 'C'로 업데이트.
			mtPaymentVO2 = new MtPaymentVO();
			mtPaymentVO2.setPaymentDtFkKey(mtPaymentVO.getPaymentDtFkKey());
			mtPaymentVO2.setPaymentStatusCd(mtPaymentVO.getRequestStatus());
			mapper.updatePaymentDetailStatusCd(mtPaymentVO2);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	@Transactional
	public void cancelPaymentRequestConfirm(MtPaymentVO mtPaymentVO) throws Exception {
		/*
		 * 1. MT_PC_BILLING_OP_TB 테이블의 PAYMENT_STATUS_CD = 'R' 로 업데이트
		 * 2. MT_PAYMENT_DETAIL_TB.PAYMENT_STATUS_CD= 'R'로 업데이트.
		 */
		MtPaymentVO mtPaymentVO2 = null;
		try {
			
			//1. MT_PC_BILLING_OP_TB 테이블의 PAYMENT_STATUS_CD = 'R' 로 업데이트
			mapper.cancelPaymentRequestConfirm(mtPaymentVO);
			
			//2. MT_PAYMENT_DETAIL_TB.PAYMENT_STATUS_CD= 'R'로 업데이트.
			mtPaymentVO2 = new MtPaymentVO();
			mtPaymentVO2.setPaymentDtFkKey(mtPaymentVO.getPaymentDtFkKey());
			mtPaymentVO2.setPaymentStatusCd(mtPaymentVO.getRequestStatus());
			mapper.updatePaymentDetailStatusCd(mtPaymentVO2);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	@Transactional
	public void updatePaymentRequestFinish(MtPaymentVO mtPaymentVO) throws Exception {
		MtPaymentVO mtPaymentVO2 = null;
		try {
			//1. 지급테이블(MT_PAYMENT_TB) 완료처리 : updatePaymentRequestFinish
			mapper.updatePaymentRequestFinish(mtPaymentVO);
			
			//2. 발주 미지급, 지급금액 변경 : updateOrderPaymentAmount
			mapper.updateOrderPaymentAmount(mtPaymentVO);
			
			if("BO".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getMtOrderType(), ""))) {
				//백오더인경우만 MT_PAYMENT_DETAIL_TB에 정보 업데이트.
				mtPaymentVO2 = new MtPaymentVO();
				mtPaymentVO2.setPaymentDtFkKey(mtPaymentVO.getPaymentDtFkKey());
				mtPaymentVO2.setPaymentDt(mtPaymentVO.getPaymentDt());
				mtPaymentVO2.setPaymentStatusCd(mtPaymentVO.getRequestStatus());
				mapper.updatePaymentDetailStatusCd(mtPaymentVO2);
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}
	
	@Override
	@Transactional
	public void updatePaymentRequestFinishDate(MtPaymentVO mtPaymentVO) throws Exception {
		MtPaymentVO mtPaymentVO2 = null;
		try {
			//1. 지급테이블(MT_PAYMENT_TB) 완료처리 : updatePaymentRequestFinish
			mapper.updatePaymentRequestFinish(mtPaymentVO);
			
	
			if("BO".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getMtOrderType(), ""))) {
				//백오더인경우만 MT_PAYMENT_DETAIL_TB에 정보 업데이트.
//				mtPaymentVO2 = new MtPaymentVO();
//				mtPaymentVO2.setPaymentDtFkKey(mtPaymentVO.getPaymentDtFkKey());
//				mtPaymentVO2.setPaymentDt(mtPaymentVO.getPaymentDt());
//				mtPaymentVO2.setPaymentStatusCd(mtPaymentVO.getRequestStatus());
				logger.debug("mtPaymentVO.getRequestStatus()=====>"+mtPaymentVO.getRequestStatus());
				mapper.updatePaymentDetailStatusCd(mtPaymentVO);
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	@Transactional
	public void cancelPaymentRequestFinish(MtPaymentVO mtPaymentVO) throws Exception {
		MtPaymentVO mtPaymentVO2 = null;
		
		try {
			//1. 지급테이블(MT_PAYMENT_TB) 취소처리 : cancelPaymentRequestFinish
			mapper.cancelPaymentRequestFinish(mtPaymentVO);
			
			//2. 발주 미지급, 지급금액 변경 : cancelOrderPaymentAmount
			mapper.cancelOrderPaymentAmount(mtPaymentVO);
			if("BO".equals(CepStringUtil.getDefaultValue(mtPaymentVO.getMtOrderType(), ""))) {
				mtPaymentVO2 = new MtPaymentVO();
				mtPaymentVO2.setPaymentDtFkKey(mtPaymentVO.getPaymentDtFkKey());
				mtPaymentVO2.setPaymentStatusCd("C");
				mapper.updatePaymentDetailStatusCd(mtPaymentVO2);
			}
			
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	public EgovMap selectMtBackOrderAmountInfo(String mtOrderKey) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectMtBackOrderAmountInfo(mtOrderKey);
	}

	@Override
	public EgovMap selectMtOrderAmountInfo(String mtOrderKey) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectMtOrderAmountInfo(mtOrderKey);
	}



}
