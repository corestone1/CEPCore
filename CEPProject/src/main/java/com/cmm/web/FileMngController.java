package com.cmm.web;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.cmm.service.FileMngService;
import com.cmm.util.CepStringUtil;
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
	public ModelAndView downloadFile(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception{
		
		FileVO vo = new FileVO();
		int x = Integer.parseInt((param.get("fileKey")).toString());
		vo.setFileKey(x);
		FileVO fileVO = service.selectFile(vo);
		if(fileVO == null) {
			throw new EgovBizException("파일이 없습니다.");
		}
		
		File file = new File(fileVO.getServerFilePath() + File.separator + fileVO.getServerFileNm());
		ModelAndView mav = new ModelAndView();
		
		String fileOrgNm = CepStringUtil.replace(fileVO.getFileOrgNm(), "&#39;", "'");
		
		mav.setView(this.fileDownloadView);
		mav.addObject("downloadFile", file);
		mav.addObject("fileVO", vo);
		mav.addObject("fileOrgNm", fileOrgNm);
		
		return mav;
	}
	
	@RequestMapping(value = "/file/upload.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> uploadFile(FileVO fileVO, MultipartHttpServletRequest multiRequest) throws Exception {
		Map<String, Object> returnMap = null;
		returnMap = service.insertFile(fileVO, multiRequest);
		
	   	return returnMap;
	}
	
	@RequestMapping(value = "/file/delete.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteFile(@RequestBody FileVO fileVO, HttpServletRequest request) throws Exception {
		Map<String, Object> returnMap = null;
		returnMap = service.deleteFile(fileVO, request);
		
	   	return returnMap;
	}
}
