package com.itbank.interceptor;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 클라이언트의 요청이 컨트롤러의 메서드에 도달하기 전에 작동한다
		// 반환값에 따라서 컨트롤러의 메서드를 예정대로 진행할지말지 결정할 수 있다
		System.out.println("preHandle");
		System.out.println(handler);
		
//		HttpSession session = request.getSession();			// 세션이 없으면 새로 생성해서 반환한다
		HttpSession session = request.getSession(false);	// 세션이 없으면 새로 생성하지 않는다
		
		if(session.getAttribute("login") == null) {			// 로그인 안되어있으면 처리할 코드 작성
			response.sendRedirect(request.getContextPath() + "/member/login");
			return false;
		}
		return true;
		
//		return true;	// 원래 요청대로 계속 진행해라(continue : true)
//		return false;	// 원래 요청대로 진행하지 마라(continue : false)
		
		// 응답이 커밋된 후에는 sendRedirect()를 호출할 수 없습니다
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 컨트롤러의 메서드가 수행되고 나서, view로 넘어가기 전에 작동하는 메서드
		
		Random ran = new Random();
		String[] bgcolor = {"burlywood", "skyblue", "#dadada"};
		modelAndView.addObject("bgcolor", bgcolor[ran.nextInt(3)]);
		
		System.out.println("postHandle");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// view가 클라이언트에게 전달된 이후 수행되는 메서드
		System.out.println("after");
	}
}