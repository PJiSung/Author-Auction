package com.kh.auction.common.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.auction.common.interceptpor.CheckWishlistInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	//사진 파일 경로 
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/**").addResourceLocations("file:///c:/uploadFiles/", "classpath:/static/");
		
		// 맥버전 제발 지우지 말아줘요ㅜㅜㅜㅜㅜ 	
//		registry.addResourceHandler("/**").addResourceLocations("file:/Users/kimgahyun/uploadFiles/", "classpath:/static/");
//		registry.addResourceHandler("/**").addResourceLocations("file:/Users/rosa/uploadFiles/", "classpath:/static/");
	}
	
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(new CheckAdminInterceptor()).addPathPatterns(".ad");
//	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(new CheckWishlistInterceptor()).addPathPatterns("/wishlist.ar","/artsDetail.ar","/payment.ar","/directPayment.ar","/pointpayment.ar");
	}
}
