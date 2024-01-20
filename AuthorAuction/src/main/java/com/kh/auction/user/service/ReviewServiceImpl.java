package com.kh.auction.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.user.dao.ReviewDAO;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Reply;
import com.kh.auction.user.model.vo.Review;
import com.kh.auction.user.model.vo.SearchReview;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO rDAO;

	@Override
	public ArrayList<HashMap<String, Object>> getOrderList(HashMap<String, Object> map) {
		return rDAO.getOrderList(map);
	}
	
	@Override
	public int insertReview(Review r) {
		return rDAO.insertReview(r);
	}
	
	@Override
	public int insertAttm(ArrayList<Attachment> list) {
		return rDAO.insertAttm(list);
	}
	
	@Override
	public int getListCount() {
		return rDAO.getListCount();
	}

	@Override
	public ArrayList<Review> selectReviewList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return rDAO.selectReviewList(rowBounds);
	}

	@Override
	public ArrayList<Attachment> selectAttmList(Integer revNo) {
		return rDAO.selectAttmList(revNo);
	}

	@Override
	public int getSearchListCount(HashMap<String, String> map) {
		return rDAO.getSearchListCount(map);
	}

	@Override
	public ArrayList<Review> searchReview(HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return rDAO.searchReview(map, rowBounds);
	}

	@Override
	public int deleteReview(int revNo) {
		return rDAO.deleteReview(revNo);
	}

	@Override
	public int statusNAttm(int revNo) {
		return rDAO.statusNAttm(revNo);
	}

	@Override
	public Review selectReview(int revNo) {
		return rDAO.selectReview(revNo);
	}

	@Override
	public int deleteAttm(ArrayList<String> delRename) {
		return rDAO.deleteAttm(delRename);
	}

	@Override
	public void updateAttmLevel(int revNo) {
		rDAO.updateAttmLevel(revNo);
	}

	@Override
	public int updateReview(Review r) {
		return rDAO.updateReview(r);
	}

	@Override
	public int insertReviewList(HashMap<String, Object> map) {
		return rDAO.insertReviewList(map);
	}

	@Override
	public int selectReviewLike(int revNo) {
		return rDAO.selectReviewLike(revNo);
	}

	@Override
	public int deleteReviewLike(HashMap<String, Object> map) {
		return rDAO.deleteReviewLike(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> reviewLikeList() {
		return rDAO.reviewLikeList();
	}

	@Override
	public ArrayList<Review> selectReviewAllList() {
		return rDAO.selectReviewAllList();
	}

	@Override
	public int updateReviewCount(int revNo) {
		return rDAO.updateReviewCount(revNo);
	}

	@Override
	public int getReviewCount(int revNo) {
		return rDAO.getReviewCount(revNo);
	}

	@Override
	public int insertReply(Reply r) {
		return rDAO.insertReply(r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int revNo) {
		return rDAO.selectReplyList(revNo);
	}

	@Override
	public ArrayList<Reply> selectMyReplyList(SearchReview sr,  PageInfo pPi) {
		int offset = (pPi.getCurrentPage() -1)*pPi.getBoardLimit();
		int limit = pPi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return rDAO.selectMyReplyList(sr, rowBounds);
	}

	
	@Override
	public int updateReply(Reply r) {
		return rDAO.updateReply(r);
	}

	@Override
	public int deleteReply(int repNo) {
		return rDAO.deleteReply(repNo);
	}
	
	@Override
	public int getMyReviewListCount(SearchReview sr) {
		return rDAO.getMyReviewListCount(sr);
	}

	@Override
	public ArrayList<Review> selectMyReviewList(SearchReview sr, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return rDAO.selectMayReviewList(sr, rowBounds);
	}

	@Override
	public int getMyReplyListCount(SearchReview sr) {
		return rDAO.getMyReplyListCount(sr);
	}

	@Override
	public int deleteReplyList(int revNo) {
		return rDAO.deleteReplyList(revNo);
	}

	
	

	

	

	

	
}
