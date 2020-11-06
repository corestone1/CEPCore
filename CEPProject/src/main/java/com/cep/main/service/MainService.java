package com.cep.main.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface MainService {
	int loginCheck(HashMap<String, String> map) throws Exception;
	int resetPw(HttpServletRequest request) throws Exception; 
	String selectName(HashMap<String, String> map) throws Exception;
}
