package com.cmm.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.cmm.service.impl.FileMngMapper;
import com.cmm.vo.FileVO;

@Component("fileMngUtil")
public class FileMngUtil {
	@Value("#{comProps['fileStorePath']}")
	private String fileStorePath;
	
	@Resource(name="fileMngMapper")
	private FileMngMapper mapper;
	
	public List<FileVO> parseInsertFileInfo(Map<String, MultipartFile> files, String fileType, int fileKeyParam, String docTypeKey, String storePath) throws Exception {
		int fileKey = fileKeyParam;
		
		String storePathString = "";
		String docTypeKeyString = docTypeKey;
		
		if("".equals(storePath) || storePath == null) {
			storePathString = fileStorePath + fileType;
		} else {
			storePathString = storePath;
		}
		
		File saveFolder = new File(storePathString);
		
		if(!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.mkdirs();
		}
		
		Iterator<Entry<String, MultipartFile>> iterator = files.entrySet().iterator();
		MultipartFile file;
		String filePath = "";
		List<FileVO> result = new ArrayList<FileVO>();
		FileVO vo;
		
		while(iterator.hasNext()) {
			Entry<String, MultipartFile> entry = iterator.next();
			
			file = entry.getValue();
			String originFileName = file.getOriginalFilename();
			
			if("".equals(originFileName)) {
				continue;
			}
			
			int index = originFileName.lastIndexOf(".");
			String newName = fileType+"_"+fileKey;
			long _size = file.getSize();
			
			if(!"".equals(originFileName)) {
				filePath = storePathString + File.separator + newName;
				file.transferTo(new File(filePath));
			}
			vo = new FileVO();
			vo.setDocTypeKey(docTypeKeyString);
			vo.setFileOrgNm(originFileName);
			vo.setServerFileNm(newName);
			vo.setServerFilePath(storePathString);
			
			result.add(vo);
			
			fileKey++;
		}
		
		return result;
	}
}
