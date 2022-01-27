package com.cep.mngProject.perform.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cep.mngProject.perform.service.MngProjectPerformService;
import com.cep.mngProject.perform.vo.MngProjectPerformSearchVO;
import com.cmm.service.ComService;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;

@Controller
@RequestMapping("/mngProject/perform")
public class MngProjectPerformController {
	
	private static final Logger logger = LoggerFactory.getLogger(MngProjectPerformController.class);
	
	@Resource(name="mngProjectPerformService")
	private MngProjectPerformService service;
	
	@Resource(name="comService")
	private ComService comService;
	
	
	@RequestMapping(value="/list.do")
	public String selectPerformWork(@ModelAttribute("searchVO") MngProjectPerformSearchVO searchVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		String toDay = null;
		
		try
		{
			logger.debug("{}", service.selectWorkList(searchVO));
			
			toDay = CepDateUtil.getToday(null);		
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getPerformDtFrom(), ""))){
				searchVO.setPerformDtFrom(searchVO.getPerformDtFrom().replace("-", ""));
			} else {
				searchVO.setPerformDtFrom(CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6));
			}
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getPerformDtTo(), ""))){
				searchVO.setPerformDtTo(searchVO.getPerformDtTo().replace("-", ""));
			} else {
				searchVO.setPerformDtTo(toDay);
			}
			
			model.put("performDtFrom", CepDateUtil.convertDisplayFormat(searchVO.getPerformDtFrom(), null, null));
			model.put("performDtTo", CepDateUtil.convertDisplayFormat(searchVO.getPerformDtTo(), null, null));
			model.addAttribute("workList", service.selectWorkList(searchVO));
			model.put("displayUtil", new CepDisplayUtil());
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "mngProject/perform/workList";
	}
	
	@RequestMapping(value="/installbase/list.do")
	public String selectPerformInstallbase(@ModelAttribute("searchVO") MngProjectPerformSearchVO searchVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		String toDay = null;
		
		try
		{
			logger.debug("{}", service.selectInstallbaseList(searchVO));
			
			toDay = CepDateUtil.getToday(null);		
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getPerformDtFrom(), ""))){
				searchVO.setPerformDtFrom(searchVO.getPerformDtFrom().replace("-", ""));
			} else {
				searchVO.setPerformDtFrom(CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6));
			}
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getPerformDtTo(), ""))){
				searchVO.setPerformDtTo(searchVO.getPerformDtTo().replace("-", ""));
			} else {
				searchVO.setPerformDtTo(toDay);
			}
			
			model.put("performDtFrom", CepDateUtil.convertDisplayFormat(searchVO.getPerformDtFrom(), null, null));
			model.put("performDtTo", CepDateUtil.convertDisplayFormat(searchVO.getPerformDtTo(), null, null));
			model.addAttribute("installbaseList", service.selectInstallbaseList(searchVO));
			model.put("displayUtil", new CepDisplayUtil());
		}catch(Exception e){
			logger.error("{}", e);
		}
		
		return "mngProject/perform/installbaseList";
	}
	
}
