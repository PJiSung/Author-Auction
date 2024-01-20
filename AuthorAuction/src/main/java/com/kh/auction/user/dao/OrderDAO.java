package com.kh.auction.user.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Order;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Review;

@Mapper
public interface OrderDAO {

	ArrayList<Order> selectOrderList(RowBounds rowBounds);

	int getListCount();

	HashMap<String, Object> selectAdmOrder(String ordNo);

	ArrayList<HashMap<String, Object>> selectAdmProduct(String ordNo);

	int updateOrderStatus(HashMap<String, Object> map);

	ArrayList<HashMap<String, Object>> selectMyOrderList(String id, RowBounds rowBounds);

	int getMyListCount(String id);

	int cancelOrder(String ordNo);

	ArrayList<HashMap<String, Object>> selectMyOrderAllList(String id);

	int getSearchListCount(HashMap<String, String> map);

	ArrayList<HashMap<String, Object>> searchOrderList(HashMap<String, String> map, RowBounds rowBounds);

	int getSearchAdmListCount(HashMap<String, Object> map);

	ArrayList<Order> searchAdmOrderList(HashMap<String, Object> map, RowBounds rowBounds);

	ArrayList<Attachment> selectAttmList();

	
	
}
