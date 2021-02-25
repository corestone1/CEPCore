package com.cmm.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cmm.service.impl.FileMngMapper;

@Component("fileMngUtil")
public class FileMngUtil {
	
	@Value("#{comProps['fileStorePath']}")
	private String filePath;
	
	@Resource(name="fileMngMapper")
	private FileMngMapper mapper;
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> parseInsertFileInfo(MultipartHttpServletRequest request) throws Exception {
		
		HashMap<String, String> session = null;
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		
		/*Iterator<String> iterator = request.getFileNames();*/
		List<MultipartFile> fileList = request.getFiles("file");
		
		/*MultipartFile multipartFile = null;*/
		String originFileName = null;
		String originFileExtn = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		
		File file = new File(filePath + CepDateUtil.getToday("yyyy") + File.separator + CepDateUtil.getToday("MM") + File.separator);
		if(file.exists() == false) {
			file.mkdirs();
		}
		try {
			/*while(iterator.hasNext()) {*/
			for(MultipartFile multipartFile : fileList) {
				/*multipartFile = request.getFile(iterator.next());*/
				/*if(multipartFile.isEmpty() == false) {*/
					/*originFileName = multipartFile.getOriginalFilename();
					originFileExtn = originFileName.substring(originFileName.lastIndexOf("."));
					storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originFileExtn;*/
					
					originFileName = multipartFile.getOriginalFilename();
					originFileExtn = originFileName.substring(originFileName.lastIndexOf("."));
					storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originFileExtn;
				
					file = new File(filePath + CepDateUtil.getToday("yyyy") + File.separator + CepDateUtil.getToday("MM") + File.separator + storedFileName);
					/*multipartFile.transferTo(file);*/
					multipartFile.transferTo(file);
					
					listMap = new HashMap<String, Object>();
					listMap.put("serverFilePath", filePath + CepDateUtil.getToday("yyyy") + File.separator + CepDateUtil.getToday("MM"));
					listMap.put("fileOrgNm", originFileName);
					listMap.put("serverFileNm", storedFileName);
					listMap.put("fileSize", multipartFile.getSize());
					listMap.put("regEmpKey", session.get("empKey"));
					listMap.put("docTypeNm", request.getParameter("docTypeNm"));
					listMap.put("fileCtKey", request.getParameter("fileCtKey"));
					list.add(listMap);
				/*}*/
			}
		} catch(Exception e) {
			throw new Exception(e);
		}
		return list;
	}
}
