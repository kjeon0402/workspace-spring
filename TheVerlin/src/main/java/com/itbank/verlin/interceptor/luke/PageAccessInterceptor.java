package com.itbank.verlin.interceptor.luke;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PageAccessInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        String requestURL = request.getRequestURL().toString();

        if(session.getAttribute("login") != null) {
            System.out.println("클릭");
            response.sendRedirect(request.getContextPath() + request.getHeader("REFERER"));
            return false;
        }
        return true;
    }
}
