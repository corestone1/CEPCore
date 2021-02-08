package com.cmm.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cmm.vo.FileVO;

public interface FileMngService {
	List<FileVO> selectFileList(FileVO fileVO) throws Exception;
	FileVO selectFile(FileVO fileVO) throws Exception;
	Object insertFile(MultipartHttpServletRequest multiRequest, Map<String, Object> param) throws Exception;
}
