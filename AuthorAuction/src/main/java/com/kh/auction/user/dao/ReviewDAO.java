package com.kh.auction.user.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Reply;
import com.kh.auction.user.model.vo.Review;
import com.kh.auction.user.model.vo.SearchReview;

@Mapper
public interface ReviewDAO {

	ArrayList<HashMap<String, Object>> getOrderList(HashMap<String, Object> map);

	int insertReview(Review r);

	int insertAttm(ArrayList<Attachment> list);

	ArrayList<Review> selectReviewList(RowBounds rowBounds);

	int getListCount();

	ArrayList<Attachment> selectAttmList(Integer revNo);

	int getSearchListCount(HashMap<String, String> map);

	ArrayList<Review> searchReview(HashMap<String, String> map, RowBounds rowBounds);

	int deleteReview(int revNo);

	int statusNAttm(int revNo);

	Review selectReview(int revNo);

	int deleteAttm(ArrayList<String> delRename);

	void updateAttmLevel(int revNo);

	int updateReview(Review r);

	int insertReviewList(HashMap<String, Object> map);

	int selectReviewLike(int revNo);

	int deleteReviewLike(HashMap<String, Object> map);

	ArrayList<HashMap<String, Object>> reviewLikeList();

	ArrayList<Review> selectReviewAllList();

	int updateReviewCount(int revNo);

	int getReviewCount(int revNo);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int revNo);
	
	ArrayList<Reply> selectMyReplyList(SearchReview sr, RowBounds rowBounds);

	int deleteReply(int repNo);

	int updateReply(Reply r);
	
	int getMyReviewListCount(SearchReview sr);

	ArrayList<Review> selectMayReviewList(SearchReview sr, RowBounds rowBounds);

	int getMyReplyListCount(SearchReview sr);

	int deleteReplyList(int revNo);

	

	

	
}
