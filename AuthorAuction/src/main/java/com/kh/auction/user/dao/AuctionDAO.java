package com.kh.auction.user.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Auction;
import com.kh.auction.user.model.vo.BiddingDetail;
import com.kh.auction.user.model.vo.Consignment;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Product;

@Mapper 
public interface AuctionDAO {
	
	// 진행중인 모든 경매의 수를 가지고옴
	int getAllOngingAuctionNum();
	
	//진행중인 경매를 가지고옴
	ArrayList<Auction> getAllAuction(String sort, RowBounds rowBounds);

	//경매 번호로 경매 세부내용을 들고옴
	Auction getAuctionDetail(int aucNo);

	//hashmap을 이용해 진행여부, 내용에 대한 경매들을 들고옴
	ArrayList<Auction> getAdminSearchList(HashMap<String, String> hm, RowBounds rowBounds);

	//입찰 - ajax  경매금액 업데이트
	int insertBid(HashMap<String, Object> hm);

	//유찰된 금액 환불
	void returnUnsold(HashMap<String, Object> hm);
	
	//입찰성공시에 금액 감소
	void updateMoneyInsertBid(HashMap<String, Object> hm);

	//입찰 성공시에 입찰내역 업데이트
	void insertBiddingDetail(HashMap<String, Object> hm);
	
	//상세페이지 이동시 관심 목록 여부 확인
	int checkLike(HashMap<String, Object> hm);

	//관심 목록 등록
	int insertLike(HashMap<String, Object> hm);

	//관심 목록 삭제
	int deleteLike(HashMap<String, Object> hm);

	//경매 내부의 사진을 들고옴
	ArrayList<Attachment> getAuctionAttachment(int aucNo);

	//문의 글 번호로 경매 등록 - 경매가 아직 등록이 안되어 있기 때문에 경매 번호에 문의 글 번호 담음
	int insertAuction(Auction auction);

	//문의 글 번호로 문의 글 내용들고옴
	Consignment getConsignmentInfo(int conNo);

	//문의 글 번호로 문의 글에 등록된 사진들을 들고옴
	ArrayList<Attachment> getAttachment(int conNo);
	
	//아이디로 내 관심 목록을 들고옴
	ArrayList<Auction> getMyInterestList(HashMap<String, String> interestHm, RowBounds rowBounds);

	//내 관심 경매의 수를 가져옴
	int getAllInterestNum(HashMap<String, String> listCountHm);

	//내 입찰 경매의 수를 가지고옴
	int getAllMyBidListCount(HashMap<String, String> listCountHm);

	//내가 입찰한 경매의 목록을 들고옴
	ArrayList<Auction> getAllMyBidList(HashMap<String, String> bidListHm, RowBounds rowBounds);

	//내가 입찰한 경매내역을 들고옴
	ArrayList<BiddingDetail> getAllMyDetail(HashMap<String, String> bidListHm, RowBounds rowBounds);

	//관리자 - hashmap을 이용해 진행여부, 내용에 대한 경매들의 수를 들고옴
	int getAdminSearchListCount(HashMap<String, String> hm);

	//검색 내용을 가지고 리스트 개수 를 불러옴
	int getSearchAuction(HashMap<String, String> hm);

	ArrayList<Auction> getSearchAuctionList(HashMap<String, String> hm, RowBounds rowBounds);

	//경매 등록시 승인여부 업데이트
	void updateApproval(int aucNo);

	//관리자 메인 페이지 경매 고액순 5개 불러옴
	ArrayList<Auction> getTopAuction();

	//읽지않은 신규 등록 문의글을 들고옴
	ArrayList<Consignment> getNoReadCon();

	//가장 많이 팔린 작품들을 들고옴
	ArrayList<Product> getTopProduct();

	//date가 없을때 오늘 날짜를 기준으로 예정 경매를 들고옴
	ArrayList<Auction> getScheduledAuction(String date);

	//경매 번호를 가지고 경매 정보를 들고옴
	Auction getScheduledAuctionView(int aucNo);

}
