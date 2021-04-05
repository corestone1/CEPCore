package com.cep.mngProject.order.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cep.mngCommon.account.service.impl.AccountMapper;
import com.cep.mngCommon.account.vo.AccountSearchVO;
import com.cep.mngProject.order.service.MngProjectOrderService;
import com.cep.mngProject.order.vo.MngOrderInsertVO;
import com.cep.mngProject.order.vo.MngOrderSearchVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mngProjectOrderService")
public class MngProjectOrderServiceImpl implements MngProjectOrderService {

	private static final Logger logger = LoggerFactory.getLogger(MngProjectOrderServiceImpl.class);
	
	@Resource(name="mngProjectOrderMapper")
	private MngProjectOrderMapper mapper;
	
	@Resource(name="accountMapper")
	private AccountMapper acMapper;
	
	@Override
	public List<EgovMap> selectOrderList(MngOrderSearchVO mngOrderSearchVO) throws Exception
	{
		return mapper.selectOrderList(mngOrderSearchVO);
	}
	
	@Override
	public void deleteOrder(MngOrderSearchVO mngOrderSearchVO) throws Exception
	{
		//Order Table 삭제
		mapper.deleteOrder(mngOrderSearchVO);
		
		//Order Product Table 삭제
	}
	
	@Override
	public List<EgovMap> selectDirectorList(AccountSearchVO acSearchVO) throws Exception
	{
		return acMapper.selectDirectorList(acSearchVO);
	}
	
	@Override
	@Transactional
	public void writeOrderInfo(MngOrderInsertVO mngOrderInsertVO) throws Exception
	{
		//CMM_ORDER_TB 
		// - ORDER_AMOUNT : Insert or Update 때 CMM_ORDER_PRODUCT_TB TOTAL_AMOUNT 의 합을 구해서 입력
		
		//CMM_ORDER_PRODUCNT_TB
		// - ORDER_SEQ : 최종 순번 조회 후 +1 하여 채번
		
		
		//orderKey가 없으면 신규 있으며 Update로 처리
		if(mngOrderInsertVO.getOrderKey() == null || mngOrderInsertVO.getOrderKey().equals(""))
		{
			//신규 등록
			this.insertOrderInfo(mngOrderInsertVO);
		}
		else
		{
			//수정 Update
			this.updateOrderInfo(mngOrderInsertVO);
		}
		
	}
	
	@Transactional
	private void insertOrderInfo(MngOrderInsertVO mngOrderInsertVO) throws Exception
	{
		//ORDER_KEY 생성
		mngOrderInsertVO.setOrderKey(mapper.makeOrderKey());
		
		List<MngOrderInsertVO> lltProductVO = mngOrderInsertVO.getMngOrderInsertVOList();
		int litListSize = lltProductVO.size();
		
		// - ORDER_AMOUNT : 구하기
		MngOrderInsertVO productVO = null;				
		int  litOrderAmout = 0;
		for(int i = 0; i < litListSize; i++)
		{
			productVO = lltProductVO.get(i);
			
			litOrderAmout += productVO.getTotalAmount();
		}
		
		mngOrderInsertVO.setOrderAmount(litOrderAmout);
		
		//CMM_ORDER_TB Insert
		mapper.insertMngOrder(mngOrderInsertVO);
		
		for(int i = 0; i < litListSize; i++)
		{
			productVO = lltProductVO.get(i);
			
			productVO.setOrderKey(mngOrderInsertVO.getOrderKey());
			productVO.setOrderSeq(i+1);
			productVO.setRegEmpKey(mngOrderInsertVO.getRegEmpKey());
			
			logger.debug("productVO.getOrderQuantity()  : {}", productVO.getOrderQuantity());
			logger.debug("productVO.getOrderUprice()    : {}", productVO.getOrderUprice());
			logger.debug("productVO.getTotalAmount()    : {}", productVO.getTotalAmount());
			logger.debug("productVO.getOrderCategory()  : {}", productVO.getOrderCategory());
			logger.debug("productVO.getRemark()         : {}", productVO.getRemark());
			logger.debug("productVO.getOrderReceiptDt() : {}", productVO.getOrderReceiptDt());
			
			//CMM_ORDER_PRODUCT_TB Insert
			mapper.insertMngOrderProduct(productVO);
		}
		
		
	}
	
	@Transactional
	private void updateOrderInfo(MngOrderInsertVO mngOrderInsertVO) throws Exception
	{
		List<MngOrderInsertVO> lltProductVO = mngOrderInsertVO.getMngOrderInsertVOList();
		int litListSize = lltProductVO.size();
		
		// - ORDER_AMOUNT : 구하기
		MngOrderInsertVO productVO = null;				
		int  litOrderAmout = 0;
		for(int i = 0; i < litListSize; i++)
		{
			productVO = lltProductVO.get(i);
			
			litOrderAmout += productVO.getTotalAmount();
			
			logger.debug("---- {} : {} : {}", i, productVO.getTotalAmount(), litOrderAmout);
		}
		
		mngOrderInsertVO.setOrderAmount(litOrderAmout);
		
		//CMM_ORDER_TB Update
		mapper.updateMngOrder(mngOrderInsertVO);
		
		//기존 정보 삭제
		mapper.deleteOrderProductAll(mngOrderInsertVO);
		
		for(int i = 0; i < litListSize; i++)
		{
			productVO = lltProductVO.get(i);
			
			productVO.setOrderKey(mngOrderInsertVO.getOrderKey());
			productVO.setOrderSeq(i+1);
			productVO.setRegEmpKey(mngOrderInsertVO.getRegEmpKey());
			
			//신규
			//CMM_ORDER_PRODUCT_TB Insert
			mapper.insertMngOrderProduct(productVO);
		}
		
	}
	
	
	
	@Override
	public EgovMap selectOrderInfo(MngOrderSearchVO mngOrderSearchVO) throws Exception
	{
		return mapper.selectOrderInfo(mngOrderSearchVO);
	}
	
	@Override
	public List<EgovMap> selectOrderProductList(MngOrderSearchVO mngOrderSearchVO) throws Exception
	{
		return mapper.selectOrderProductList(mngOrderSearchVO);
	}
}
