package com.kh.auction.user.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.auction.user.model.vo.Inquiry;

@Mapper
public interface InquiryDAO {

	void insertInquiry(Inquiry inq);
	
}
