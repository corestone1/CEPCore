/**
 * 
 */
package com.cep.mngCommon.product.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cep.mngCommon.product.service.ProductService;
import com.cep.mngCommon.product.vo.ProductSearchVO;
import com.cep.mngCommon.product.vo.ProductVO;
import com.cmm.config.PrimaryKeyType;
import com.cmm.service.ComService;
import com.cmm.util.CepStringUtil;

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
	
	@Resource(name="comService")
	private ComService comService;
	
	@Override
	public List<ProductVO> selectProductList(ProductSearchVO searchVO) throws Exception {
		return mapper.selectProductList(searchVO);
	}
	
	@Override
	public ProductVO selectProductDetail(ProductVO productVO) throws Exception {
		return mapper.selectProductDetail(productVO);
	}
	
	@Override
	public List<ProductVO> selectOrderProductList(ProductSearchVO searchVO) throws Exception {
		return mapper.selectOrderProductList(searchVO);
	}
	
	@Override
	@Transactional
	public Map<String, Object> insertProduct(ProductVO productVO) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String pmKey = "";
		
		try {
			if(CepStringUtil.getDefaultValue(productVO.getPmKey(), "").equals("")) {
				pmKey = comService.makePrimaryKey(PrimaryKeyType.PRODUCT);
				productVO.setPmKey(pmKey);
				
				mapper.insertProduct(productVO);
			} else {
				mapper.updateProduct(productVO);
			}
			
			returnMap.put("pmKey", productVO.getPmKey());
			returnMap.put("successYN", "Y");
		} catch(Exception e) {
			e.printStackTrace();
			returnMap.put("successYN", "N");
		}
		
		return returnMap;
	}

}
