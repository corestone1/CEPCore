package com.cep.mngMaint.bill.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.maintenance.contract.service.MtContractService;
import com.cep.mngMaint.bill.service.MngMaintBillService;
import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;
import com.cep.mngMaint.bill.vo.MngMaintBillVO;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
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
		try {
			
			billCallKey = contService.makePrimaryKey(PrimaryKeyType.MAINTENACE_BILLING_OP);
			if(!"".equals(CepStringUtil.getDefaultValue(billCallKey, ""))) {
				
				mngMaintBillVO.setBillCallKey(billCallKey);
				mngMaintBillVO.setBillIssueStatus("R");
				mapper.insertBillRequest(mngMaintBillVO);
				//MT_SALES_DETAIL_TB.SALES_STATUS_CD 업데이트.
				mapper.updateSaleDetailStatusCd(mngMaintBillVO);
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
		try {
			maintBillVO.setBillCallKey(mngMaintBillVO.getBillCallKey());
			maintBillVO.setBillCtFkKey(mngMaintBillVO.getBillCtFkKey());
			maintBillVO.setBillIssueStatus(null);
			//세금계산서 요청 삭제.
			mapper.deleteBillRequest(maintBillVO);
			
			//MT_SALES_DETAIL_TB.SALES_STATUS_CD 업데이트.
			mapper.updateSaleDetailStatusCd(maintBillVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	@Override
	@Transactional
	public void updateBillIssueStatus(MngMaintBillVO mngMaintBillVO) throws Exception {
		
		MngMaintBillVO maintBillVO = new MngMaintBillVO();
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
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}

	@Override
	public List<EgovMap> selectBillList(MngMaintBillSearchVO searchVO) throws Exception {
		
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
			 */
			mapper.updateSaleDetailStatusCd(maintBillVO);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}

	
	
}
