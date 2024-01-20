package com.kh.auction.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.user.dao.ConsignmentDAO;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Consignment;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.SearchConsignment;

@Service
public class ConsignmentServiceImpl implements ConsignmentService{

	@Autowired
	private ConsignmentDAO cDAO;
	
	// 위탁 문의 등록(글)
	@Override
	public int insertConsignment(Consignment c) {
		return cDAO.insertConsignment(c);
	}          
	// 위탁 문의 등록(첨부)
	@Override
	public int insertAttm(ArrayList<Attachment> list) {
		return cDAO.insertAttm(list);
	}
	// 마이페이지 리스트	
	@Override
	public int getListCount(String memId) {
		return cDAO.getListCount(memId);
	}
	// 마이페이지 리스트	
	@Override
	public ArrayList<Consignment> selectConsignmentList(String memId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return cDAO.selectConsignmentList(memId, rowBounds);
	}
	// 마이페이지 검색
	@Override
	public int searchCount(HashMap<String, Object> map) {
		return cDAO.searchCount(map);
	}
	// 마이페이지 검색	
	@Override
	public ArrayList<Consignment> searchList(HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return cDAO.searchList(map, rowBounds);
	}
	// 상세조회
	@Override
	public Consignment selectConsignment(int conNo) {
		return cDAO.selectConsignment(conNo);
	}
	// 상세조회 첨부 리스트
	@Override
	public ArrayList<Attachment> selectAttmConsignmentList(int conNo) {
		return cDAO.selectAttmConsignmentList(conNo);
	}
	// 관리자 열람여부
	@Override
	public int updateConAdmStatus(int conNo) {
		return cDAO.updateConAdmStatus(conNo);
	}
	// 상세조회 멤버 가져옴
	@Override
	public Member selectMember(int conNo) {
		return cDAO.selectMember(conNo);
	}
	// 글 삭제
	@Override
	public int deleteConsignment(int conNo) {
		return cDAO.deleteConsignment(conNo);
	}
	// 글 삭제
	@Override
	public int statusNConsignment(int conNo) {
		return cDAO.statusNConsignment(conNo);
	}
	// 글 수정(첨부)
	@Override
	public int updateAttmFno(Attachment a) {
		return cDAO.updateAttmFno(a);
	}
	// 글 수정(글)
	@Override
	public int updateConsignment(Consignment c) {
		return cDAO.updateConsignment(c);
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////////

	
	
	// 관리자 상세조회
	@Override
	public Consignment selectUser(int conNo) {
		return cDAO.selectUser(conNo);
	}
	// 관리자 첨부 상세조회
	@Override
	public ArrayList<Consignment> selectAttmUserList(int conNo) {
		return cDAO.selectAttmUserList(conNo);
	}
	// 관리자 체크 삭제
	@Override
	public int checkDelete(String[] deleteIds) {
		return cDAO.checkDelete(deleteIds);
	}
	// 관리자 조건 검색(리스트)
	@Override
	public int searchCount2(SearchConsignment sc) {
		return cDAO.searchCount2(sc);
	}
	// 관리자 조건 검색(리스트)
	@Override
	public ArrayList<Consignment> searchList2(SearchConsignment sc, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return cDAO.searchList2(sc, rowBounds);
	}
	// 수락 / 거절(멤버 가져옴)
	@Override
	public ArrayList<HashMap<String, Object>> selectAuctionMList() {
		return cDAO.selectAuctionMList();
	}
	// 수락 / 거절(클릭) 상태 변경
	@Override
	public int updateConConStatus(HashMap<String, Object> map) {
		return cDAO.updateConConStatus(map);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
