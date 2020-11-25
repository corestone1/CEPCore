package com.cmm.service.impl;

import com.cmm.vo.MailVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mailMapper")
public interface MailMapper {
	void insertMailInfo(MailVO mailVO) throws Exception;
}