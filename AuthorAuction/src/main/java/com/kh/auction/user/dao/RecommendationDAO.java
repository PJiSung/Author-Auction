package com.kh.auction.user.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Recommendation;

@Mapper
public interface RecommendationDAO {

	int getListCount();
	ArrayList<Recommendation> selectRecommendationList(PageInfo pi, RowBounds rowBounds);
	ArrayList<Attachment> selectAttmList(Integer recNo);

	int insertRecommendation(Recommendation r);

	int insertAttm(ArrayList<Attachment> list);

	int getListCount2(HashMap<String, String> map);
	ArrayList<Recommendation> myRecommendationList(HashMap<String, String> map, RowBounds rowBounds);
	
	int deleteRecommendation(int recNo);
	int statusNRecommendation(int recNo);

	int checkDelete(String[] deleteIds);
	
	Recommendation selectRecommendation(int recNo);
	ArrayList<Attachment> selectAttmRecommendationList(int recNo);
	
	int deleteAttm(ArrayList<String> delRename);
	void updateAttmLevel(int recNo);
	int updateRecommendation(Recommendation r);
	ArrayList<Attachment> getAttachmentsByBno(int recNo);
	
	int insertReply(Recommendation r);
	int insertAttmReply(Attachment a);
	
	int updateAttmReply(HashMap<String, Object> map);
	int deleteAttmReply(String delRename);
	int updateReply(Recommendation r);
	ArrayList<Attachment> selectAttm();
	
	
	
	

}
