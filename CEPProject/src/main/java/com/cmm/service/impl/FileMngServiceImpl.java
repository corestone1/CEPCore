package com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cmm.service.FileMngService;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.FileVO;

@Service("fileMngService")
public class FileMngServiceImpl implements FileMngService {
	
	@Resource(name="fileMngMapper")
	private FileMngMapper mapper;
	
	@Override
	public List<FileVO> selectFileList(FileVO fileVO) throws Exception {
		return mapper.selectFileList(fileVO);
	}
	
	@Override
	public FileVO selectFile(FileVO fileVO) throws Exception {
		return mapper.selectFile(fileVO);
	}
	
	@Override
	public String insertFile(MultipartHttpServletRequest multiRequest, Map<String, Object> param) throws Exception {
		FileVO fileVO = null;
		List<FileVO> fileList = null;
		
		String fileKey = CepStringUtil.getDefaultValue(param.get("fileKey"),"");
		Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		if(files.isEmpty()) {
			if("".equals(fileKey)) {
			}
		}
		return "";
	}
}
