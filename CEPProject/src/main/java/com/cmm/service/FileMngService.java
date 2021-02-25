package com.cmm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cmm.vo.FileVO;

public interface FileMngService {
	public List<?> selectFileList(FileVO fileVO) throws Exception;
	public FileVO selectFile(FileVO fileVO) throws Exception;
	public Map<String, Object> insertFile(FileVO fileVO, MultipartHttpServletRequest multiRequest) throws Exception;
	public Map<String, Object> deleteFile(FileVO fileVO, HttpServletRequest request) throws Exception;
}
