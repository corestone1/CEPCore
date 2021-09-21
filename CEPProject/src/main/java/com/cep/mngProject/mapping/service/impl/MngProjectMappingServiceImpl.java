package com.cep.mngProject.mapping.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.cep.mngProject.mapping.service.MngProjectMappingService;
import com.cep.mngProject.mapping.vo.OrderBillVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.util.CepStringUtil;

@Service("mngProjectMappingService")
public class MngProjectMappingServiceImpl implements MngProjectMappingService {

	@Resource(name="mngProjectMappingMapper")
	private MngProjectMappingMapper mapper;

	@Override
	public List<?> selectOrderBillList(OrderBillVO orderBillVO) throws Exception {
		List<?> resultList = null;
		try {
			resultList = mapper.selectOrderBillList(orderBillVO);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return resultList;
	}
	
	@Override
	public OrderBillVO selectOrderDetail(OrderBillVO orderBillVO) throws Exception {
		OrderBillVO resultVO = null;
		try {
			resultVO = mapper.selectOrderDetail(orderBillVO);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return resultVO;
	}
	
	@Override
	public List<?> selectBillDetail(OrderBillVO orderBillVO) throws Exception {
		List<?> resultList = null;
		try {
			resultList = mapper.selectBillDetail(orderBillVO);
		} catch(Exception e) {
			throw new Exception(e);
		}
		
		return resultList;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> updateOrderBill(HttpServletRequest request, OrderBillVO orderBillVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		Map<String, Object> param = null;
		
		try {
			session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
			orderBillVO.setModEmpKey(session.get("empKey"));
			
			mapper.updateOrder(orderBillVO);
			
			param = new HashMap<>();
			param.put("regEmpKey", session.get("empKey"));
			param.put("modEmpKey", session.get("empKey"));
			param.put("billList", orderBillVO.getBillList());
				
			mapper.updatePurchaseBill(param);
			mapper.insertPcBillingOpInfo(param);
			System.out.println(request.getParameter("paymentKey"));
			if("".equals(CepStringUtil.getDefaultValue(request.getParameter("paymentKey"), ""))) { 
				mapper.insertPaymentInfo(param);
			} else {
				param.put("paymentKey", request.getParameter("paymentKey"));
				mapper.updatePaymentInfo(param);
			}
			
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			returnMap.put("successYN", "N");
			throw new Exception(e);
		}
		
		return returnMap;
	}
}
