package com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import com.cmm.vo.FileVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("fileMngMapper")
public interface FileMngMapper {
	public List<FileVO> selectFileList(FileVO fileVO);
	public FileVO selectFile(FileVO fileVO);
	public int getMaxFileKey(FileVO vo);
	public void insertFile(Map<String, Object> vo);
	public void insertFileBizInfo(Map<String, Object> vo);
	public void deleteFile(FileVO fileVO);
	public void deleteFileBizInfo(FileVO fileVO);
}
