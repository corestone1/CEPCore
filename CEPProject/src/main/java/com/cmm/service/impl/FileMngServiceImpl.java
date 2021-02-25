package com.cmm.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cmm.service.FileMngService;
import com.cmm.util.FileMngUtil;
import com.cmm.vo.FileVO;

@Service("fileMngService")
public class FileMngServiceImpl implements FileMngService {
	
	@Resource(name="fileMngMapper")
	private FileMngMapper mapper;
	
	@Resource(name="fileMngUtil")
	private FileMngUtil fileUtils;
	
	@Override
	public List<?> selectFileList(FileVO fileVO) throws Exception {
		return mapper.selectFileList(fileVO);
	}
	
	@Override
	public FileVO selectFile(FileVO fileVO) throws Exception {
		return mapper.selectFile(fileVO);
	}
	
	@Override
	@Transactional
	public Map<String, Object> insertFile(FileVO fileVO, MultipartHttpServletRequest multiRequest) throws Exception {
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(multiRequest);
		Map<String, Object> retVal = new HashMap<String, Object>(); //응답값 셋팅
	 
	    try{
	    	for(int i = 0; i < list.size(); i++) {
				Map<String, Object> vo = list.get(i);
				mapper.insertFile(vo);
				mapper.insertFileBizInfo(vo);
			}
	        /*retVal.put("fileInfoList", fileArrayList);    */
	        retVal.put("successYN", "Y");
	    }catch(Exception e){
	        retVal.put("successYN", "N");
	    }
	    
	    return retVal;
	}
	
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public Map<String, Object> deleteFile(FileVO fileVO, HttpServletRequest request) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> session = null;
		session = (HashMap<String, String>) request.getSession().getAttribute("userInfo");
		
		File file = null;
		
		FileVO vo = mapper.selectFile(fileVO);
		
		// 파일이 db에 존재하지 않음.
		if(vo == null){
			throw new Exception("파일이 DB에 존재하지 않습니다.");
		}
		// 파일이 물리적 경로에 존재하지 않음.
		file = new File(vo.getServerFilePath() + File.separator + vo.getServerFileNm());
		if(!file.exists()){
			throw new Exception("파일이 경로에 존재하지 않습니다.");
		}
		
		// 첨부파일 물리적 경로에서 삭제 
		/*if (file.exists() && !file.delete()){
			file.delete();
			throw new EgovBizException("삭제에 실패하였습니다.");
		}*/
	
		// 첨부파일 DB 삭제
		if(vo != null || file.exists()) {
			fileVO.setModEmpKey(session.get("empKey"));
			mapper.deleteFile(fileVO);
			mapper.deleteFileBizInfo(fileVO);
		}
		
		returnMap.put("successYN", "Y");
	    
	    return returnMap;
	}
	
}
