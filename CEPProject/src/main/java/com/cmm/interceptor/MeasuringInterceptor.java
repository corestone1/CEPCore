package com.cmm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cmm.util.CepStringUtil;

public class MeasuringInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(MeasuringInterceptor.class);

	private void saveURL(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		if(CepStringUtil.getDefaultValue(query, "").equals("")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		if(request.getMethod().equals("GET")) {
			logger.info("url: " + (uri + query));
			request.getSession().setAttribute("url", uri + query);
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try {
        	/*System.out.println("SessionInterceptor : [init]");
			System.out.println(request.getSession().getAttribute("userInfo"));*/
			//userInfo이라는 세션key를 가진 정보가 널일경우 로그인페이지로 이동
			if(request.getSession().getAttribute("userInfo") == null ) {
				response.sendRedirect("/");
				logger.info("로그인 정보가 없습니다.");
				saveURL(request);
				return false;
		    } 
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
		//userInfo 세션key 존재시 main 페이지 이동
        return true;
	}
	 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	    super.postHandle(request, response, handler, modelAndView);
	    
	   /* HttpSession session = request.getSession();
	    ModelMap modelMap = modelAndView.getModelMap();
	    Object userInfo = modelMap.get("userInfo");
	    
	    if(userInfo != null) {
	    	Object url = session.getAttribute("url");
	    	response.sendRedirect(url != null ? (String) url : "/");
	    }*/
	}
	 
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
	 
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    super.afterConcurrentHandlingStarted(request, response, handler);
	}
	
}
