package com.kh.auction.common.interceptpor;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.auction.user.model.vo.Member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CheckAdminInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser == null || loginUser.getMemIsAdmin().equals("N")) {
			String url = request.getRequestURI();
			String msg = null;
			if(url.contains(".ad")) {
				msg = "페이지 접근 권한이 없습니다";
			}
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().write("<script>alert('" + msg + "'); location.href='/';</script>");
			return false;
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
