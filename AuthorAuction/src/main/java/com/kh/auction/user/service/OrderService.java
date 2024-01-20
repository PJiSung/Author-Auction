package com.kh.auction.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Order;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Review;

public interface OrderService {

	ArrayList<Order> selectOrderList(PageInfo pi);

	int getListCount();

	HashMap<String, Object> selectAdmOrder(String ordNo);

	ArrayList<HashMap<String, Object>> selectAdmProduct(String ordNo);

	int updateOrderStatus(HashMap<String, Object> map);

	ArrayList<HashMap<String, Object>> selectMyOrderList(String id, PageInfo pi);

	int getMyListCount(String id);

	int cancelOrder(String ordNo);

	ArrayList<HashMap<String, Object>> selectMyOrderAllList(String id);

	int getSearchListCount(HashMap<String, String> map);

	ArrayList<HashMap<String, Object>> searchOrderList(HashMap<String, String> map, PageInfo pi);

	int getSearchAdmListCount(HashMap<String, Object> map);

	ArrayList<Order> searchAdmOrderList(HashMap<String, Object> map, PageInfo pi);

	ArrayList<Attachment> selectAttmList();




	



	
	

	

}
