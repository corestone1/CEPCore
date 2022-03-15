/**
 * 
 */
package com.cep.mngCommon.product.service.impl;

import java.util.List;
       
import com.cep.mngCommon.product.vo.ProductSearchVO;
import com.cep.mngCommon.product.vo.ProductVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * @File Name : ProductMapper.java
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

@Mapper("productMapper")
public interface ProductMapper {
	
	public List<ProductVO> selectProductList(ProductSearchVO searchVO) throws Exception;
	
	public ProductVO selectProductDetail(ProductVO productVO) throws Exception;
	
	public List<ProductVO> selectOrderProductList(ProductSearchVO searchVO) throws Exception;

	public void insertProduct(ProductVO productVO) throws Exception;
	
	public void updateProduct(ProductVO productVO) throws Exception;
}
