package com.kh.auction.user.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.user.dao.MainDAO;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Inquiry;
import com.kh.auction.user.model.vo.Product;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	MainDAO mDao;

	@Override
	public String selectImg(String id) {
		return mDao.selectImg(id);
	}

	@Override
	public void insertInquiry(Inquiry inq) {
		mDao.insertInquiry(inq);
	}

	@Override
	public int getWishCount(String id) {
		return mDao.getWishCount(id);
	}

	@Override
	public ArrayList<Product> selectTopOrder() {
		return mDao.selectTopOrder();
	}

	@Override
	public ArrayList<Attachment> selectTopOrderAttm() {
		return mDao.selectTopOrderAttm();
	}

	@Override
	public ArrayList<Attachment> selectTopAuction() {
		return mDao.selectTopAuction();
	}

}
