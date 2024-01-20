package com.kh.auction.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.user.dao.OrderDAO;
import com.kh.auction.user.dao.ReviewDAO;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Order;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Reply;
import com.kh.auction.user.model.vo.Review;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO oDAO;

	@Override
	public ArrayList<Order> selectOrderList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return oDAO.selectOrderList(rowBounds);
	}

	@Override
	public int getListCount() {
		return oDAO.getListCount();
	}

	@Override
	public HashMap<String, Object> selectAdmOrder(String ordNo) {
		return oDAO.selectAdmOrder(ordNo);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectAdmProduct(String ordNo) {
		return oDAO.selectAdmProduct(ordNo);
	}

	@Override
	public int updateOrderStatus(HashMap<String, Object> map) {
		return oDAO.updateOrderStatus(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectMyOrderList(String id, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return oDAO.selectMyOrderList(id, rowBounds);
	}

	@Override
	public int getMyListCount(String id) {
		return oDAO.getMyListCount(id);
	}

	@Override
	public int cancelOrder(String ordNo) {
		return oDAO.cancelOrder(ordNo);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectMyOrderAllList(String id) {
		return oDAO.selectMyOrderAllList(id);
	}

	@Override
	public int getSearchListCount(HashMap<String, String> map) {
		return oDAO.getSearchListCount(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> searchOrderList(HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return oDAO.searchOrderList(map, rowBounds);
	}

	@Override
	public int getSearchAdmListCount(HashMap<String, Object> map) {
		return oDAO.getSearchAdmListCount(map);
	}

	@Override
	public ArrayList<Order> searchAdmOrderList(HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return oDAO.searchAdmOrderList(map, rowBounds);
	}

	@Override
	public ArrayList<Attachment> selectAttmList() {
		return oDAO.selectAttmList();
	}




	

	

	
}
