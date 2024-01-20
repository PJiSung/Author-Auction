package com.kh.auction.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Auction;
import com.kh.auction.user.model.vo.Consignment;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.SearchConsignment;

public interface ConsignmentService {
	
	// 위탁 문의 등록(글)
	int insertConsignment(Consignment c);
	// 위탁 문의 등록(첨부)      
	int insertAttm(ArrayList<Attachment> list);
	// 마이페이지 리스트
	int getListCount(String memId);
	// 마이페이지 리스트
	ArrayList<Consignment> selectConsignmentList(String memId, PageInfo pi);
	// 마이페이지 검색
	int searchCount(HashMap<String, Object> map);
	// 마이페이지 검색
	ArrayList<Consignment> searchList(HashMap<String, Object> map, PageInfo pi);
	// 상세조회
	Consignment selectConsignment(int conNo);
	// 상세조회 첨부 리스트
	ArrayList<Attachment> selectAttmConsignmentList(int conNo);
	// 관리자 열람여부
	int updateConAdmStatus(int conNo);	
	// 상세조회 멤버 가져옴
	Member selectMember(int conNo);
	// 글 삭제
	int deleteConsignment(int conNo);
	// 글 삭제
	int statusNConsignment(int conNo);
	// 글 수정(글)
	int updateConsignment(Consignment c);
	// 글 수정(첨부)
	int updateAttmFno(Attachment a);
	
	
	
	////////////////////////////////////////////////////////////////////////////////
	
	
	
	// 관리자 상세조회
	Consignment selectUser(int conNo);
	// 관리자 첨부 상세조회
	ArrayList<Consignment> selectAttmUserList(int conNo);
	// 관리자 체크 삭제
	int checkDelete(String[] deleteIds);
	// 관리자 검색
	int searchCount2(SearchConsignment sc);
	// 관리자 검색
	ArrayList<Consignment> searchList2(SearchConsignment sc, PageInfo pi);
	// 수락 / 거절(멤버 가져옴) > 시간 지정하려고 가져옴
	ArrayList<HashMap<String, Object>> selectAuctionMList();
	// 수락 / 거절(클릭) 상태 변경
	int updateConConStatus(HashMap<String, Object> map);

	
	
	
	
	
	
	
	
}
