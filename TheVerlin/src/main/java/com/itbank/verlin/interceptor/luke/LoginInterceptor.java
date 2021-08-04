package com.itbank.verlin.interceptor.luke;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURL = request.getRequestURL().toString();
		HttpSession session = request.getSession();
		if(session.getAttribute("login") == null) {
//			System.out.println(request.getContextPath() + "/member/login?url=" + requestURL);
//			response.sendRedirect(request.getContextPath() + "/member/login?url=" + requestURL);
			response.sendRedirect(request.getContextPath() + "/member/login");
			return false;
		}
		else{
			System.out.println("로그인 상태");
			System.out.println(requestURL);
		}
		return true;
		
	}
}

