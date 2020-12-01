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

import com.cep.mngCommon.product.service.ProductService;
import com.cep.mngCommon.product.vo.ProductSearchVO;
import com.cep.mngCommon.product.vo.ProductVO;

@Controller
@RequestMapping(value="/mngCommon/product")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Resource(name="productService")
	private ProductService service;
	
	@RequestMapping(value="/list.do")
	public String selectProduct(@ModelAttribute("searchVO") ProductSearchVO searchVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		logger.debug("searchVO.getProductDivision() :: {}", searchVO.getProductDivision());
		logger.debug("searchVO.getProductFlag()     :: {}", searchVO.getProductFlag());
		logger.debug("searchVO.getProductMake()     :: {}", searchVO.getProductMake());
		logger.debug("searchVO.getProductName()     :: {}", searchVO.getProductName());
		
		List<ProductVO> lltProduct = service.selectProductList(searchVO);
		
		logger.debug("--------------------");
		
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
}
