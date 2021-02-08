package com.cmm.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cmm.service.FileMngService;
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
	public Object insertFile(MultipartHttpServletRequest multiRequest, Map<String, Object> param) throws Exception {
		List<HashMap> fileArrayList = new ArrayList<HashMap>();
	    HashMap fileHashMap;
	 
	    String filePath = "C:/test"; //파일 저장 경로, 설정파일로 따로 관리한다.
	 
	    File dir = new File(filePath); //파일 저장 경로 확인, 없으면 만든다.
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }
	 
	    Iterator<String> itr =  multiRequest.getFileNames(); //파일들을 Iterator 에 넣는다.
	 
	    while (itr.hasNext()) { //파일을 하나씩 불러온다.
	 
	        MultipartFile mpf = multiRequest.getFile(itr.next());
	        fileHashMap = new HashMap();
	 
	        String originalFilename = mpf.getOriginalFilename(); //파일명
	        String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
	 
	        try {
	            mpf.transferTo(new File(fileFullPath)); //파일저장
	            fileHashMap.put("originalFilename", originalFilename);
	 
	            fileArrayList.add(fileHashMap);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 
	    Map<String, Object> retVal = new HashMap<String, Object>(); //응답값 셋팅
	 
	    try{
	        retVal.put("fileInfoList", fileArrayList);    
	        retVal.put("successYN", "Y");
	    }catch(Exception e){
	        retVal.put("successYN", "N");
	    }
	    
	    return retVal;
	}
}
