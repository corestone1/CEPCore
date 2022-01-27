package com.cep.mngProject.perform.service;

import java.util.List;

import com.cep.mngProject.perform.vo.MngProjectPerformSearchVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MngProjectPerformService {
	
	public List<EgovMap> selectWorkList(MngProjectPerformSearchVO mngProjectPerformSearchVO) throws Exception;
	
	public List<EgovMap> selectInstallbaseList(MngProjectPerformSearchVO mngProjectPerformSearchVO) throws Exception;

}
