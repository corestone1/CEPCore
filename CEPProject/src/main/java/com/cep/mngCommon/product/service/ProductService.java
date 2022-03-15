/**
 * 
 */
package com.cep.mngCommon.product.service;

import java.util.List;
import java.util.Map;

import com.cep.mngCommon.product.vo.ProductSearchVO;
import com.cep.mngCommon.product.vo.ProductVO;

/**
 * @File Name : ProductService.java
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

public interface ProductService {

	/**
	  * @Method Name : selectProductList
	  * @Cdate       : 2020. 11. 25.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description : 제품목록을 조회 한다.
	  * @param ProductSearchVO
	  * @return
	  * @throws Exception
	  */
	List<ProductVO> selectProductList(ProductSearchVO searchVO) throws Exception;
	
	/**
	  * @Method Name : selectProductList
	  * @Cdate       : 2020. 11. 25.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description : 제품 상세 정보를 조회한다.
	  * @param ProductSearchVO
	  * @return
	  * @throws Exception
	  */
	ProductVO selectProductDetail(ProductVO productVO) throws Exception;
	
	/**
	  * @Method Name : selectOrderProductList
	  * @Cdate       : 2021. 11. 25.
	  * @Author      : sylim
	  * @Modification: 
	  * @Method Description : 발주된 제품목록을 조회 한다.
	  * @param ProductSearchVO
	  * @return
	  * @throws Exception
	  */
	List<ProductVO> selectOrderProductList(ProductSearchVO searchVO) throws Exception;
	
	
	
	/**
	  * @Method Name : insertProduct
	  * @Cdate       : 2021. 1. 11.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description : 제품을 등록합니다.
	  * @param productVO
	  * @throws Exception
	  */
	Map<String, Object> insertProduct(ProductVO productVO) throws Exception;
}
