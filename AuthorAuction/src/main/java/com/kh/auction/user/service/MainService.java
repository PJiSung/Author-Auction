package com.kh.auction.user.service;

import java.util.ArrayList;

import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Inquiry;
import com.kh.auction.user.model.vo.Product;

public interface MainService {

	String selectImg(String id);

	void insertInquiry(Inquiry inq);

	int getWishCount(String id);

	ArrayList<Product> selectTopOrder();

	ArrayList<Attachment> selectTopOrderAttm();

	ArrayList<Attachment> selectTopAuction();
}
