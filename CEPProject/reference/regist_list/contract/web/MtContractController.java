package com.cep.maintenance.contract.web;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.maintenance.contract.service.MtContractService;
import com.cep.maintenance.contract.vo.MtDefaultVO;
import com.cep.maintenance.contract.vo.MtSalesAmountVO;
import com.cep.maintenance.contract.vo.MtContractProductVO;
import com.cep.maintenance.contract.vo.MtContractVO;
import com.cmm.util.CepDateUtil;
import com.cmm.util.StringUtil;

@Controller
@RequestMapping("/maintenance/contract")
public class MtContractController {
	private static final Logger logger = LoggerFactory.getLogger(MtContractController.class);
	@Resource(name="mtContractService")
	private MtContractService service;

	
	/**
	 * 
	  * @Method Name : writeProductInfo
	  * @Cdate       : 2020. 11. 25.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description : 유지보수계약 제품정보를 등록하는 화면으로 이동
	  * @param request
	  * @param mtContractVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/productInfoView.do")
	public String writeProductInfoView(HttpServletRequest request, MtContractProductVO productVO, ModelMap model) throws Exception {
				
		try {
						
//			model.put("mtIntegrateKey", productVO.getMtIntegrateKey());		
//			model.put("parmMtSbCtYn", productVO.getParmMtSbCtYn()); //백계약여부.
			model.put("updateYn", productVO.getUpdateYn());	
			model.put("mtIntegrateKey", "MA200024");	
			model.put("parmMtSbCtYn", "Y"); //백계약여부.
			
			model.put("successYN", "Y");
		} catch (Exception e) {
			model.put("successYN", "N");
		}
		
		return "maintenance/contract/write/productInfo";
	}
	
	/**
	 * 
	  * @Method Name : writeProductInfo
	  * @Cdate       : 2020. 12. 3.
	  * @Author      : aranghoo
	  * @Modification: 
	  * @Method Description :유지보수계약 제품정보를 등록.
	  * @param request
	  * @param mtContractVO
	  * @param model
	  * @return
	  * @throws Exception
	 */
	@RequestMapping(value="/write/productInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> writeProductInfo(HttpServletRequest request, @RequestBody MtContractProductVO productVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		
		try {			
			logger.debug("mtIntegrateKey===>"+productVO.getMtIntegrateKey());
			logger.debug("parmMtSbCtYn===>"+productVO.getParmMtSbCtYn());
			
			logger.debug("size=>"+productVO.getMtContractProductVoList().size());
			for (int i = 0; i < productVO.getMtContractProductVoList().size(); i++) {
				logger.debug("getMtPmFkKey ===>"+productVO.getMtContractProductVoList().get(i).getMtPmFkKey());
			}
			sessionMap =(HashMap)request.getSession().getAttribute("admin");
			
			service.writeMtContractProductList(productVO.getMtIntegrateKey(), sessionMap.get("empKey"), productVO.getMtContractProductVoList());
			
			returnMap.put("mtIntegrateKey", productVO.getMtIntegrateKey());
			returnMap.put("parmMtSbCtYn", productVO.getParmMtSbCtYn()); //백계약여부.
			returnMap.put("updateYn", "N");
			returnMap.put("successYN", "Y");
		} catch (Exception e) {
			logger.error("",e);
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}
	
	
}
