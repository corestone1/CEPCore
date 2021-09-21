package com.cep.mngMaint.bill.service.impl;

import java.util.List;

import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.mngMaint.bill.vo.MngMaintBillSearchVO;
import com.cep.mngMaint.bill.vo.MngMaintBillVO;
import com.cep.mngProject.bill.vo.MngProjectBillSearchVO;
import com.cep.mngProject.bill.vo.MngProjectBillVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mngMaintBillMapper")
public interface MngMaintBillMapper {
	
	/**
	 * 세금계산서 요청 기본정보 좌측 메인 조회.
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 3:51:11
	 * @author aranghoo
	 */
	public EgovMap selectBillBasicInfo(MngMaintBillSearchVO searchVO) throws Exception;
	
	
	/**
	 * 세금계산서 요청(오른쪽메뉴) 저장 정보  조회.
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 7:36:22
	 * @author aranghoo
	 */
	public EgovMap selectBillDetailInfo(MngMaintBillSearchVO searchVO) throws Exception;
	
	/**
	 * 세금계산서 요청(오른쪽메뉴)을 위한  기본정보 조회(MT_SALES_DETAIL_TB)
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 7:44:30
	 * @author aranghoo
	 */
	public EgovMap selectBillDefaultInfo(MngMaintBillSearchVO searchVO) throws Exception;
	
	/**
	 * 세금계산서 요청 등록
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 10:06:58
	 * @author aranghoo
	 */
	public void insertBillRequest(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	/**
	 * MT_SALES_DETAIL_TB .SALES_STATUS_CD 업데이트
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 10:54:27
	 * @author aranghoo
	 */
	public void  updateSaleDetailStatusCd(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	
	/**
	 * 세금계산서 요청 수정.
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 8. 30. 오후 10:07:15
	 * @author aranghoo
	 */
	public void updateBillRequest(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	/**
	 * 세금계산서 발급취소.
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 8. 31. 오후 12:36:09
	 * @author aranghoo
	 */
	public void deleteBillRequest(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	/**
	 * 세금계산서 정보등록 관리.
	 * <pre>
	 * </pre>
	 * 
	 * @param mngMaintBillVO
	 * @throws Exception
	 * @cdate 2021. 9. 2. 오후 5:11:49
	 * @author aranghoo
	 */
	public void updatetBillInfo(MngMaintBillVO mngMaintBillVO) throws Exception;
	
	/**
	 * 기존계산서 정보 조회.
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 8. 31. 오전 11:41:08
	 * @author aranghoo
	 */
	public List<EgovMap> selectSdBillList(MngMaintBillSearchVO searchVO) throws Exception;

	/**
	 * 유지보수 발주목록 리스트(유지보수관리 ==>발주목록)
	 * <pre>
	 * </pre>
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 * @cdate 2021. 9. 15. 오후 4:27:28
	 * @author aranghoo
	 */
	public List<EgovMap> selectMtOrdertList(MtDefaultVO searchVO) throws Exception;
}
