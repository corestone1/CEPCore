package com.cep.mngCommon.product.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.mngCommon.code.service.CodeService;
import com.cep.mngCommon.code.vo.CodeSearchVO;
import com.cep.mngCommon.product.service.ProductService;
import com.cep.mngCommon.product.vo.ProductSearchVO;
import com.cep.mngCommon.product.vo.ProductVO;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
@RequestMapping(value="/mngCommon/product")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Resource(name="productService")
	private ProductService service;
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@RequestMapping(value="/list.do")
	public String selectProduct(@ModelAttribute("searchVO") ProductSearchVO searchVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		logger.debug("searchVO.getProductDivision() :: {}", searchVO.getProductDivision());
		logger.debug("searchVO.getProductFlag()     :: {}", searchVO.getProductFlag());
		logger.debug("searchVO.getProductMake()     :: {}", searchVO.getProductMake());
		logger.debug("searchVO.getProductName()     :: {}", searchVO.getProductName());
		
		List<ProductVO> lltProduct = service.selectProductList(searchVO);
		
		model.put("displayUtil", new CepDisplayUtil());
		
		model.put("productList", lltProduct);
		
		return "mngCommon/product/list";
	}
	
	@RequestMapping(value="/delete.do")
	@ResponseBody
	public Map<String, Object> deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		logger.debug(":::::: PM_KEY ======= {}", request.getParameter("PM_KEY"));
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		return returnMap;
		 
	}
	
	
	@RequestMapping(value="/writePopup.do")
	public String writePopup(@ModelAttribute("searchVO") ProductVO productVO, ModelMap model) throws Exception {
		
		logger.debug("=============== writePopup ======================");
	
		CodeSearchVO codeSearchVO = new CodeSearchVO();
		codeSearchVO.setCdUpCd("PRODUCT");
		
		model.put("PM_CLASS", codeService.selectCodeList(codeSearchVO));
		model.put("productVO", service.selectProductDetail(productVO));
		model.put("displayUtil", new CepDisplayUtil());
		model.put("manufacturerList", CepStringUtil.getManuFacturerList());
		
		return "mngCommon/product/write";
	}

	@RequestMapping(value="/popup/searchListPopup.do")
	public String selectPopupProject(@ModelAttribute("searchVO") ProductSearchVO searchVO, ModelMap model) throws Exception {
		
		
		logger.debug("searchVO.getProductDivision() :: {}", searchVO.getProductDivision());
		logger.debug("searchVO.getProductFlag()     :: {}", searchVO.getProductFlag());
		logger.debug("searchVO.getProductMake()     :: {}", searchVO.getProductMake());
		logger.debug("searchVO.getProductName()     :: {}", searchVO.getProductName());
		
		logger.debug("searchVO.getReturnType()    :: {}", searchVO.getReturnType());
		logger.debug("searchVO.getReturnKey()     :: {}", searchVO.getReturnKey());
		logger.debug("searchVO.getReturnNm()      :: {}", searchVO.getReturnNm());
		
		
		List<ProductVO> lltProduct = service.selectProductList(searchVO);
		
		model.put("returnType", searchVO.getReturnType());
		model.put("returnKey",  searchVO.getReturnKey());
		model.put("returnNm",   searchVO.getReturnNm());
		
		model.put("displayUtil", new CepDisplayUtil());
		
		model.put("productList", lltProduct);
		
		return "mngCommon/product/popup/searchList";
	}
	
	@RequestMapping(value="/popup/orderSearchListPopup.do")
	public String selectPopupOrderProduct(@ModelAttribute("searchVO") ProductSearchVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		
		logger.debug("searchVO.getProductDivision() :: {}", searchVO.getProductDivision());
		logger.debug("searchVO.getProductFlag()     :: {}", searchVO.getProductFlag());
		logger.debug("searchVO.getProductMake()     :: {}", searchVO.getProductMake());
		logger.debug("searchVO.getProductName()     :: {}", searchVO.getProductName());
		
		logger.debug("searchVO.getReturnType()    :: {}", searchVO.getReturnType());
		logger.debug("searchVO.getReturnKey()     :: {}", searchVO.getReturnKey());
		logger.debug("searchVO.getReturnNm()      :: {}", searchVO.getReturnNm());
		
		searchVO.setSearchKey(request.getParameter("searchKey"));
		List<ProductVO> lltProduct = service.selectOrderProductList(searchVO);
		
		model.put("returnType", searchVO.getReturnType());
		model.put("returnKey",  searchVO.getReturnKey());
		model.put("returnNm",   searchVO.getReturnNm());
		
		model.put("displayUtil", new CepDisplayUtil());
		
		model.put("productList", lltProduct);
		
		return "mngCommon/product/popup/orderSearchList";
	}
	    
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/write.do")
	@ResponseBody
	public Map<String, Object> insert(@ModelAttribute("producntVO") ProductVO productVO, HttpServletRequest request) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		
		logger.debug("=============== writePopup ======================");
		logger.debug("=== productVO.getPmDetailClassCd() = {}", productVO.getPmDetailClassCd());
		logger.debug("=== productVO.getPmLineCd()        = {}", productVO.getPmLineCd());
		logger.debug("=== productVO.getPmNmCd()          = {}", productVO.getPmNmCd());
		logger.debug("=== productVO.getPmReleaseDt()     = {}", productVO.getPmReleaseDt());
		logger.debug("=== productVO.getPmRemark()        = {}", productVO.getPmRemark());
		logger.debug("=== productVO.getMfAcKey()         = {}", productVO.getMfAcKey());
		
		try {
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			productVO.setRegEmpKey(sessionMap.get("empKey"));
			
			returnMap = service.insertProduct(productVO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return returnMap;
	}
}
