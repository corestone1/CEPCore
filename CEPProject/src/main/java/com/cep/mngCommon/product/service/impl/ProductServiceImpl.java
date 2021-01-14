/**
 * 
 */
package com.cep.mngCommon.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.mngCommon.product.service.ProductService;
import com.cep.mngCommon.product.vo.ProductSearchVO;
import com.cep.mngCommon.product.vo.ProductVO;

/**
 * @File Name : ProductServiceImpl.java
 * @Project   : CEPProject
 * @Author    : ynk
 * @Cdate     : 2020. 11. 25.
 * @version   : 1.0
 * @Description : 
 * @Modification Information
 * @
 * @  수정일                        수정자            수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 11. 25.                최초생성
 *
 *  Copyright (C) by CORESTONE All right reserved.
 */
@Service("productService")
public class ProductServiceImpl implements ProductService {

	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Resource(name="productMapper")
	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> selectProductList(ProductSearchVO searchVO) throws Exception {
		logger.debug("=======================");
		return mapper.selectProductList(searchVO);
	}
	
	@Override
	public void insertProduct(ProductVO productVO) throws Exception {
		//Product Key 생성
		productVO.setPmKey("PM000002");
		
		mapper.insertProduct(productVO);
	}

}
