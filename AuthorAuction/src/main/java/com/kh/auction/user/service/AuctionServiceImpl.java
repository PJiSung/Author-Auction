package com.kh.auction.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.user.dao.AuctionDAO;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Auction;
import com.kh.auction.user.model.vo.BiddingDetail;
import com.kh.auction.user.model.vo.Consignment;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Product;

@Service
public class AuctionServiceImpl implements AuctionService{
	
	@Autowired
	private AuctionDAO aDAO;
	
	@Override //진행중인 경매의 개수를 가져옴
	public int getAllOngingAuctionNum() {
		return aDAO.getAllOngingAuctionNum();
	}
	
	@Override //진행중인 모든 경매를 가져옴
	public ArrayList<Auction> getAllAuction(String sort, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1)*pi.getBoardLimit(), pi.getBoardLimit());
		return aDAO.getAllAuction(sort, rowBounds);
	}

	@Override //경매 번호로 경매 세부내용을 들고옴
	public Auction getAuctionDetail(int aucNo) {
		return aDAO.getAuctionDetail(aucNo);
	}

	@Override //관리자 - hashmap을 이용해 진행여부, 내용에 대한 경매들을 들고옴
	public ArrayList<Auction> getAdminSearchList(HashMap<String, String> hm, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1)*pi.getBoardLimit(), pi.getBoardLimit());
		return aDAO.getAdminSearchList(hm, rowBounds);
	}
	
	@Override //관리자 - hashmap을 이용해 진행여부, 내용에 대한 경매들의 수를 들고옴
	public int getAdminSearchListCount(HashMap<String, String> hm) {
		return aDAO.getAdminSearchListCount(hm);
	}
	
	@Override //입찰 - ajax 이용해 환불한후에 바로 경매금액 업데이트 및 입찰내역 업데이트 입찰자 금액감소
	public int insertBid(HashMap<String, Object> hm) {
		
		//입찰전 환불을 위해서 이전 경매의 정보를 다 들고옴
		int aucNo = (int) hm.get("aucNo");
		Auction beforeAuction = aDAO.getAuctionDetail(aucNo);
		hm.put("beforeBidMoney", (int)beforeAuction.getAucFinishPrice());
		hm.put("beforeId", (String)beforeAuction.getAucMemId());
		
		
		//경매금액 업데이트
		int updateAuctionPrice = aDAO.insertBid(hm);
		
		if(updateAuctionPrice > 0) {
			//유찰된 금액 환불
			if(hm.get("beforeId") != null) {
				aDAO.returnUnsold(hm);
			}
			
			//입찰성공시에 금액 감소 
			aDAO.updateMoneyInsertBid(hm);
			
			//입찰 성공시에 입찰내역 업데이트
			aDAO.insertBiddingDetail(hm);
			
		}
		
		return updateAuctionPrice;
	}

	@Override //상세페이지 이동시 관심 목록 여부 확인
	public int checkLike(HashMap<String, Object> hm) {
		return aDAO.checkLike(hm);
	}

	@Override //관심목록 업데이트 + 마이페이지 여러개 삭제
	public String updateInterest(HashMap<String, Object> hm, String result) {
		switch (result) {
		case "forCheck":
			//현 상태에 따라 업데이트
			if(aDAO.checkLike(hm) < 1) {
				aDAO.insertLike(hm);
				return "insert";
			}else {
				aDAO.deleteLike(hm);
				return "delete";
			}
		default:
			//마이페이지 여러개 삭제
			aDAO.deleteLike(hm);
			return "deleteMypage";
		}
	}

	@Override //경매 내부의 사진을 들고옴
	public ArrayList<Attachment> getAuctionAttachment(int aucNo) {
		return aDAO.getAuctionAttachment(aucNo);
	}

	@Override //문의 글 번호로 경매 등록 - 경매가 아직 등록이 안되어 있기 때문에 경매 번호에 문의 글 번호 담음
	public int insertAuction(Auction auction) {
		return aDAO.insertAuction(auction);
	}

	@Override //문의 글 번호로 문의 글 내용들고옴
	public Consignment getConsignmentInfo(int conNo) {
		return aDAO.getConsignmentInfo(conNo);
	}

	@Override //문의 글 번호로 문의 글에 등록된 사진들을 들고옴
	public ArrayList<Attachment> getAttachment(int conNo) {
		return aDAO.getAttachment(conNo);
	}

	@Override //아이디로 내 관심 목록 들고옴
	public ArrayList<Auction> getMyInterestList(HashMap<String, String> hm, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1)*pi.getBoardLimit(), pi.getBoardLimit());
		return aDAO.getMyInterestList(hm, rowBounds);
	}

	@Override //내 관심경매의 개수를 들고옴
	public int getAllInterestNum(HashMap<String, String> listCountHm) {
		return aDAO.getAllInterestNum(listCountHm);
	}

	@Override //내 입찰 경매의 개수를 가지고 옴
	public int getAllMyBidListCount(HashMap<String, String> listCountHm) {
		return aDAO.getAllMyBidListCount(listCountHm);
	}

	@Override //내가 입찰한 경매의 목록을 들고옴
	public ArrayList<Auction> getAllMyBidList(HashMap<String, String> bidListHm, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1)*pi.getBoardLimit(), pi.getBoardLimit());
		return aDAO.getAllMyBidList(bidListHm, rowBounds);
	}

	@Override //내가 입찰한 경매내역을 들고옴
	public ArrayList<BiddingDetail> getAllMyDetail(HashMap<String, String> bidListHm, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1)*pi.getBoardLimit(), pi.getBoardLimit());
		return aDAO.getAllMyDetail(bidListHm, rowBounds);
	}

	@Override //검색 내용을 가지고 리스트 개수 를 불러옴
	public int getSearchAuction(HashMap<String, String> hm) {
		return aDAO.getSearchAuction(hm);
	}

	@Override //검색 내용을 가지고 경매를 가지고 옴
	public ArrayList<Auction> getSearchAuctionList(HashMap<String, String> hm, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1)*pi.getBoardLimit(), pi.getBoardLimit());
		return aDAO.getSearchAuctionList(hm, rowBounds);
	}

	@Override //경매 등록시 승인여부 업데이트
	public void updateApproval(int aucNo) {
		aDAO.updateApproval(aucNo);
	}

	@Override //관리자 메인 페이지 경매 고액순 5개 불러옴
	public ArrayList<Auction> getTopAuction() {
		return aDAO.getTopAuction();
	}

	@Override //읽지않은 신규 등록 문의글을 들고옴
	public ArrayList<Consignment> getNoReadCon() {
		return aDAO.getNoReadCon();
	}

	@Override //가장 많이 팔린 작품들을 들고옴
	public ArrayList<Product> getTopProduct() {
		return aDAO.getTopProduct();
	}

	@Override //date가 없을때 오늘 날짜를 기준으로 예정 경매를 들고옴
	public ArrayList<Auction> getScheduledAuction(String date) {
		return aDAO.getScheduledAuction(date);
	}

	@Override //경매 번호를 가지고 경매 정보를 들고옴
	public Auction getScheduledAuctionView(int aucNo) {
		return aDAO.getScheduledAuctionView(aucNo);
	}

	
}
