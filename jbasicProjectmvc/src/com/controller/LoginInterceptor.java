package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LoginInterceptor implements HandlerInterceptor  {
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        //获取请求的URL  
//	        String url = request.getRequestURI();  
//	        // 前台不拦截webmain/  后台只有登录不拦截qir
//	        if(url.indexOf("qir")>=0||url.indexOf("webmain")>=0)//前台controller需要webadmin/news_index命名规则
//	        {
//	        	return true;
//	        }
//	        String user = (String)request.getSession().getAttribute("admin");
//	        if(user!=null)
//	        {
//	        	return true;
//	        }
//	        request.getRequestDispatcher("error.jsp").forward(request, response);
//	        return false;
	        return true;
	    }

	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	       
	    }

	    @Override
	    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	      
	    }
}
