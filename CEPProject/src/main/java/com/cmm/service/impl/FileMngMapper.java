package com.cmm.service.impl;

import java.util.List;

import com.cmm.vo.FileVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("fileMngMapper")
public interface FileMngMapper {
	public List<FileVO> selectFileList(FileVO fileVO);
	public FileVO selectFile(FileVO fileVO);
}
