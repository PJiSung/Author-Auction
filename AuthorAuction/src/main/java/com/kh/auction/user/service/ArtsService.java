package com.kh.auction.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.auction.user.model.vo.Address;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Order;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Product;
import com.kh.auction.user.model.vo.Sellstatic;
import com.kh.auction.user.model.vo.Wishlist;

public interface ArtsService {

	ArrayList<Product> selectArtslist(PageInfo pi, HashMap<String, Object> map);

	ArrayList<Wishlist> selectWishlist(String loginid);

	int getlistCount(HashMap<String, Object> map);

	Product selectArts(int proNo);

	int updatewishlist(Wishlist updatewis);

	int deletewis(Wishlist deletewis);

	int deletewishlist(HashMap<String, Object> map);

	int insertOrder(Order order);

	int deletewisAll(String loginid);

	int insertOrderDetail(HashMap<String, Object> map);

	int addtowishlist(Wishlist addwis);

	int selectWish(Wishlist w);

	int updatepointBonus(HashMap<String, Object> pm);

	int updateProductamount(HashMap<String, Object> map);

	int insertAddress(HashMap<String, Object> rmap);

	int updatePoint(HashMap<String, Object> map);

	ArrayList<Address> selectAddresslist(String memId);

	ArrayList<Attachment> selectAttmlist(ArrayList<Product> plist);

	int insertOrderwithalreadyaddr(Order order);

	int selectPoint(String memId);

	int getlistCountadmin(HashMap<String, Object> map);

	ArrayList<Product> selectArtslistadmin(PageInfo pi, HashMap<String, Object> map);

	int deleteArts(int proNo);

	int insertProduct(Product product);

	int insertAttachment(Attachment a);

	int updateArts(Product product);

	int deleteAttachment(HashMap<String, Object> map);

//	int insertPayment(Payment payment);

	int updateMemrat(HashMap<String, Object> map);

	int updateThumb(HashMap<String, Object> tumbmap);

	int updatememAcc(HashMap<String, Object> accmap);

	int updateGrade(HashMap<String, Object> pm);

	ArrayList<Product> selectMimicArts(int proNo);

	ArrayList<Sellstatic> selectSellstatic();

	Sellstatic selectSelldata();

	Attachment selectAttmlistforsell(int proNo);

	int getWishCount(String memId);





}
