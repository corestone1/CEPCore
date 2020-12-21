package com.cmm.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cmm.service.FileMngService;
import com.cmm.util.FileMngUtil;
import com.cmm.util.StringUtil;
import com.cmm.vo.FileVO;

@Service("fileMngService")
public class FileMngServiceImpl implements FileMngService {
	
	@Resource(name="fileMngMapper")
	private FileMngMapper mapper;
	
	@Resource(name="fileMngUtil")
	private FileMngUtil fileMngUtil;
	
	@Override
	public List<FileVO> selectFileList(FileVO fileVO) throws Exception {
		return mapper.selectFileList(fileVO);
	}
	
	@Override
	public FileVO selectFile(FileVO fileVO) throws Exception {
		return mapper.selectFile(fileVO);
	}
	
	@Override
	public int insertFile(MultipartHttpServletRequest multiRequest, Map<String, Object> param) throws Exception {
		FileVO fileVO = null;
		List<FileVO> fileList = null;
		
		int fileKey = Integer.parseInt(StringUtil.nullToString(param.get("fileKey")));
		Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		if(files.isEmpty()) {
			if("".equals(fileKey)) {
				fileList = fileMngUtil.parseInsertFileInfo(files, StringUtil.nullToString(param.get("fileType")), fileKey, StringUtil.nullToString(param.get("docTypeKey")), "");
			
				if(fileList.size() > 0) {
					fileKey = fileList.get(0).getFileKey();
				}
			} else {
				FileVO vo = new FileVO();
				vo.setFileKey(fileKey);

				int cnt = mapper.getMaxFileKey(vo);
				
				fileList = fileMngUtil.parseInsertFileInfo(files, StringUtil.nullToString(param.get("fileType")), cnt, StringUtil.nullToString(param.get("docTypeKey")), "");
			}
		}
		
		if(fileList != null) {
			Iterator<?> iter = fileList.iterator();
			while(iter.hasNext()) { 
				fileVO = (FileVO)iter.next();
				
				mapper.insertFile(fileVO);
			}
		}
		return fileKey;
	}
}
