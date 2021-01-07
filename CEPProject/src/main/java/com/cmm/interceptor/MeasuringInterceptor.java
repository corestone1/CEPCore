package com.cmm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MeasuringInterceptor extends HandlerInterceptorAdapter{
	//final private Logger logger = LogManager.getLogger(MeasuringInterceptor.class);


	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        try {
	        	System.out.println("SessionInterceptor : [init]");
	        	System.out.println(request.getSession().getAttribute("userInfo"));
	            //userInfo이라는 세션key를 가진 정보가 널일경우 로그인페이지로 이동
	            if(request.getSession().getAttribute("userInfo") == null ){
	                    response.sendRedirect("/");
	                    System.out.println("로그인 정보가 없습니다.");
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
