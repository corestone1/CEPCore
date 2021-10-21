package com.cep.mngMaint.bill.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.maintenance.contract.service.MtContractService;
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
			
			//세금계산서 정보 등록
			mapper.updatetBillInfo(maintBillVO);
			
			/*
			 * 1. 유지보수 매출세금계산서 정보를 업데이트 한다.		
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
	public void updateSdPaymentStatus(MngMaintBillVO mngMaintBillVO) throws Exception {
		/*
		 * '계산서 발급 상태 - R:요청 >> I:발급 >> M:매핑 >> E: 수금 or 지급 완료'
		 *  E : 수금완료처리.
		 */
		
		MngMaintBillVO maintBillVO = new MngMaintBillVO();
		try {
			
			
			if("E".equals(CepStringUtil.getDefaultValue(mngMaintBillVO.getBillIssueStatus(), ""))) {
				//수금완료처리인 경우.
				maintBillVO.setSalesCollectFinishDt(CepDateUtil.getToday("yyyyMMdd")); //수금완료일자=오늘날짜.
			} else if("M".equals(CepStringUtil.getDefaultValue(mngMaintBillVO.getBillIssueStatus(), ""))) {
				//수금취소 처리인 경우.
				maintBillVO.setSalesCollectFinishDt(null); //수금완료일자=오늘날짜.
			}
			maintBillVO.setModEmpKey(mngMaintBillVO.getModEmpKey()); //수정자
			maintBillVO.setBillIssueStatus(mngMaintBillVO.getBillIssueStatus());
			
			//where
			maintBillVO.setBillCallKey(mngMaintBillVO.getBillCallKey());			
			maintBillVO.setBillCtFkKey(mngMaintBillVO.getBillCtFkKey());
			
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
			paymentRequestInfo = mapper.selectPaymentRequestInfo(searchVO);
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

	@Transactional
	private void writePaymentRequestInfo2(MtPaymentVO mtPaymentVO) throws Exception {
		try {
			//매입요청정보 등록
			mapper.writePaymentRequestInfo(mtPaymentVO);
			
			//세금계산서 맵핑정보 업데이트.
			mapper.updatePaymentRequestBill(mtPaymentVO);
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
	public void updatePaymentRequestConfirm(MtPaymentVO mtPaymentVO) throws Exception {
		try {
			mapper.updatePaymentRequestConfirm(mtPaymentVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	public void cancelPaymentRequestConfirm(MtPaymentVO mtPaymentVO) throws Exception {
		try {
			mapper.cancelPaymentRequestConfirm(mtPaymentVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	@Transactional
	public void updatePaymentRequestFinish(MtPaymentVO mtPaymentVO) throws Exception {
		try {
			//1. 지급테이블(MT_PAYMENT_TB) 완료처리 : updatePaymentRequestFinish
			mapper.updatePaymentRequestFinish(mtPaymentVO);
			
			//2. 발주 미지급, 지급금액 변경 : updateOrderPaymentAmount
			mapper.updateOrderPaymentAmount(mtPaymentVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	@Transactional
	public void cancelPaymentRequestFinish(MtPaymentVO mtPaymentVO) throws Exception {
		try {
			//1. 지급테이블(MT_PAYMENT_TB) 취소처리 : cancelPaymentRequestFinish
			mapper.cancelPaymentRequestFinish(mtPaymentVO);
			
			//2. 발주 미지급, 지급금액 변경 : cancelOrderPaymentAmount
			mapper.cancelOrderPaymentAmount(mtPaymentVO);
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
