package com.kh.auction.common.interceptpor;

import java.io.PrintWriter;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.auction.user.model.vo.Member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CheckWishlistInterceptor implements HandlerInterceptor {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		
			if(((Member)request.getSession().getAttribute("loginUser")) == null) {
			
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println("<script>alert('로그인 후 이용해주세요'); location.href = 'loginView'; </script>");
			
			return false;
			}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
}