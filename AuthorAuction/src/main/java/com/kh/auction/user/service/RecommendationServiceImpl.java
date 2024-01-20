package com.kh.auction.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.user.dao.RecommendationDAO;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Recommendation;

@Service
public class RecommendationServiceImpl implements RecommendationService{

	@Autowired
	RecommendationDAO rDAO;
	
	// 그림추천 리스트
	@Override
	public int getListCount() {
		return rDAO.getListCount();
	}
	@Override
	public ArrayList<Recommendation> selectRecommendationList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return rDAO.selectRecommendationList(pi, rowBounds);
	}
	@Override
	public ArrayList<Attachment> selectAttmList(Integer recNo) {
		return rDAO.selectAttmList(recNo);
	}
	// 그림추천 글 등록(글)	
	@Override
	public int insertRecommendation(Recommendation r) {
		return rDAO.insertRecommendation(r);
	}
	// 그림추천 글 등록(문의)	
	@Override
	public int insertAttm(ArrayList<Attachment> list) {
		return rDAO.insertAttm(list);
	}
	// 마이페이지 리스트
	@Override
	public int getListCount2(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return rDAO.getListCount2(map);
	}
	@Override
	public ArrayList<Recommendation> myRecommendationList(HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return rDAO.myRecommendationList(map, rowBounds);
	}
	// 글 삭제
	@Override
	public int deleteRecommendation(int recNo) {
		return rDAO.deleteRecommendation(recNo);
	}
	@Override
	public int statusNRecommendation(int recNo) {
		return rDAO.statusNRecommendation(recNo);
	}
	// 체크박스 삭제
	@Override
	public int checkDelete(String[] deleteIds) {
		return rDAO.checkDelete(deleteIds);
	}
	// 상세조회
	@Override
	public Recommendation selectRecommendation(int recNo) {
		return rDAO.selectRecommendation(recNo);
	}
	@Override
	public ArrayList<Attachment> selectAttmRecommendationList(int recNo) {
		return rDAO.selectAttmRecommendationList(recNo);
	}
	// 글 수정
	@Override
	public int deleteAttm(ArrayList<String> delRename) {
		return rDAO.deleteAttm(delRename);
	}
	@Override
	public void updateAttmLevel(int recNo) {
		rDAO.updateAttmLevel(recNo);
	}
	@Override
	public int updateRecommendation(Recommendation r) {
		return rDAO.updateRecommendation(r);
	}
	@Override
	public ArrayList<Attachment> getAttachmentsByBno(int recNo) {
		return rDAO.getAttachmentsByBno(recNo);
	}
	// 답글 등록
	@Override
	public int insertReply(Recommendation r) {
		return rDAO.insertReply(r);
	}
	@Override
	public int insertAttmReply(Attachment a) {
		return rDAO.insertAttmReply(a);
	}
	// 답글 수정
	@Override
	public int updateAttmReply(HashMap<String, Object> map) {
		return rDAO.updateAttmReply(map);
	}
	@Override
	public int deleteAttmReply(String delRename) {
		return rDAO.deleteAttmReply(delRename);
	}
	@Override
	public int updateReply(Recommendation r) {
		return rDAO.updateReply(r);
	}

}
