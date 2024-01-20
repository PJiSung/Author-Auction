package com.kh.auction.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Reply;
import com.kh.auction.user.model.vo.Review;
import com.kh.auction.user.model.vo.SearchReview;

public interface ReviewService {

	ArrayList<HashMap<String, Object>> getOrderList(HashMap<String, Object> map);

	int insertReview(Review r);

	int insertAttm(ArrayList<Attachment> list);
	
	int getListCount();

	ArrayList<Review> selectReviewList(PageInfo pi);

	ArrayList<Attachment> selectAttmList(Integer revNo);

	int getSearchListCount(HashMap<String, String> map);

	ArrayList<Review> searchReview(HashMap<String, String> map, PageInfo pi);

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

	ArrayList<Reply> selectMyReplyList(SearchReview sr, PageInfo pPi);

	int updateReply(Reply r);
	
	int deleteReply(int repNo);

	int getMyReviewListCount(SearchReview sr);
	
	ArrayList<Review> selectMyReviewList(SearchReview sr, PageInfo pi);

	int getMyReplyListCount(SearchReview sr);

	int deleteReplyList(int revNo);



	
	

	

}
