package com.cmm.web;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.cmm.service.FileMngService;
import com.cmm.util.StringUtil;
import com.cmm.vo.FileVO;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;

@Controller
public class FileMngController {
	
	@Resource(name="fileMngService")
	private FileMngService service;
	
	@Resource(name="messageSource")
	private MessageSource messageSource;
	
	@Resource(name="fileDownloadView")
	private FileDownloadView fileDownloadView;
	
	@RequestMapping(value = "/file/download.do")
	public ModelAndView download(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception{
		
		FileVO vo = new FileVO();
		vo.setFileKey(Integer.parseInt(StringUtil.nullToString(param.get("fileKey"))));
		FileVO fileVO = service.selectFile(vo);
		if(fileVO == null) {
			throw new EgovBizException(messageSource.getMessage("FILENOTEXIST", null, null, new SessionLocaleResolver().resolveLocale(request)));
		}
		
		File file = new File(fileVO.getServerFilePath() + File.separator + fileVO.getServerFileNm());
		ModelAndView mav = new ModelAndView();
		
		String fileOrgNm = StringUtil.replace(fileVO.getFileOrgNm(), "&#39;", "'");
		
		mav.setView(this.fileDownloadView);
		mav.addObject("downloadFile", file);
		mav.addObject("fileVO", vo);
		mav.addObject("fileOrgNm", fileOrgNm);
		
		return mav;
	}
}
