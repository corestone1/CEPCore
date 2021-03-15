package com.cep.main.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.cmm.vo.MailVO;

public interface MainService {
	int loginCheck(HashMap<String, String> map) throws Exception;
	int resetPw(HttpServletRequest request, MailVO mailVO) throws Exception; 
	String selectName(HashMap<String, String> map) throws Exception;
}
