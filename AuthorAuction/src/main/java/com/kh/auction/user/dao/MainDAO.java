package com.kh.auction.user.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Inquiry;
import com.kh.auction.user.model.vo.Product;

@Mapper
public interface MainDAO {

	String selectImg(String id);

	void insertInquiry(Inquiry inq);

	int getWishCount(String id);

	ArrayList<Product> selectTopOrder();

	ArrayList<Attachment> selectTopOrderAttm();

	ArrayList<Attachment> selectTopAuction();
}
