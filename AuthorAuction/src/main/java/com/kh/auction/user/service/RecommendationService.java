package com.kh.auction.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Recommendation;

public interface RecommendationService {

	// 그림추천 리스트
	int getListCount();
	ArrayList<Recommendation> selectRecommendationList(PageInfo pi);
	ArrayList<Attachment> selectAttmList(Integer recNo);
	// 그림추천 글 등록(글)
	int insertRecommendation(Recommendation r);
	// 그림추천 글 등록(첨부)	
	int insertAttm(ArrayList<Attachment> list);
	// 마이페이지 리스트
	int getListCount2(HashMap<String, String> map);
	ArrayList<Recommendation> myRecommendationList(HashMap<String, String> map, PageInfo pi);
	// 글 삭제
	int deleteRecommendation(int recNo);
	int statusNRecommendation(int recNo);
	// 체크박스 삭제
	int checkDelete(String[] deleteIds);
	// 상세조회
	Recommendation selectRecommendation(int recNo);
	ArrayList<Attachment> selectAttmRecommendationList(int recNo);
	// 글 수정
	int deleteAttm(ArrayList<String> delRename);
	void updateAttmLevel(int recNo);
	int updateRecommendation(Recommendation r);
	// 답글 등록
	int insertReply(Recommendation r);
	int insertAttmReply(Attachment a);
	// 답글 수정
	int updateAttmReply(HashMap<String, Object> map);
	int deleteAttmReply(String delRename);
	int updateReply(Recommendation r);
	ArrayList<Attachment> getAttachmentsByBno(int recNo);
	
	
	
	
	
}
