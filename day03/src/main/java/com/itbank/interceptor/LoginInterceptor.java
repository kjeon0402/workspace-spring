package com.itbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 로그인 상태가 아닐 경우, 로그인 창으로 이동하는데
		// 로그인 성공 시, 원래 요청했던 주소로 이동시키려면 어떻게 할까
		
		// http://localhost:8080/day03/login?url=board
		String requestURL = request.getRequestURL().toString();
		System.out.println("원래 요청한 주소 : " + requestURL);
		
		HttpSession session = request.getSession();
		if(session.getAttribute("login") == null) {
			response.sendRedirect(request.getContextPath() + "/login?url=" + requestURL);
			return false;
		}
		return true;
	}
}
